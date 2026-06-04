Return-Path: <linux-arm-msm+bounces-111121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnxXJ00NIWqu+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:29:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6B63CF8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:29:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OWL8E5H0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ITK7Qq+p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F28853069406
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DF83BFE5C;
	Thu,  4 Jun 2026 05:26:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EB3BFAF6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:26:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550816; cv=none; b=B+IpWhShG0iHRHFy5OeOIoou14rst8mgPZXBB6VBl6RAWyU2k5QsETaITETd7iKa1S+FtTJotBFbqVeGY2OA5Ah2LaVZLBfjD/2QPCFZ7Xcr3ZPWEw7lK6sCA08TaGhENl4TRYnZQf+nJH+4BMdMp+UjdIEf5WcJMyTY0ymam4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550816; c=relaxed/simple;
	bh=42ccGag0WOj0/GBe2dVH9h3Tap4krbtNxLr1X4sK6N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNQ/8tMuEbdUKYgTFzkqwKHNX/8UCZYw+O0u5ABB5WO1mAscH7Zd8CgeAI4NnBzcvETKi577V3JJ7oyiGXS7p+8ZJKafAS2BSk1wSqW2H8Av2TuY46eO0C/BO7vP++SxnRTEd6MApTq0JX7g40BCvxbH3gTTAN2VY69V4JNyWU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWL8E5H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITK7Qq+p; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542NQnW2262005
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=; b=OWL8E5H06GXMGVpQ
	gZNN8NmWWSACqYGiDciGdVRvYiNSm87VHduLObObTWSE8svhb36AJEU0oTJsD+Gv
	VUCw4wDQewRtqRcXjGHJJtN4R61Pp+1WLLnz4RJLckU4tHLdXXxNpFV+eeGJgkcd
	G0zc45pO/BB/dhaDvkXSgra2wEu8qlMfhILsYSONpQeao2vZEn7L9M1vyqs6k9Bq
	6EimwlYTiJRplMj5995yFZFNKdQrl6Hh4bA2bxrKNXfkJHW8bZjYjeB4vlA9/GiE
	Hud2RWWbW6wH+cSaDJvNnXozAi5NQrnsgwOwJ910jqWGqaSpm2m66WGy+Dd6pvUC
	OPLfSA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mjgas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:26:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428384f31fso277709b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550814; x=1781155614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=ITK7Qq+pdggMnF5wijd+YrcwKX43ze+EqUSwOrMYaw2OZiknPkAoyZ4SnSxvF3lp17
         xfdcupkv11hPaoRIDaonsYnh4UTMPudqnTdCIU+GwJUOdyXqX5sDcxZh7D9fM3tH2jcV
         1F1Anq+DT6rkjOrn90iFA/X111RcolBMGVA4VdCpgUrGWvuukz/gW4Oud35YnrMs8WXR
         PQ2+3skIsq2gzA4ocOVVl/XWvv9wDLG0uQ8AtXJN/mQfLdNAC8kWslzS9Uk0wicG/GkN
         2rR3pb5B/OGIldhav+R79/5RGjMi9YE56plhABfqRqCuQshPpW2ktYdltYZw/Lho324D
         4pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550814; x=1781155614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=LOpl9On0LDwuIRd0ke/dSh0khjbvexGxN7YgpHGnXC1Q+yH0JnrD5frG08ULEOKpcw
         yPkXOFMxLODLyi3lxKF9G1V08XiUUca1Licks+RGcGFJBBaqBXl7QY5VxeXbHIs7h6hi
         YMESuSKTkn/Xq9qaR3Arbd5gawRGe/3UieoRuC0+UAEwFsYx2GWOQNhPsANAxOXNcZse
         i8i32cOlSx0eopYWA/ScEmvvNfx1ImKrFlYVjJQ0FrF5rdiFCTryWhR/mLr+Hj3B95ep
         qk8UGXsaHJBOUqVKhNubkRvTlMNuh56+67rPp5uCRGoG+kTIWTFyt4KalkVDxzJ7wi6o
         cMFw==
X-Forwarded-Encrypted: i=1; AFNElJ/whOkRzyrj7BRIfoNn9SXHhblFrlvOIkqYTlJxFsXCWAzr7osIAQOImINBK8qXFnjsgqt3XlMR12XZQjk6@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkXVBj2m6L0qhXz2nzW7W3rGk7qrwWMwZxqhm0IRY2QV2uvc/
	ec/31valXTMWjJJUok1btHPgHWzNyVyiwUHSSw6cj5ejo+ZU5wPVlXVXfoS1yzcMZftItfh5qUW
	mymT9JaxcSi4VN9vB3YCjIFV+DgFjft1tG2J7KEelfQdHymdq+VHuLuZUVepQ0+wr6etz
X-Gm-Gg: Acq92OFHiPWwh2DwGu84eTOdnzqaY9BwNV0qO/tp79bzJP1o7VxxPzFaKllw7NiiJgi
	PJeZWxaSuO2bPGASp6y4Kg1tDSoOvISXpo+Pj7I/hQL3cZjKmCC4cB0X9JmNOMNcKbe658gtham
	SMvkrZAbi9DWiVSfUHICt6awcfLtVw4wWTSrqU3PtA/kKm0jzWIdbLz1Ofxpvz5/1bbSNDHyGqV
	2Bjy3dF/uPPo4ZJF2dpfs+wtlcFA1oJxjEJKRmzEv7j2AlTtP3dRtbuh++7QUSD6PNsPzENX4ne
	OTI1rtV2miAAjItFue4b49zoKWg6HYkVPkvRp/mBR79ouLeOTJiqT8Jk1SVkfxG54RLyWRd35c3
	RqwFSImXILFlWLDnW06lkOdJFgUf7h6+YplGh0XzO3I28S2ybjXB2xlWQXZ85iFE=
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408289b3a.30.1780550814215;
        Wed, 03 Jun 2026 22:26:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408266b3a.30.1780550813795;
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:11 +0530
Subject: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Jab2blliU9NiVKsjwkqxsuYEtp3V1-m2
X-Proofpoint-ORIG-GUID: Jab2blliU9NiVKsjwkqxsuYEtp3V1-m2
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a210c9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXy2RCwdzHBkJv
 4v1j7hFgKD+67lPl/IwQ4oeZ5bDgJyGUWCuYMZuT+Upmgofqi4w8eMKAU7BwqXX1KitntIMvrFO
 p0UPMjmJ6iLC9qCBbTHdI8EX9v+qaDZ7covYGNcvSUBGfueWEg5R1Yh1FlvlyRme5sy2lKCypia
 QSbbN/a+jyoPMIUvy3nu8930suf0/48qeGld4cVmd9uXwzB4ZbK0rXyzzwbq3vVCI3TteYx7GEe
 rELTe6kIBDkA4ysZ/9uF48djfHntL7tMyherNobRvtfjiml5MXRPwJkhpLTFvIj1KcCTqF80+8b
 KDOWGanpDTFwzXEgOorTAKODfMCGpsoQESpQUkYx5Bc+INGvVodsHhzmql74EWPq7jqr5kYDvDa
 FJqk2EgsrXV2qnDbORyeRogoRqMvKYHa/xiVFrZRbIUQ5V/X6x6dx0O4N3GYBGOY0SlpzgkgVxz
 KOyNytiaHB7CzYKvhUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
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
	TAGGED_FROM(0.00)[bounces-111121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41C6B63CF8F

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..1c21267ae0f7a86c1de88e888c2a990c35f0a0e0 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -49,6 +50,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -483,6 +485,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -491,6 +501,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -499,6 +516,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -509,25 +527,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1


