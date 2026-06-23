Return-Path: <linux-arm-msm+bounces-114215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z9PcGLKEOmp4+wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9D6B7502
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iaAhBswq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="D/71Zr0S";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 902E73022D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B54C2D781B;
	Tue, 23 Jun 2026 13:05:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20A2D7814
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219936; cv=none; b=iyAx7n+wdbwmLLJIHTzbSR0HkvP1BIT85qTReEqY50/LDciYd5ko5bdFM0sn2bvzzsdu5l9vtHAL4ShTeAV1VbMeLZhE6ZBTnN9OYGw0dQLahRLCPVylGkc9X75hQY7SHBo91Zb+rn1M+rAZoBGNZb1EgB22c07NhYpijwjTfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219936; c=relaxed/simple;
	bh=sb3Uq6ABumgwjZWgmUAldF69UC0Cn8aYOQo27nojvoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ki2a921u5J8mWCreRaJ0ugFJGA2S/JBL6XAU6XUhVR3mTawco4sbvqmCTU6/7eJBUrH8tKCqi+a+8DweDbZ6l+H5RfN9g+V1gDcQyeb6+x1Sy0aNds0d8S4oP56gy59mOJsirXjcLVbcRliof1jhbpYtU5/aeJPRODgbaIyyJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaAhBswq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/71Zr0S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY0j31156135
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=; b=iaAhBswqoYiwV/Yw
	d8c+1pmd/DVTubskKIa52iaZwp26rXvtA85b/7unmWqJ/mnAhvHCidvZFtQFp/5l
	KYURbqhfxFzr1YV6NKEhiXgJNwk2XpR8jRfJ7+N1j2yB7bMicmFn23dNEVCr4yOI
	JVqjhcC4/kbEwShg/04VGat80o3s5NW38BVMDURXp9E+XblNjDKLxs9ZuUHLFF9q
	lJWWnbLlhgzaS5UUUc3zpz1HoZ+QlRYAfvpzXRCVfDxC9MPvQqLTQVajym8VdqzY
	ji/cffhzLvxT1yaMU7P1XaJVWUOm2toQkY0nfdG9dnHCw+bCNcoLYYOLr1x3/pOx
	Lw4JWA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28rmm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:31 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e9dbc4039bso18960147b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219931; x=1782824731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=;
        b=D/71Zr0SQNtKeeXSmO+DbuyKDMPhc+EOihQ2NA0nHDkzVXsvUoOrGvZ65MS2fitxKV
         h7GNxLDSRTgZ7Plw06z+xBbYl4T/A59rAW3q8JyRsguc2YRFuWTDOwqXmMXdIVhdouxi
         M4SQQEWJYZTHbnSIE/GNJqBx8fQwJZOS4XNM0Nm9IzYqI/xE9ZIRoQwoa9sI83uMzWu+
         DNNfs0bPdswW7J3slIj0wWjWzfuaP4rRX9jmh9BjB8gFEblxdMJiUTXugqBpa6VF917z
         8pcXKfP113OuFL6Ux88ZFTCM3sWoFHkehedi+rT0NXdhMkcOg6L52V0LF1n1N8EAmB3l
         oyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219931; x=1782824731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=;
        b=IWYa6WBm7eNe7IMTFWlPuDIVkW4jejg4THRgMo8RW04dIQExW7+WrHwRNoklAlxPnN
         2P8TIVBYntgtwXO2hPf4Ai7ll3XaJWoM8XOMNp+q2XnYYjaquNaY7Ykfq8AEw71sJpCO
         uHlQL/y/pSpOxnrtL/aBYHWpkrNtKWmGPjLXpS9Oq8oMPq6MucJnTMFFvmbI8QRsBgcz
         iazW6GpYPxRU1+/STKHa4wx8oRBVSwDlwK4hS537ekmZf2AIzvRro8jvkTYWWKQl2t84
         s5CRTK6zpnubYwwaEbpD4yLWGTaR6M4S2lbAdF1acTyMsRtm8cR7lbp/gONmpi5UjebR
         Dy6A==
