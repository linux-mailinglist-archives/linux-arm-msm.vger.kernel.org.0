Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2D170DC3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbjEWMQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbjEWMQN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:13 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4B1186
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:05 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f37b860173so8028076e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844103; x=1687436103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=xovt4aEyTZfHLuBgY7Lj6XlCpNIET84LYBDk+/oVzP755lUBkUTXz+H6yWz2r2Cw2U
         IB+r1bJB7dhEFU49rbl4eAsdZr98efw8Tfpn6MGdjG/QIcKYEViZoQL8G2YfISYdPR1S
         Pwxw+0/cK9OIcRrEA1vKeANcP8A+BaNRoTwJtIB+F5Ez8S26oOYFLFZOJJojsY88BbeM
         GNS5nvvM6ccaALPTO6+4ZuCu7UkWC0G3TDPFiXp6UMGrw/mXkJMa8rxWmKnR2xYYsTv3
         uYQqAGNkgWno9cyaOslg7BQvNJK/cVw83NRJd59NVf7QGygEkyoXuI719WVBPTwyIptU
         Kd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844103; x=1687436103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=YvM9RNGrn4rjC1mNhVZc9sooeD82WrBIJ72XKc9ewaVMUhGHzy85OpP2bSR4qVscXs
         GSGm05CD7GAX9S0+MSwkbaFz36CfwwCNQwD33jnHBLsWooSWLLfuo1mjAUjUKwmwA2Bm
         XL+rXhBJKTrxgQJAIh0XXHwIcYwMXImTh8ojeAtkX1bj6JihZ7ajbXgtx8pM2h+Xjw3K
         Q5/8ngLrDZrBRjmarIcqmSorCL813SF8E0z8hWL2WxDYYcTG+k+h8Pf6JaL0cBw2OpEG
         g2bQspp2a92cbaffftjG8S8Ci7PBgyBc9mNoPQkTHlm0sY6+4u16j2iPhOTvbLKRY6Jv
         g+Tw==
X-Gm-Message-State: AC+VfDw+fpTacvwuNkTjuCNIGvI17JGHqEnV9EkInV94yx7GIwnrEVn6
        H94i5kV/Bt76mHeHwJOTjdwi0w==
X-Google-Smtp-Source: ACHHUZ50IH3a8pjiP+UBa8g9txbuBk/wEdojWdQ3Zvz9henvUls4QHCr5OhPT8MEUkJo4Z565Npxlw==
X-Received: by 2002:ac2:46fc:0:b0:4f3:9a2c:589e with SMTP id q28-20020ac246fc000000b004f39a2c589emr4109700lfo.24.1684844103714;
        Tue, 23 May 2023 05:15:03 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:15:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH 08/15] drm/msm/hdmi: move the alt_iface clock to the hpd list
Date:   Tue, 23 May 2023 15:14:47 +0300
Message-Id: <20230523121454.3460634-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

