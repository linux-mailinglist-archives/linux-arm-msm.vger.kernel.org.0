Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAC1730AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 00:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjFNWoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 18:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235305AbjFNWoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 18:44:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6101FCE
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:44:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f629ccb8ebso9385595e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686782646; x=1689374646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4TeQ2gX03YG5PIrvF0SIkzbh/hc2Hi8ju+1wWJts90=;
        b=mejd0PgojRgTibQo1NDO1zLnL/YJsWUZ6RDOgpGRjulWpfTej0tGMWIppnOZyCyckj
         6b+b9/fWlJf6CeriG5ixL0Ig1nDxRIPAu4bNZfnanSYC/GWmb4BPXjA6MsnOymj5SreU
         2bsHPKSQc0JVWUnJh34Zw+c5yt4T7HAJgPcTkzJbEzoydR040QEfP8cesF12I58MdPc8
         8nPPL2f0EpRIpIck2Om4QzUV7deYmQY/dCxn2D5Mt9fB6SvKF12JEAJdAyczOjJmCE/A
         G7msGmNwIKE2O3p1NaaJFx2Yte7Cr48HRd6lpjVcrVDS8+XC+8lSMNNx21Vf5au9gBFY
         ZqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782646; x=1689374646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4TeQ2gX03YG5PIrvF0SIkzbh/hc2Hi8ju+1wWJts90=;
        b=Veyd28sn9ZbhMjW7YmhJyxgk1rFaV4qm8YRjbJeT62kMdWmclbquFj6naWXoIwFAUt
         yn5KG9UkhYB8pLR0lUD5Xs3OnHti6WEhW4HLpzfniK25VewEhd/maQjzoO/ErLqYxUJ0
         gUiMKcBOUPzyqtFDYeL4tXOHVziP3MNpI4LjIbNmfry1dK4odwcYOig/v4k5X8izq2YL
         ftFTKZBv6cUAMkoMkusHxFJckbHCKntsjPhmCwJAxarizGKBynyr1gzXR191IdkqVmfS
         DcS89lkL3gACFUgk9fofB4APrkqwKQgEZLOrCa+C2pZcaHMFoqjpnP2Gy0hrGmGfhNGs
         L1TQ==
X-Gm-Message-State: AC+VfDxtziCpiI3ceDRzaGEyIBQaweQ03B78q1bKEWMjwiRWzw/afi+v
        HjDusAVOV88AvYXXc4chPmSyUg==
X-Google-Smtp-Source: ACHHUZ4pJcmQKm4s+0vsfF9XrGooeI1io0wm57LzsKmlwXycybu69XZDRdyXWGWiYbJ0TTkGHAJU1g==
X-Received: by 2002:a19:5619:0:b0:4f3:8196:80cb with SMTP id k25-20020a195619000000b004f3819680cbmr8397374lfb.41.1686782645905;
        Wed, 14 Jun 2023 15:44:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q2-20020ac24a62000000b004edd2dc9a09sm2295866lfp.258.2023.06.14.15.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:44:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dsi: split dsi_ctrl_config() function
Date:   Thu, 15 Jun 2023 01:44:02 +0300
Message-Id: <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It makes no sense to pass NULL parameters to dsi_ctrl_config() in the
disable case. Split dsi_ctrl_config() into enable and disable parts and
drop unused params.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index eaee621aa6c8..3f6dfb4f9d5a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -705,7 +705,12 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
 	}
 }
 
-static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
+static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
+{
+	dsi_write(msm_host, REG_DSI_CTRL, 0);
+}
+
+static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
 	u32 flags = msm_host->mode_flags;
@@ -713,11 +718,6 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	u32 data = 0, lane_ctrl = 0;
 
-	if (!enable) {
-		dsi_write(msm_host, REG_DSI_CTRL, 0);
-		return;
-	}
-
 	if (flags & MIPI_DSI_MODE_VIDEO) {
 		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
 			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
@@ -802,7 +802,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
 		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
 
-		if (msm_dsi_phy_set_continuous_clock(phy, enable))
+		if (msm_dsi_phy_set_continuous_clock(phy, true))
 			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
 
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
@@ -2358,7 +2358,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 
 	dsi_timing_setup(msm_host, is_bonded_dsi);
 	dsi_sw_reset(msm_host);
-	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
+	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
@@ -2390,7 +2390,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
-	dsi_ctrl_config(msm_host, false, NULL, NULL);
+	dsi_ctrl_disable(msm_host);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 0);
-- 
2.39.2

