Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CFC3EE03E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 01:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhHPXM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 19:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbhHPXM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 19:12:58 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9CBC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:12:26 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso1916592otp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJDww2QKwaG5UxSU79OCSXCPa4nkLZpLQevsgJIxBTU=;
        b=MEg0pmRm0aNWyFeoabK/rETBcjiKGQcZQPGkjPSdH3zNb+UR7LQVbRDhF9ykT1kn4M
         LfOUIxuQHKoyds/ordQXguakZJfu9qmXYkOAHY+FsW8W6xABke79ipj3gKls9Kn5y6iM
         36abUQLzNB+TYJdzfC/rhoYKVWNZKW7EXzQxa8dhHeCECg7w9iHHv/Nc285CcCTI4FsY
         lSCxQXbvzrZ2I/pboKaF20WZcpjYD4bVexyFgfK1lH4daJipIp4/m8hDLOkercg1srE1
         qQHRV5RXLmT+BegLg9BVHOQkXSoLUFdjKQd77IpPZVKmMyQCDdn9MrvkXBVHKEBMhSmQ
         eqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJDww2QKwaG5UxSU79OCSXCPa4nkLZpLQevsgJIxBTU=;
        b=t4D5lj2H2xo9Re40C5HPBwAA+m4n58nA+f0brFwAM/HYrMhUT5B7+bpJjBGowMe7RN
         IWJ6Cqgr6QlUTjXD7HZmSCJR0zlPb8CQHyKLbvLjb7qk9WjvPNfa1JRjnSbQcCTjXdXo
         x0/u0kSCYEMyLuo9Gbo/gcNOvN3Gh+/UeCCXtVTyg1KWdAWKsQceQb0846wo3GwkxV+T
         +twGCop2RXBy5K/yzbJ6JWM0PvAgn7tXY4QtnzmEEQLZVXgmIXyGaVyJcUmmhhCITJ4N
         JT3fLTYkRUYNdpw0emeCSTIo//GLurij6I6KJYIZEfr3evYSwrZBKkPSsSx3qS93WrGn
         +bRg==
X-Gm-Message-State: AOAM531ssGvQc7euyZa2r7WfTdpeq7FciJlEffFT9Qtb2DV+nXQDsrcQ
        CKv5jHQJaPnTl3JQ6f3BobB++w==
X-Google-Smtp-Source: ABdhPJxhfYCZa16ambCb4b0oMrh8uwWyP7Y/u0p8AToOvJCwALxmiDwhCeJKUn6eh2IXO64zrzLSyg==
X-Received: by 2002:a05:6830:114d:: with SMTP id x13mr385910otq.105.1629155545304;
        Mon, 16 Aug 2021 16:12:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o24sm91389oie.17.2021.08.16.16.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:12:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Martin Botka <martin.botka@somainline.org>,
        Robert Marko <robimarko@gmail.com>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Douglas Anderson <dianders@chromium.org>,
        Felipe Balbi <felipe.balbi@microsoft.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kathiravan T <kathirav@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        satya priya <skakit@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 updates for v5.15
Date:   Mon, 16 Aug 2021 18:12:23 -0500
Message-Id: <20210816231223.586597-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.15

for you to fetch changes up to 198b8c8ede36d2135df73fee19506276059a0f8e:

  Merge tag 'v5.14-rc3' into arm64-for-5.15 (2021-08-16 18:02:26 -0500)

----------------------------------------------------------------
Qualcomm ARM64 updates for v5.15

SDM660 and SDM630 was concluded to be similar enough that they should be
merged, and the derivative SDM636 was added to the bunch. The combined
platform gained support for GPU, DMA, I2C, IMEM, display, power-domains,
SDHCI, thermal, USB, interconnects, VADC, WLED and audio remoteproc. The
Sony Xperia "Ganges" platform was similarly merged with "Nile", got
cleaned up and gained touchscreen, USB, volume keys and uSD support.

IPQ6018 gains USB2 and PCIe support and a few minor fixes. IPQ8074
gains SCM, PRNG and Crypto support and a DT style update of the PCIe
nodes.

MSM8916 gains Coresight STM support. The Xiaomi Redmi 2 is introduced,
with touchscreen, notification LED and IMU support. MSM8996 gains
support for GPU cooling and v3.0 of the SoC, which is used to introduce
support for the Sony Xperia X Performance, XZ and XZs phones.

SC7180 finally gains DisplayPort support and LPASS is updated
accordingly. A number of fixes are introduced and with the newly
introduced DRM aux bus in place Trogdor's panel is moved under the eDP
bridge. SC7280 gained USB, eMMC, SD-card, QFPROM and IPA support, the
new IDP2 board was added.

SM6126 (aka Snapdragon 665) was introduced, together with the Sony
Xperia 10II phone with support for framebuffer, USB, eMMC and volume
keys.

SM8150 gained inline crypto support for UFS enabled, CPU opp-tables was
introduced to scale DDR and L3 frequencies and SPI nodes where added, in
addition to a number of smaller fixes.

SM8250 gained a number of minor fixes and had its serial engines wired
up to use the GENI wrappers' DMA engines.

