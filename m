Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D75A5710BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 05:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiGLDSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 23:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiGLDSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 23:18:15 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A14B6F7FC
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 20:18:14 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u9so9003618oiv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 20:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32e9w7H/YZWGbr9gX3MxrH+QEmq87aGcQE2gV4/SJnk=;
        b=IP2JpeJ4y5Hz3arOc8BXbzqMWOhDhhY9QolRaN1SCjFIxa9oveysbISh8EJtOU+HiV
         v0NJHxgzkS+m1P3oMXpsWkY/k/gZOx0tTcETUHfKLo4xFLcp66kiWW8o8f5sw5UdchgQ
         mu4bvvld/rtmiByau1n27UbbVK+bwR0WvG5qrfREh/9OgVWi3cXUjy7BiqF0A27xhDQG
         QOlGByS6WgJTn+hGanrHTlAWKdUDsd1auRjAfUoJTiqq32okpm3ZnRYMsBHwK08LSxXO
         TLPWDhYO+pVojLXo+Jbm4CW5EyyH2YZ/6PH6J3Cc5Eg6s6wgtcrKf0zBPkNRR2L+itG3
         yijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32e9w7H/YZWGbr9gX3MxrH+QEmq87aGcQE2gV4/SJnk=;
        b=530wOH42VgifGancqC+00rP368XVRDBoTD07PuRsb2OafLF3cdb0KhbSSspn2fdl1y
         czByHnSnsQsASVkNfj/T/q/7MGPnVddRayX2Syrj+0q0ggWS3h9p7iUvVp/H70S5hWvK
         ksuJc8Ip+qDUwazPZAwU0RtTqgc1iulYflyLJYk1+dvhJjfmaNd61h9X8XUZk28KD7By
         VvY6Fb8A8+qT+3j6zJOCDlJk+zGojI40R8H+HWhyUTCtlpLplrT6usE3M83svTIRuYyP
         KCqPDehqYUtqvKZIu1Xqw31gzF1gGasqcaPCsXcv1R9iHZXj62t9Sf8shzU17HTmSAaw
         nkvw==
X-Gm-Message-State: AJIora9s5fPShOaMGfdAgDIvvBo2vW1UPh3frDiuRAA9ByJBNxoooZPj
        ZCJV7H3iBy/dYNrBWYXePhGx3A==
X-Google-Smtp-Source: AGRyM1tx652Yw/r/fiijIIbJzi2YD3iutE2V9+Lz2qF8Axy228G+uuKPPm/66rRKjOA2Jf/YfKZ5sw==
X-Received: by 2002:a54:4e8d:0:b0:325:988d:afaf with SMTP id c13-20020a544e8d000000b00325988dafafmr825016oiy.135.1657595893397;
        Mon, 11 Jul 2022 20:18:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c128-20020aca3586000000b00338869042fdsm3517878oia.32.2022.07.11.20.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 20:18:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.20
Date:   Mon, 11 Jul 2022 22:18:12 -0500
Message-Id: <20220712031812.1275182-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20

for you to fetch changes up to 76f11e77f919397f31198354cd0e0bd8e76f8748:

  arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.20

This enables the drivers for the Light Pulse Generator and Bandwidth
Monitor hardware, found in a wide variety of Qualcomm PMICs and SoCs.

It enables interconnect providers for MSM8996, QCS404 and SC7180 and it
enables the USB PHYs for the QCS404 platform.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: defconfig: enable Qualcomm LPG leds driver

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm Bandwidth Monitor

Vinod Koul (2):
      arm64: defconfig: Enable qcom ss & hs usb phy
      arm64: defconfig: Enable qcom interconnect drivers

 arch/arm64/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)
