Return-Path: <linux-arm-msm+bounces-108381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMR9Mu8QDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0E5790E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EFC13090DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299CC3D5229;
	Tue, 19 May 2026 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpMEkhGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsggWxvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752093D3481
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175473; cv=none; b=p1jrK3YHQ6v+CWJg0J2Lqi16Eg++c5KrgPHc7P92tpLVgikXzuCO6iaNvKybvRoOzzAcwnMrxDN7Do59UwJNmrgySU4hBX5McA25Bciz4VSNwXA41Vsp6+NxchcKAtNjb55MJTTah/sFfDC8YSgsv2ZWliebG2y42+sUt0Sqsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175473; c=relaxed/simple;
	bh=YuroHQl0RaEfqlcbPAw5LHxqeiE2B1J2dL3SPvMEUoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz7DnMcOjCja7ye94PYuG+xRwj2nHhSjRCOIGMeizQqWSYHOBovHVjVmgApN0EAM1+yUwl9hZKsSK1aMA3rRrkKVD7dNiju+ciZIx1+ru5tlu+/eyebqtnItTtrrkNN901roMyxVo9G9xOMCSNqldFT+1woDWzZT62yFsCUxuLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpMEkhGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsggWxvs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5CHjM1250942
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Yxppoecnv6lUMs3okuA/xmMwVErI7Rlp5d15Pjd5Sk=; b=dpMEkhGaJ1IkON05
	3cZqx7LPTijdBc+riBzQJSPNstSu0UhziAJkOcyjBxk6rwnCbqxcW3H6HMbtrkeD
	LrXYa2aC+U6GwKL3fdJA6GS1soPOVPR8qj4zvSQKrLa+JImhLqNwyJmBSR/2YygZ
	Ij+tQ30jWJCUaA54QjgOoD1YM0btNhogyopxITZfkTyeCECzTRNJnRBqKSgjRcCA
	nNWp5IQQ8aSGEE0LNk0AZxXVaEgxjEOTNY442F/0Du4A5xl2ECT4dSPFncV+xNe6
	hkf9ykNPqsN2MWkFtYY9KZWa5lpkgN5QIfsSEzhnaEda5ASmeB8i0vil5lKR5TqF
	FUobmQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kybn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353a6f29deso3710266c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175470; x=1779780270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Yxppoecnv6lUMs3okuA/xmMwVErI7Rlp5d15Pjd5Sk=;
        b=JsggWxvs3/bdhN6NcQcjBcVENapOH64r58pEFaQd69FVsYYrSrSvVVF/C3hepMTCm3
         U41rAMCBq0WmkgA9aTc7nti2FLXrXXhrUzBCB6cmDovrXSTuSg2pSKDwR1X9tOl1cXj1
         QFoMbxy/SpMz64GyicQHgRruLteEmCV65Jpat54K2afpGOKxg29u+z4mAiV44QBN69DT
         ipOV/TGFML3Ncimp1ptlVkx8PNBEaRZJJ9DwnZf679Pra6GqLe/E9mxeTwhUOCa5uYRZ
         NXKVv3KZJQqIqJd7VawpAdjYFWOyEgooByFsLpq73iVSkSnJnWjKWd8wpn7bCVAiamJq
         i/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175470; x=1779780270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Yxppoecnv6lUMs3okuA/xmMwVErI7Rlp5d15Pjd5Sk=;
        b=F8nZVEwaN1ArDMXsSoCDtbtrY+0p3FLSob3sXZ7Dg3Zr82e5Cs/mgW0uiyNvF5PZRH
         o+kXo3X+KeEBHzBXzZljyyCK/CsgOHstwxuQp2olp0Vw/KFhlrznTr/FC2ze7z0cG4VX
         Zaz82BoELvmj2XE4I/R8zfOwFeGMxs8ypnN66ZAkhDgyWvSjhZpLh/Q4xBW9ZbS98Fsl
         +voMbqldT5IEnQqgvDRFxHUwNOap43IJ3PN6M4mOGUvV2WA2PYB3Apv/6oeXuRE03laH
         i4wRNEs2w7vGK858UszS8sWyjZ9qO9ju7/iFmREgS6OVAS782Njjx7/9qpcgzLTuzR7l
         OEGg==
X-Forwarded-Encrypted: i=1; AFNElJ9V74pBUdARoUKOFFXYOb9hKI2Hoc4pDouXnyGdeLyNhk0p13HN2TyW+DCJwQwDviNMPwvtU+7+awjx5FfH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwi19DmaPB+FaDSGnRdtsl6oBheOSb1c7CDuPLgyd/nFutXw+w
	tsEux58Oo+0IFnRIkg7jcLtumCmWLCZwwA6+SeCwEZ/rjjG8068xCCFfmim3ETOLKR7kI9noOvO
	EHcncmvu4HL9b8u1Nyjq9t72i4V1K8pcVeB2TbOZlom4hHzJa+Y3JLHtvCFvq1aGIq9Up
X-Gm-Gg: Acq92OEQlKnSKzzMPNUuOlSUBnOz8z25DW6LTpNSNN613AKWp9FAdeYw4krgS6yVRTt
	ytqijD7EsivrDFawELWdPEXx2dqmOyTR65pepchbNdkpOlV9Q1+sGIjEa+GQyrc+84rxo2CeJhe
	8wYBIK23UGG7t+7Pf2xzJyN9ipAnN7PUrrqKsSsbYiDG4kVXUnWQC2EbWXNAOM7AdeglGrallyV
	RjnI5PsMdrKTEYK7NYklf345EJdQBl7WqzILXT6PpAGPGJNRHjGH1PhL7vHYJ5MMYTEAD+ddXtm
	jFs1BSznZmFEaLL+ZXXBvPizThwFtMcgZsvNUZkwvRoIXraPZYGdKYZ45ySwEly4OZuun+fH7He
	JAhCGXbjzkZvK8KSMFi2fLxUEFhuaIovGpnomFB42LjpdfvNOcJteKqCzQb3beLJiruXIeMoJ