SM8350 had wakeup-parent defined for the TLMM gpio node and I2C13 was
introduced.

SDM845 display clocks was corrected and Lenovo Yoga C630 got IPA enabled
and now has working LTE connectivity.

Additionally a number of minor fixes throughout to correct DT validation
warnings.

Lastly v5.14-rc3 is merge in to resolve the merge conflicts caused by
the USB maintainer deciding to fix a regression in his tree.

----------------------------------------------------------------
Alex Elder (4):
      arm64: dts: qcom: sc7280: add IPA information
      arm64: dts: qcom: sc7280: enable IPA for sc7280-idp
      arm64: dts: qcom: sc7180: define ipa_fw_mem node
      arm64: dts: qcom: sm8350: fix IPA interconnects

AngeloGioacchino Del Regno (14):
      arm64: dts: qcom: Add support for SONY Xperia X Performance / XZ / XZs (msm8996, Tone platform)
      arm64: dts: qcom: sdm630: Rewrite memory map
      arm64: dts: qcom: sdm630: Add qfprom subnodes
      arm64: dts: qcom: sdm630: Fix TLMM node and pinctrl configuration
      arm64: dts: qcom: sdm630: Add SDHCI2 node
      arm64: dts: qcom: sdm630: Add interconnect and opp table to sdhc_1
      arm64: dts: qcom: sdm630: Add GPU Clock Controller node
      arm64: dts: qcom: sdm630: Add clocks and power domains to SMMU nodes
      arm64: dts: qcom: sdm630: Add qcom,adreno-smmu compatible
      arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration
      arm64: dts: qcom: pm660: Support SPMI regulators on PMIC sid 1
      arm64: dts: qcom: pm660l: Support SPMI regulators on PMIC sid 3
      arm64: dts: qcom: sdm630: Configure the camera subsystem
      arm64: dts: qcom: sdm630-xperia-nile: Add all RPM and fixed regulators

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: correct TCSR block area

Bhupesh Sharma (4):
      arm64: dts: qcom: sm8150: Add UFS ICE capability
      arm64: dts: qcom: Use correct naming for dwc3 usb nodes in dts files
      arm64: dts: qcom: sm8150: Sort dc_noc and gem_noc nodes
      arm64: dts: qcom: Fix usb entries for SA8155p adp board

Bjorn Andersson (3):
      arm64: dts: qcom: sdm850-yoga: Enable IPA
      arm64: dts: qcom: sm8350: Add wakeup-parent to tlmm
      Merge tag 'v5.14-rc3' into arm64-for-5.15

Caleb Connolly (2):
      arm64: dts: qcom: sdm845-oneplus-common: enable debug UART
      arm64: dts: qcom: sdm845-oneplus: add ipa firmware names

Dmitry Baryshkov (7):
      arm64: dts: qcom: sm8250: fix usb2 qmp phy node
      arm64: dts: qcom: sdm845: move bus clock to mdp node for sdm845 target
      arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sm8250: assign DSI clock source parents

Douglas Anderson (1):
      arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

Felipe Balbi (1):
      arm64: dts: qcom: sm8150: add SPI nodes

Georgi Djakov (2):
      arm64: dts: qcom: sm8250: Fix epss_l3 unit address
      arm64: dts: qcom: msm8916: Enable CoreSight STM component

Gokul Sriram Palanisamy (2):
      arm64: dts: qcom: ipq6018: Update WCSS PIL driver compatible
      arm64: dts: qcom: ipq8074: Add scm on IPQ8074 SoCs

Jonathan Marek (1):
      arm64: dts: qcom: sm8350: add qupv3_id_1/i2c13 nodes

Judy Hsiao (2):
      arm64: dts: qcom: sc7180: Set adau wakeup delay to 80 ms
      arm64: dts: qcom: sc7180: trogdor: Update audio codec to Max98360A

Kathiravan T (1):
      arm64: dts: qcom: ipq6018: enable USB2 support

