Return-Path: <linux-arm-msm+bounces-89756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7285D3BF7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A98B84F6B4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 06:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30A837E2E4;
	Tue, 20 Jan 2026 06:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzXY1gIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPwu4fRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1836E479
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891393; cv=none; b=iasHIbL1Jn7Ld21Lc8Y12j0wYs7Dtt4T7yC2WJ4O4R2/GFSF7LSEEgjdbtYhwaB6+BnLdtjusr9aWnF3adoyO6m9gItVwkIrVgt3qALkBqsOGt0KDHOGUit2W2DSzyqLXQWItjJHBlluuX8lJkhRQnyRJvkWx2+8IHykSWTJ4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891393; c=relaxed/simple;
	bh=4xfEYBLIIh/QJTSywXNdacMhkuJaXkgcsUCelou2GvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpiitqDMTtmV9Nfq2H5OmYJNS36fNAl7rHG8Qu3Ga6eQ0LLfyfx3Ghs3j5L9XhdvggU5BWqTNteVmIPrXrJM5dWjGibkhHiMZBcvwz4XDAnntqxtDP7Nd6wds3ywUeVGEXo+OuWQXN0oQ3fCFHEoS92IZDgSuSQbjlWlY5FJncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzXY1gIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPwu4fRZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMB2Ex2096706
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=; b=VzXY1gIzLEHPbzxw
	nGcaNdY8lpj7auVz1VRgpnBexchuDecStm8mo5pLyEThNGKlzaGbjOSTQ1bV2ImE
	LPIwba8Y4HvMYEeVHu8jV/R2tGkokEj5bObARHsLBz2IDHwpzJG2dNlpUT0d6zEl
	v8HRGSeai/mmKYeCMuQyUbSXvxU43RjMpO/zVUJQmKElZmeTmZoPJQoN8dBvX4fo
	137//SemPSzUVS9L5YfLxJQR4B5F48vLAMUkE3eGUyB3nNh4pOq6CNzHpECH0cuU
	rGQRaYbboxLIOsbouktsT0BVXQ3KOHhEnZtFR8rAjdTyQbItLLU73AsfbO1bgUGR
	/XWh7Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7ju25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0588c6719so4154128eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891386; x=1769496186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=;
        b=VPwu4fRZgNW9yvSvrcCkLmb0eX+t4Y9i9D12y0LS0QsI8BXSsC1s0a+wui83mf7aBY
         3aD3pBsKn08xDmCoACzLgbN/XxlkcCy9yVzZL6g7FgI4IDqEEPb14q7kFBuIla/Fcgwi
         Ro4PX66kmBhoo9pG+2Q6Gh8AQZPztNjHFYrTWlVf4xVOnnfQD+0Tfc2tOcZ/RfGxTJal
         IAb4gC+8rtcqLOygAgaMhsUwB6z4qnctoZI211FKkbQw+9HZejRzuldYYpkB8zOsH+1L
         I3cWaIQm5DOutAUU9qnlxvNMdF/1tw08hgsfe3VoZLSHLM7AuLNFlcYqwCvd09wvSPu2
         Jtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891386; x=1769496186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=;
        b=Q4wPan7+X6mirTtrbFt3SlKOnGU7pv934x06+8zlCotLuK5HFNfKxwM+GTUeX/aMi3
         lV3q498vr0UXLBn5pEPyzzp1/7G6ViDxqKF+PVD2oCscvyzl8xqTd/lPMKFo7hKC16uL
         9XKtiMQnCYvlno1TqcpfG4hSHfevPs2t/b/FNG7qmoag7cvvqtAigU+eRHaC9hLxuMyw
         AieL53Shqc2jLECPqwa51xJ9UyHZbWgqmjuTQZmC2rdBEIEo+b1zPNeYT63BwAMaNQU0
         yMOkZpqs76wz+I7au6uBqUcEhThLcmfSbLf49lGp6Y/yZ+/Z8HvYQonlJczZbyWf67AD
         OZuQ==
X-Gm-Message-State: AOJu0Yy+l6ufrptAvduTVaiFjnwW5Id1O78DKPvI5pHs5wvDnoLWz4HN
	tv/A7F5zz5DW1ge/nP/aiQw8DfaNdtecLI9loYBQ+hIZFoG7wd3lkz3mldh/QyYtuUJwYo5byp4
	9QW7O9V/YdxZKMKcJbxMC6FIhYKktsKDV1mkzK/g5qdcNEr0uZNmtLnj0rY5SY+y/5Bon
