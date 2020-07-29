Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23CD231DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2MBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2MBD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:03 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA0CC061794;
        Wed, 29 Jul 2020 05:01:03 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id c80so2492931wme.0;
        Wed, 29 Jul 2020 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jx6EqieUkHWaZH6NLlTYAUYl2Z+H5sinZlTBkzIivcs=;
        b=b8KXiqAYMzlvrZyjvf2etXAe9K3k4YUMyKbHaRjdFLU5MU5AG4svh0q3saMUMIzujo
         mR5h2AXKWKN5jZEnP9/WLSSnSv1JABXPHU1eZ7SnmnwqW+hf/320FJ50nEYGRYgUzqRd
         wTG9cjypzAxx4OyQ4zp/jG7Jbk+lczx2V2FcUKomzW82PMDHkIB3AQyMxNXBlGky9nM3
         OP2i9gBziZs/2cW8KBmtzMi9ADNgqOF/TagmkztW3PYUP6aEldQ1HcHgk4iJ6wUwpVwC
         lEz0x7JG7erSL38d9AeBXJNHVohytBqei01VJ1tzS6PgsXDrOiHal2ts6IteBbWBbPDP
         rnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jx6EqieUkHWaZH6NLlTYAUYl2Z+H5sinZlTBkzIivcs=;
        b=FesBfpYrzLGqtBJuetLZcC2meIZ7WkKhAubyruXPMv0LaPXnIKa5a+1ZHluGXKWEVr
         +lUitNSvZ2E/vF1y04Z0oDYBsLkRso0NxusHJ4lekb8hNlCaToz3D7csB4jNKtbBcKCe
         omYPRXFv6x5dDjvjetUtWsltaZRU4bxup9qpjtsF97WLEki+7ktbd8yKh+k93d30tDXu
         dU5Toq6T0OifI7XTjqwrXeFdINEYOpe2FPR6Syo4d8osoclkaMxHnbXSTL8XXYUygmKF
         fbQ/d3M3fp1MuxknfzIHPeteC5wj7El/dPTD07vpHcZIyY8OfZcy+6+LCkIORwZTX14Q
         iw3A==
X-Gm-Message-State: AOAM532yJKq6BOkg+L9Zk4WYVtGhDATBuab6FxFNfzwhcYTNZS1D4Eyv
        7dkpLYxiZElnSRCS3uewu5s=
X-Google-Smtp-Source: ABdhPJxN+rnZl0ZoT8siI0yvIAflJTa/7+a8wG3re4zKe/jyTEKmwakBjX7TkB4qNUvdRkak6LQbzg==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr7951248wmj.184.1596024062002;
        Wed, 29 Jul 2020 05:01:02 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:01 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 00/10] msm8992/4 updates
Date:   Wed, 29 Jul 2020 14:00:46 +0200
Message-Id: <20200729120057.35079-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings support for:

* sdhci2 on 8992/4
* BLSP_I2C1 (a seemingly WP-exclusive i2c bus) for 8992
* Synaptics RMI4 touchscreen for Sony Kitakami and MSFT L950
* DWC3 USB for msm8992/4 (doesn't work on Lumias, they use custom
circuitry)
* Missing clocks for 8994 GCC needed for USB

And also cleans up the clock driver

changes since v1:
- switch clocks to use parent_data instead of parent_names
- add missing reset for modem
- clean up gcc-msm8994 probe and remove predefined "xo"
- remove peripheral_noc_clk_src from SDHCI AHB clocks which was added by mistake

Konrad Dybcio (10):
  arm64: dts: qcom: msm8992: Add support for SDHCI2
  arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
  arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
  arm64: dts: qcom: msm8994: Add USB support
  arm64: dts: qcom: msm8992: Add USB support
  arm64: dts: qcom: kitakami: Add Synaptics touchscreen
  arm64: dts: qcom: msm8994: Add SDHCI2 node
  arm64: dts: qcom: kitakami: Enable SDHCI2
  clk: qcom: gcc-msm8994: Fix up the driver and modernize it
  arm64: dts: qcom: msm8992/4: Add clocks property to gcc node

 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  28 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 126 +++
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  49 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  91 ++
 drivers/clk/qcom/gcc-msm8994.c                | 800 +++++++++++++-----
 include/dt-bindings/clock/qcom,gcc-msm8994.h  |  37 +
 6 files changed, 915 insertions(+), 216 deletions(-)

-- 
2.27.0

