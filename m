Return-Path: <linux-arm-msm+bounces-65287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F5B07989
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5EF8580DE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2302F531B;
	Wed, 16 Jul 2025 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBSIobQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294F2F5080
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679247; cv=none; b=px7PGcncAW8zixPkH/RQAustToIT/72Pvt7EJmXhTin310Wa45SRWS4SquByguxyGulAJ4BOKskxxBRNbQj+7xKfeWHN9RrnUu8poKH8ykJs+9SJdv/+sVxJxo4XgTw6yazhCktzNv7mEOBVj/W2liRn30wR6RxNq7AhEkvJ8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679247; c=relaxed/simple;
	bh=iSXFZ/rxSfqiYe032EgSZdLxuNhPgtOw+DCydKf66Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgcNMfHMMnHxwWvJUU1AYogMdomm3TUl86wCYY5+VJxEWg5iDE8GlIzJh7a3PhuJLgSMpA/ldxRmu3nHjff+I+b1hdqRzNNSuaH03z5lde9kwVHlCXRXQXlXKbrawp8FA78SIHRlLzUY4o7XpN4Sr9q9m7s6xCsLncm1mG1y7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBSIobQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1WdF031464
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KeWo6NhvYfL
	SpZC4i2L+Ou9NoRlmlKN1CvQ6KpYQ+j4=; b=mBSIobQf3aVJSci4MgOtVXV+25K
	RmvnH6s8JyyRBOKoao8r31UDEb5uq5oV3KJMtc/1mGHCJb+ziDvOB8fr20FWAe42
	GZpMVO4a0kMAuG6gjF5Ll7DyiA/TsN6cZJytLp/uRD35jrySa+vhZlK06tFfKDCo
	aj7/bPoX4eoSLwl1ruuecLyauCEG6CTyJ2r0JvCDChNC2rIMDnBfKvL3H65+vlLS
	mITlnRFq0J7jWt7O0YrPhDYn/2goL4vdI5b+EH3nL1F9wiuZ7XoPpGW9B3iDKVGI
	vC9yvIURrdUT3T36yzMuzg7B0CU++ASc6wajVsfAM0HXQd5M58r5MABKniA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h8bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so7992023a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679243; x=1753284043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeWo6NhvYfLSpZC4i2L+Ou9NoRlmlKN1CvQ6KpYQ+j4=;
        b=eK5/Ax+TYKCxI6dDvNdWtAZsOHFRfCn0ADaHwTJw86iVqSD2J5VTimiW5+5NgWngdP
         lCyDX5rqlPlqlm86cdAC9ZhriQ7wTLaKzmA0Bw2sHkUg/qgGXkMhS6d42AGr4cUlRvEB
         5M5s/i/mPr6d8jBGi5unWtpDPvMuPGOgZRntJrUjbg/FfuNvyQuDDVkGk7HT86gKPn2c
         I//9JI9Q14WO3pYif+YhK4SkbnP6oQehJ80yv9pOu3ejyONNVgYSGEJBwcsoY5SqxPk0
         kU4PZiQXNgg4gd7q14FE0ZQ7mqAjZdWr4JFTm6RlY1KnM7dUWnZ1u34r+cnNHULAJ3yl
         ChTg==
X-Forwarded-Encrypted: i=1; AJvYcCVU61/9I5wYRadeOgp/laC5NmbW3Fh5KQon0gItck4OvZFyu/TEaX1zT6sbx9BotmyUSQkXEOO5TkssBWaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMMx/RaQihgIGwPAIYVxCdxUsIbAYCMgZD6zfA4wcDwOpDHZq
	2VZqzlwLQgMDRpYWsWf3Kz+tjt6R5VsZqLoz+n57yhlErycAcf+LdTc/4kg8ZdhmPAMKjI6Rpo7
	D+DPniKK+eLYpvUsEbBYZI6thHhA89wh5qDAighOi5DtjJ8HbnREtngiuIaU/bJ6VPNvD
X-Gm-Gg: ASbGnctQr4tKgIhAPFYZ0M9wnXzv4wv1yQzIjuYPPVQ2kMQOCsY/N60z0A2gAE62d1b
	fm6Qpkj7nyr6f2hT68S3TdsE04o83LJVh61R7Wk3DfxxaRiLcFja7nJ+qt8wucr8u0THD9qQrYH
	PqenuaYISkQ7zzf4b/RCpk7E8dj9JopVOIt9DyJKVNbMvmt2qIYxdYEbJXpAXmF+YRqOfPQBHOV
	6fJiKrqtyC/WCj2kMYdr9M3zsacD8vmTu/6P/Ye1T6PkmMP4pUPYUOVuMMyFbFBjAUfoEc/z5TR
	Z8ruHPolFhXXyTJSeR5v+KAlLLUnRW5537GM32uQq3EK+DH9Xkqn42XdK8YkP3RWVLnxwaGcoL4
	jUuZSCE53Owg4vIYgqVSJ/XFqLICCmJTjFucg9ZAVSBXmspxI9MyllVVmAWyd
X-Received: by 2002:a05:6300:6d0b:b0:238:cded:d32d with SMTP id adf61e73a8af0-238cdedd407mr1274383637.23.1752679243321;
        Wed, 16 Jul 2025 08:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGalH6XH9sbSz8Z1EVkarL4o21D07/XcWEc3VRsCi3TM9BgHq254ZLszBRAS/A60P5dNPeUGA==
X-Received: by 2002:a05:6300:6d0b:b0:238:cded:d32d with SMTP id adf61e73a8af0-238cdedd407mr1274334637.23.1752679242755;
        Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Date: Wed, 16 Jul 2025 20:50:14 +0530
Message-Id: <20250716152017.4070029-5-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX1xZHr0/mFgiE
 6Hq+Jj+uIJarNiF20zdbpNSuObaakEtozynIc9cC20hOhWXDhW7OBeSYym/QAdbOhF3llV6Qm3d
 +I3l07WFTh2/Pxlvxe+Zoaklk0H4SZNzsBeHoikqSW2A5IcawixdkDNl6gaJLigEiahnuykSecH
 6rxVOfJ40Tf22PzeyXvTxzolc1GTtqsySPn+FCgjKDMwNLvT5bnxLfuOiUo78rFUpBcCEzpEYQM
 Jy1Zz/7yN3rybTs4XI/f84sZQyUGVF293/AnCrQkEYi8za7KtGOSj8I3eib0x6usnDUnK90dia3
 3hB7zRSElUPen0MUjK/OJwo7x5wawkrWKgt5nWjodiWT6zeWYrALGYdPcAj/m6UFatKZa1txVxN
 BcW0f8Ou8sl2PjZd3zQoFsNAidVrXJ3H2P0ok592Vhhmt9UOBLMHFlvqk7V/82QFhU0K98n5
X-Proofpoint-GUID: q1vfKOBHIQnXfMM-0f70w6OCWyzhKkBX
X-Proofpoint-ORIG-GUID: q1vfKOBHIQnXfMM-0f70w6OCWyzhKkBX
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c34c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RRvC4NyyfoRIYhV0TvUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add RPMH clock support for the Glymur SoC to enable proper clock
management.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388..1bc1333087b4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -388,6 +388,11 @@ DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -854,6 +859,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clka_optional = true,
 };
 
+static struct clk_hw *glymur_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_glymur = {
+	.clks = glymur_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -943,6 +964,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
-- 
2.34.1


