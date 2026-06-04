Return-Path: <linux-arm-msm+bounces-111090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nqdTHPXVIGpU8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4463C36A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jlHZX6AP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkeUPuN0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23324303EA73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D311A23A4;
	Thu,  4 Jun 2026 01:33:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC723C4FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536808; cv=none; b=V+ojIhLWGsvHD+/5d/R6GHbl4SATa4VKQdjf3d9VWo3QvqSzjGvFcP0dPLrzfn5CF83nl8Zjkg3jy52mVExXOKIq5i9Mr/Rq/rweMWSILG7F7RO7jYvLgxJ2rhvIK/5MkWct2pEcKJp/lOBjowvOGhMyOlZTYO7fdSCkxCoAtlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536808; c=relaxed/simple;
	bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQHWwmh7otQ/lyNKscai5ddDeXXwofKOsIHDIAcjzs/MjKjIL3iaRIFet3s2VgKVCVaClc34kRFWsErizai7cxyx/7bwxlOK3+g77FsJfocbx0MRriF3cHoCRqlSNe9O4APad1cjQUuLYdtyeuYIiRFvHl139vHYp8RhahJciJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlHZX6AP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkeUPuN0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65419E9p141895
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=; b=jlHZX6APGVIZkiZ2
	byW6d4aSVzXS7wZdn/u0ag/wZUdaqSJ2X/alNRw90aAYMu1DkuJdX0T9sdLf5HGN
	jHNgN7UfJUqwlRfAZwd/YojTt6YzbbZgTZ6uZDM6qQiW9hiYVAk2BtngzkofmE6x
	igbqq7mmuSXU2akJalRl+EDdrkBttTPQOQNvsTqv8vuehXLK/eGwQIx8MeYVH43+
	YsKtuuTtcjHF8F/KA+aqc3GwNZ6Xc95jaLpFtfA7863ZBgmfoeEpfROPMKmTGHd2
	UQp3nbCc11j9Yx9E8y9Qg7fX/pZMM46SGEL9yZCWjaoa8C1ObktXnVzFuqtcVJ5C
	eqxWpg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen821t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so88777eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536806; x=1781141606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=WkeUPuN0K6227OZFpxm06KtCF6U2MVxPPn7DWAg32NnAwOjdGv6iXFUIcP9GCYdKfb
         IMO+NKJVq4nX/Y0fsqp+PWvgYLjG97Z7Wvu+HlakBcrKxER8eMKeSY571Ey9Rf272fhz
         Jcz8e6aiP2KX5XdSDeWf1zDdCzyOg1U+ERh0+2dfLbAYHWMdBa8BSGQxeLhVnvRRtBS2
         iVHfpIdoR7IKAZjmwqMJXQrOGf6j0+YyvA0Q0LxZAkcFHtba6o7dd3FjRwJGGX7jXmc+
         M9K5ZsZzVmzkRaRAE+aoORa6yW+f3UDBo5IyoCRYhl8d9nQ5ldbiSQIdH+AWxeUPb6k8
         +arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536806; x=1781141606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=MlbD4Kw5jRz3r4v0xTmLhyss0m1/Ie6/dGUU+02tXi8F9tqhlObkwmOtWFHcMTNJ2I
         fNY1S4dmr8QfvtDE/Z9HT2T9CmuFooRqmua39r+GnEsBR35lmrgyg2ZPH4qm7zlfO1S+
         BB2TN5QpcZZ0HDKFm/SMB2oQVi6TuSbGhq94bUNrQMYwg55esRvkPNlaXsDZ3+oNlHdJ
         glRy6RlxF+zik3jjFuSfn8kit+KG6xpw224JMTw7gszdefFiQKcYPwZuRAw2ntNBUHwF
         dLSHDiZpmWVbLHILVF0pPdlHU/fXdo4V5mwq9Bz/zRtvS6vBs+gpeqxFDUs4UlsTWopn
         JlTA==
