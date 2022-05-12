Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCB3525862
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359572AbiELXgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359530AbiELXgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:51 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB06D580F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:49 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v4so8341840ljd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqg2HFo22LFUUAaIX3kOrdEQtT9JSav1gOQJOHe+MV4=;
        b=mmR26HUeqn9O1FSlvZQyN8+ORR4vZKDXyrydHFmv787Zc9a1TOfTgqG5GLjXrYHsYA
         /FwsXZG72N4ZPzGi/bx4LpFilKVXHporkkc39B9zx7xzqVw1HT/8CCod3ku7aY31RLCy
         yi8S5F9e8zcNX+kOQ5POJ6PH5pDW3GxLS7vQA5cyAtqv1KDmlj8u5zQvVG1UN9pUqu7O
         jObEyn32ImgdkZdTGsYTDRJqg/DybjdlvEJ8tSzQSfb6RvcqsqgD+6z18IpCBod348u0
         i/cFE6wp7VrPz5qDGvaYkpHm0Bvlk/5UqcckaZyl3TRyx6YkoB7TqCzQG/5QBtsrykdi
         +9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqg2HFo22LFUUAaIX3kOrdEQtT9JSav1gOQJOHe+MV4=;
        b=eP4hpyC8PFQlxB08KsNQgT/2LqgR3/IhFeFdD+Fgo6hpz1Aw0rQM/8FenZpCZHqc3G
         aGSIQUDfG2uKv5NcirzQGSrEElo25jWkd9BfibS6izD2pfQX0MR2n4dfrxlX5N/2fM0X
         tgGFyC9W/uZM6UgCmlyK2JsEUbIKSi65EjpjsrusjAh8fGc/ueOKQEeQUVIO4gBBQVR7
         xFFkFlfk1TsML/9n73Stmpjere9RN7yCG5G+B2IiUVm9kJlifaktMXZmwqMb+HUekzf/
         dp4RQtZ/8DX9S/gDxetfeVl//m0oEzJzN9zBScC14pYu5NBYIZkqFVu0GR9q0MalWlOQ
         afrQ==
X-Gm-Message-State: AOAM533QhmtOFTUsUXrsl2KhUmvATLOuUj4L4DqYCe1B8AdUDxuNtp9R
        xR6i0Ef7cVFWKL0G49sToRNRAQ==
X-Google-Smtp-Source: ABdhPJwBV8uAqbFejjQddQs0SGuoQqzrAx8iRAAigbgyagyUKnQQFbrC4zQOu8lElkRCIsjDcVoTBw==
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id m11-20020a2e934b000000b0024f0cce5501mr1442767ljh.443.1652398608278;
        Thu, 12 May 2022 16:36:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/8] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Fri, 13 May 2022 02:36:39 +0300
Message-Id: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This work is largely based on the previous work by Bjorn Andersson ([1])

Changes since v1 (mostly based on Kondrad's review):
- Also disabled dsi0/dsi0 phy in sdm630.dtsi
- Removed the clock from BAM DMA devices rather than disabling them
  completely
- Replaced numbers with symbolic names for interconnects in sdm630.dtsi
- Switched to "qcom,sda660" as a fallback compatible string
- Added dt-bindings for the qcom,sda660 compat
- Removed extra nesting level from the adsp firmware path
- Replaced numbers with proper symbolic names in the board file
- Added chassis-type property
- Changed the order of blsp entries in the board file
- Removed spurious newlines
- Changed the order of regulator properties
- Changed the DSI data-lines to list all four lanes. Still use just
  three lanes for the adv bridge (and describe the reason in the
  comment)

Changes since Bjorn's v2:
- Disable dsi1, dsi1 phy, GPU by default in sdm660.dtsi/sdm630.dtsi
- Fix qusb2phy ref clock
- Added USB2 host support to sdm630.dtsi
- Renamed DTS to follow SoC-vendor-board pattern
- Fixed vph_pwr voltage
- Removed extra/unrelated comments
- Added keys, USB2, USB3,
- Added configuration for the attached HDMI bridge
- Enabled MDP, MDSS and DSI0/DSI0 PHY devices
- Removed uart pinctrl and /reserved-mem nodes (present in main dtsi
  file)
- Added card detection for the SDCC2
- Disabled BLSP BAM DMA devices, they make the board reset during boot

[1] https://lore.kernel.org/linux-arm-msm/20210825221110.1498718-1-bjorn.andersson@linaro.org/#t

Dmitry Baryshkov (8):
  arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable GPU by default
  arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
  arm64: dts: qcom: sdm630: add second (HS) USB host support
  arm64: dts: qcom: sdm630: use defined symbols for interconnects
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
  dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 459 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  85 +++-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 5 files changed, 542 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

