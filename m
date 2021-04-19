Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F7D3646C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 17:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237778AbhDSPK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 11:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhDSPK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 11:10:28 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C57C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:09:58 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x20so1977663oix.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
        b=lBV3eh4yMGcw0lYrX19B5UryCJpgZc9mYX4RoQ+eV5iLvRUyGWNmkVoEUxVo10/CpU
         RKSpIfB3BW+jTHV0UDGn3AC/AehaoMK+eLufxsbj8qzpIKOjVyUobRYqRMjoNsdTS0RT
         se71ePt3uhsv6htwRrZ88bnCv9AsAEGoUuRekcRctF+hpnG9nAsztGtmEaeKhdwm5uI8
         NdRyPLSWfpHkv0vzth897yblwJZ1URldSaDltK755WW98yLYp92JGLAuX7Ty9xK/qVJ0
         IzB/XwXHm1yE5bmuDaZIlN751yKBRvZAGvY2o29531LpOyNnX6RK4D3FQp1moQa2hBrO
         Nryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
        b=aneUfb3ZVmGh/Tv/jOy6QF04uICAx0SCH3YHg5ztRrvRQ6cu135CyjFWrAV+F/+nNT
         EFFOjLps/z1trlKEhOWOfylmVszw57mYMAiYaoriFybF0S8ASsaj6Bn1GNmhSgj1q4Iw
         nhRfv41LvDQ/QfduNpbTexUqNPaaPaRDE/de4ewahqtB2suWv/J4Ye5HsdWGwswAJNp3
         cVrGz6ON/ZWE2Zw8cU8nr4hW2ae5tuH6NNxpLso/6a8VhpBhHAkzHa0nqo/YZ2II7GqK
         aVFRY6+StbB4vqzdGocd3u3RnVH4aILMZd7I/FEQMBnI08K9ZS+aYJS7cMXpCTsPZ2I2
         Pbkw==
X-Gm-Message-State: AOAM5329hPJwsfb3xVguu+3rsxChOCkpyXvDulFPQXGalTm+rnbeNbXX
        /VQEKwtmEygoTIhBLsxS0vN8tQ==
X-Google-Smtp-Source: ABdhPJzOvIG9+263Vs7RPSxqh9TNbUCMKdLwV0N+9EFcHrqfJ6XnLxq1gGEaTygCtEX/rfCwxG+TXg==
X-Received: by 2002:a05:6808:f08:: with SMTP id m8mr11644084oiw.127.1618844997831;
        Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x13sm3492048otg.57.2021.04.19.08.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@linaro.org>
Subject: [GIT PULL] More Qualcomm DTS updates for 5.13
Date:   Mon, 19 Apr 2021 10:09:56 -0500
Message-Id: <20210419150956.860423-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13-2

for you to fetch changes up to 06ad53efeb496d8841169ec0919ba6852c7852f6:

  ARM: dts: qcom: sdx55: add IPA information (2021-04-13 21:35:56 -0500)

----------------------------------------------------------------
More Qualcomm DTS updates for 5.13

This adds CPUfreq, interconnect providers, IPC, remoteproc and IPA to
the SDX55 platform and then adds board files for the Telit FN980 TLB and
Thundercomm TurboX T55.

----------------------------------------------------------------
Alex Elder (1):
      ARM: dts: qcom: sdx55: add IPA information

Manivannan Sadhasivam (14):
      ARM: dts: qcom: sdx55: Add support for A7 PLL clock
      ARM: dts: qcom: sdx55: Add support for APCS block
      ARM: dts: qcom: sdx55: Add CPUFreq support
      ARM: dts: qcom: sdx55: Add modem SMP2P node
      ARM: dts: qcom: sdx55: Add IMEM and PIL info region
      dt-bindings: firmware: scm: Add compatible for SDX55
      ARM: dts: qcom: sdx55: Add SCM node
      ARM: dts: qcom: sdx55: Add interconnect nodes
      ARM: dts: qcom: Fix node name for NAND controller node
      ARM: dts: qcom: sdx55: Add Modem remoteproc node
      dt-bindings: arm: qcom: Add binding for Telit FN980 TLB board
      ARM: dts: qcom: sdx55: Add basic devicetree support for Telit FN980 TLB
      dt-bindings: arm: qcom: Add binding for Thundercomm T55 kit
      ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T55

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts               | 281 ++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 282 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 207 ++++++++++++++-
 7 files changed, 776 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-t55.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
