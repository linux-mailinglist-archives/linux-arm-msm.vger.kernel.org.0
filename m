Return-Path: <linux-arm-msm+bounces-45625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14577A16FA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FBB3A488A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FD81EF096;
	Mon, 20 Jan 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnkbOXwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C461EE013
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388034; cv=none; b=esH+chhOsbkoQeL2s/wjn7HaXsLZzFwmTjPTN9/0tw0RcEtRgAbTq3BQHmLhK/UVra8JfbEZ2WlcHkuxXgkVNYGJH2I8zR0Uhx+0FzlYPsUu66BKssvJjMcadiQoGtbH3IQcYab5vKLYsDc6uHKOfAnhvCHj+m0PRxKmjpAXls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388034; c=relaxed/simple;
	bh=w3R74BaBkfWv6/gs5HkZ+GN7B/D/n3Ira0ZO8St8Ttw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvOH19y5UZPGdD/7UIl7RFpoVb613axjAd9XaQ0zfxglB+OHP+G3BMt1xnzCAnr/M3my2fNpkcQMYF7mTPwVpDKjJbQWk2TFQC4mI7oruo1IvPf7mNhg9hKQhpPiqmO9n8ZZnJVkSVbZrKdzLSOM5OCmTF1VnQyiI77nQnD2qVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnkbOXwP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2103659f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388030; x=1737992830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlbfgbMP4TlW1lPU13Kg+FtoOjGMZvKdb8QxriksIXE=;
        b=RnkbOXwP/zNbMEoIvEjinOhPQZzg4XxTXoWWT3QCfVAr+7R/ABZYF8hPOpyjWCHHJD
         4cTS8jQukrCdxyInJJC8jvz37oDp2JEEmmstw2Dd4kn4D8CX/Y7d9fai3Cm4Vpxw+pUF
         IHwHqEs6bTCPIR510jwbX0qclacxXw9cOKNWETimWB/3UORxG+iyOkjUTzP9DNOk3bNd
         ekEPemyKk7mH5YUqOq2NVNoCHvP7uZO08iFbTSK6utqIO9VNDcfNVBN0nWRQjw+hqCtb
         tpapTahgC15zZ1TKoYUJ4MZOz7l7IueBpHrLgMuJs62yRPh+blXQzPE3lAwxbb6bP/mv
         ehqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388030; x=1737992830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlbfgbMP4TlW1lPU13Kg+FtoOjGMZvKdb8QxriksIXE=;
        b=qnvNJ5cDUm+Lv1tuChhSMiHeFTqlrA8jzInkCaD0nAV7q4W+5IIqnmvFsUDAqHsObc
         7mQf8PX647NUAaCyfpL8vweEWNKkiZXayB3/3nxBUQN91hlYBIdCuUMlsm3mlQjmHPdM
         xcHnQbtT/lgs3WGZnykYALa/XBHHiR7+EpYJqFUK7lueKrcPPxYKfeSww3ZN1rROg4RW
         c2xKCR1JfNu44FqZanDD06Mr58Z5rZ15enDmmvxcDhhPyg08iaSyaXRKvcyhl8piSzRj
         /36HrGxCYe6HlRDgUVIQEdtKp44NOrf3ZO96mh7c0lCpTFz1PGw3Ix7kNi3N8RziTRos
         0IqA==
X-Forwarded-Encrypted: i=1; AJvYcCUm2+pCL8Pg8WBqpw7FLLOK5GiR6gfgbfsWRPK6gGV0HswR39ninHES21mni0f8LfVAy+3MYr0A1XP11n5w@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTQ2mZM8I5HOPi0tvg5FOj1op1p63DNSYLxECRWmmTx6ikhdJ
	DtJvNU1GmsYRpAx6FyUZjr3kJevNAex2iw+kEDKieyo0HDUFVr18jiHwJHgEyho=
X-Gm-Gg: ASbGncuZnv459Gb5z9tgc+eK8qRkoc5bslZhVEZjTDTeruBC6UwSqvrf+lQKReKamie
	9V7qd97nDkf3vvev8AILkY0vXGTYFAV1ytK7yx7Jwig1IZm7ttVltZHsjt4Ewbh2gN1UD5mfwq4
	efv8d9Jtt+NoUyn1MLX1Cf6qRDl9fFtAxthTuZLl3D8ITQsZLwbmgWt/i7D8H2O/7bzOueRH3zD
	LpXh3FuI1kTRVYAn+jiO+FaVDIBzGBw/pJ2Lp8ToOiB8KGIvDxbeXp9lvHI91GUKTGQ3YvGtqtP
	mIc=
X-Google-Smtp-Source: AGHT+IEjAuygC/EX+XK7ApY/+FyQ99t76VxiNzEuMeI4fS4vGaTa6OLrfRDJfPl/9iSs7F/F5z9JGQ==
X-Received: by 2002:a5d:47cf:0:b0:38c:1270:f964 with SMTP id ffacd0b85a97d-38c1270fbaamr1640338f8f.47.1737388030397;
        Mon, 20 Jan 2025 07:47:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:47:04 +0000
Subject: [PATCH 7/7] media: qcom: camss: Add x1e80100 specific support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-7-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

Populate CAMSS with x1e80100 specific hooks.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   6 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 286 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 295 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index fc624a3da1c43..24dd20de014e0 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -754,6 +754,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		ret = true;
 		break;
 	}
@@ -842,6 +843,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sc8280xp[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
+	case CAMSS_X1E80100:
+		regs->lane_regs = &lane_regs_x1e80100[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		regs->offset = 0x1000;
+		break;
 	case CAMSS_8550:
 		regs->lane_regs = &lane_regs_sm8550[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9ffa6bc72cf1e..4f7a559f9992c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1972,6 +1973,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a128b1d1c6d57..02fc49ff46d18 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2294,6 +2294,276 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1e80100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1e80100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
+			  "vfe0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "cpas_fast_ahb", "cpas_vfe1", "vfe1_fast_ahb",
+			   "vfe1"  },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
+	.reg = "csid_wrapper",
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -3346,6 +3616,21 @@ static const struct camss_resources sm8550_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources x1e80100_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_sc8280xp,
+	.icc_path_num = ARRAY_SIZE(icc_res_sc8280xp),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -3356,6 +3641,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
+	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 58fc61e7cf7ad..426e80f1c4b52 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -86,6 +86,7 @@ enum camss_version {
 	CAMSS_8280XP,
 	CAMSS_845,
 	CAMSS_8550,
+	CAMSS_X1E80100,
 };
 
 enum icc_count {

-- 
2.47.1


