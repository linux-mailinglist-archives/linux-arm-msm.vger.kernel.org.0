Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF23C6C2756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjCUBUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCUBUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:20:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB0144A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t11so17244347lfr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679361510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
        b=ubcPRMxmRwEd85TrfYF/RwP07EFJYEh945p6zqIsaVf+qEtLWvPWR+c7mYruJouS7s
         8+x3swC9Glg/NfQ/cQXkppvzxZmAy5uzWwacFfgUF8P7Ed8Fo3+SUAn1DEMCSGcb91Ks
         R7aJ2m7pdbKLm538cec2q50wLiHgJT6SjAv3q0ZsPx0bITbjcIHUNzkqRdmTK69fl2hE
         0KMGIge19xJMZQ3KrBhpu/C8Bp73iT5xOOXW3aQ3N1x8353qTu2NKmSepQnnaUkSk8CM
         7GwcAZZm/odQuZkjT2IDdPWLFscTAXNBFGo83Ov6C/8jNY42qLBYf4GfnwRJ8hVOLBGV
         zqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679361510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
        b=SfzP3ECFtaQWsOfvlhNVT6DK9TesET20CPf89mX4fRvIrbor5NQ4e8c8KeoHAsvT2s
         NPt07VKtpjbEcsz2qMrOLMDTrCg72FNzdXQd+tDKta1DLlGUIj1qFBWhQe/qvx52fL+f
         DzVHhx6UfBzdsbXcB5kGjl2zl/lcdQZHsGXgsx6dvzWWeIzqgnCrf32zOkwl4u9cvGK1
         UZNmE0YgUkGXAmuX10L+j7IXpag5V6aPcHOFDtOmr/nWDrUmZpmYB0MVxukahpCKe9LF
         FM89QvYgFwyraWbDmbcYVoyXEJqCCW+LifhlNxVxn+P6862KKgCcvSIzX9sscuY2nTJC
         h5Cg==
X-Gm-Message-State: AO0yUKVm0hRqLmKJEZtlnNqgdEoZoEVXjSdviaGIzqVkKAcPGSz/op31
        TA1iNhkGsk+x41Mk0iOU+rTp/w==
X-Google-Smtp-Source: AK7set/R+d/jdQwRe0GjLylJCWLzBcnmxTSOu/bfURtntrciRtQ/h/o6B+OE49fG3/rWDbQOQoc2JQ==
X-Received: by 2002:ac2:5218:0:b0:4cc:96f8:f9c4 with SMTP id a24-20020ac25218000000b004cc96f8f9c4mr260566lfl.45.1679361510080;
        Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats to the DPU caps
Date:   Tue, 21 Mar 2023 04:18:18 +0300
Message-Id: <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 212d546b6c5d..2d6944a9679a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
@@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sdm845_dpu_caps = {
@@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
@@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8180x_dpu_caps = {
@@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
@@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 900,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8350_dpu_caps = {
@@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8450_dpu_caps = {
@@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8550_dpu_caps = {
@@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 89b372cdca92..4847aae78db2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -419,6 +421,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2

