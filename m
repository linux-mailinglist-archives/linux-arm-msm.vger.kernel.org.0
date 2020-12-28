Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5142E431C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Dec 2020 16:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392830AbgL1Pae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 10:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392822AbgL1Pab (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 10:30:31 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56BFC061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:29:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s26so24617431lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WF0Cu8o79luIt0pp9MvQ6wygmd9AYSWGJHH8PJhk4L4=;
        b=OoMkr9a0tF6JbW1OYLq9XTpO9oCsreqSX5rLNMFjMHxpwZEihYZjHVnTFQj8Gcl6q1
         MaToxFFnZV64PBjUEeCXL0QUTxEwp5cxZ+qAeqCl9rhoSqa3ytswyE8jJCeXRoHyBoaL
         n+wzgZZm7W97l6wXGu4fFniGpOREa24ZgvIBFXJ+h5p0bSu8CCqwgtePdVsRdkqM2eTw
         xlXTn6bAgsECyiQEvTEnpSks5tNvD/6G0J1JGL5ItMw4cFWqqs9Q5AEXjcWD2LgBJjBy
         +GKJ8gtJm8QYUKn18n0l+4UKUKRhqT5H3UrQ+l74QMWpzvFDBRiFeQcXd5U5kh/sv7bL
         5FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WF0Cu8o79luIt0pp9MvQ6wygmd9AYSWGJHH8PJhk4L4=;
        b=CKp5HzBBtKtdE6I6WeHfcp04MqiFZoIV4024YoafN0pa7Zm/ErkFcA8O4XOmXBAIG6
         hFHNsdl6UUAsTwjUN40cPTXD3/EZNxRiySIbvl0+qwUJBQjv1NmkEghABzVI6ta6/90m
         sMBsJe4pQJ85NwkUGWHdeMQIJxGJSpjZMPf2xeFMf/BLoi/Hh+ModBQvwX8U1/VEVt3k
         8jebRt76HZ6PmioFJ6hK9RdW0pUBGFhdldfuFhTXvNz1q6fipDxBvBVORcw/+AYOMVeQ
         YVFMSol/5UWiAW9zOo2I0qz95C7YqMttOXotWydltB8a/lE9WpDlI1UTu/6sTP0PJuSI
         ZBvQ==
X-Gm-Message-State: AOAM532tRAftyYDgEd4dZNT+Mn9rHsGtf8TuFeOkB6o3meN58hy7lAiZ
        3XenRpED1/GX94jejeEQhHbyKIQrBsmY3Krw
X-Google-Smtp-Source: ABdhPJwCAVDDj3+YygrNDk4VfbBp5ZP54hOpg4uPQXWENBJz8hPXSK/uAcGSC/ypul8Xyn8bPf9vkg==
X-Received: by 2002:a05:6512:3321:: with SMTP id l1mr18120044lfe.473.1609169389460;
        Mon, 28 Dec 2020 07:29:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id d23sm6477250ljj.24.2020.12.28.07.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 07:29:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SM8250 audio config
Date:   Mon, 28 Dec 2020 18:29:47 +0300
Message-Id: <20201228152947.4021689-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable ASoC platform driver and condec drivers for Qualcomm SM8250
platform and devices based on it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..9b1c438aa17f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -505,6 +505,7 @@ CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
+CONFIG_PINCTRL_LPASS_LPI=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -724,6 +725,7 @@ CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
+CONFIG_SND_SOC_SM8250=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
@@ -747,6 +749,8 @@ CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WSA881X=m
+CONFIG_SND_SOC_LPASS_WSA_MACRO=m
+CONFIG_SND_SOC_LPASS_VA_MACRO=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
@@ -932,6 +936,7 @@ CONFIG_SM_GCC_8250=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_QCOM_HFPLL=y
+CONFIG_CLK_GFM_LPASS_SM8250=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.29.2