Konrad Dybcio (31):
      arm64: dts: qcom: Add PMI8996 DTSI file
      arm64: dts: qcom: Add MSM8996v3.0 DTSI file
      arm64: dts: qcom: msm8996-*: Disable HDMI by default
      arm64: dts: qcom: sdm630: Add RPMPD nodes
      arm64: dts: qcom: sdm630: Add MMCC node
      arm64: dts: qcom: sdm630: Add interconnect provider nodes
      arm64: dts: qcom: sdm630: Add MDSS nodes
      arm64: dts: qcom: sdm630: Add USB configuration
      arm64: dts: qcom: sdm630: Add TSENS node
      arm64: dts: qcom: sdm630: Add modem/ADSP SMP2P nodes
      arm64: dts: qcom: sdm630: Add thermal-zones configuration
      arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration
      arm64: dts: qcom: sdm630: Raise tcsr_mutex_regs size
      arm64: dts: qcom: pm660l: Add WLED support
      arm64: dts: qcom: pm660(l): Add VADC and temp alarm nodes
      arm64: dts: qcom: sdm660: Make the DTS an overlay on top of 630
      arm64: dts: qcom: Add device tree for SDM636
      arm64: dts: qcom: sdm630: Add IMEM node
      arm64: dts: qcom: sdm660: Add required nodes for DSI1
      arm64: dts: qcom: sdm630-nile: Use &labels
      arm64: dts: qcom: sdm630-nile: Add USB
      arm64: dts: qcom: sdm630-nile: Add Volume up key
      arm64: dts: qcom: sdm630-xperia: Retire sdm630-sony-xperia-ganges.dtsi
      arm64: dts: qcom: sdm630-nile: Add Synaptics touchscreen.
      arm64: dts: qcom: sdm630-nile: Specify ADSP firmware name
      arm64: dts: qcom: sdm630-nile: Enable uSD card slot
      arm64: dts: qcom: sdm630-nile: Remove gpio-keys autorepeat
      arm64: dts: qcom: sdm630: Add I2C functions to I2C pins
      arm64: dts: qcom: sdm630: Add DMA to I2C hosts
      arm64: dts: qcom: sm8250: Add DMA to I2C/SPI
      arm64: dts: qcom: pm8004: Enable the PMIC peripherals by default

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7180: Add DisplayPort node

Martin Botka (2):
      arm64: dts: qcom: Add support for SM6125
      arm64: dts: qcom: sm6125: Add support for Sony Xperia 10II

Rajendra Nayak (3):
      arm64: dts: qcom: sc7280: Add qfprom node
      dt-bindings: arm: qcom: Document qcom,sc7280-idp2 board
      arm64: dts: qcom: sc7280-idp: Add device tree files for IDP2

Ravi Kumar Bokka (1):
      arm64: dts: qcom: sc7180:: modified qfprom CORR size as per RAW size

Robert Foss (1):
      arm64: dts: qcom: sm8350: Rename GENI serial engine DT node

Robert Marko (2):
      arm64: dts: qcom: ipq8074: add crypto nodes
      arm64: dts: qcom: ipq8074: add PRNG node

Sandeep Maheswaram (3):
      arm64: dts: qcom: sc7280: Add USB related nodes
      arm64: dts: qcom: sc7280: Add USB nodes for IDP board
      arm64: dts: qcom: sc7280: Add interconnect properties for USB

Selvam Sathappan Periakaruppan (1):
      arm64: dts: qcom: ipq6018: Add pcie support

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup the cpufreq node

Stephan Gerhold (4):
      arm64: dts: qcom: Add device tree for Xiaomi Redmi 2 (wingtech-wt88047)
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add touchscreen
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add notification LED
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add IMU

Thara Gopinath (3):
      arm64: dts: qcom: sm8150: Add CPU opp tables
      arm64: dts: qcom: sm8150-mtp: Add 8150 compatible string
      arm64: dts: qcom: sm8150: Fix incorrect cpu opp table entry

V Sujith Kumar Reddy (2):
      arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
      arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI

Vinod Koul (11):
      arm64: dts: qcom: msm8996: don't use empty memory node
      arm64: dts: qcom: msm8998: don't use empty memory node
      arm64: dts: qcom: sdm630: don't use empty memory node
      arm64: dts: qcom: ipq8074: fix pci node reg property
      arm64: dts: qcom: sdm660: use reg value for memory node
      arm64: dts: qcom: ipq6018: drop '0x' from unit address
      arm64: dts: qcom: sdm630: don't use underscore in node name
      arm64: dts: qcom: msm8994: don't use underscore in node name
      arm64: dts: qcom: msm8996: don't use underscore in node name
      dt-bindings: arm: qcom: Document alcatel,idol347 board
      dt-bindings: arm: qcom: Drop qcom,mtp

Wesley Cheng (1):
      arm64: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996: Add gpu cooling support

satya priya (1):
      arm64: dts: qcom: sc7280: Remove pm8350 and pmr735b for sc7280-idp

 Documentation/devicetree/bindings/arm/qcom.yaml    |    4 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |    1 +
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  157 ++-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    3 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  313 +++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   27 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |    8 +
 .../qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-kagura.dts    |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-keyaki.dts    |   11 +
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |   27 +
 .../dts/qcom/msm8996-sony-xperia-tone-kagura.dts   |   15 +
 .../dts/qcom/msm8996-sony-xperia-tone-keyaki.dts   |   26 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  956 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |   63 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |  133 ++
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   54 +
 arch/arm64/boot/dts/qcom/pm8004.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    6 +
 arch/arm64/boot/dts/qcom/pmi8996.dtsi              |   15 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   60 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   62 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  102 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  241 +---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  341 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   23 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  419 +++++-
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |   14 +-
 .../boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi   |   40 -
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |    1 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  527 ++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 1441 ++++++++++++++++++--
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |   14 +-
 arch/arm64/boot/dts/qcom/sdm636.dtsi               |   23 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    2 -
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  519 +++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    3 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   35 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    5 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  139 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  566 ++++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  797 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  217 ++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   53 +-
 60 files changed, 6754 insertions(+), 892 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8996.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi
