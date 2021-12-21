Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DF347B928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 05:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhLUEWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 23:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhLUEWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 23:22:03 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D12C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 20:22:00 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id e17-20020a4a8291000000b002c5ee0645e7so3696356oog.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfcIKzslVYZekJHq1BYulIL1J8boZNWVn+NLo0uiBgA=;
        b=kS5d/44FUi2py7n72gJGJ0x5X7VaKfCQUwNpSqDQRDeqGBNHJldxNxFtBLMzAFf9aq
         eO0Rud+wXQniYHeGNtcT6K1IiweFdJtqNUNG+HC7k02Vdsv0GpL2wBvAfrU4LiBC08Yg
         Mkm9N0rx9e9WvKd5LcQ4BDJFfb1WgHjyWPHecO4FK4sXSt03UQlv15XuJQQAaiZmJwz5
         w4Qg56y0Q3O2OjO1K+jk9hP6XGKFNKedEoynj4+xyaIvkwPQd+mWfnW2RjB5HFR3kTNF
         xCdBOyS1sfZWlm1UPhzXFmTAz5GEMH6k/3tJtQAt0dXNbq7wouLlGn0ajYW2PPG4v5l8
         9BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfcIKzslVYZekJHq1BYulIL1J8boZNWVn+NLo0uiBgA=;
        b=RDWvZoqzIX5/cR/fCOAkg91ouYDP9wT4BpwUUu8kiKywK/YjzWuRqWsrY8HzutAGtg
         OTykaQKgd3xNervmaQMqgUlSVA0Z4gJ7gTH6W1MIkZBxYjofP4R3x917flfmAqEXz3ya
         ftiHKBr3QLdzMriPLCpufL5Vl2UJ0Uvl7cgdhbhjtFvyJMr9aLONVJtiAFRn0mqEalTI
         RlRdrpkO0zqac/VruRxC2+O39jjFUheFTbQ/TVJ6iYRESIMQS2t5lD/8c1vBWLHkc8mP
         N+sHkvxtXG+paNFMSJ6PdTyubKE/mql9Am71q7pzq7MC4JhrTtbQCDRnqKntVPCrU0Jx
         8hbg==
X-Gm-Message-State: AOAM530bOl/+7CtpvAJqh6b/zD9VWi+q8dcxGKUMm2XZzVcn5lOIhFzY
        bZ1JuL9+0dj8JLe/f95S1QYVtX5rHsgq2A==
X-Google-Smtp-Source: ABdhPJw5ubsboZodLFZq2UVhYvn/vsgdaCvfn+q4p8iQfDXZTcs+a+ziUGQuWFUF5fpmo1NvRbeqfA==
X-Received: by 2002:a4a:d284:: with SMTP id h4mr824706oos.31.1640060519279;
        Mon, 20 Dec 2021 20:21:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a28sm48488oiy.4.2021.12.20.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 20:21:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>,
        Dang Huynh <danct12@riseup.net>,
        David Heidelberg <david@ixit.cz>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] Qualcomm DeviceTree updates for v5.17
Date:   Mon, 20 Dec 2021 22:21:54 -0600
Message-Id: <20211221042154.3621955-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.17

for you to fetch changes up to ef5ad2608511596b8bd28f1e2b4fa8fadfd2f536:

  ARM: dts: qcom: Drop input-name property (2021-12-15 16:40:52 -0600)

----------------------------------------------------------------
Qualcomm DeviceTree updates for v5.17

To SDX55 this introduces the description of the IPA, PCIe PHY and PCIe
endpoint controller, as well as enables these for the FN960 device.

The SDX65 5G platform is introduced, currently with definitions
necessary to boot to a shell.

The undocumented property "input-name" is dropped throughout the dts
files, dwc3 nodes throughout gains more specific compatibles and lastly
building of the Dragonboard 410c DTB on ARM32 is enabled, in addition to
its normal operation in 64-bit mode.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge tag 'e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quicinc.com' into dts-for-5.17

Dang Huynh (1):
      ARM: dts: qcom: Drop input-name property

David Heidelberg (1):
      ARM: dts: qcom: update USB nodes with new platform specific compatible

Manivannan Sadhasivam (6):
      ARM: dts: qcom: sdx55: Add support for PCIe PHY
      ARM: dts: qcom: sdx55-fn980: Enable PCIE0 PHY
      ARM: dts: qcom: sdx55: Add support for PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable IPA
      ARM: dts: qcom: sdx55-t55: Enable IPA

Stephan Gerhold (1):
      ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32

Vamsi krishna Lanka (4):
      dt-bindings: clock: Add SDX65 GCC clock bindings
      dt-bindings: arm: qcom: Document SDX65 platform and boards
      ARM: dts: qcom: Add SDX65 platform and MTP board support
      ARM: dts: qcom: sdx65: Add pincontrol node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |  80 ++++++++
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/qcom-apq8016-sbc.dts             |   2 +
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |   1 -
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |   1 -
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |   1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |   1 -
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |   6 +
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |  59 ++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  80 ++++++++
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  25 +++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  | 222 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h         | 122 +++++++++++
 19 files changed, 609 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 arch/arm/boot/dts/qcom-apq8016-sbc.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
