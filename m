Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A79041D1A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 04:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347917AbhI3C4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 22:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347912AbhI3C4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 22:56:52 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A2CC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:55:11 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 24so5577762oix.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+1ST1IwMq7SdLN8IVWaHSe9jzpTADx+oCW9sYTruZ8Q=;
        b=hDRMWj4AyHsqYsMPUVFDfAJoc/59eTDFl+JDDVqRnSLT8YLgzTsoSQgDThD+hvsAF6
         vy/5x4rZjFMg0fec/cc1gzn6KRxIGE/4dPLWGCRb4fmBsT8UKpt9Tt1Kl7hWUH0lLNjs
         CD5wPz9FHeseaYWEQa51a4XLgo5LVpGiTlYPxe5L3xZqBPoRMP8hAd9NVTE4WWEuoLeu
         tAaDKApIfE4wJk5paOKCh9b7ciAfSX37AVxvz/52zs7oO4GxT7PKpxQ9t9HKGuQRpAkK
         DPNPbA+aEjI4F7xlLLT0jJvUgHh2PvtCMc8FdK5Jnq9mqaTVPStvz33LviCPG6pI5Vxq
         ge3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+1ST1IwMq7SdLN8IVWaHSe9jzpTADx+oCW9sYTruZ8Q=;
        b=N8V2T5ylCKbCgYmQoLY7yzfUgTNRQ12anheZC2sPLwADZCR+lSz6aMmakNAM1FKooT
         CehK++xDuk27x+QC3lPriU0TzC4V/r2DDmLywk+bTx7s7q69LwNFpWS5LXP+RsAWb5oL
         Pdvpi1ecsYDV8Fw41805nj4S5XiyxvB8ZSsgu3YIUuNgaRdubrTNidDvLmqgOOIc6Y3r
         pwGi5fVBqL0nlLiLSfpr5Wlraoc/U9eLlmUfiTKaUeUZdofxDz+tYSjh4JcU9sdyQVoy
         7Mi8xguII8eY5caJbyOuDVr2nqb8hD5zBt0hxc2TEH0ACGmWv8S5OI+vH7RG9RWjx8Nk
         s9QQ==
X-Gm-Message-State: AOAM533OqyUKW9vBoKHvS5c31L5/mPjULwRp1EAy/VYq00DuprFSAd7U
        Gx9ICRDOagROu53g+1CV5yzEIl8f8emNQg==
X-Google-Smtp-Source: ABdhPJxGDBULmmB1HwFnluqAi6juGLR+lBmZye4slIGlDBjO9z62aUEnz9vq2OafqnFVDQO58Conpg==
X-Received: by 2002:aca:c641:: with SMTP id w62mr833261oif.102.1632970510404;
        Wed, 29 Sep 2021 19:55:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z17sm350459ooz.38.2021.09.29.19.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 19:55:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS fixes for 5.15
Date:   Wed, 29 Sep 2021 21:55:09 -0500
Message-Id: <20210930025509.1091-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15

for you to fetch changes up to 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae:

  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks (2021-09-24 10:05:22 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS fixes for 5.15

This starts by reverting the SC7280 CPUfreq update, which was merged
before concensus about the associated drivers changes was reached.

It then moves the reserved-memory changes done to get IPA working on the
Lenovo Yoga C630 into the Yoga specific DTS, as changing the memory map
on the platform level did break a couple of the other boards.

It fixes the HDMI audio on Trogdor and add missing Aggre2 NOC qos clocks
on SDM6{30,36,60} which prevented some boards from booting.

Lastly it enables the PON module on SM8250/QRB5165, as the lack thereof
is blocking automated testing in LKFT.

----------------------------------------------------------------
Amit Pundir (1):
      arm64: dts: qcom: sdm850-yoga: Reshuffle IPA memory mappings

Dmitry Baryshkov (3):
      arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
      arm64: dts: qcom: pm8150: specify reboot mode magics
      arm64: dts: qcom: qrb5165-rb5: enabled pwrkey and resin nodes

Douglas Anderson (1):
      Revert "arm64: dts: qcom: sc7280: Fixup the cpufreq node"

Shawn Guo (1):
      arm64: dts: qcom: sdm630: Add missing a2noc qos clocks

Stephen Boyd (1):
      arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI

 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  4 ++-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 10 +++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  9 +++---
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 15 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 21 ++++++++-----
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 34 ++++++++++++++++++++++
 7 files changed, 80 insertions(+), 19 deletions(-)
