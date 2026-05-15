Return-Path: <linux-arm-msm+bounces-107863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGVVLAgJB2qcqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:52:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625454ECF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 657E230782B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A34B47D920;
	Fri, 15 May 2026 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0msKWLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2YKYtX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AC47A0C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845189; cv=none; b=AJlHCVDj7v3CDb3J5DOOxdWsotDM9qTsmUicOTRoInNMLa2fKWsHUbLvlN7hqAxnfeQ/925BGk7/sH34mFIH0kL7/nLoGCLsCYfJmALcWgrvk+kdRG7UWKKbHHDUIMHJ8CppOc0Y9vvyLPhEBLoTmfJAZqYnM4Vl4MtLdZKBemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845189; c=relaxed/simple;
	bh=EW046zoiuLAPmtsqyP76uePwyQeRVtPiin3oxyUHQ+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SPBg1xl84wzdgqVP1dzQxgumXCmnKHqnubZy4Xt+RCAoZlYu6qXKVENOOF+K2cnclpqdD5jvikAkWc6kmjHKMhPImw9/1x9qJ2A3EBDmo2pO49PQh9vXsNdW7lTieQZ/lK1IBLYaUoL/VjTZS7FC37skQ2oIovgNoyUF1sq+Jms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0msKWLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2YKYtX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAMBS23671009
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QWiz89LQJ5jwc2iwcQq0lt
	DcxqIAHER4VQP56IlfDPY=; b=B0msKWLfOp9IJGyn4BL53e3E0FZ5emaiewtGrw
	mg89UC53M3e48cVl9QDLWwFoSoM7M3yBAQ/yhm2Vet+fcDXkPi+vM2AHiksnp1T+
	+JtA6VsrRzatiG1SgieyCeKngOfGsDIXn2CSIPPHsm7Ay7fehpmGEDwtdZirKf4b
	7nFphzXx19vaa+O/KOroXbpwC8A1/ci8esZSIBS2cFOGHcnQlHr4wnQerBTBkX2j
	V0fPc8LmUbWODsHAq2HyeH8ka2FTEjaMIp9Pbepo9IkT4GKiEpSAupa7O/BruB9j
	4B2j0218IdTrqW6HxInEy5hYsgAVqp1rARiRd+a/87qFds3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s34p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:39:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so120877721cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845186; x=1779449986; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWiz89LQJ5jwc2iwcQq0ltDcxqIAHER4VQP56IlfDPY=;
        b=D2YKYtX/JjpOYVw8ZKNBaMyrUdKVLLlCMrc7gNVoc3KkzjM4fhU6ZQpxY/m32eVTuN
         LjMydgnTgDAVDZSb2ZcSfehj1K5bUBJZLYM0s2Y8XP7lQjSdPrn2h1bpkmTNzc5bPKFd
         e3gCRigzghw1qW4MH10q7o9li8aYJQcgVHVrmdHJ6k5tmfp/viKCQBtNV+Pre2sC8sUK
         VomYQUiwXHjFmXC4IZd3O9gtssQZ7lQw0Dt4nfScthW4WqzXFVBJO5himD6YP2VybUqT
         4Z2MLtp767ZqPZ6TLVtOmuSYiUKdVyuygYXuTK5053WAa7QVNkHDT7iBq3W74OBRn2Ki
         ei7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845186; x=1779449986;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWiz89LQJ5jwc2iwcQq0ltDcxqIAHER4VQP56IlfDPY=;
        b=YgGQ8RHRX27RU+6EJX0tdz1rGI57x0xh8nsB25rxhO125nzQPFxaJvSp/YdAC81z3g
         rJFFnCukIPyQbYvGqL0rTOrUdsoDMmt4EMJoni1dA3Na/OXkpg4aK3CdtK0YLPvnG7xs
         ITRPjuvx49+svEGA95aR+SsGUuaFIk+qKm1blAXcECTqWbNm34cmJSMZiyiU19GgldaM
         fUcogk3vEt2qtBTW+ZNV6ni6Iaevv7wghw/gmsB9fH4vKfkS1/edKV/WAmSXdmbugn+q
         uo3j6L09+/VmTb6Oo8O0PraCHZKzcVAwAtmwg7lGsDkJ+FGTahaAE/k0XmGC3N9vbI71
         o+TA==
X-Gm-Message-State: AOJu0YwGfBfP6AEI3IdiLtsD0b+GNBwuA+RAocxeyyz/6ngF7xE7IRR3
	EEbKZE0reHdrCX1cl2fubyYAbgdA2n8W8nE46LUQ3vKp0xxZ5MpbUXODimk0R4gOvQV6Lcp4ecQ
	0iqm8w9DIF7hDV7EfrLhtJ3NU0N5xZVSBwBqeowGmuqR2tnfTWGxmHdBPD0Zg5SvokDHEcj2aFk
	2B
X-Gm-Gg: Acq92OFC+/GQAZy9GjVhSP3brFDsWfNskc4yKTCyTQvwADzWktHU1wbPGyCfkxHDgL1
	pM/hvvP96BIZ64Xnr2DCDmG03ShcHVsd4cMqPUtCDGxH8+WxKzEF+OBCYXux3w7GlmJb+KFLTjM
	PHsstqteTzY51dNZ+/N6g81OeSYylt6AOSrTOGj81APUFnVNYWugWYmHxEsjlumPAqj9FLcdr+N
	IL+4KhL95sj/H2Vpihx1613ZZEs1EC44Y7a3AhndUYZ01dG6tymdvZQUdfhhI7dHW45sT0HAIdn
	SUK+5heIk+fHBHnztltdnKw2YWOD37Nl55yHrffpe7PJtaOqTGlTpSopyblGdqYVnHk/+QwZjjt
	4mUvzcUyDgiR1/87WvuhSoJtUwI1S
