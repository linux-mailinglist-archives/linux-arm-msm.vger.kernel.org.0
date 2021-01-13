Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB65F2F40CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393714AbhAMAnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 19:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392360AbhAMA1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 19:27:05 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A55C061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 16:26:25 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id x126so124288pfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 16:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5cep6q7xr6t9kLaivrV7idzLK5AQ7vlZX4sAVxDVuo=;
        b=fD2bqF0VHgRb3wN28oaLJ2r6nRVEHcID7ozo+dKpSqImokp7jo1Dnks9lAwMp1OU2e
         LKDvKcQkPpkRqksrGprFTd9tf/s1aBw4CYL5/mMRv6crxJePDqW1d2bOs97Zn2GKBW0Q
         qZh7DnUEyWkliISDzQEVJp4YJEpDuSsx3R2/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5cep6q7xr6t9kLaivrV7idzLK5AQ7vlZX4sAVxDVuo=;
        b=O0bbso4WS3/1Ra8TRHSlVPyVZnBmDzSG/4SsWIo8haNeHB0WxqMOY5g8zuf6v44Bad
         HeqI9Bs/av+5IazwDmaPN931M7qf5drwUrDgI+Q60olmTU+F3DCxDJUEsQHAs+Vax0++
         piMLHYLGoRoH+Dxu4savwPTCw7uSQiIhqw5/0gTiPaDQXPJ4aLbZSJnS5RmnNwwYzK/3
         RO8mmi06mccIZcQtUXrlLqG6v1sseaKazc3wtyterbJfR0J76KMzaWRsu5LgfgqlW8cX
         XZxB3CjistKiELI+cps7NONEx/QPE+D32V7LAcBPqelK2xBg4d33LCYP9BuclvSuHSDG
         9BEg==
X-Gm-Message-State: AOAM533y8l/qGsIdIcAuVfrFG8KiSk0t/lOuA3wIBL7xH/Tg3D4Kpx/K
        zUT7z72zdoYZ9XF2H3iWNXHkGQ==
X-Google-Smtp-Source: ABdhPJyD+hXJ2C6UE9S3spN4vWkdQDn/M2cSB0mVGVds2IGeT6BY0kPf2x1dFVfgMUuecjbhznXfjQ==
X-Received: by 2002:a63:31ce:: with SMTP id x197mr1637187pgx.262.1610497584553;
        Tue, 12 Jan 2021 16:26:24 -0800 (PST)
Received: from localhost (136.247.83.34.bc.googleusercontent.com. [34.83.247.136])
        by smtp.gmail.com with ESMTPSA id h17sm270397pfc.119.2021.01.12.16.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 16:26:23 -0800 (PST)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        acourbot@chromium.org
Cc:     Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] venus: Check for valid device instance
Date:   Wed, 13 Jan 2021 00:26:16 +0000
Message-Id: <20210113002616.1501493-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

core->dev_dec and core-dev->enc are set up
by the corresponding vdec_probe and venc_probe.
If the probe fails, they will not be set
and so could be null when venus_sys_error_handler
is called.

Fixes: 43e221e485e5 ("media: venus: Rework recovery mechanism")
Signed-off by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293faaad0..979fcada4d3b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -62,7 +62,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	mutex_lock(&core->lock);
 
-	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
+	while ((core->dev_dec && pm_runtime_active(core->dev_dec)) ||
+			(core->dev_enc && pm_runtime_active(core->dev_enc)))
 		msleep(10);
 
 	venus_shutdown(core);
-- 
2.30.0.284.gd98b1dd5eaa7-goog

