Return-Path: <linux-arm-msm+bounces-83418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B0C89022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DB5B4E2DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4631631BC8D;
	Wed, 26 Nov 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibdDzwTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfTrX/M4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608763126DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150013; cv=none; b=MsYCY3qOQ5RTg4IRZraNVfmQsXiFJPMkl80X+evSKM09vA4GaWxpXGeIl2dwqcq2rYtucHz62SRjBYw/x6XgZ6dwBX4xRHy87vER1pXjklRLCyBhncj37BfAXlrsFKsQDpvltqnE0YSDMplx8a4ggvg9wpWygBpBKYn/7hj8nNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150013; c=relaxed/simple;
	bh=BdLIVz6LV0BZOCe4sxOBNulMnhIH0NsgIFsIkmeLvPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ala2oW7Uz2AaY6sjrzGBlj7HHlQGs2yg3KJPyaoj/RRi4xmcD06o+rgDv33nbNOnZga9db15fEypcyoyFXumt3RIfYfju+bnoxR2eQ1evHw2+hPSgNEeKNGBnpaDwdgTSp8BFmuj4lnuH5TsLSwQ+KVckGo249zM2peyswj5EP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibdDzwTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfTrX/M4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gC0s1234719
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQJA1ELcDGRUgHNOuAM4muGRHTZ3uoP3b4oY3AK+qaM=; b=ibdDzwTSOIQfwQ7O
	50i0laNIUDdXldGx+ty+2dA7h0lmvbi4QbNUPhc1LQ4V4Nguh2R692ZvMcXRoeR3
	2D65AgK5jVzd0Z6oEoKITlytcQyoI0e3kBmFbOQsV4+UqVgTFopJ5Zyd+KLHRdy7
	pCJ/FYqbUpDCiTmArcct2E40Z6WPABvLVxioFWK4xUQDdPErbMSxwNGs0/crl2be
	m4kwzoZAknIjekKvhVna5WKZXwwFTWdnoEk7E1R2lla4azs7GP+XiZYzG2BXU0k5
	bKza8hHaxXITBwUccsfyRlbb+Cvf2ehkl1PcvoMMV+x4ZEW4CYw7D+1EpYEYF2n1
	vhlTFA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40by3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so14183949b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150009; x=1764754809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQJA1ELcDGRUgHNOuAM4muGRHTZ3uoP3b4oY3AK+qaM=;
        b=WfTrX/M4YxtmcvbO05q6Xt8XYmDbYQsW0gYMW+LZq7Y3GjpfP3okSkyjw1Vu0AVeij
         3Qo4JeSaj66EtthzaDYpOPFqInrf9v+y4d/3+oW/VslwpiDDChP5uQR7nVSStphL+NER
         AIuC4JA474sU3rXKjMwf4hLeKzqruEO9m3OKRTrJzKi9bYPvy4va2zb2CZjQAx7aigwe
         /M42n3Y2PXj+fAiw7kAC/w0W0R/UkKJ6v66o8imLc3I1G0M45F2Ejf4oK2epJKWc8ntx
         h7FbTR9mLeAfLCdKXP85rV4nqOTjuQZwn97dtAwBA7rjZwugKsAnmCLspJvjp3uz1m01
         ayzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150009; x=1764754809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQJA1ELcDGRUgHNOuAM4muGRHTZ3uoP3b4oY3AK+qaM=;
        b=MX2pPffI6M34zORhNGaeXvY4WilK6rFUSzuO/M6HwTZkfczZ3YjfhlxtvQ43DSILIt
         q9LlxMCZDKkeRROzfhtLUulTiSzHkXVatvWwaLOOoHBUTZIDerXs81NzWu+sN9VDAFhf
         VQREI5BhqzpxnE6rBW5eTdWHeMEJxL/8ibEbZqVtE2f2bIi9lpWdp82t+uSb8q7M2EFF
         UptbeukyJN5MpY/IcZx9v22CEQKJTTEa0/zOcEY7do/WB0lYKPMDz7e4ckBDZT+0NnEw
         UYf915zKHfflRe7rJst5qRp6x37VmOd4Ha0zZFF8Mkk8Kr9sdgTXkUtwyZHw0nSTmCKw
         0Axw==
