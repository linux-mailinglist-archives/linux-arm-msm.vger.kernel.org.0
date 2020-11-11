Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13C02AFAF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 23:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKKWB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 17:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgKKWB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 17:01:27 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6355C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 14:01:26 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id v20so3789130ljk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 14:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf/AR5sXId7uyYNqyyFj8tO3BvI4jy2CUGJkVnPWaJw=;
        b=GjflVxJ+JQaVQ9+812drTCjrhApz0M6QRtebsd+XvcceurpsoBL9DPMAe7p2I3R92a
         QkQ7mbF3dRYKUXhGZXxIrP6JFSwCPmzEASaNq6wboJnSO2RHP4RFSsCfFTGJ2CroiM+l
         XaK3Nc+h8B0632PFgStGt45KdIZ2DtMqZP4DA238wvAigM9DrtmBqO8+BkoKqTgRrTZ5
         B24yzu0nfqywie21epH82rLeDhK3H0NhFIPcvoEHsK3t5sejdb5apmebNOwt6WAGOkDS
         c30kGsbP/AXvWc+czKeyYcP4imTqGtNpDT+IkK5Hh6ainVnYMl5+U8UNP6nhQjrzfMS0
         jBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf/AR5sXId7uyYNqyyFj8tO3BvI4jy2CUGJkVnPWaJw=;
        b=kz/A1U23pC88LiXESdFNqdsqOhDLz0CbRqTFbVx6ZIWlK57i2L/tfwXNhYaDaceEE7
         TxMqIysdPhV+Fg9KFk8rPb9JoMfbtwakApIXi8rKL0fcXBaHgSb4gCrMeodfXOVnTSIZ
         ACDsd5ooN6OVh9XE27C2tG+6aImKzgvXiGnv0yJ7A/BbtonTH0uQzuEW5z38FdA7HitG
         GCsntZUlYc99FvIcakG4wErey7gg+Ogy8q8pBTNKOOoOXiMjOjCu5uPI1ae0KzoAoWvT
         KJh7YbqzNkcEnR1i83urcOSJ4eJA8sOr7oAOYKbvfm7VGCCiURYEGK3RREtCUJMlPVRj
         y4XA==
X-Gm-Message-State: AOAM530/GaLIdNWSWXOEZGSrE76trqSbFXH7tgampZhjZHnKsWQlHGxl
        lCSiyG6z4WLJox11XC63LS2T0Q==
X-Google-Smtp-Source: ABdhPJwOApRIRBA9IwsaGlXPhwOPiH0SoIEODujbEeKOV9ng2jstr8d1NIRlflZJuDXvw0iwiEHbJw==
X-Received: by 2002:a2e:88d0:: with SMTP id a16mr193151ljk.56.1605132085301;
        Wed, 11 Nov 2020 14:01:25 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.115])
        by smtp.gmail.com with ESMTPSA id i19sm339756lfj.212.2020.11.11.14.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:01:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH] mmc: sdhci-msm: detect if tassadar_dll is used by using core version
Date:   Thu, 12 Nov 2020 01:01:22 +0300
Message-Id: <20201111220122.2392823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Detect if tassadar_dll is required by using core version rather than
just specifying it in the sdhci_msm_variant_info.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3451eb325513..dd67acab1660 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -248,7 +248,6 @@ struct sdhci_msm_variant_ops {
 struct sdhci_msm_variant_info {
 	bool mci_removed;
 	bool restore_dll_config;
-	bool uses_tassadar_dll;
 	const struct sdhci_msm_variant_ops *var_ops;
 	const struct sdhci_msm_offset *offset;
 };
@@ -2154,18 +2153,11 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
 	.offset = &sdhci_msm_v5_offset,
 };
 
-static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
-	.mci_removed = true,
-	.uses_tassadar_dll = true,
-	.var_ops = &v5_var_ops,
-	.offset = &sdhci_msm_v5_offset,
-};
-
 static const struct of_device_id sdhci_msm_dt_match[] = {
 	{.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
 	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
-	{.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
+	{.compatible = "qcom,sm8250-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
 	{},
 };
@@ -2249,7 +2241,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->restore_dll_config = var_info->restore_dll_config;
 	msm_host->var_ops = var_info->var_ops;
 	msm_host->offset = var_info->offset;
-	msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
 
 	msm_offset = msm_host->offset;
 
@@ -2396,6 +2387,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x49)
 		msm_host->updated_ddr_cfg = true;
 
+	if (core_major == 1 &&
+	    (core_minor == 0x6e || core_minor == 0x71 || core_minor == 0x72))
+		msm_host->uses_tassadar_dll = true;
+
 	ret = sdhci_msm_register_vreg(msm_host);
 	if (ret)
 		goto clk_disable;
-- 
2.28.0