X-Gm-Message-State: AOJu0YyugatefNUzmQ3v5YaGrMLJz/GAbhfHU0NQfCrZA0D98iG5G48v
	6cZc53QQA75pwwEQfrvP/5YR8AneUfOSNiTou9MqPNTGdU6hFHr8AVcgaTj8ILX37N+33cgMWpl
	+CJnrhXeAVnpSYYWv7bArSzt2hWBYxzUawwHd4g7CQ1X+BHVEyExnRsMt+oqeoUdIg8EA
X-Gm-Gg: Acq92OEtB0kfNOITlnBoduSm2rfWbUspfjOiQoHbMLa7tqVYOyx5/2F/ZCPAnR4KWXZ
	P6VjuAx3XK2ZH8irs5VpaIk4BQxT802n27bxYP3f7bqKqzah5jGR6KnUeAGTjmplENACkVOFtBg
	FTwmOwSaOgR7ANSt9r3sePHXJOeKwqT6bLxTNPBNzuW7ZC6HzWP37GAoHpaMsvTETyRiPTFXQFN
	7j0AGlhwMVS3RYhLHvcIih+zS0ecP6jhiKA4LkgiZAjdUJa0PpqdDGBrUM0QRvNFAqOEwcksIm+
	++v2SHwvGX2hs7dleUJ45gjjF2dl2mHQ4aar8xiRdJaCsy6Qjf9IRK7gIQNFIRqr5x+W1tGk8Fa
	3UJC9Yj8y/z266er6CDo8IvrauOscyO4eIgwiX+WtRzcylfeTdq9AwjxEhDh5MQgzKtNmtw==
X-Received: by 2002:a05:701b:4250:20b0:136:9ebf:3be7 with SMTP id a92af1059eb24-137f6bf3f03mr1707926c88.26.1780536805571;
        Wed, 03 Jun 2026 18:33:25 -0700 (PDT)
X-Received: by 2002:a05:701b:4250:20b0:136:9ebf:3be7 with SMTP id a92af1059eb24-137f6bf3f03mr1707913c88.26.1780536805012;
        Wed, 03 Jun 2026 18:33:25 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:23 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:55 +0000
Subject: [PATCH v2 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-1-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1854;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
 b=fJcfCbPxirPTf5QaSo6sHsbagcLFq37fKcd+C/Qbvt8EKyrKbKkj6cfd0/OabdC9BYJV7LPV8
 nnKwSZPqT40BcKp6qh8aZwqCqaIrYmgVnSPvhyJn/Lwty5iL8wjB6Cl
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a20d5e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: cjPtGSxXRfxo4rqX0NLNMMDQRQEgGDm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX3Og3lkVqDH1w
 bHtSyj2td1QJE5zqW/0QiDOra8346o4DgdaVlLWMi/52oV4DNSMVdW3Qx2vEbMXisW8gtA3g2oq
 +x+W4wjZtVtSqJ1rIS5Dv96Tw/n6XW7M5AZ4m8bSLsFVvvdP4rbN3a5cBvLLgG/9q7Kked/CHed
 J7WXDiqD275xGADRoKp8DaO9Bq5AR2+WHvUQNfxQ89W7OfmlZjJZXp3Ds2TD9RxQX4vTJnLZW3l
 YBL1hpWhjinmQqJ123PkWWo2NiDHpJhTI4uUSvBZmenUZrAKpQijUZjYYJntjDTwxLfQt3KNtj+
 1BtFRLCjBWPxkKlQHL9gUQbQHLak17MxFnN+aOL0pP64wqVyjgrcbn5YvuYGypifn4HBOGfu8Z+
 kcgPHaxCRPizWt4bB8k9+hQHdzyx4smTlE+0PS2Y7d/SnC+tT0jDBYWMGc88wfZ1GyuLqszVloU
 PV7ZxVOWpz4rAhRhung==
X-Proofpoint-GUID: cjPtGSxXRfxo4rqX0NLNMMDQRQEgGDm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111090-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FB4463C36A

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1


