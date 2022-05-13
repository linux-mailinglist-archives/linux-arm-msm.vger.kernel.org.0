Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B05E526D9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 02:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiEMXzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 19:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiEMXzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 19:55:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717993A8AC7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i10so16911116lfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3coptSTcGA7KypoKZXkrTWNT5EPdBpjYIMaRVPMsJBY=;
        b=AXHjNtsuiVQTpne6SfqrZqeCD54SmmFhgYW+yfZCEvZzVJp7g0ruiP9scGl1U3NM4C
         /BaTWyS3pJeHotMyzXfp85skrMWAFT+6SrzcB0VfBZNW7pH09Xxe/hjh2Pk5VBxkMLrd
         wxkxk/gMoX8VA1Fe459O6Z9Q582J4Nz0PrHrMC+KlL372hSLJo4ApIfLatTQjQTPAZvr
         LfVmLfm+tGwluYENy8f1c/X8Ml3uxr0tBvkVedGcV/PMIiryY2uR/jkvMwPeIwY3UlnX
         Tz31CZXNUjbeqFfgFMGCuWiAwTk52fbTvMh5Z7r94JkAGlsrVXDS5dLF1f6qru9/UGeV
         49Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3coptSTcGA7KypoKZXkrTWNT5EPdBpjYIMaRVPMsJBY=;
        b=5ar9XSPkA0i2IvoVXrx92+FM3lLXKrsSRaFN0gf00/pJSRfFq/yEfeTeH8CAluH2oX
         ai2P5foTRNfZ1dfXC+V1DkWmaNJQSmCLgy29IP9VnhkRW/5vnQ80unO0shaNhG0dl/+R
         gbriVOfj605iGbgEMCndg7q75A/F3+tLZYgjXzEouTz0MP8iZhLSZ6//LaXuaJY8xAQc
         TZYBM3kVDIp4S2RGq7GmDbQkexd0bBXheQ1+RUuC5OQNAV1J72udut4U5P0izCXAm6CK
         v8SyCLomoKkPB94A3UrQL76NUoxZgjEqHphnvzJawZQw4Gan6N2S3BhsLaiM41+dELVh
         qxzg==
X-Gm-Message-State: AOAM533EOIe7PWPz9qGuFX1oJ2Y1aSoiwLM2KXacVLYvUlUyiFO9H4d/
        pwZp3UgvNDCiwPHQTXJFNXTQgQ==
X-Google-Smtp-Source: ABdhPJzpk8BnALUUcy2fNAUcadJ6hsyk5mbR49jSY23KTAO/gyXM6TzbP4Tmn7GxiY9khRKdL8PhRA==
X-Received: by 2002:a05:6512:32c1:b0:473:e3f3:fdf8 with SMTP id f1-20020a05651232c100b00473e3f3fdf8mr4802683lfg.283.1652485519393;
        Fri, 13 May 2022 16:45:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/8] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat, 14 May 2022 02:45:10 +0300
Message-Id: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This work is largely based on the previous work by Bjorn Andersson ([1])

Changes since v2:
- Removed useless enablement of mdp node from the board file. It is
  already enabled in the SoC dtsi file.

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
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  85 +++-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 5 files changed, 538 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