X-Forwarded-Encrypted: i=1; AJvYcCUjiR+j8GOQd/6pR5bsfCsXnr1e0UgKjKB88hHj2ha0jYrOuB0zCi4Q6phH9cnWoWrvX1s2aY1PQWJifaKk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1oOxBEFTGdg+VDxZoHTQfAiUUVdxRvDiL6gUqsGLMZSjOLKV6
	+fFJIiki6F0jVB/g5WMXjZsDQmSZUV319c/KQsbXq2wtCsdaVFooyXYHmnzktN3ZfBUjeQRazf+
	eIawFwYOYeJVZbEzl4aMnvWJ0JBKwMCJbjwF5l15jz/vsQbWFBV4FFzpQJuKqDqGaYflR
X-Gm-Gg: ASbGncsaITMmWwnGE+IwKBHs7Rlr3y9qVICoEwCtIPfLWnbN7FGrXrpL9amRp6a/mB8
	nqaeuiuscvWJ+tJgcEJ6JhqNy760bZH6ye8e9l4a0Np+sphZEaziMH+Uez8rFtnxLDHTxDCMxco
	uEMpGcQjlMYTOownyywBBgXO0rbquxh34Xm6CxhWnT9MG+DzF/QBjRJtv5Lxp5LKgM9V70oS8kN
	qvZeextxmK00tJcRbSzCT1lLlzrhEP4ES4qKqHlWKjR/3CrutkpyzgXhGpZ6y3rRAxNyu2XrJoj
	9GFB0UZ6z20lDmev6NZHLzX6/pKaBMkk0TiFkk60Qv+knr1Nlb0fXK9Tp9XyrmE4D+YBHGHUEar
	0pHnaGacdGD80vu9Os/YJupulzPekgUfZD6XWe6008G35YjUSDqVrQvVVlzrqHkig
X-Received: by 2002:a05:7022:f683:b0:11b:c1fb:896 with SMTP id a92af1059eb24-11c9d70a12bmr15934810c88.4.1764150008635;
        Wed, 26 Nov 2025 01:40:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFma7DXOY5J0a2udLEd9VZx32/VBsAfYAE3YE9AX8DnGR4BKnB2PUk0sCrjgOf9oPepYtlW+w==
X-Received: by 2002:a05:7022:f683:b0:11b:c1fb:896 with SMTP id a92af1059eb24-11c9d70a12bmr15934789c88.4.1764150008033;
        Wed, 26 Nov 2025 01:40:08 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:37 -0800
Subject: [PATCH 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-4-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: O0GoPNHNNwYohKlDPCdVvcwg3TwErFQz
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926caf9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: O0GoPNHNNwYohKlDPCdVvcwg3TwErFQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX34qLKOjDPNdX
 IH5vqJjrbpeGmpdTfrbezLMpjitdSWIiBbe276cthGts4ok/e0YJC2INa8zgko/DdmdufbaJ/gA
 uNhvMP5R7AOVvwnvP1iy5AmONnXqFXabSlYOZ67ZwRP51O6Pp356EGp5S2Pi9ulXG40OE5V1wHl
 sYi5xvfUqivl9B/dduGSYL5Qv+v3Vi8aOtmwCaRaIOZLA0TA6l/N0iAQsdi2bQB051PVZPdss7u
 dvb5L2JO7eWJytF+MANjaJciVaz6uvPnNi7icNAucJiCZkx8lIXeu2on6FgmRZL9JkxkfzbD2TK
 69HNKXHHo1eo79z8Hk9yVanA45xV9Ce2MAe3wNQfp6BX0idWm0zstpzirUxQnZAs54Hxrg8WLkq
 DQgBLRPheEC/1yQ2Ja3kmis8eZAL1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  11 ++-
 drivers/media/platform/qcom/camss/camss.c          | 107 +++++++++++++++++++++
 2 files changed, 114 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f9db7e195dfe..157e946f67db 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -684,9 +684,9 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
-csiphy_lane_regs lane_regs_kaanapali[] = {
+csiphy_lane_regs lane_regs_v_2_3[] = {
 	/* LN 0 */
 	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -1134,6 +1134,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1250,9 +1251,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
-		regs->lane_regs = &lane_regs_kaanapali[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
+		regs->lane_regs = &lane_regs_v_2_3[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_v_2_3);
 		regs->offset = 0x1000;
 		regs->common_status_offset = 0x138;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 805e2fbd97dd..bfc942635682 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3870,6 +3870,111 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy0-0p88", "vdd-csiphy0-1p2" },
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy1-0p88", "vdd-csiphy1-1p2" },
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy2-0p88", "vdd-csiphy2-1p2" },
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdd-csiphy3-0p88", "vdd-csiphy3-1p2" },
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdd-csiphy4-0p88", "vdd-csiphy4-1p2" },
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = { "vdd-csiphy5-0p88", "vdd-csiphy5-1p2" },
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -5300,7 +5405,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


