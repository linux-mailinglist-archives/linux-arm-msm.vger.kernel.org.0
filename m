Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C550510E80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 04:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357021AbiD0CGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 22:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356963AbiD0CGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 22:06:51 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741044C7B1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 19:03:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n18so366536plg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 19:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wc+2XZPEQYFH8y8VTjcF8pWwSz487fhH3cfdOdvAYWY=;
        b=mZ8usUoirqcoTx9Hs24a9CJ/Vus3WeuHhFuyQW79gUnyF0wurc/Bx6DpY9EEYitYiy
         x5OBFxn8PVsSVmB6f4nEvvHOMR5x7akAdh5p/MaEh2aopCQAWSZ2X2q56b0xG/M04sZF
         1BteDlHlgMMv6dDVmdphUnP04lkZfHxtWaNgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wc+2XZPEQYFH8y8VTjcF8pWwSz487fhH3cfdOdvAYWY=;
        b=w/5tqJhMDKe17/5SL6eWRrYniw1RIuHtbVRF5b88ZZqyosMn7qaVOEBBpVM9VAJOWn
         0p6bkpDKNyaFpMaND4z/S/R2uPGs/Zxahl18tcVodDIBHQHvzgckz53vCq6diMrEh6wc
         y1DEohWXJkMl3cwGtkwDIRoY8jfXa1bwwwsJNLh09IWjb/Z3KNCVl8xKzEM74pzinumy
         BuUmRurt7EEdg1P9bbixs18BgcEKsD4dpDpVaC8UBEDRRteagFkfuO5c3uoZGWJlJVop
         q5wO3TB8OKy+xAT4mpAlCRYpbIhfPwolVOC2JiMS1Uvp5e7S1OQGXHH5rWg5wivmETPU
         N9fg==
X-Gm-Message-State: AOAM532SXzAZNs7Nkl2ETSl5TM71AT36BReLC7k+NTkPBMeAH0x/l6L0
        f9YukMcZiy/KTf3NQl5LGzgYwg==
X-Google-Smtp-Source: ABdhPJwbzaogkQCtlbv1RZNPvF9OcQIiCWJ5G1M9CMws5WnO3sCYZskphMfOjbW7oZHd3/44RVMyZw==
X-Received: by 2002:a17:90a:3d02:b0:1ca:7f92:1bf1 with SMTP id h2-20020a17090a3d0200b001ca7f921bf1mr41124131pjc.177.1651025021797;
        Tue, 26 Apr 2022 19:03:41 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:482e:60bc:84d1:bf5c])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a0023cf00b004e17e11cb17sm18324197pfc.111.2022.04.26.19.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 19:03:41 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc7180-trogdor: Simplify!
Date:   Tue, 26 Apr 2022 19:03:36 -0700
Message-Id: <20220427020339.360855-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a couple patches to simplify sc7180-trogdor dtsi files further.
There will be logical conflicts with the wormdingler patch because it
will need to have similar changes done for the swizzle and include, but
that can be cleaned up later or I can resend if the wormdingler patch
gets merged first. Either way nothing will be broken from what I can
tell.

I compiled these and diffed the dtbs before and after and found no
changes.

Changes from v1 (https://lore.kernel.org/r/20220325234344.199841-1-swboyd@chromium.org):
 * Another patch to move around sc7180.dtsi includes
 * Fixed trackpad for trogdor-r1 and pompom
 * Made spi0/spi6 patch not as aggressive

Stephen Boyd (3):
  arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
  arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
  arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 11 +----------
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts      |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts      |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r4.dts      |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi |  7 -------
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts    |  2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts    |  2 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts     |  2 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts  |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts      |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts  |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts      |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts  |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    |  7 ++++---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   |  9 ++++-----
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts        |  9 ++++-----
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          |  8 ++++----
 21 files changed, 32 insertions(+), 49 deletions(-)

Cc: "Joseph S. Barrera III" <joebar@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>

base-commit: f238ff81e8946540e1a7c1496aa92fa2386893dc
-- 
https://chromeos.dev