X-Received: by 2002:a05:7022:6993:b0:134:df7f:910d with SMTP id a92af1059eb24-1350451e077mr7346432c88.7.1779175469976;
        Tue, 19 May 2026 00:24:29 -0700 (PDT)
X-Received: by 2002:a05:7022:6993:b0:134:df7f:910d with SMTP id a92af1059eb24-1350451e077mr7346409c88.7.1779175469331;
        Tue, 19 May 2026 00:24:29 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:21 -0700
Subject: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=16488;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=YuroHQl0RaEfqlcbPAw5LHxqeiE2B1J2dL3SPvMEUoA=;
 b=WceVYENDAM4QkQHqOexKGQbzvtkM0rugpnYE1bTY2zTOwPVPKlzrzYBwOiYxzdKwjByyICWPA
 Hd2EV4MVI0XA/y4jY8QotLtRkeVUNs3QOPwTRnVgEc0LgUzizQuQlXz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX0hdaGBm1eRaz
 0AZykXtSZxn1QZDSL8Mb6T9MBjiLdywxKXRYJwZiEUU7C6k4NLCeVd+CvGF9TmZ1UapCijr2SE5
 CdHJbpYld7MIHISmYp0jg+as+mqafJVxlUPR1bUxYrcMCCEq9+FiX7lbgboTbl+Bxd7Qa+ysLZ8
 IDupE7mZgQAHDOXk135WZAhcRgwLDGBO+zElxGs5FnK815EiXPrzX0lw0hKqxOzC3NhIcxEmsRS
 Bhf0Qg9nTlly9+YobIVQLSM1hcqam55PftsMqwSs7bnU25Z3VYZy8/+FT4a280Jch/CqrxDs7WJ
 MQ+YVcIj4le/5XmOpC/HYQZjekTSkN9Q7evB7OIpKcPT3U1FLYLCkNUsZsLsEX9C14J/hyyYX0C
 gwXU1OBOoCESVUUK+viF2MAW60GudqD3qtH/YMwNPgfw4OazTEReP/f5/TE2ZpL6ExtiOuuqn2P
 ln48QzL2/BNGKIvPDMA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c102e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HRkYIiX3aUEsQExlndAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: -vdU99cJzzesdMUUFNQPDZYUZbmajaHW
X-Proofpoint-ORIG-GUID: -vdU99cJzzesdMUUFNQPDZYUZbmajaHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108381-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,d00000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35F0E5790E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
and add maxItems constraints for SMEM properties in the documents
that reference to pas-common.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
 .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
 15 files changed, 263 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16c35e15ee1b..7e8ecae8e6cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -73,6 +73,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - memory-region
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..ce18460a949f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls USB
+  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
+  analogous to traditional PC Embedded Controllers. This document describes
+  the Peripheral Authentication Service that loads and boots firmware for SoCCP.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-soccp-pas
+          - const: qcom,kaanapali-soccp-pas
+      - enum:
+          - qcom,kaanapali-soccp-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  firmware-name:
+    items:
+      - description: Firmware name of the SoC Control Processor
+      - description: Firmware name of the SoCCP Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal the SoC Control Processor
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - memory-region
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #define IPCC_MPROC_SOCCP
+
+    remoteproc@d00000 {
+        compatible = "qcom,kaanapali-soccp-pas";
+        reg = <0x00d00000 0x200000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "pong";
+
+        memory-region = <&soccp_mem>,
+                        <&soccp_dtb_mem_mem>;
+
+        firmware-name = "qcom/kaanapali/soccp.mbn",
+                        "qcom/kaanapali/soccp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,smem-states = <&soccp_smp2p_out 0>,
+                           <&soccp_smp2p_out 8>;
+        qcom,smem-state-names = "stop",
+                                "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_SOCCP
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "soccp";
+            qcom,remote-pid = <19>;
+
+            /* ... */
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index d22d50c1e1ea..99d7337e58ec 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -69,6 +69,14 @@ properties:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index dc5a9981c12c..e81ef400555a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -46,13 +46,17 @@ properties:
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
+    minItems: 1
     items:
-      - description: Stop the modem
+      - description: Stop the remoteproc
+      - description: ping the remoteproc
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
+    minItems: 1
     items:
       - const: stop
+      - const: ping
 
   smd-edge:
     $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index 5854b3d2041d..bf9bf1af9ff1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -59,6 +59,14 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7f287e55896e..dda2d144b720 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -74,6 +74,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index cb0a61fc301d..b20780e5e26b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -68,6 +68,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index fef9d7c39f3c..4bbe4a986c7c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 2bbd427c6ea4..8c16b01c53e4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -71,6 +71,14 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 987fac433fae..454ba82bd6f1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -71,6 +71,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 53ffb1ccd199..42e02c64347a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 6823a2a8d74e..274f87880e2e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -61,6 +61,14 @@ properties:
 
   smd-edge: false
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 8a1fae095a3b..5a7c5f8c92d1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -81,6 +81,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 4ea7518db537..72d0db5698c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -75,6 +75,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 74df49b5fbe9..0b44141d31ee 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -93,6 +93,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg

-- 
2.34.1


