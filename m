Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD2331B2D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Feb 2021 22:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBNVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Feb 2021 16:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhBNVf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Feb 2021 16:35:56 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7DFC06178C
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 13:34:44 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a17so5593044ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 13:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X3oQlK034EEXzVHV9w/Hp4W7yC/z0cpwLLXOmsVzkLI=;
        b=BT87EgepeeF5OxT3DLWBnraFAXWBUJw+XsAhozM0jPI1+hOKYBATXfvW5DpTFyT2QW
         8JcNrdCYRRJX7sBZVBiBdiOmSG1DdfDcLTl0Fw2cnJrz4xbw3uu7FQ2D2lHK6evp9Gif
         sOM1dsOtUxw5YwsFtXQS/4KfyOKh6H78Cdm5WQB+h+wS0aX58JCUt+i3co59QOv5vprO
         dTXJjN+XlR2RdzjFZ5rDjfLldzLxtimRoAnY1EK+MFfSn7O3xgv5Kx3rnFyMzt3ugsFC
         s6VqqcopcUGZIELFepM6U577xkzabQcuP9+9aPw+2EvnB/lmg11iy8DYUHiH1Z/f09vk
         NrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X3oQlK034EEXzVHV9w/Hp4W7yC/z0cpwLLXOmsVzkLI=;
        b=e30JpTdN69h0rOstNdSjwYKptR8cJE0csHvtxHdJnYw/axEJO9txCsFOvIcwvDb4i+
         Ysa9GCPvBnPT4xU1LXKckdY2uBkx+rfcTTJV+rS+NRSHZVsZYZnasVfe8umkEvJyYiG8
         dcIsFi4wanPFN6rMM+LXRMmK8LJ+l/SlLT2XvhHb4JiO+nYZO7rQZIDyPdDjtdHHF7Jm
         o8dN6yqT4gnc8nb7Jie2tsyVwn7A7OT2ZWJreVPwspDXcWlCdz47ByTHEDMg/K/+dWEU
         VWebNANSktMJ+c/trEotNZT/ERmZvo1aNNKSq0ifOmg92qQd7xjmLuDNVcQc/GCm9R1S
         y9Uw==
X-Gm-Message-State: AOAM531lNecneSy45EB187FoY1+EGNp9wrEh2/IPnJss48M0JXWft8lW
        WZXQITskGL9uqiM0er7IiCkiIg==
X-Google-Smtp-Source: ABdhPJx5qaiHKyLC6w48sfIh+JdZUTvX9TsRCJ/+IXfXt6OduASKlsTTReuBL9z4Q452RADhc6tyzw==
X-Received: by 2002:a05:651c:1386:: with SMTP id k6mr7286329ljb.51.1613338482946;
        Sun, 14 Feb 2021 13:34:42 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id h11sm2500066lfd.243.2021.02.14.13.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 13:34:42 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/2] media: qcom: camss: Fix overflows in clock rate calculations
Date:   Mon, 15 Feb 2021 00:34:04 +0300
Message-Id: <20210214213404.8373-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210214213404.8373-1-andrey.konovalov@linaro.org>
References: <20210214213404.8373-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <junak.pub@gmail.com>

Because of u32 type being used to store pixel clock rate, expression used
to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
to integer overflow. This patch changes data type used to store, pass and
retrieve pixel_clock from u32 to u64 to make this mistake less likely to
be repeated in the future.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Acked-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 drivers/media/platform/qcom/camss/camss.c     | 2 +-
 drivers/media/platform/qcom/camss/camss.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..b2c95b46ce66 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1112,7 +1112,7 @@ static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
 static int vfe_set_clock_rates(struct vfe_device *vfe)
 {
 	struct device *dev = vfe->camss->dev;
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
@@ -1194,7 +1194,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2888c7ef2303..ea17f5997dc6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -578,7 +578,7 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
  *
  * Return 0 on success or a negative error code otherwise
  */
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 {
 	struct media_entity *sensor;
 	struct v4l2_subdev *subdev;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 86cdc25189eb..e29466d07ad2 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -110,7 +110,7 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_entity *camss_find_sensor(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
-- 
2.17.1

