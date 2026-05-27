Return-Path: <linux-arm-msm+bounces-110011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULY6D+IVF2px3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:03:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E90D5E7682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D3030EE5F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0533C380FE2;
	Wed, 27 May 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue0TQ6Hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/OP1Yey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9A273803
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897329; cv=none; b=hFqlBf975sNAsPZ/dU4fxex8OcDKUhg63ElqLHWYsWl37EFuSiU3HYpS3vKhKcebXXD0s59H7LhSUU1sKu51h5H0Qmha5pm45SGhSl1ba+8X2BoPcsM7ZB+Mk87mAyFQL/8Y9M4IJF4kDU0DPwQmjzjBfgJSyeTZ+m6yXl7MjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897329; c=relaxed/simple;
	bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ue0nO5viXdqwKveOeF0CrsNQ4hkk7tXkiRtXCw+Bc7UOJZweEmwZ7254yZ+vu74FoB6rR2SYbxBJjpCeOHCX7hsgpoDLyRVo3vNL2H+l6E4YfPY1PFg08e/0bwnc4jB4+8ceUAI2Jvj2e/gw5WDTYcccqC31cbjIXkReRaaw4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue0TQ6Hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/OP1Yey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFFjm52282563
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=; b=Ue0TQ6HuLggxG2UQ
	pzIx626T4ghJxbF5OHCfrB+wxqp+xGpCuT9tCuFDqvHoCo3D257w5I82asfaEr82
	Hkcky9s/R/LZOWzN52/ucFmcmEspzIXQ9ZOGge1ZF1vfOHQqiDOrmrg+LlmdtfzB
	TQJH8EFpa+pW2urJ9zQZ7AjbHv1ZeEYmP+nN4ho3FEbklzU+h0xron0k+OTmXr/n
	w97oNiSmsG3bAo7wm8GrgRlss+oKIbbuZkr2eiYWoJOgNTTSSJMHm3cuLOffHN+f
	zNVDviIhqaAhLWUzjDV/UPldn/tUc+GKh/Ar3I9D8yFRs5gFiOMYehrp6qL26UfT
	452Gyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvct9c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso132957285ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897326; x=1780502126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=T/OP1YeySfEykNQWBjFqmJ63jzC+XJcA5sT9gDd1ywnTAQsHqtnNWiirruQnPgjziu
         0fqBZ+JjMf36C2dwTnWciRIGDTeZvhQfVGRWAgvUC7nyEWPlqxtcSv44ZECPMFd0wuib
         SfQncHyokU8O+F8Rq2NGFD58hvFgMofvQHBMq4u5/4Fz3ygtbCW0yJ2CIfyjf3RU+eI5
         8UsA0Jc7onJ5+trVf/2U1hDcY0ziQ1xvJ/6oZTE0sZwB98JbJIK3fKdvfbhFd8uBboqN
         SBS7P9DqRi3mZTUP0V9v69h+laia1U1AQLSQwTNfd2pNMhPExjsM1Lc7ijnizrJKr1fQ
         KJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897326; x=1780502126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=oVB8M1+tUVurwCOB19toEnWyJQCEHpQoMt0/bmvRAhVbfNvhL1vTf4Jd1m37MAEb3+
         HqFpt1aBWnaxlLM4mwqi0mZM4jrU1JpGmzWtgW2BYTrSm48n1urohiJhUPhRNHukhKlF
         GlrfwllLhI/zgd2rcuUTGFqyWQy7TWYy4L+NkGnOkmfeVgeY9LRbl1uhKoWI/b2O7Thx
         OCCxH+PyGhfQayAi0CSgS0K+26VYS/oCwlAT4pz8/t/vk0oHKQx4vO8Gqh3vGBx9u41j
         hiWE3JcpayGMIZZQsUoDUMmvxQYt/j5yP/9pp7PxTtmcl3wHfGB2yOPzA6N4Sboranco
         9/Sw==
