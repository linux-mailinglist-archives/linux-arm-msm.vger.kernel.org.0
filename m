Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC9152031C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 19:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239439AbiEIRGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 13:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239440AbiEIRF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 13:05:59 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039D81B3BBE
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 10:02:04 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id z15-20020a9d65cf000000b00605f064482cso10537536oth.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjxiAYG973+YHHezpxuQgXS4fAT5Lbjwcqc22ucgL2w=;
        b=wlkusx7cNtkouSDUW6mCE2YQ6lW/1MopLeduSz5WaihSFZzTZr9QDyEfS7ocIuwUe3
         PDQesJEDxfsvRW16HXyg93hK2iKJsT8IJW3wns4p8ia5LlRH5CbSdaskbR6jEIOMZ2Ni
         LpyA2rVh9P87cG3zHU/BplocnEcFJSxNU+B/GhSVZGnQrCG5Dy73GN2u08udAn8351mF
         IaYacqn0KN8Vin2/xG61uNHAU+6d94mOVo/7s5dCWf25wOAvhXXlZHXK8CFhXCqlrvxI
         1NTk8hI5P9pxg4ltm8ZD6W/O+fKeI1PZ+xGH4ijQ2sad1/2NnjGrQH6Ld+pjmZ7WvZ9w
         XG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjxiAYG973+YHHezpxuQgXS4fAT5Lbjwcqc22ucgL2w=;
        b=aXeEhwKpHemRGWW2b7CEcHBh7xhHEXGDBk4NdTC+CP5X3zxXp1woBFVirh//N4tL7v
         woKAHwx/eTMV5zYal3C833iSsmoFOcuKDwxKX6zPdVbQfLYVM/xCuYNjrHIPDd4yUJLu
         HR5i0Rou3vjEIhKEN1Qqry0C1fcig845cM6OvRhc9PDXEtzLGah00iQKeMzoSaD0C57S
         pRROkHvgLhQiD3SkdBJ8sR7IseiC05A/vTvb8uqH3zfkkVBCXff2fPDY9qvKgPTLhuOC
         OLURnMn2kswHDs+zZWLqEFZIysMvi+m2L7+G7vX6Jk4OrrwgcG+p0NzUz5xc6KkQT3sy
         St3g==
X-Gm-Message-State: AOAM533LI+QEgif0Ihadx2OSIt3VEGXr1kUS1CfTDnRYrrT9v7WoqyUh
        wya6455YeGuD/2oWF2iP9SloiA==
X-Google-Smtp-Source: ABdhPJyAJJiAw7wJ4RHIkyJlmYNTD3aC/s4/u1WNoTMgV46YA06Jxxzcfituz+AmE6RNCaBmUoLPlA==
X-Received: by 2002:a05:6830:2705:b0:606:5c00:e45d with SMTP id j5-20020a056830270500b006065c00e45dmr6517054otu.375.1652115723208;
        Mon, 09 May 2022 10:02:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bh29-20020a056808181d00b00325cda1ff9dsm4499198oib.28.2022.05.09.10.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 10:02:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.19
Date:   Mon,  9 May 2022 12:01:58 -0500
Message-Id: <20220509170158.311962-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.19

for you to fetch changes up to ad1661b0c91d55f1c194fa4bb059056e48937adb:

  arm64: defconfig: Enable Qualcomm GPI DMA Driver (2022-04-12 16:51:24 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.19

This enables the GPI DMA driver, providing access to I2C and SPI
controllers that are setup for shared ownership. The PCIe Gen2 PHY
provides PCI support on the QCS405 platform, among others. The PMIC
watchdog, concell and ADC5 ThermalMonitor drivers provides housekeeping
services on a range of different platforms.

The Display and Video clock controllers for SM8250 are enabled, as is
the audio RX/TX macros and the WCD9335 audio codec driver.

Lastly the Ath11k driver, used on a variety of modern boards and the
FastRPC driver, which provides an interface for computational offloading
on the Hexagon cores, are enabled.

All drivers, except the SM8250 Display and Video clock controller
drivers are enabled as modules. The two clock controllers provides
power-domains and must be builtin to reduce the risk of probe deferral
happening (and being ignored) after late initcall.

----------------------------------------------------------------
Aníbal Limón (1):
      arm64: defconfig: Enable PM8916 watchdog driver

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm PCIe Gen2 PHY

Bryan O'Donoghue (1):
      arm64: defconfig: Enable SM8250 video clock controller

Dmitry Baryshkov (5):
      arm64: defconfig: enable Qualcomm RX and TX macro for SM8250 audio
      arm64: defconfig: enable wcd9335 codec as module
      arm64: defconfig: reenable SM_DISPCC_8250
      arm64: defconfig: Enable some Qualcomm drivers
      arm64: defconfig: enable ath11k driver

Vinod Koul (1):
      arm64: defconfig: Enable Qualcomm GPI DMA Driver

 arch/arm64/configs/defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
