Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32C74438F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjF3Uzj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbjF3Uzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:37 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECEF3C24
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3730237e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158532; x=1690750532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9nJmBXtUdxJ/gDlevYDuB9pv/4D74pOISGK1kYK+eI=;
        b=bRFszGj6WyZPw/+lFWNuKoM6n1UJovG4wjhJ+Ld/Ig3/b3wGixnyqqqlM/jT6nZX/6
         ajUTGjisNDS/xAiKNDoFsTMQyjT9KhaIDLJYEf1AZj1PJv3z4Jg7V6hfeoCM8ict3pIA
         s75Msk7QWf6bg6kpdcwCsrlvRhCDmP1s/MtB5mRF47hS3wSBcM+lC5B2cxh+mcvfQcg6
         8B/8XiTWMl7XG12ussy4zO/FD5xdvMtjWrFsZp+nSvee/C6V3l7LCL+xTX3JtNCc4suj
         vim+wZk3wWoa+usGKRb581pmQBX2Y2l5tB6RwjJ3uEgBmmY/TXPdzZMbPxBEzEqwr/iH
         W55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158532; x=1690750532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9nJmBXtUdxJ/gDlevYDuB9pv/4D74pOISGK1kYK+eI=;
        b=lLRLkqaJBkGuTMPhce5AWTySTwNdhkbgGKdPX54e7UZBo4h3f+l8GLnLQvNaHanwZm
         JCtKwibkOA7NCaQCstvcu3x0HAIswe6eaOleZueiKEVGKfWJ3GQ5qGabcGNPPNS1MI5C
         XQPwX3A5tIYi5XfiJdgAfqbjJb1mNBA/Xemx0ZjhPy0Ok+zGZBIh29uTcOzbdYJdDrOx
         LiCkBp0FLhmJkEtbEm0rzcjEJndCnQPyIDvkI5LiRMiwwVohcKwSIgLO88wxeuWilZgO
         Ej6exhzZgYDNFZAmN8uSC4e1+97MrOHeggcibt2iEiHGKXCZutXYaZE/Jct8IYg7k825
         4qmw==
X-Gm-Message-State: ABy/qLYd9cj42QrWDQaNgiF9Cr1nrXmxpRX5G92xmnqq5M36ALlQN8C3
        SIQLiQ4boEAYElJb1zg2mIVj4A==
X-Google-Smtp-Source: APBJJlHUspM9v8shYqhN8bMVifEchIKqf7LWFUH/BjDcBsLrOt1u++WunBXzpBu3HxNBLwJQB7a60w==
X-Received: by 2002:ac2:58e7:0:b0:4fb:925f:8be1 with SMTP id v7-20020ac258e7000000b004fb925f8be1mr2653312lfo.45.1688158532623;
        Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
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
Subject: [PATCH 11/15] drm/msm/hdmi: rename hpd_clks to pwr_clks
Date:   Fri, 30 Jun 2023 23:55:19 +0300
Message-Id: <20230630205523.76823-12-dmitry.baryshkov@linaro.org>
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

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9aba6a67816a..621dcc981794 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -241,19 +241,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 /*
@@ -459,17 +459,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -529,7 +529,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -552,7 +552,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 896f4b3d5978..22c91c17539c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -90,8 +90,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
-	int hpd_clk_cnt;
+	const char **pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {
-- 
2.39.2

