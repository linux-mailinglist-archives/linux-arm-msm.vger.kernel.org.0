Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA314B54F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 16:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355900AbiBNPh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 10:37:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236092AbiBNPhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 10:37:54 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A419DF96
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:46 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v12so27563099wrv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YT5Imfq0LMuVZOXx0XtEYUfkVCCzeXiSTBNp7getK24=;
        b=Q4z2sLp9vgx5dFg2IuDY/HyEbLdPaVgbvkiNSjnchz9tPBDFLdvyLgY547tI8KRIN5
         MJ8qWz4FYwY9eR7R1R0q+kinxAt4EUPMXxmKcoF6gS18Qz25FesdTkD0/nYf/CqMxzKC
         MpWY79AruqPuJA3m5UM8seDuvCgJw2ZH9dUOj1+l+CyAclR/ORjt0sUn7NLMJxqcM3pQ
         ryoHTY4Pn+rzP9fEhW36TX5VVzsqg7YTPWpgh/6HoNjwzaatCsO63jvb8IUYAa6HixMc
         L7yXbXwPKcAR7RdU7X+lBcresX4+g26j8peqlbIWG5zLTWCvm5PwsgatOH+oFFtib+bs
         xgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YT5Imfq0LMuVZOXx0XtEYUfkVCCzeXiSTBNp7getK24=;
        b=vjSoCKSeSDbjvGsmubzzGEoon3E8QD/vqGJ90Ad7fy/pUJszb9vtVmatguxlW7NR6d
         l5+H6eMAK+WuWBf1pAgLk2TYawkUTD6ytUg4vl8RlZ2qI767ic9hWrc9Af/8pxC2pyyb
         Z8uMJcgVT3nTR3zQHNu3AwSBD7YgPEq9ab94E0xPDzQMoT+Wdee5CssyC94zFwevFz1H
         mw82/Qeih78k2BeoBkd5wa7XWN1n8NtzYKbywT87+7cx2grLIH/fenZr3RyY/psPHcCK
         7VjRmBberYSfXHhLefBmbIND4JqTrFYPWl36bklMua6YkCKe2nt9UVY3WQIejh5rwr0I
         XABA==
X-Gm-Message-State: AOAM530WOn+Ib4UO0cdsrzSPxTGA28ZLyeIekqzR5MfFDihaBqJ5HBZH
        /dPm9RaJFUaN4KhR0CyTyr6UBw==
X-Google-Smtp-Source: ABdhPJxDmnQW8BFcCa9HYezn36gI/eXsK+ZpTY6byPQzuhuqYE5UDH49gKOgYeqccSAazZ0R7VG0aQ==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr169686wrt.394.1644853064495;
        Mon, 14 Feb 2022 07:37:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id l26sm12935850wms.24.2022.02.14.07.37.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Feb 2022 07:37:43 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.baryshkov@linaro.org, robdclark@gmail.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/3] drm/msm/dsi: Allow to specify dsi config as pdata
Date:   Mon, 14 Feb 2022 16:37:38 +0100
Message-Id: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Config autodetect based on DSI controller version is quite limited
since several qcom SoCs can integrate a DSI controller with the same
version, but with different config (io_offset, supplies, etc).

This change allows to specify dsi config via device data pointer.
config autodetect is still used in case data pointer is NULL.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 v2: no change

 drivers/gpu/drm/msm/dsi/dsi.c      | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 0525488..06a9008 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -170,7 +170,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl" },
+	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4..c540acc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -212,6 +212,10 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
+	cfg_hnd = device_get_match_data(dev);
+	if (cfg_hnd)
+		return cfg_hnd;
+
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);
-- 
2.7.4

