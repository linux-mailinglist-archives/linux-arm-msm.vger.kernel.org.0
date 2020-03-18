Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA86189508
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgCREnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:43:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39415 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgCREnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:43:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id d25so5183159pfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 21:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jc7JXIl9pPFBTwgw5WmPaYcz+H7umRKbuhQlfABpCas=;
        b=lQsbM4vRJS5yrZkATzOSv7+mGzM51qrW+S9wJNoGWAvYaTd12fBV9y8jRx67JlMq6n
         Cw3a1sOxOL2bxuWd/2k+JavWr904D95HpMj1oAfaglpgKLswZt6HgOnEyPkJncr9FufZ
         uxBHz/7vCsLTzTMGiGnaUH4m+3R5mksBIbZWPJPsDDmN+bd1c6rXcZQDFObmxXndvXGD
         yyVO716enj+zqm6aRSzs1t3jKhZQPE8VVdSM9lVmOsXhP01Lbw8DANpny/JWNq03wgfm
         OOAgrowEjxzyMkKsDI86swaN+dTRoabkVMw9H95I6vu7IfuZkmBJqD3XlLcw6f7eTu1M
         6ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jc7JXIl9pPFBTwgw5WmPaYcz+H7umRKbuhQlfABpCas=;
        b=dBbWB+xz5LhDHJ9eBllEgspNiHiEWYKDIV4Nt5oh4l1jsz+ZWVaOkHuyy1nEdpLOM+
         Bsk4XzmnA4dFOJ0XJtWWSg5TlJwytpTwzWJW2PDnQvWZmp/2kcS03HG71bOit9Lg7gzq
         s21j1v/92icXq6VF3kHQLvynyttzq/IoRsnu52WUWz1xKAXMQvQcLGukdLX2BvRZZkln
         e5QZpWQNdTUPBs6YdINU1NgqlrUhvcFyxFMFngD+LAXE7RpfGaut1S8YxPcrYO2a/WAn
         fqnw1kBeNTrBhFry5tz4l+M1n82e7c+sGVpAiVfwJB5J+wQ+sLZZckSyT8k9F4UOVRiS
         vk/A==
X-Gm-Message-State: ANhLgQ1DDDOUY//bfWwQPaeLBt4C2njcDOdhosiNnjcjovx7Fo0+Ppc1
        ML+IpvljzpOGbRc5Rr9Dvv2TvA==
X-Google-Smtp-Source: ADFU+vsGvibNnunYwvv1wAot5gW2OLSg9QJLf1lb6UdxnyEl2+0hkd8U8icpz5luR18odm6LQY/u0w==
X-Received: by 2002:a65:678e:: with SMTP id e14mr2436997pgr.299.1584506588173;
        Tue, 17 Mar 2020 21:43:08 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u126sm4563397pfu.182.2020.03.17.21.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:43:07 -0700 (PDT)
Date:   Tue, 17 Mar 2020 21:43:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Christian Lamparter <chunkeey@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: [GIT PULL] Qualcomm ARM dts updates for v5.7
Message-ID: <20200318044305.GE470201@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.7

for you to fetch changes up to 8b99dc0922618062a1589ebd74df6108b4f9ac22:

  ARM: dts: qcom: add gpio-ranges property (2020-02-24 20:54:29 -0800)

----------------------------------------------------------------
Qualcomm ARM dts updates for v5.7

This adds Bluetooth support on Nexus 5, USB on Xperia Z1 and defines
gpio-ranges throughout the various gpio-controllers.

----------------------------------------------------------------
Christian Lamparter (1):
      ARM: dts: qcom: add gpio-ranges property

Jonathan Marek (2):
      ARM: dts: qcom: msm8974: add blsp2_uart10
      ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth

Konrad Dybcio (1):
      ARM: dts: qcom: msm8974-honami: Add USB node.

 arch/arm/boot/dts/qcom-apq8064.dtsi                |  1 +
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  1 +
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  1 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  1 +
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |  1 +
 arch/arm/boot/dts/qcom-msm8660.dtsi                |  1 +
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  1 +
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 71 ++++++++++++++++++++++
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   | 25 ++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 10 +++
 10 files changed, 113 insertions(+)
