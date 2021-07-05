Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0193BB4B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhGEB14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B79CC061764
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:19 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a6so22410703ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
        b=w3dDSLN3s6dj6Eu0RsDo+s3MXu59YHHkVWukQHMb3jMNoaH5ZOPh01bXrgyaEOf/ee
         JrgKMnuSjLxehp+t0zFU4/IU48Z7bzVQN6Zs1dXiLgSDxH679bwn4ggDs80xy1Sr8apJ
         PMU8K0pqi/NH7GnQ+7O5sZT5P05kZ6ukJu2RhjH5R20d29Ozu2o6WMMIZ5VlEgYyGixq
         t1mHyNU2gQAM6lucsoDzVrr/xWI6zlCe3YWauAMHgLHU15qvNIUAyNYnFOoRnB97qPEg
         a4PjQOkaspcoqm2kzEUnezIonjCIA1K2m9qmlgpkC9vxA/NZYwN8XhOS8Gn8Yzheqp0l
         RTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
        b=dJyp9mmaxtfk+cuomYM1mflln3nmfze4MY3WV/J46h+8R20xosnbuFnhDLLR/nBw4i
         1Y6XdNHqcPv4+jvXnjwnNHHvNagQMeNqtYVD0A3UrV7O14Q6sXu2N33lfEDyK4ZvALmC
         yhNwKziwY3eyNU/LE95WMor324+jdMzHq+JmeEdycgR6VjoT4IZ8UaCo+zr3g0NAEn5Z
         31I1V1EAAst0t3rk6bKXkAiypOZWKK7eo9woJ7vO965qD1uMPe1NEUZGGU/PAnkOYuNV
         dpMCbgfzxtIp/NP5t9CdsNBRu+pXp3Ge3aA7NNRsDbEq9xT5DJ0VGMjmMb8vX13iAT1K
         ZW+A==
X-Gm-Message-State: AOAM531SeRGZN5+vi9hvvL+w5/Udlx4jBDlKbUjdefq9WfZG9/XLDfwh
        dfLbAH2EifD1cJeZegeNrO3NSQ==
X-Google-Smtp-Source: ABdhPJyBgJHrsLnImuBCvXevidlUx106HBbkf4d9I/VRlJgvxqrzm35g/QnBhWAaTj9rmTGB74lX4Q==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr8919899ljh.55.1625448317628;
        Sun, 04 Jul 2021 18:25:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 14/22] drm/msm/dpu: add list of supported formats to the DPU caps
Date:   Mon,  5 Jul 2021 04:21:07 +0300
Message-Id: <20210705012115.4179824-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d01c4c919504..b8e0fece1f0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -195,6 +195,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -207,6 +209,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -223,6 +227,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -237,6 +243,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -249,6 +257,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d2a945a27cfa..f3c5aa3f4b3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -324,6 +324,8 @@ struct dpu_qos_lut_tbl {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -340,6 +342,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2

