Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018613DBC8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 17:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhG3Pqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 11:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhG3Pqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 11:46:44 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E597C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:40 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id k1so11529568plt.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ohaLOrFvMPYOwPHkhrUlARVRgT2ljmNxajBb/yxaac=;
        b=J17LyUDE8Yo2nHUiCmMlgZq8I3yLfIyU4twrisKA0rzzwG5t6FV4RZQIyXG0BoYFBl
         N+mtUoq7163QOaK3A22SACsDbBIGm4bw16OVBqsP2kkPjlPaYFG4cUPIFM8SQp5GADbb
         Qzenjya7ny6KUpmgHX5UjFRJE7WFHDJpGzMsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ohaLOrFvMPYOwPHkhrUlARVRgT2ljmNxajBb/yxaac=;
        b=TyLGJ6Iw+DIJFBVD04F8pVfmRlFcPaPAU9nZ6uAwREkKI935rTDtevMcyeLfjHsa44
         RXQqlLaa8lZ38ER5dPsyOI3fsKHdHxIvwxms85bEzOVX/nf9IFXkwkW3gXmWELA24yrC
         iBxsMwBCzM68MAXqeOJgr51mOUCcQjPSPHgKnYigCAI6Omr0YbWipleYxa8x6AcY3REx
         3Xpow30h3O1meM8CCnwWPChVEIU9YKw7DlYjPgHyZnQliZJ1SZg28gZBLvLGoWx1vRBT
         A1XZBezhhjuEySlx1evhyKNB9VO3rWu7QeqFq3eCNAqJalSxOB2Bx/FTlYvBjFa246IS
         EqvQ==
X-Gm-Message-State: AOAM531rW2S4gG4FrNnYLnATre8sLycv2WytcM6ZNU8OigP9//HwTsj7
        0ORptluovHMSffvQoS8c96f+dQ==
X-Google-Smtp-Source: ABdhPJwckcuTwdneMgghpL15NaD/GuPlvbqz6vYecQaLZqzjDqWyfvp0IjrQshK6FMvhYBYWrCvR8Q==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id x15-20020a170902e04fb02900eb66b06d08mr3115614plx.50.1627659999704;
        Fri, 30 Jul 2021 08:46:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3424:e0ac:5a92:d061])
        by smtp.gmail.com with ESMTPSA id u188sm3175621pfc.115.2021.07.30.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:46:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, steev@kali.org, robert.foss@linaro.org,
        Laurent.pinchart@ideasonboard.com, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, airlied@linux.ie, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
        sam@ravnborg.org, jonas@kwiboo.se, mripard@kernel.org,
        thierry.reding@gmail.com, lyude@redhat.com,
        linus.walleij@linaro.org, rajeevny@codeaurora.org,
        linux-arm-msm@vger.kernel.org, a.hajda@samsung.com,
        tzimmermann@suse.de, narmstrong@baylibre.com,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not specified
Date:   Fri, 30 Jul 2021 08:46:00 -0700
Message-Id: <20210730084534.v2.1.If017efce7116ae8ba015ed7def840c390a0e0c77@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730154605.2843418-1-dianders@chromium.org>
References: <20210730154605.2843418-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function drm_edp_backlight_init() is defined such that the
"driver_pwm_freq_hz" parameter is optional--it's 0 if you don't want
to futz with it. If you follow this variable through, you'll find out
that if it's 0 we won't ever set the "bl->pwmgen_bit_count", leaving
it as 0.

That means that before using it in drm_edp_backlight_enable() we need
to check to see if it's non-zero.

Programming this field to zero was confusing the panel I tested with
(Samsung ATNA33XC20). The backlight still worked somewhat but the
brightness values didn't correspond to what they should have been.

Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b5f75ca05774..b8a5c5e49d74 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3229,10 +3229,12 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
-		if (ret != 1)
-			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
-				    aux->name, ret);
+		if (bl->pwmgen_bit_count) {
+			ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
+			if (ret != 1)
+				drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
+					aux->name, ret);
+		}
 	}
 
 	if (bl->pwm_freq_pre_divider) {
-- 
2.32.0.554.ge1b32706d8-goog

