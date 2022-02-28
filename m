Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06E914C6C7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236103AbiB1MbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbiB1MbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:31:10 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D8274874
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:30:32 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m22so11037295pja.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F524H+EHCjRDkj4aTyqwy6bl6HAQXd0c5ZEF3tVd+W8=;
        b=J4l4CpOFtsLzHHsE+ZVUXy7AVfFawxAzlpF90pkRnTNV0xCjEx8yA7bxEPtzZFADfK
         qsAU7jdu3Lxt6M/oQ2ps6vtVVR7816vjM/MBhEnvTYoS1qn28bgwiy1nEvqMZsXCHJvv
         e5gtfN6IcJryJI9TzFLhtoFfaSsX8uCKoqjQatLkHA20b5mDiUeUB/5GJBtjNEnkrC0y
         4qce5iigKPgCp1lfkatJX1s9eBkwHhcmsXSoxUOKQp6FQeo5kGyqN345dSHjA+jbHNEP
         D70dujbrXrTzYFg4n66TnrUsIutJ9aBLqbB3LrBS3yRzSRsqroRfGxIqvNdJEuEUiuQ2
         Gymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F524H+EHCjRDkj4aTyqwy6bl6HAQXd0c5ZEF3tVd+W8=;
        b=Oh74GnOHQT+9rmtoZBxlwOHcgqZdEBvqcYzRcPcESpnx5LfaPB9nnv0pLDRf/m7fiO
         Jh/9Zr4BNwiC60TePRAUTDyamCfwAnw5yOOQ+gCuBQW8lpTO/ny4zqWw0Z4XtWyX6ywK
         /fy0exkzxg3gquIIMuKspGfwlonFkmiWx/KKiSKHO1mIdrHZDKpMr/4CXKOjWLGrwyzU
         7bfsnEj2B26sfUfmRkINEjLDCzWxBKmITGTuqRLrT5aWKzTg09ok7M/ODUeQ7GwQYh5Z
         2f1TQy3TwbF+tzbPXEdl9xCFMiSWqECD+O70FSSNR7HGCUYYwHJk97cWUg5zHX6jbg0d
         N5ig==
X-Gm-Message-State: AOAM533QxkIlUAlRG+20jMysDqxawa2ClMVe40ZWrQn50xyMIfoZj44K
        9XxNbkyraKc2/Oxi+A31qtJH11EK3g6mEA==
X-Google-Smtp-Source: ABdhPJwHPNuDlX09dyPhCHJdYfRFs24vD4evbbRVf2AIlQ27k2Nd9/5N7B4rUGXwXCxlhLAwF1krsQ==
X-Received: by 2002:a17:902:b589:b0:14f:3f88:15e2 with SMTP id a9-20020a170902b58900b0014f3f8815e2mr19875896pls.171.1646051431532;
        Mon, 28 Feb 2022 04:30:31 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id f7-20020a056a0022c700b004f0e9d686dcsm13790001pfj.137.2022.02.28.04.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:30:31 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/8] Fix  dtbs_check warning(s) for Qualcomm QMP PHY
Date:   Mon, 28 Feb 2022 18:00:11 +0530
Message-Id: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
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

Changes since v1:
-----------------
- v1 can be found here: https://www.spinics.net/lists/linux-arm-msm/msg104871.html
- Addressed review comments from Dmitry.
- Addressed the remaining dtbs_check warnings rasied by Rob's bot on v1.

Shawn Guo recently fixed a large number of 'dtbs_check' warnings
on Qualcomm DTS files for qmp phys. However a few warnings are still left
(possibly due to new dts files being added over time).

So, I decided to clean them up.
After this series, '$ make dtbs_check' leads to no warning for QCOM
QMP PHY.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>

Bhupesh Sharma (8):
  dt-bindings: phy: qcom,qmp: Mark '#clock-cells' as a 'optional'
    property
  dt-bindings: phy: qcom,qmp: Describe 'vdda-max-microamp' &
    'vdda-pll-max-microamp' properties
  arm64: dts: qcom: msm8996-xiaomi: Drop max-microamp and vddp-ref-clk
    properties from QMP PHY
  arm64: dts: qcom: sc7280: Fix qmp phy node (use phy@ instead of
    lanes@)
  arm64: dts: qcom: sm8450: Fix qmp ufs phy node (use phy@ instead of
    lanes@)
  arm64: dts: qcom: ipq6018: Fix qmp usb3 phy node
  dt-bindings: phy: qcom,qmp: Describe phy@ subnode properly
  dt-bindings: phy: qcom,qmp: Mark 'vdda-pll-supply' & 'vdda-phy-supply'
    as optional

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 26 +++++++++++++------
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  4 +--
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |  5 ----
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  2 +-
 5 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.35.1

