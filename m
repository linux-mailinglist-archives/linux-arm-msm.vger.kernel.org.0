Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED76832F7C1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 03:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhCFCJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 21:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhCFCJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 21:09:16 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C06C061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 18:09:10 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id l5so896463ooj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 18:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RpW8AgcggMi37Kh1va9pAJtKdZcmSmLgmqgQgQCGXuE=;
        b=sGydEBgzuauqvvBqPw8Z+yYb2oMgwVhixQIqKli2S318aWmv2Nr/bmBOGzOKp8zzEZ
         PR7R4EihfCfm8r2QSqU/mORh1/UURE2+ED0Oa8aL3tsPa0GXUOhnDX5KF2qtpYi6/Z8m
         I1/ijzvYiGva5dJYr0sHRN+BCB5ay2vJQeK4ASOir2DJnd1WYZDXP+fUUNPqKDZAuwEG
         hAsHZwc/KCYLK54RPDyl6NKhIAINaG3ANxnPjifp2rqrmGZa0gb+xGvXWfLrS5vfCFJm
         sYaeYkVeQK6nF1fxvrCV6kEC+MK9+2Qm3L2nPCm6gd7c5ROlG9PwUxACNEeIVJIgGGm9
         sZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RpW8AgcggMi37Kh1va9pAJtKdZcmSmLgmqgQgQCGXuE=;
        b=pdOmCm7OC4SMzSY3hVQ+APJo9i1V00eESp+XiiFM0qQcH2qq7Ce8c6kPEb8zhJAWB1
         G4CntqyKg7fouau04PFbQPIG7lOvVry+m5jjcSgdCZVG5mCYVVPKW8JvfQG3ROJhvwjS
         4/Av/9ly0CaVrQ4WJ5eIwb0rt2fAwVWL3Z2xf13Zvfm6lpTPiNUx7m+odZo8pnc6B7RN
         JZoYL7qxOwFcT49XxQxTI4UB6IpycHbZbMpy6xdnbMK4T5QYxtWehIfsiAP8oGa/v+a3
         N82d+u0MNmlxWliSG8ycqygIb2GA09Hcpa2WVBF6qw0ICKbzTUn/hlHNzfBg5ivbhV/4
         4Lvg==
X-Gm-Message-State: AOAM532liWqDSl1WOcmQVzKrWuywK0xM9Gy+nBHTG/JBgPn4MWLBx3yF
        nPtu9s860+JLa55GWGvxX2YVyw==
X-Google-Smtp-Source: ABdhPJxkkuoPBEwEqSEZ2TjvGhwkmhjfgEPHIebE2oEVPGvk1TTIzUQ+kFX/QgQCJEhHssT+vmfq9g==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr10318457oop.18.1614996549570;
        Fri, 05 Mar 2021 18:09:09 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y27sm925781oix.37.2021.03.05.18.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 18:09:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC
Date:   Fri,  5 Mar 2021 18:10:21 -0800
Message-Id: <20210306021021.1173860-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the Qualcomm SM8350 TLMM pinctrl and GCC clock drivers. They need
to be builtin to ensure that the UART is allowed to probe before user
space needs a console.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..029edddb50df 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -510,6 +510,7 @@ CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
+CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
@@ -957,6 +958,7 @@ CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_SM_GCC_8250=y
+CONFIG_SM_GCC_8350=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_DISPCC_8250=y
-- 
2.29.2

