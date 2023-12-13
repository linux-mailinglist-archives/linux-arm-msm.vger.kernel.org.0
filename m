Return-Path: <linux-arm-msm+bounces-4491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A70810715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2313A1C20DDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385B6A49;
	Wed, 13 Dec 2023 00:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBMS2pxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8670EA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:57:31 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bffb64178so7477617e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702429050; x=1703033850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iw+vqIrpMCqoLuNdswkeTR7o91xkh4BP60Z4S9vbYx0=;
        b=uBMS2pxG/g6Hdx/NHzkNw3j81x+omnRKTnXUzW3EFiTD4yE9zxh88ORTlqcM3sb/Vq
         yqZAsx7WLPN6M3du16qK7CwnF1DQrfLoF+Bdwlw+Q1i5xj9kO7EV7H5pHBjVwHz4Ab6A
         b/agjGBC67QWl6ArP4kbA/HJCc7crM/AYSZfXo1YftdASff4yIkwmrlRmWsCeuKLAFuy
         b7cpRbjnWoy7yycMY0DZ2jFRNkKzQWZ7IJNw9h6eCMG+DEwop94Onr2KVP5/hvjZqhcy
         L55AD0elFaa+my4iqr4QZC/I+v0A+hOL+dZJ4uGMqQ56nNKs02ETkev2OpALItGDE2W8
         J0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702429050; x=1703033850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iw+vqIrpMCqoLuNdswkeTR7o91xkh4BP60Z4S9vbYx0=;
        b=Gv8pbxERQqcj96RvQbkQbK4Y2FlFBGFmCngIRFKYHnWrR4U4QxIAMv60FSYdSpDnOD
         ZO01YUkW4Xv84ZJ16SAW6ATncAb1vk4mkn6alV2Mqpb2DvdmvxxQL/Zj3tds+aZERoB2
         MCivhgMk1iJuq0nUJ/TYIHyfdD1tioUhp3+DwneDad6zCpZdUggwAFp670zwy/VYn1BW
         8F3Cfds/jhIyPaZeOb5KVjqV1jf9WJe6l8a241lqnUAdXKIJ+T5W74BDShM2wjyEIQFo
         ialTiLUO8HSrQbAeS6LnXDJNSZ3YqKhMd/0fTUNuE7pU5U/MVrOvz2MfhzpbN0Cwekh+
         gtwQ==
X-Gm-Message-State: AOJu0Yz9SqenbpwK0BJ/XCgLej6+R582FwppYXWP7RwYEY/j2QPRlfi7
	haXnw1CIYf08p7LfH/73/QZskw==
X-Google-Smtp-Source: AGHT+IG2u5rGzo5hYIj9xeOkLdMYT04GmZzKwZFkbccKkIYix0qfsOih520Fx6RMmwO2wAWBGnV2kg==
X-Received: by 2002:a05:6512:3451:b0:50c:221f:857a with SMTP id j17-20020a056512345100b0050c221f857amr2877687lfr.136.1702429049729;
        Tue, 12 Dec 2023 16:57:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020a197605000000b0050c2294c65dsm1481370lff.261.2023.12.12.16.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:57:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: move CSC tables to dpu_hw_util.c
Date: Wed, 13 Dec 2023 02:57:28 +0200
Message-Id: <20231213005728.53060-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move CSC tables out of the header file to fix following kind of warnings:

In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
                 from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:5:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: ‘dpu_csc10_rgb2yuv_601l’ defined but not used [-Wunused-const-variable=]
   54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
      |                                 ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: ‘dpu_csc10_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
   39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
      |                                 ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: ‘dpu_csc_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
   24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
      |                                 ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 44 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 44 ++-------------------
 2 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 0b05061e3e62..395fdcea28b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -561,3 +561,47 @@ bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
 
 	return clk_forced_on;
 }
+
+#define TO_S15D16(_x_)((_x_) << 7)
+
+const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+
+const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
+const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
+	{
+		TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
+		TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
+		TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
+	},
+	{ 0x00, 0x00, 0x00 },
+	{ 0x0040, 0x0200, 0x0200 },
+	{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
+	{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
+};
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index c0aaad2023da..25cc13b57756 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,47 +21,9 @@
 
 #define TO_S15D16(_x_)((_x_) << 7)
 
-static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-	},
-	/* signed bias */
-	{ 0xfff0, 0xff80, 0xff80,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-};
-
-static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-	},
-	/* signed bias */
-	{ 0xffc0, 0xfe00, 0xfe00,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-};
-
-static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
-	{
-		TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
-		TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
-		TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
-	},
-	{ 0x00, 0x00, 0x00 },
-	{ 0x0040, 0x0200, 0x0200 },
-	{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
-	{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
-};
+extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
+extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
+extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;
 
 /*
  * This is the common struct maintained by each sub block
-- 
2.39.2


