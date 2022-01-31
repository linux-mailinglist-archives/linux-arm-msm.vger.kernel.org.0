Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8AF4A5018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 21:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378685AbiAaU12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 15:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiAaU1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 15:27:24 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B19C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 12:27:24 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id e9so21114106ljq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 12:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XT4y98QYDRqxXL+ybVdl1639szcNakLd8Ajz8X1rsrU=;
        b=ZjQB0ntEiNSuHTElQMr6fNdiYABhetD07rzGIDpM9Dntir9nh2EPhqd03DMa5RVJp5
         Zi+VnRh5f8AVhUCM8iogE4/n3qGB3ipnokVoMwiom2r5/cfQ4xV6Vwu2cbTA6C7JdO/c
         hpAgRIOce+K90n1MJRN6ZJOjWGU43IeWmXX9vyGVBl16FP8UghbcJS80ZIaDV5oSSq/o
         UbnADTnARfyDMee7UZOm4mRYTL9vj71cDxVwc+KtO2GiruuJat9AtGQk5TX4wY3M+FWW
         NeX4k0EcxkRcb/9aBkCobq34RVHqZ3GIAEuRWCG+t+9+hmbRE2vIKRt35ghvXRH/F7m0
         B/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XT4y98QYDRqxXL+ybVdl1639szcNakLd8Ajz8X1rsrU=;
        b=RQj49TWocF9L20sfZgsSd5V9bNdJBezic2bOQtLWc4WhT12FC0F+Zi7EZEo+O9B0Ii
         4Rs2fRNBUxGiDHcgY4bBo34RPQSyD94J+W25UiwcLIrgOyFyHgsVYheAN5JPNy9vLmL5
         eRHMoF+TlNYa1LevqGiT92E7ta6bFVc7OTBOZVbpy3PZ/wTVr3Eb+vMD/UKgajbFAG4A
         rAFzzQEEXmD4CTtfJOQYqEoK77HYgtGkjwY0pqbiFDvi+0yUJwMFP7DZQZth4B7V79NG
         9B1MZQ/L5vfo/dcsLX7N8i4LBo33whHgEBkhRU8q1e8I8wPf4K14BE1ZT0pCW8RWdXoH
         ZfEQ==
X-Gm-Message-State: AOAM533ZJ/2IxBe3CybFSrSeJisCz6t0+/iGZ3dulPe0YCmiuaDcw30u
        OUsuamN0gjX4m4gEPfyRjHlZHg==
X-Google-Smtp-Source: ABdhPJzV0qH0DJ08iw0G5zrTMSCLdQCZ9dwvqytW25f5YueJl5IbRZ65AaV25RdDeIN7Yd8NjhRZTA==
X-Received: by 2002:a05:651c:d4:: with SMTP id 20mr14591015ljr.132.1643660842706;
        Mon, 31 Jan 2022 12:27:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n9sm2130811lfi.227.2022.01.31.12.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 12:27:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH v2 1/2] arm64: defconfig: Enable PM8916 watchdog driver
Date:   Mon, 31 Jan 2022 23:27:20 +0300
Message-Id: <20220131202721.2122605-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Aníbal Limón <anibal.limon@linaro.org>

Enable watchdog driver for pm8916 block. It is used on msm8916/apq8016
platforms (e.g. Dragonboard 410c).

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
[DB: changed to =m, expanded commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bb30afa95a73..087a1612902f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_MESON_GXBB_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=m
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
+CONFIG_PM8916_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
-- 
2.34.1