X-Received: by 2002:a05:622a:4d44:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-51659ff98afmr43393571cf.10.1778845185981;
        Fri, 15 May 2026 04:39:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-51659ff98afmr43393021cf.10.1778845185465;
        Fri, 15 May 2026 04:39:45 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5821fsm11994135e9.14.2026.05.15.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:39:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:39:36 +0300
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Document the Eliza GPI DMA
 engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPgFB2oC/3WNQQ6CMBBFr0Jm7RDaCqgr72FYlDLAGKHYAlEJd
 7fg2s0kL3n/zQKeHJOHS7SAo5k92z6APERgWt03hFwFBpnILEmFQnrwR2MzMFadxqxM1VHIXNT
 JGcJmcFTza+/dih/7qbyTGbfIZrTsR+ve+8NZbN6/9ixQYHUilddBMCq7Wu/j56QfxnZdHA4U6
 7p+AXFRlNzDAAAA
X-Change-ID: 20260513-eliza-gpi-dma-6b5341271f09
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EW046zoiuLAPmtsqyP76uePwyQeRVtPiin3oxyUHQ+Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwX9WaDMU91MXGkSLVrbuul5VqduX/09wMqkt
 ox6jXyyR32JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcF/QAKCRAbX0TJAJUV
 VkwPD/43dMPZqMijRpp9ridMO+U1joOPlrQsRO202nppoQ8seQmdShy62OZ1Px4WHphEMA1IGrL
 7+/dxyUOauT/QTFbTABzmmfDmPe3oucsKF8ra2p9CAh25FXK1rys53T2xz5I4bRZOHGaExuPIro
 hJIRxlnaR83T1YeJRV+V/S3YQGsDgkrp4XGkiPeBSoIBUXlmeoHuO7d3RLHXOIEnv52uL5XvAXM
 0VtxN5x9PI/Hmjwkqal0tJsBMioOuVMiIqqnyM4z9UhThZL8UkZZ2/zJNFn4pzwIQsAKchPetds
 ARMgbTCL+uoC/p9EoA0V5wOiQpqSOMdf3jDzqx6psqmBWAgdn9pTZOU4T1gNyRCDwOOgqQBTQ27
 P9lyqgxzga4BWX3/1yLvNly//EZFvmkI3TMrNTIkdPbPZ0Dk9cju2ZJLw5ll7CQcNn9bPUuHWXn
 RHYACNnBIK6tlJHCaFWahq11oemfaTpI6SQIr3QazhYgxVnYqCS3nxrgvBzjvfyg8tDjMXgyNW5
 tGbBNN7UoJL/Nb9EOjUSFOtEarPpl8Bnq7Re2vOKUaVHgutJL+S2ZNQzAYqsQoSFSiOfs36RxXV
 1eVsfsHDjlcqT98TXEW8yTSwpxGvBTBUu9ciZV1iGTAsS74FIh5CFXnMgLt3pBMhfjDbmcRy13X
 YXbJl3mIhyVoRrA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX7ZgZKs8o617n
 Zz0KVadi2SzXlYaOEMhdLj1+1yU4Nbx+oEU5TRrf1GscDuXyjR4yyNT5YNDy2qNG4kfSC5O8jDn
 3D4LwjJhyI4O8mosW15pqqAgXfBlzZRwEatNumIzLvrVHa5PSuuB4+LYt2OEy74G5saD5rPT3E6
 jR4hWn/gx18b48A8IqfbBN+op3elX/ffoH68pkow19qz5RD/fooAKPBSyOE9H38Skh17aFh194o
 VLwtqdhj6xppe+zs+G0savPJI+6Ms6kP2kHYM76t1naWnGiA297nUiY6J153Q68eXmgqfbfhPOE
 pE+5Y3u1f8QUHNGdTdTRyybyRFoDvEfr0wGoEHh5+u3jNZgUyfI1BXMpK1c4Mp9k20K0HUZWE93
 h3pvwbLJ9+j5ulvm56Fs8eKb2NGvG2QxVzO3ZQZrJ8a9zX2fqr0pVaLsgw7pyG+uIKZB9Vk/4/l
 aOm1O47KU9t1FTfqxAg==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a070603 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fJTFHGPQb36AD_UPoAQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: mHg1pLbs0L15XMmbp9uFtWSqtw4p8PNb
X-Proofpoint-ORIG-GUID: mHg1pLbs0L15XMmbp9uFtWSqtw4p8PNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150116
X-Rspamd-Queue-Id: 7625454ECF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107863-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the GPI DMA engine found on the Eliza SoC.

It is fully compatible with the GPI DMA engine found on SM6350,
thus using qcom,sm6350-gpi-dma as fallback compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Re-worded the commit message to mention the compatibility with SM6350.
- Picked up Krzysztof's A-b tag.
- Link to v1: https://patch.msgid.link/20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index fde1df035ad1..d40b0a8dc9e8 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,eliza-gpi-dma
               - qcom,glymur-gpi-dma
               - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-gpi-dma-6b5341271f09

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


