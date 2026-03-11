Return-Path: <linux-arm-msm+bounces-96996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCDyJVtusWnLvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:30:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 293232648AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00779303A3F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDAB31F996;
	Wed, 11 Mar 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0PPa6vh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsgPL47f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF431E83E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235780; cv=none; b=omToz+Pq+J0LaapQ3OmgRtcRwmwl+Otc8RUqQlvmvLhUqRBQOWnDDp4ptvfDzdIcTuTzV2wXu2eqd4WdsSUDzVeTX0Sj15RVPbQgEcGNP74AmGy06qn1oPfActg3t83k6mGy4pgIJhPh31mGyKbT5Lzq5kyeALNFpd7nNXagJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235780; c=relaxed/simple;
	bh=iuDywFfEymgVyjKEIcd69+zFLavfd5mGpRdBR9KDDKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tOmD4stCniRi7E8FK23nN7atiwVXF1mIBdlUbF0KS8Aiz2rRN8XuGIZ7DCZv6dOgEy40HnZAsXUInXzmYcNWNU6sJAj8JdXTZH764Fy6GI7pkFKSDHVDyuN2oS8dh2AG1v0G0fiDqU05QJBL+wz2of9f+k4Z5mv7js7WRdc7cGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0PPa6vh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsgPL47f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9Lj9Y249197
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AOeHj9DZI5gglJMMlKAv2a
	3QyW7iJ9EM5Nw0yxLn7V8=; b=T0PPa6vhcvFUI/wRmExqHnb4PzAmOFw4q+zOV6
	PeXn6cUpr/no88/T7ie3TR/9ySjd7Cky86G3KnGqeFEl0GVmM5zVXkPkvw06CaHC
	AEYkiy3DPiHqa99jXpbcURr9J0SKUrI0cmq2Er6kvZ/WJUhWbqKqIKDUTUTU54y9
	J0sknlDQuBKJtAlZHc/JfNXnJgesdK7x3JC8hNZWPNVkr6qBJg7SFOm13xZ/b/iK
	xG1xdh77fd2+WzlOLS7LkBw8EjXpo4A5a+etXl2RWa728K95hBTFZTTzlXLo9XVT
	zAERRUaudQ6C8+AiBNHOFav0xNl02gBTeiAaTz7XBWzNdIPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv13qe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:29:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so2299645585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773235774; x=1773840574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOeHj9DZI5gglJMMlKAv2a3QyW7iJ9EM5Nw0yxLn7V8=;
        b=MsgPL47fTicjQoMq06mNBPqomNrqDu628+enX8z7XgyU6Hf061jcWIFe06g32fMAHt
         KriLMPIdIoBEXCmltfVRCW7HA63AgZJYwykFSqt8pfiCwF2aOW6usboXO7u0br9NwGV+
         wwU/YdttrsIwXuftuTFr8Vcn1eT3o6bOwwAKCp7eM0IWn6wuCjMrvnHFvRGfEgCeEJH5
         u9g7YAUUMw6Q6drVDfzikRCi+DyxVS5R9rt29zOoKN2xcPYIA5HrzYCNi55ml1rSoiG8
         Y0YFn6d824rA9eI1NWw6nYl5ipvTvCFXetD8p01Gs46K1SBZ0fo8FMEourbcFpGRaBLB
         mhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235774; x=1773840574;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOeHj9DZI5gglJMMlKAv2a3QyW7iJ9EM5Nw0yxLn7V8=;
        b=FIxi6XRv0Gh2/QvOdHUpdvqzFb8wO4PJKymYmiA2llQzgB2DyIyvD3xsolntiHoNNE
         8vH4wmu1a4mKthTCXm3/vB0hibXKmmWF1OQ8OPZdmy8zgVHI9UfP9WnvLu0rPzeLZAZm
         mdpxnfHxtDSLbVwvDFNyzcnNAEJQ4mmAR+Tg2fSsSvX/F1eOKArp1RXwyxLgiyw7kgsW
         PVYcgIfOUybiDFpYNdWrA7vV4YJ/crBHGnTXNtkF+idoLrB2aU2IlHFzACFv5XT8ahE0
         6q1i2SOO0vPvBvVD4FRHQMThCrp/l9OLOs4OoKYSh42oWfUIWrDsMrbKoCI70cZJ9I/b
         SAJQ==
X-Gm-Message-State: AOJu0Yyh4ZGTdwNCJvay9rLnwb9M9U1PSxztvUrvTxz8SM91ySRP/ImJ
	2TQmKsSwcywqROnzFye6YaVBdD3a9/eE5gO0WrSvVKMFUn3hkFPkRZJ16NzTrP1bZCBt/u+Zz3X
	hsTOvQGoth5qCarLrTBJ73wkcsHfPhsoIoqTpT8ptF7xcM3pAU08ho1GS6JG3T6q4K/3c
X-Gm-Gg: ATEYQzxl6Kq6kLgYDqzbUJHyKj80HuDqnTXE4AqnLa7m0hvTgcLPGpAjkPvLmudXgQs
	drPaFN3JXjN5D+hpx7pJG35sAllTSWstlC/9Q23S0DChdZbak/sPwg50hh88AZqS4CQafVO9C6M
	K7uMmH4ni8rR9jXc0Mfyov/srysmk7bvLMoloxw9to/9njQu7bLOpt5Uc+gCSrnfGfkXrmFLjIv
	Os6lzTxDX1vAmFvK2RgS9yux/64ST8ybVqYExmEKf0k9+PyMxNyGHzxZSmTKrkQAbFucLcKql4H
	RNmDbVF1TMHzzSznZzk6CUfqHdvDi65k/ulFcpR5ZbT7FhfkmkKfFf4FhcKy1p7CTiYeRvfMtLN
	z6c/vpKMMOMHim5S5EC9AH4nZauiwog==
