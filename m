Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1071251F7F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237169AbiEIJQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbiEIJFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 05:05:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B0A1900D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 02:01:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l19so16171008ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uk0F+pHFme3IX8Eb3GloSmQuUNGPl5g90xgvNBZj1Q0=;
        b=T8Fkx+HlnRGu+csQwocv2tBOCOgRuBg/8XXN4eYCxquH9wcCL75nYMyC7w71vwlPm+
         ZvWbpfa5j4F1xqlgpGSd0NxQyWkTN3eva9ZRd1vYB1N/3Tn7T5hY3vAvDs6dXhUwwuPu
         GlowdfDbdaeMsReG004sKGBeXFhiKA0UDflhGQuy//NNPvuHZSppxxR1RegATSIpxyv4
         3wg7QkTW6tSKL8fSAjlbkCg1KoAENUwizi9WlHs4BuCfaNvEOiF4YDXyUQ8Dhy9aOpgl
         jhfOuvB9PZc2V/VY+pOJHNGJQlR9NAT+4bucaMkHdO3xyGtlP6LzHsGboCJSqGJ98ngt
         ZTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uk0F+pHFme3IX8Eb3GloSmQuUNGPl5g90xgvNBZj1Q0=;
        b=mTLXjoeCrfWvdzuR2iFkcjCZyKCKG2tm/HT7GT6GuTjENX8PtOwcGAylNeelrR8VBG
         /rD7SVg7luKoiQpeXNSPhRZD48R499L95Xze4xMyMKFhsDzdzjg8usNyhDrD1geVlvCM
         rs2Ib+ZWTP+5ZcCCaStjdi7oh2cSzt9gb1an8BkG5DAd5QrZeHySX/XGFJedg+tScQ2d
         3hfc7dTpgi2AcIPkgnsTqzvo9ug0FdgusxWyOW0wYRPH5qxPyNmIrgoAzKeQsDKV0gzw
         Sup92EwlJ74ZOSqaxRk6YvzGBcXvFQXMS5+aNoAeRap4V0RseeSTX+uxkWmODl/1yyWZ
         g/Jg==
X-Gm-Message-State: AOAM5306ExmaUAzUEb/TqBU5YOrGuLBWSt3YcZWJraRtjz0sP52wM6kI
        utoPb0Ak/3nf2cKim01CbvU+6w==
X-Google-Smtp-Source: ABdhPJw4YqikXmTuH3YWOOhGAa9mTdCn4BuRZknaQFg95We20bWB5fgxTha1VNVQ8Yly6Ib2FSFYUQ==
X-Received: by 2002:a2e:b5d1:0:b0:24f:331d:f9b6 with SMTP id g17-20020a2eb5d1000000b0024f331df9b6mr9821404ljn.302.1652086863539;
        Mon, 09 May 2022 02:01:03 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id t3-20020a2e7803000000b0024f3d1daee8sm1749824ljc.112.2022.05.09.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:02 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v5 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Mon,  9 May 2022 12:00:57 +0300
Message-Id: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
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

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Changes from v4 to v5:
* fixed the same typo in a usage example found in yaml file as in v3
  change.

Changes from v3 to v4:
* fixed a changed path in the yaml file.

Changes from v2 to v3:
* fixed a typo in a usage example found in yaml file,
* renamed dt related files to match the compatible "qcom,sm8450-camcc",
* minor fixes in the driver per review requests from Bjorn,
* added Bjorn's tag to a change of exported symbols namespace.

Changes from v1 to v2:
* updated qcom,camcc-sm8450.yaml according to review comments from Rob,
* changed qcom,camcc-sm8450.h licence to dual one,
* disabled camcc device tree node by default,
* added Stephen's tag,
* rebased the series on top of clk-for-5.18

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   89 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2859 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3285 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

