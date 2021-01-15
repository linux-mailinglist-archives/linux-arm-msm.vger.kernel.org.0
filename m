Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C59F2F7F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732744AbhAOPQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732142AbhAOPQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:16:07 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CED2C061793
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:15:26 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 23so13582917lfg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkUjFz0N6tyXLS/kO7KhPi9AzPg/g3UZg/RYg5x6HBM=;
        b=nY0bn6QVggzUpt7jNakWhaO8Z+pjfUcDdEF0fQ/U2kOLNRvwiaEk/3qO9AM4LqdlsQ
         is4URrxM08Rxk/NGbC5cOpNj+LozS2aW05njxX996X6lxzN2A4/cRoIMW7D8p0mlU50J
         zJNG3tf+FXoIm2nm/zRJystN7N37ZxfQMope8O5vSVszepvTqfR+feqZw04kVGOUcgGt
         H7XeunOoCv9cJrs9WdZDfQsi1G3p6fkfXHci+nabIm4tzDWJLDFel8taTVeKktiEQPuD
         qDI/rKsdrizRNpWCpRnskPCkYv7lVfbtoEnvPfMPYM0HB99VDPa3cvoXy8Bc/l7Usord
         knPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkUjFz0N6tyXLS/kO7KhPi9AzPg/g3UZg/RYg5x6HBM=;
        b=pMHBXCdN4/FmdoJEKWPbUjVcyLpSNQAN0+xPrCdpIIJFY/VLwRkgmuPnx9Pw8pw+8j
         6sVopCwTA2r5Bh9UBeInwlHQnEIXhjJu0F6Qf5AFKh0VHzBDkmwY707yEGcIZDarLgK7
         rWg/D/1quaulrLGmylP5HbRnQjjeAArSAmM/d1EMMzrmQNezlTELUqBn3rQW9miSl+hP
         zSaOhIjngRs47GtTFqCTjlImf8CLP4Rm42tkqQaKc9JzvLwMSP1Ws0M5mb1G9V3FYMJq
         8s80jaY3dSIcmIVqUMs4sPrnr31W6+1AwUP7LoTPdOc5dqF5+AK8k5+spuP4LOlC61mH
         JNzQ==
X-Gm-Message-State: AOAM530XURM1vd5gK0K77lukuA9o/rTEJiEP34FiEPHmEHfqMf/H2lMH
        i2/jeSUwmzcPoLNhnZK/Fmcfj/ZAYtB7xe2/+Os=
X-Google-Smtp-Source: ABdhPJzS7gnNutw7M58eqKhFdFN0q2HdxjVszb/Wmc2Tpo5OK6+I5IIQztF7aBYGGrL2Q9Jp7tXkvQ==
X-Received: by 2002:a19:644b:: with SMTP id b11mr5636347lfj.358.1610723724903;
        Fri, 15 Jan 2021 07:15:24 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id t9sm931438lff.45.2021.01.15.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:15:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: defconfig: Enable Qualcomm SM8250 audio config
Date:   Fri, 15 Jan 2021 18:15:22 +0300
Message-Id: <20210115151522.399359-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
 - switch CONFIG_PINCTRL_LPASS_LPI and CONFIG_CLK_GFM_LPASS_SM8250 to be
   built as modules

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9957b6669eb1..869292dc1c5e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -506,6 +506,7 @@ CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
+CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -729,6 +730,7 @@ CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
+CONFIG_SND_SOC_SM8250=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
@@ -754,6 +756,8 @@ CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WSA881X=m
+CONFIG_SND_SOC_LPASS_WSA_MACRO=m
+CONFIG_SND_SOC_LPASS_VA_MACRO=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_HID_MULTITOUCH=m
@@ -945,6 +949,7 @@ CONFIG_SM_GCC_8250=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_QCOM_HFPLL=y
+CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.29.2

