Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9335470DC44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236764AbjEWMQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbjEWMQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:16 -0400
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEE918F
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:09 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so3470089e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844108; x=1687436108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
        b=cLSxKqmrFivha60kjqdkAq/2GXt9zXw+KGWMkRMtnGfSoqc+rEbGIY9SPFp3raR+tL
         Fvve4+1DQYi2PZ2Uk+JYU1ZJHEpz7EtzCFXCqQ4nutMAoROslrRjO/0UMoGpS3F3PoLF
         b66oDK+O3wB+Kad+4bZv7mmK5nHfbLakmzppjNLiji1FtxYNYvhmsFa41D5FrKjbmdOp
         rGkgZ1zXw6baayCE5w1FciCQFkd3PAedqX2dE/XVUQBO6CdcCCjqBs+KpHQtjGAiY/44
         fX8XjppzEo8N+XyYR0YxjjNW/xd/cvw3Ha1RuV9t1+FNXekSLqTGUystJEhzUatiIUt+
         HICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844108; x=1687436108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
        b=S7sQXWYS/ltP6qdO7ZuuC2HP02taiJj/Kh+ILMdcvPhqdjz7+dSor1ywd5843XHnmQ
         Rhv2vauJ+aru9sWbP6wHuFHywlZuyPpVzL34Rquc8B6LG4phRafPxceyqvgBRGrpkriI
         skEV00Ab4A28amY/UiAbGoqwAzueH4+lFVCrBlReNkEQ24AzGokXpsFQtoZrISOXWKO+
         bwNc4ujMh84OW/BwChOyu8TYbvUeljqBLgvSR7uOViBKmmjeZ1+s7dBiDxK1K1m6nrYC
         sCva9BPJfD56+09eK6e6tHL7qM6cWWic5ksH5eg3z1DKNXqPHQd246e+OCj5GWRYswub
         ya1Q==
X-Gm-Message-State: AC+VfDxQVgQ88K3dpuf44/ifmNxIwAkCnBF9QNvtr3vYV3R96Iega8p6
        0D1IccFaJN4lHc9gAP0JwpxdRg==
X-Google-Smtp-Source: ACHHUZ5WxYFiA0x3xgvZXvUWQdi/r/0i5DuVqgDFMuE7nU4AygQeYTf069U5/4/emwtjx39IRyOE/A==
X-Received: by 2002:a19:7003:0:b0:4f3:a99f:1ea3 with SMTP id h3-20020a197003000000b004f3a99f1ea3mr4008960lfc.32.1684844108297;
        Tue, 23 May 2023 05:15:08 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:15:07 -0700 (PDT)
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
Subject: [PATCH 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
Date:   Tue, 23 May 2023 15:14:52 +0300
Message-Id: <20230523121454.3460634-14-dmitry.baryshkov@linaro.org>
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

In preparation to converting MSM HDMI driver to use PHY framework, which
requires phy_power_on() calls to be paired with phy_power_off(), add a
conditional call to msm_hdmi_phy_powerdown() before the call to
msm_hdmi_phy_powerup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 2d405da63bd0..46ae7ef9bc98 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,7 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool phy_power_on;
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index bb10b35194ff..1bbd76e595af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -148,7 +148,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_audio_update(hdmi);
 	}
 
+	if (hdmi->phy_power_on)
+		msm_hdmi_phy_powerdown(phy);
+
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
+	hdmi->phy_power_on = true;
 
 	msm_hdmi_set_mode(hdmi, true);
 
@@ -170,6 +174,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	msm_hdmi_set_mode(hdmi, false);
 
 	msm_hdmi_phy_powerdown(phy);
+	hdmi->phy_power_on = false;
 
 	if (hdmi->power_on) {
 		power_off(bridge);
-- 
2.39.2