X-Gm-Message-State: AOJu0YySPR9gSkTNVkY7M8YXp2AxTBHAKogUiVDavIFSr95Bph5FZVrY
	3uJ0iubeC/FLl8w//KsAxO83A7GNKJf1tmB/f0vapcYY/3Nt99R24J6jUEoQ67JRXKEC3QX6tmP
	WgmLGAA5+bdTTXMLAgw2zzBIsQ9TZLDfWv643wp52LfOd/+6eOqMmEP7KbfB4kvk1QFLB
X-Gm-Gg: AfdE7ck/DBFpbDFqp/kT+GYCEx0p6TcJDBwWVylnsOV8d5/zdezVKpXmrDzlAZ5hixD
	756EngLWZHHU3WbQNvX+z+W1KDza03jpFJlvvEPM8P98qMxmBeHVjtCiZ2R3xNHhfOqlFGaziDL
	mipe3PbVJqcBXoi6E0G4jv9xCtvVPbbY7Lmwf6dt2F6eKAFtaR8oh+8RP4Buaf4SzuNjC5W9PLm
	j3LOj6FgJDE9eITqLj1iDAchx/j3Bi0yr8pZP+WmWtn6TlV1p0gFSIKi8rHxrEXaCYFyPHEEn/8
	aOz9RvAYj2sEWGDxzK2ZfHOB98cSPblavjHEskHLXe/fNkkX5MuR2rwM/6JRaD/W33Qpce7KK49
	DXd1Zp06U+e+s7TF5OS99xf3tkFefphHTSM6WZavPJcH17RT0286bbDDlyg==
X-Received: by 2002:a05:690c:ec2:b0:7b6:7df9:33f6 with SMTP id 00721157ae682-80670e47f1dmr40183897b3.2.1782219930661;
        Tue, 23 Jun 2026 06:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:ec2:b0:7b6:7df9:33f6 with SMTP id 00721157ae682-80670e47f1dmr40183137b3.2.1782219930078;
        Tue, 23 Jun 2026 06:05:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 06:05:18 -0700
Subject: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-phy_refgen-v2-2-4d15983bf91d@oss.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1908;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=sb3Uq6ABumgwjZWgmUAldF69UC0Cn8aYOQo27nojvoQ=;
 b=lccl7A4IcciL4lCF44EqI5hyhq94HvqgY9ftKfLfzIZ0mHnucEkAgZ+GqhMJK9q3M8A/GlLk/
 z+ZdNTNpUopB/fYRJbsUZXijtJpSXV9Qk6RUmak86gaNsU7K5SFHPDv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX8bG0Oq2QsLEC
 WHwlolsOznOLl9spAag0Yq8r/6s7hKQApusgQkmVBekvGqy9fLL2djoAbBnYlBPNsjoHNUZp/eU
 XxDHR1fmEYbWStJ1tcUfGlKRuNxSeTg=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a849b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: OYnqNL--7NdqzwpkyD6vyHtjwBk-XwWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX9KYfl4sBLGSY
 giwO8qq/LSWP3s2Qtp0dKqdDL76UoT595g8PuRO3f7JetBJg5XdjCvzWY+cc+XEuzYlUO3CyhfB
 nbCLfkVAjj4LwOE2B4IZUFYIPdUtyLSl9QIcaNtFwlGr5tX2M1Y4w0HGZiSLDfKobAz3Y2vE7wa
 VaK6G90041CIP8ZdbVKRTDgHqwS8AR+QUWYbUMbkYYye5AulGUgvso2RiMRSGB9iYQ/q45ihC5u
 fl3KGBYXxhhWwGuxq/5KeAMsRpwmD9Q9TYyeN2BPaN6bP7inG7yToofUJSI9GB5Dx3Xfdk3z8aZ
 5nTPv0XW4DexvKABBrfYHSLB3r+DkBgmzzXgKdGSojeaI/Z2McoG+tLN4g4j69tnIeSWUD9Qyfa
 qc7WF6LxqlxhjXQeXUBccWhnSMte2hGzXYnT+BQ/naA2ziSzQJ5p5hKGszo9h3JVm6quFCgylfr
 1gHYEe8QZzBLTP5YJiQ==
X-Proofpoint-ORIG-GUID: OYnqNL--7NdqzwpkyD6vyHtjwBk-XwWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62F9D6B7502

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..08bc89ce80e1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3488,6 +3488,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -4756,8 +4760,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -4772,8 +4776,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1


