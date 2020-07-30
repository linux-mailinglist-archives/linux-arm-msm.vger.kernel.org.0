Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A10232B56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 07:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3FXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 01:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgG3FXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 01:23:32 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139DCC061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:23:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so3282488pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82iPq/dl3fSSblQ20jxlinGCAwWS3+QAubsNlPph9z8=;
        b=tA+pH1DqL6wOpI4XXl/JSAfSWJIgxc3bKs3LWr0jgvPqjOgT4Q14JZqJ4vGUBpyRNr
         wx5AhX1lMa1mm/5IBYFSJqKWQqsU/+efwNdQtZPduVZ9R2ympzXyco6xt/628d94iZfK
         W+vip9+XX2A7oDmANMRODmddtj04w2co3N9kf4CKNgEtNwymd6ABaJJk4uM8Tuv0S2jV
         aIZHFH51xLklKkR3OUJyIwB3dwdMpnBQtyNASUHXv1qJqcdPx4WBnEyOJAPRhXfC3iNQ
         q6o8SDWo4z7eB4dNES27bOP03P240H3U+YQWGzmdLkqVOyZyP7ftuwLCltzfaQt51Hhm
         oeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82iPq/dl3fSSblQ20jxlinGCAwWS3+QAubsNlPph9z8=;
        b=cdC2jz0l5voIR1E2GK8Smw6LLrh7VPmz/J+Ai7IBprIwXigTLJtAtkL3zJICDNgJ+s
         mPSjM5Ng8mn3sno6He1PHN3e3u1KRnrbAHF1ogsRjlIZmAc3YSSPhSJYyTxkyRoBvltn
         euOm5Q4I/nRlVIza/gwUyutDTR0Hgw0LzeAPuTgRLfYwdGnw0dIs0c2KUoWKe4SDzCzz
         tsAy5JnJj0De97iMdGlzuv0vI5j8nzUc73uyDpChUz7dQc/1qQMA4dJmSUlyCLMSxsNL
         BE08wM7pNaDdAhvvtSKKchBsudvmE+zGdqHCZjICMRXLy0DHCCV83JL/N27pxH4WRQGb
         CmFg==
X-Gm-Message-State: AOAM532xbaVhkf9NzYHqvDkCeoKhsE7eS9KeIeVY/5pZjtwMFohm7agh
        fnFuFRu1CF3T2ZJuwhsvppAV8g==
X-Google-Smtp-Source: ABdhPJyx9fA3lHIrBstsbynO0iH1Xc1ewLWcFuZzN3lGkoJOu7yV4THoHdkjJ+tye4/gffBp9Nhjhg==
X-Received: by 2002:a17:902:54e:: with SMTP id 72mr29983630plf.181.1596086610946;
        Wed, 29 Jul 2020 22:23:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g28sm4288395pfr.70.2020.07.29.22.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 22:23:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 DT additional updates for 5.9
Date:   Wed, 29 Jul 2020 22:20:03 -0700
Message-Id: <20200730052003.649940-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 208921bae696d92f6a10681cfef2df0bb68f091a:

  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators (2020-07-18 22:37:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.9-2

for you to fetch changes up to 9d56a1c21f1caf52ca4f6f578e98a0503aa8001d:

  arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree (2020-07-27 23:46:29 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DT additional updates for 5.9

For SC7180 this adds the necessary properties for blowing fuses in
qfprom, Coresight fixes, GPU interconnect votes and specifies max speed
for USB controller.

SM8150 and SM8250 gains Adreno SMMU, the graphics management unit and
the GPU nodes, to enable headless GPU usage.

SDM845 gains tracing support for deep idle, GPU bus bandwidth scaling
and DB845c gains the LT9611 HDMI bridge wired up.

MSM8994 gains SMD RPM and SCM support and a new dts for the Sony Xperia
Z5.

MSM8992 is refactored and modernized and gets support for SCM, SPMI,
BLSP2 UART and I2C nodes, PMU, RPM clock controller, PSCI and proper CPU
definitions. Support for the Xiaomi Libra and Microsoft Lumia 950 are
added.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sdm845-db845c: Add hdmi bridge nodes

Jonathan Marek (3):
      dt-bindings: power: Add missing rpmpd rpmh regulator level
      arm64: dts: qcom: add sm8150 GPU nodes
      arm64: dts: qcom: add sm8250 GPU nodes

Konrad Dybcio (18):
      arm64: dts: qcom: msm8994: Add SCM node
      arm64: dts: qcom: msm8992: Add a label to rpm-requests
      arm64: dts: qcom: msm8994: Add support for SMD RPM
      arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.
      arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)
      arm64: dts: qcom: msm8992: Modernize the DTS style
      arm64: dts: qcom: msm8992: Fix SDHCI1
      arm64: dts: qcom: bullhead: Add qcom,msm-id
      arm64: dts: qcom: bullhead: Move UART pinctrl to SoC
      arm64: dts: qcom: msm8992: Add a proper CPU map
      arm64: dts: qcom: msm8992: Add a SCM node
      arm64: dts: qcom: msm8992: Add SPMI PMIC arbiter device
      arm64: dts: qcom: msm8992: Add BLSP2_UART2 and I2C nodes
      arm64: dts: qcom: msm8992: Add PMU node
      arm64: dts: qcom: msm8992: Add PSCI support.
      arm64: dts: qcom: msm8992: Add RPMCC node
      arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree
      arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree

Ravi Kumar Bokka (1):
      arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing

Sai Prakash Ranjan (4):
      arm64: dts: qcom: sdm845: Support ETMv4 power management
      arm64: dts: qcom: sc7180: Add support to skip powering up of ETM
      arm64: dts: qcom: sc7180: Add iommus property to ETR
      arm64: dts: qcom: sc7180: Add support for context losing replicator

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7180: Add maximum speed property for DWC3 USB node

Sharat Masetty (3):
      arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
      arm64: dts: qcom: sc7180: Add interconnects property for GPU
      arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     | 245 ++++++++-
 .../boot/dts/qcom/msm8992-msft-lumia-talkman.dts   |  39 ++
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |  90 ----
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  | 364 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8992.dtsi              | 566 ++++++++++++++++-----
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi      | 268 ----------
 .../qcom/msm8994-sony-xperia-kitakami-sumire.dts   |  13 +
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     | 235 +++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  49 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   4 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  31 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 118 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  18 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 135 +++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 142 ++++++
 include/dt-bindings/power/qcom-rpmpd.h             |   1 +
 17 files changed, 1820 insertions(+), 501 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
