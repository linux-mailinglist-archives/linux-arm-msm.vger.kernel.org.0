Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF353D1C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 04:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhGVCFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 22:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhGVCFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 22:05:42 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C710C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 19:46:18 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id s2-20020a0568301e02b02904ce2c1a843eso3969125otr.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuEoL0cflmj88ic5E/HBFbgKYO0ZjMr2HcVskHGb4+8=;
        b=gTWxU6v2EWpdjHWSdRsk7wGshB7EBoTxmSV8TDRq2yPSI+1sk7E66j1/hwyjO4OvR1
         ERJYkBJc9Dy8API/rXeZ+l4O6oiASLlyq07LRhhazsHoV+RZPzB1EP2osUPlOKuTxtro
         tsFgityqP73QzS4/Hp56+85gZF9n7sb3eGg9VoHjmF616Yi/u2Bg5wkfZ0cVrwkyb+1+
         qRC9l9PhkTMIRd8JVck0BGGsS2UojXzmzZ7pGR8s6EnAUm/4lPqVA69zwov42viY5jbN
         fO4SlDvt8c6ZkomLyW2cf93psDPozgx8QWP5ynKKkoZpwrY9e7uSlpxofWPei1rnnNsJ
         u4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuEoL0cflmj88ic5E/HBFbgKYO0ZjMr2HcVskHGb4+8=;
        b=gwmFN+v1IPVczc3vyTmyb0qfbxhOZ5bTAtydxscAsLxfwvwaIEvTpvE+PnIP/0a4m6
         09l3raEM8BH2i1iMxBze/FEB4vrF501qKbKBL0qfwzMXvl8K1cUu8MV8uw91oBY5eiFQ
         KvB4ZSNxKQQi10OPaA1PpoK3LI/e608ukANmZAYbvNRbSMMmanDCZoqmByj2hMsXVf/k
         IoJP952y9P/b/+cw73y6oxuyz92MzDMnJCaJ4tzcmeIsjze7KtxL6LAZ70LFJiSBgiVC
         PZljSg2id9ygR48BI0HTkE+7Pg97jFypfOuiV0iBr9EYUehrzLuosbaMboCCYLA91JqP
         cV+g==
X-Gm-Message-State: AOAM533znTfTREOHPU0FQbbod61ul6nAFnBTTwylepTPmbpo+0pnCVJy
        M3JRfnqAGGdFAcWblW/YQlV8tg==
X-Google-Smtp-Source: ABdhPJzn5vDJKXScBg/5Zax5IQIFFmirfICOQE36McKeLi23Vbz6GYsDN43N0AUPf+NSyaLxhLNgXQ==
X-Received: by 2002:a05:6830:1b6b:: with SMTP id d11mr27389811ote.234.1626921977560;
        Wed, 21 Jul 2021 19:46:17 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x16sm390098ooj.1.2021.07.21.19.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 19:46:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Vara Reddy <varar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Initialize the INTF_CONFIG register
Date:   Wed, 21 Jul 2021 19:44:34 -0700
Message-Id: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
but configuration of widebus isn't yet supported ensure that the
register has a known value, with widebus disabled.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 23458b0ddc37..37cb1102a0ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -747,6 +747,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
 	return 0;
 }
 
-- 
2.29.2