X-Gm-Gg: AY/fxX5GvSNy+3is4Dq3c6KAyl3fZrNk7UvI7m5/9l6P3FgAA6s+vEhoXB1j8SD92CA
	oZDkB2q34kPqGsdbTiojpJjkaREtUO+DxXAq2kEFIPiige0oEmISFmSRNrRKN19Y7EMkUCu+oae
	7RU0vxwqi+3XvLRShiIu5Wrt9GX13y0eeEdDYT1edGchCyuY0DxMIP9sVIEMVmL5kGKUqIJUxqT
	SFtSgsw6jbHxgDxRlc6VbrqTWO287zCgNv8yOno7hys53A+5OHYwmiZqGaOs6Zacqw0w2splZGo
	Dv+QPT3w1XDXY9uR4BZvE5QGOWaJ4/N9ABpaAETVzWagtZFXz4nO7YFNfWYhniNfej1C3EwoWXu
	6+OkNSI0I6lIO6IUUKCzOuZtRxwJvuIa6ID3smpBelzwXOfG+ITY/vvU71CLpOwfT
X-Received: by 2002:a05:7022:6189:b0:11b:b471:dc8d with SMTP id a92af1059eb24-1233cfad056mr12767782c88.2.1768891385457;
        Mon, 19 Jan 2026 22:43:05 -0800 (PST)
X-Received: by 2002:a05:7022:6189:b0:11b:b471:dc8d with SMTP id a92af1059eb24-1233cfad056mr12767770c88.2.1768891384874;
        Mon, 19 Jan 2026 22:43:04 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:55 -0800
Subject: [PATCH RESEND v2 5/5] media: qcom: camss: vfe: Add support for VFE
 980
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-5-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfXxb+zax2g/NFs
 yG2cbD5Uk3045bHrwOgT7hPVUXYES3U8N+T7G7G0vy+6sImvOT5J31I8X/rBW2K9e1qPgNV/u5s
 nYOxAHEpA1kfFV5CdTXJ0CbPC7G7PNvNeZtwO7bZ/WfkhDyQJBrb2iVWivKlUh9x+B0G5VkQ/Ig
 jH8KSiC7oN2ZTjlYlQBp/IClXgYw5QWb3/2AZiM9kKqi5GJyXX5biu4VzkCEHlWFWn02+QZOvBA
 NkkAx4LMgfMTFGSgtUThInPfP0/Kj3TesCi6fDxRhIQrykROB05MLCGXiH04tj2ifKeTwcw0Asg
 qyLwsXLDDHb8STRdHCxCE6Hn/49CkMORWvAao3Zp1+Nz4/Dgsd80M6hlq6VolJwFLlB9tr9N0hk
 wlgXbXzu2/bCzbXRSrKcDBhPJ6m0rFPJLBFJYQV6ZnX0gGHIjZgFN3GiQcstlR9juNnmgo5b2Xd
 b40j3yx2W6FmvaiPLrg==
X-Proofpoint-ORIG-GUID: 18Yjh0u83V_XvlR6hzWpI1P4Zg2RGaqv
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696f23fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3rR15nC7HOTWOJgZU7UA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 18Yjh0u83V_XvlR6hzWpI1P4Zg2RGaqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add support for Video Front End (VFE) that is on the SM8750 SoCs. VFE
gen4 has support for VFE 980. This change limits SM8750 VFE output lines
to 3 for now as constrained by the CAMSS driver framework.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 135 +++++++++++++++++++++
 3 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710..46d8e61b9bac 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 99630ffa1db5..fbde638db194 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -351,6 +351,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2014,6 +2015,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 005f9a243ee1..1f6bacbbb202 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4444,6 +4444,139 @@ static const struct camss_subdev_resources csid_res_8750[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8750[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe0_fast_ahb", "vfe0",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe1_fast_ahb", "vfe1",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe2_fast_ahb", "vfe2",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "cam_ahb",
@@ -5885,9 +6018,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
 	.csid_res = csid_res_8750,
+	.vfe_res = vfe_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.csid_num = ARRAY_SIZE(csid_res_8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