X-Received: by 2002:a05:620a:1726:b0:8cd:8320:3379 with SMTP id af79cd13be357-8cda1a7c669mr320872385a.73.1773235774090;
        Wed, 11 Mar 2026 06:29:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:8cd:8320:3379 with SMTP id af79cd13be357-8cda1a7c669mr320867185a.73.1773235773494;
        Wed, 11 Mar 2026 06:29:33 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm41689355e9.6.2026.03.11.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:29:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:29:23 +0200
Subject: [PATCH v2] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADJusWkC/32NTQ6CMBCFr0K6tqQDBsWV9zAsSjvCGGixA0Ql3
 N2Ce/OSl3zJ+1kEYyBkcUkWEXAmJu8iZIdEmFa7BiXZyCJTWaFyAIkdfbSsyVlyDUseepJneyx
 r0AVYlYvYHALe6bWv3qof81Q/0Izb1JZoiUcf3vvtDFvu/8MMMkpnCtEAnEq8eub0OenO+L5Po
 4lqXdcvrSPXS88AAAA=
X-Change-ID: 20260311-eliza-bindings-spmi-8d49b1a61d03
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iuDywFfEymgVyjKEIcd69+zFLavfd5mGpRdBR9KDDKo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsW424XZVnSyNND3EpolABpFBAiaE+GUmW3S1l
 azcEvpbI2yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabFuNgAKCRAbX0TJAJUV
 VhKeEACRUU5AWYJDd8NP3iZWm6AiYgMKPQFKiBEAj6aacpaLBV7fYpenIGPUslSCXIU3Vyp3Hdd
 +C9GmVWbRWOD881pL9FhtHKVijA2oLeV+ejHRsJj6AXWpaSBuLzJj+HW8YfiaN+/TW3agh3q33U
 PTsysy0zGyZt9u4x1H97mKpfi2oCfrwWUsgmJ5mWyH+l0eUhl5Ozf/TcALGX9BYI2Ot/2BcEIpV
 YOXZTollwQQ5J3E16OwdwOonjB8JSlDBIg6l91u9h98nZbwofpGwKBSPjMJUehqQk1g+s9w6AgC
 I0MUE15pRAqejoofEjvghN0YmT+kChCDOzrSkO2aOVZw+DY9LsRRx6nDO4Cf75DhORYQEb6b4G3
 qbij/p4NMs8hHMnPNE/qym2pgocEMCdA0UtNch5ZsP6ykqSkPqKbe57BsHScdaiaAJ9UUrDKzmA
 mTDAy0kJlpw0uvI9ogX1onudklEeoT0BSmt5JOi8HKoakfCRQ2C0cjpdVLx2MWneuu+Iz2bVGNs
 wd7ib59SNbXX/u4o19IRW9ZiCsCYulxyoU0doFiNIxzEV3KGtlLqIWt3p6NQCnQzY/39n4HyQ7K
 uuta/wmVj3UF4+uZgWnkjUK/UlDtEMb7+Y6CuBOgJLswtmNu7EweTnClWRCa5l0uBW7MtcAyCok
 k579kbsycIlEZGA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX4xkdSUY85Omq
 xHFl9UP3oc121eRV4ZkysaCZCYWaljPcxD97AbEjprKAzZQK0Bte7w/2CA3jJp/JTptQ38iFMsB
 OrJDtb1wNAe2zDfoVUGIGfpPtpcI+4wSL8dWOeQRK84hXFms3qVYCrv0T4v9dEfdptqvwVR8MZi
 /1TiMi2VBotXvf8FHJJ4LIotqvr2vvdKGqerHZc8fSY/IbAqFl5xAF8bmqIRoI0ujjcYeoN3opZ
 nSeJlN2KDLmGTh4kXjCEs4FYaMfx0t4P/HnbRrFgUpvhWmV9sL0zekjuPjkgvOrHXDHJ2c8AaiB
 xcqMdAmnsC8hkaGrqSLfDraXuT2oWIAPh36fb59JaknVzA1ozVbzQDN2Fh++clsHGopoTFzGyZG
 UtJubZSR9XwZ2gTrjgcEmOKknfFIxB5La9rK3UXchlwzv2hInf4azSJOG9XBn4tRiVF3mZBURGT
 tBgGNnB7fvGKF54nlKw==
X-Proofpoint-GUID: s1uUGO3q9XLSQ56OawjzQ4ZS-3W03fuF
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b16e3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fNS8NsvCbKrWdB45dbUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: s1uUGO3q9XLSQ56OawjzQ4ZS-3W03fuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114
X-Rspamd-Queue-Id: 293232648AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96996-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
driver-wise, still compatible with the one featured on Hamoa (X1E80100),
which is 7.0.1.

So document the Eliza compatible and allow Hamoa one as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Instead of reworking the whole oneOf for compatibles,
  add Eliza similar to sar2130p.
- Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
---
 .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
index 08369fdd2161..4152469b3880 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -23,6 +23,9 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: qcom,eliza-spmi-pmic-arb
+          - const: qcom,x1e80100-spmi-pmic-arb
       - items:
           - const: qcom,sar2130p-spmi-pmic-arb
           - const: qcom,x1e80100-spmi-pmic-arb

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-eliza-bindings-spmi-8d49b1a61d03

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