X-Gm-Message-State: AOJu0Yza0LfsJshmHSMxRBi1Hw6w1k3ZHpyzSMrgUL6lCeAMnHZcrRxr
	U3d8KyvIUA/2Qzh/27UVFeZpXe6DbWtBeSbhRS0AJePEjbkA4aSSHUZXQcOkvzt+HVWnysmlKAl
	EfXOr+ukxciMH0NZlliBCdC5RlSoKfKkHj10fWSoLlBkQlspMnazTqSvVTh3sPz0KshmL
X-Gm-Gg: Acq92OFR6+2Ude2KILYcTWSakWsHbXR23+1zLw/ilDUQR2OVRSz9Rf3pCyvTqF1Tlvy
	etzN748q3V3ZKAWZHKgeVHS6XTAnozh29yXEtCBGfy0cFcwRho/MjkcWQfTcPGZabw54yTdhaFB
	RLh2yPSVrZEB8CARjm0kYdp4J1sS8VnkpuOVK3k+eZEK/ppujlCvhX/Mb/8N1CIfJ6sdtDkDdfZ
	agtpEu3il3g1pR1tia1Lu1E0iVdU6hWu2HTcpWzeO32ezccUWe05LR2qHZEMO+OzHo7/T2nReiD
	FomMtFjaYA+9a6TDZsbXgv4rsU9PsHassNKdl4/X1WNfMJXHEbBJc5QtFvOqMslkBrvQkIo00pp
	DoC86izC2TzUHd2iy5UhNE6TwWv//0OAKvfF7
X-Received: by 2002:a17:902:da88:b0:2b7:ca38:975f with SMTP id d9443c01a7336-2beb05b57c8mr265814485ad.23.1779897325607;
        Wed, 27 May 2026 08:55:25 -0700 (PDT)
X-Received: by 2002:a17:902:da88:b0:2b7:ca38:975f with SMTP id d9443c01a7336-2beb05b57c8mr265813955ad.23.1779897325040;
        Wed, 27 May 2026 08:55:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm1264135ad.37.2026.05.27.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:55:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:23:51 +0530
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-shikra-dt-v4-1-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779897312; l=1745;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
 b=rDdsXqx2OGS4HgppqsyFw7mstu3UAVMe6PAhzN13fr4mCPzL5eaBydZ50PISMnIlKsANw/AQa
 kp+rRqblaBUAXV5KM+PCA8BfUHkOpqLgyaWVQb0E8b2SLc0gD57pb6g
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: ohBaS50OgOVO6ju3bp5aWRVJxPdvrXSl
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a1713ee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX/qOSywRDRSHd
 FtrunurYJBkoE7o2PxBj2VRmRm44I4xZTjH6j7R8FMeiePIwz9q7BEB+THEj2trQgBUhIi4R/fU
 /XXwS9vt7KtQzGSxA5vmG5kXBMoWm/i3vvLXWHqVrzIxfDMtykBFXDv0KlIQltSjeZc0n/Q9fOA
 j1ymnSjgra0tEnTNb7HyyCdQziX/6c5Q0jWLk65zhQzZ54lhmfrYaXwGRwkt8MRierelvh62hoZ
 P9x6skNR28CMF69YKfujw0UKjfZ5QWlb38qAeeQI3Kmg+59osC1bHQFnqVHLdNrI2Z9LDs702la
 PRM2aYzFUaDpBlrMZsiu9rTFmKGohvwRbvJjHljT2Evy1Fk6m/KMHwFrAvQU39FdISJ2cqD0Vnw
 ztN4OuSNu0bvF4WuICm3ciQQv6n1mczR0Q+WHOYUki8zxONYw8cNkoq76hL/3xtcunvMNcjx41o
 IZnRcPzhXPe577H2WaQ==
X-Proofpoint-ORIG-GUID: ohBaS50OgOVO6ju3bp5aWRVJxPdvrXSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110011-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E90D5E7682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


