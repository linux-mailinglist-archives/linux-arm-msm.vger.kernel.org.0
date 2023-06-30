Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A173C744381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbjF3Uz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjF3Uz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25F43C22
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba74870abso1281908e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158525; x=1690750525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=kAoziV/5EUEZRZyBL62VYO/5KfJ+j5DttptKmboAgeWuVDZVQL33i5Qih7xRTXLOQc
         2f78Fv71mJx57vAK3YVQJkBB9BNsmMmldNRi2NWM6v0MQHic/lululGRa5HPc47UmGHw
         uZjz2rr8gQmg522lUOOCqXXlVwRhEM5V9r6KStLlXxH6iL7i4mcMqDEUiefTVaL0DVzb
         7VXV2xxfJOOLcun0xgSY+ZPXc5UdWZEUrVkJ/cIQStZF31uL1xjcPK4G91XSEhVEow58
         HLY6+h5PhVnI3+gt6e8ddJbc7MPHP5jdkF0kwMZ9dcffumTEQZ/b40sKkhno8TJ6UG8U
         QbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158525; x=1690750525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=eJGwrbSg+LH5orsY81Be86rv+8xE5VabNM7mNwhh4EBFK7mTJ7lIL10vBRmdsW+qE7
         GTwF6gCVFiLKrexKALTzzLvKWF6q0SBMLevzsnh/Bh/nRpyM7s+mRdOBozlpj1DNKam8
         ootbgRB3rGL70Mrnewrj/DgzIW6D0AIozd5VNgpybkVA7Fl914PybPueWUpcaNRLKtLE
         oHKGbC7rLzCL9isB+2E1U56zROFm2KB//3OxuUt6i5jXB/IgKXp1TNRccRe7QXtCQmsw
         y9F4GWkmV5wQjfSNmUH7rtGvrF5EkCA9CtlnOJoahDCBAalZyce0wYBKEdXsfBWX4X2J
         xZhQ==
X-Gm-Message-State: ABy/qLYFZN2Y4y5FW0M3sCvl5LjmwQ58IUXyJ5HrC6dtg+PL2GkpR9re
        UPhVx4EiY0KPAONrdROUquWX8w==
X-Google-Smtp-Source: APBJJlH7+/Tiivo+aQ56fmpNN08qXzXrcEz9E5HgbD5QQ59W1lPmLx0cun8MJdkbojYwtZJpLfG/wg==
X-Received: by 2002:a05:6512:3703:b0:4f8:68a3:38d5 with SMTP id z3-20020a056512370300b004f868a338d5mr2655594lfr.66.1688158525287;
        Fri, 30 Jun 2023 13:55:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
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
Subject: [PATCH 01/15] drm/msm/hdmi: move the alt_iface clock to the hpd list
Date:   Fri, 30 Jun 2023 23:55:09 +0300
Message-Id: <20230630205523.76823-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..0fc3df43aa70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-- 
2.39.2

