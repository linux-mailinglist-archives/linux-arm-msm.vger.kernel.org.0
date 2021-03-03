Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A5D32C241
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389838AbhCCVrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386142AbhCCRqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 12:46:47 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D58EC0613DB
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 09:43:31 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p21so38423469lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mikpPCKqiawoZCyFMz/JZszyNAgG2MWQqRABlKUmtPE=;
        b=qPag2lIKx7lybT1A8UT7VBqWbqmI/IzPDWnJI60OE5N6mh3ngTzRKXzJO9ugnhQiDg
         5GbvPCRPJwVx2vAItSFv2FKFNu2VyQDmLQaWfLBnu/V19VNOoMNojrDNQA5WfyssEzWC
         bxc/dde1HAtqp8MsUPGbTNb7D99TmItDbVpz5N0J3sSVVsP7/pls9OaQSs/qW/SGFxsk
         4mWyWhXsfqe53vmNFe8PDYRjIVlihqEfUcWsjXFwY4hmgwT7cckKL462+1TqEF61NeQX
         V9rW3218DHYK59+fJ6KPEhWngR9A3GkF043BZuQUf4fov0RggHvHu3K0E8QqDfVm8d+C
         arqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mikpPCKqiawoZCyFMz/JZszyNAgG2MWQqRABlKUmtPE=;
        b=kyh0135ZoAa9WUbPlZoskRv5bpZsoKHuEk9ESleb2PtQgreq07y/1SIXLLggXBiWza
         e68wpS4E4jgX3euhvhzqjtGJPSh8WfUpjAqXum7rMSaNaQ3ScSoDSZRQF5RNCLrrwhUm
         XdPPQQcZOa6GRnmjlW0PSgYaMXBmCQpxMjFJ3F5y5fOb5afTHFF4LP2sEu4R8/4qLIJB
         Ri7EAQVjLlcbXOl76uztcFmgvz2JHVuYjMcGaQAhTFog79s+EU3ApM0QDHHgVVRDtX3M
         agrpOYciNplwHqxuQUMcu8m/GVh5RyMIdSP1753R4uJkaQV7QYNUqr52NoxR9oFrHYUM
         wLMA==
X-Gm-Message-State: AOAM530ddBszFF95Ucg8P/fs5+Jpn9uUE/sq77KpVCxKvHDvOxNT8Mpp
        9t0Z0Br65u6jVq+uWSRVuwnPEQ==
X-Google-Smtp-Source: ABdhPJz24Nt4zTWXCh0P8CSKaTk4yAMhHXahLWxwJBGz1RSR42b/HhFny15eAaawuAsKINhR/37ykw==
X-Received: by 2002:a19:4042:: with SMTP id n63mr16165938lfa.256.1614793409462;
        Wed, 03 Mar 2021 09:43:29 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id s7sm2101441lfi.140.2021.03.03.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:43:28 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 3/3] media: qcom: camss: Fix overflows in clock rate calculations
Date:   Wed,  3 Mar 2021 20:42:50 +0300
Message-Id: <20210303174250.11405-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
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
index eb8fb8c34acd..d82bbc2213a6 100644
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

