Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFFB84C81AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 04:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiCADgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 22:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCADgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 22:36:09 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480607030E
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:35:28 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id k22-20020a9d4b96000000b005ad5211bd5aso11186638otf.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TpT57l7j+VEVWnhi7VBvM0wYYn+eMC3kYTDkfBvy3Y=;
        b=m6/oovAFI2rxU7OYUBCXzeFB+a/w+X2tXEmbsES52kGWzO2PRHd7yPle5WujrazpFB
         AO9uyafF04NjtHyR+i1l0omWXP4mOarEM3dB1jHYkT8zPvATHLGxr1OrEs7jse2eT4AM
         RKkJMpfOPaE5m6g1EM530RVCgEBM3mmGhOKI8kO3EeuPN/LxCzhcLSa5P70h0L5L/snp
         KaZOj4FeWgS2m7e1cYj6QCDKh6SZPtuzX25M5pZqXwfXrThRJUr9SH/dbbLfmgwcBrbY
         jFyfOOFWxZAyixsw+pK4YijAGFIEuRR4NK4o46BII9Lk8Gopt/vhXPKbmQtckVtJMtRq
         M1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TpT57l7j+VEVWnhi7VBvM0wYYn+eMC3kYTDkfBvy3Y=;
        b=UHbuYR8mlyWVMLPTWILFROE8arU22SW54gBHubXIpHZzkGLb6DXH8BdVHRjgFSnm9K
         i63dPHmOMIfDBFkIgLB+ftBKQASxjrRMsc5Ur4gj4P5r4Mxaieh0P1uDVJiEAWsYUbMZ
         hjJhUwJCO785ACJKeTwIvVJCoFfSUM6NTrPXv/oIo7L2fm/7u8tarhIyr4C56UcpJi/v
         uExheX8saiKMGt8J8ihGqLfSX+6sfdz7JCEeIpOhf61DKJpvBmQH7XEuPbT9kaQmsfst
         Tb7pS/fIrru3CrlwvCn0se86UgCjEAKQ6h8ML9nrjI/gCqLKFXEOIvWCqNteEfaUO4jC
         Pz0Q==
X-Gm-Message-State: AOAM531iRlouywdsxSg4fVB/7GJwQE6Gw485H10Wx0vaTAex5Gn9O36j
        azTE+wg/z5U6yDDGidbGcXSGYA==
X-Google-Smtp-Source: ABdhPJwdnilFD6W4jB2CzREpYQ2+PlfGHjlmFZDbx6RF3p2xwfnDtMwnnOylRst1W4QzurrpKUp5nw==
X-Received: by 2002:a9d:76c6:0:b0:5a1:b25d:1311 with SMTP id p6-20020a9d76c6000000b005a1b25d1311mr11367633otl.297.1646105727580;
        Mon, 28 Feb 2022 19:35:27 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l4-20020a4a94c4000000b002ea822fbac8sm5753828ooi.21.2022.02.28.19.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:35:27 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Steev Klimaszewski <steev@kali.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 5.17
Date:   Mon, 28 Feb 2022 21:35:26 -0600
Message-Id: <20220301033526.1801295-1-bjorn.andersson@linaro.org>
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

Sorry for the late fixes request. If it's too late, please merge it towards
v5.18.

Thanks,
Bjorn

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.17

for you to fetch changes up to 382e3e0eb6a83f1cf73d4dfa3448ade1ed721f22:

  arm64: dts: qcom: c630: disable crypto due to serror (2022-02-14 21:50:11 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for 5.17

This starts off by fixing an issue introduced in a bug fix in the
global clock controller, where the symbol clocks for UFS would
end up picking the wrong parent clock which breaks UFS.

It then makes sure that the reference clock for the USB blocks are
enabled, even with booting without clk_ignore_unused.

It corrects the apps SMMU interrupts defintion by adding a missing
interrupt in the list.

Lastly it disables the Qualcomm crypto hardware (for now) on the Lenovo
Yoga C630, to prevent the cryptomanager tests during boot from crashing
the device.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sm8350: Correct UFS symbol clocks

Jonathan Marek (2):
      arm64: dts: qcom: sm8450: enable GCC_USB3_0_CLKREF_EN for usb
      arm64: dts: qcom: sm8450: fix apps_smmu interrupts

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: disable crypto due to serror

 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  5 ++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 28 ++++++++++++++++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  8 ++++---
 3 files changed, 33 insertions(+), 8 deletions(-)
