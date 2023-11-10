Return-Path: <linux-arm-msm+bounces-395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B747E765D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D621C20E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A27E7F1;
	Fri, 10 Nov 2023 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK6gt3Bo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD71104
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:04:59 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660EC3C19
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 17:04:58 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso11179765e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 17:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578297; x=1700183097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nU9fYZR+2K3QutxP+Bn6CTJGz4Zd3R0Lyr0w7NYqBw=;
        b=hK6gt3Bog5FdeJQwJ3yiaitMRFEgYTOjza1CVw4wkpznusblKA+bwsGSclzGoyt+RW
         A5lEbzAzImi83kzkvwpF/8Ni8WGDt8srpkDxSp8tm7HE0TAk31m+Frl3OhLgYrs1CvU2
         Hi3573GWAi4oxpXDcSQ0WnM/9gi0UEK/bqU/ViWpproNFyrp74Cvan3TMOdq5nju8COp
         o52a3tPD8LXvufgpTvbAJYbqX3YzTTlJTx1vpN9h8l8ZnI6clqwlc8xwFLYU7eOHPj9u
         4p0hEcD7k70Vz5mpLvEHQP3VmFkhkNsP0OKr+IuSpt4FAyYKU9qwrN57fgpZ7ZdAXv7o
         cumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578297; x=1700183097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nU9fYZR+2K3QutxP+Bn6CTJGz4Zd3R0Lyr0w7NYqBw=;
        b=FkIB03IStAZoqohABqH5Ha5pSvbB7i0LdZwhsrJVFds9Hl007do9y6oba8lPKV34BK
         n99MksSeFVBbS4PlySdpiz0T1jRNlWmA04VcDZWeB3t6EUeYO6yyrULJ2XfZ7beFBFXe
         hlRYCWxoBfKgmnjUlWAdtOaQXYynw93rx2wEtLV+cu7fKjFxwzSqcUhSfo3eE6S6bV63
         Tskrxl/1aaVqDXKIrgY+690ptxcpB0VLLQE5SIoV7phVVlF8gWqqlyVH5+FbL9dt7Bem
         U3X9qvxEWMLfN+ke/x8Y49oCxzZ3LbGlJMHaU0tiq9r1aCCtV+3W6pNZtjrpeNmejttj
         dc6w==
X-Gm-Message-State: AOJu0Yw9+dDFvEfSEIiwyq6ZWoc1dVV8PkdKZVTWPSCc5+Z/6OtXD9WD
	CSIe0SAJf20e6Xzaxr7WJ2JaaQ==
X-Google-Smtp-Source: AGHT+IFb37GdOGbi9TCUzksjOZJ0RLEoweUvkA8zHWpoeHguQMXqLiQmk7wGQtv4b1gaBUcfwR9NQQ==
X-Received: by 2002:a05:6000:2c1:b0:32f:7c24:f02a with SMTP id o1-20020a05600002c100b0032f7c24f02amr6540211wry.58.1699578296964;
        Thu, 09 Nov 2023 17:04:56 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 10 Nov 2023 01:04:50 +0000
Subject: [PATCH v5 5/6] media: qcom: camss: Add sc8280xp support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-5-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3

Add in functional logic throughout the code to support the sc8280xp.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 23 +++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      | 25 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-video.c    |  1 +
 4 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 66ff48aeab646..df7e93a5a4f6e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -513,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
 		break;
+	case CAMSS_8280XP:
+		r = &lane_regs_sc8280xp[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
+		break;
 	default:
 		WARN(1, "unknown cspi version\n");
 		return;
@@ -548,13 +552,26 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 	return lane_mask;
 }
 
+static bool csiphy_is_gen2(u32 version)
+{
+	bool ret = false;
+
+	switch (version) {
+	case CAMSS_845:
+	case CAMSS_8250:
+	case CAMSS_8280XP:
+		ret = true;
+		break;
+	}
+
+	return ret;
+}
+
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
 				s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
-	bool is_gen2 = (csiphy->camss->res->version == CAMSS_845 ||
-			csiphy->camss->res->version == CAMSS_8250);
 	u8 settle_cnt;
 	u8 val;
 	int i;
@@ -576,7 +593,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	val = 0x00;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
 
-	if (is_gen2)
+	if (csiphy_is_gen2(csiphy->camss->res->version))
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 	else
 		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index edd573606a6ae..8241acf789865 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -579,6 +579,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		break;
 	case CAMSS_845:
 	case CAMSS_8250:
+	case CAMSS_8280XP:
 		csiphy->formats = csiphy_formats_sdm845;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 50929c3cbb831..28cf63af1ec08 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -225,6 +225,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_660:
 	case CAMSS_845:
 	case CAMSS_8250:
+	case CAMSS_8280XP:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1522,6 +1523,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 			break;
 		case CAMSS_845:
 		case CAMSS_8250:
+		case CAMSS_8280XP:
 			l->formats = formats_rdi_845;
 			l->nformats = ARRAY_SIZE(formats_rdi_845);
 			break;
@@ -1600,6 +1602,23 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static int vfe_bpl_align(struct vfe_device *vfe)
+{
+	int ret = 8;
+
+	switch (vfe->camss->res->version) {
+	case CAMSS_845:
+	case CAMSS_8250:
+	case CAMSS_8280XP:
+		ret = 16;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -1666,11 +1685,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		if (vfe->camss->res->version == CAMSS_845 ||
-		    vfe->camss->res->version == CAMSS_8250)
-			video_out->bpl_alignment = 16;
-		else
-			video_out->bpl_alignment = 8;
+		video_out->bpl_alignment = vfe_bpl_align(vfe);
 		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
 			video_out->bpl_alignment = 16;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index a89da5ef47109..54cd82f741154 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -1028,6 +1028,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		break;
 	case CAMSS_845:
 	case CAMSS_8250:
+	case CAMSS_8280XP:
 		video->formats = formats_rdi_845;
 		video->nformats = ARRAY_SIZE(formats_rdi_845);
 		break;

-- 
2.42.0


