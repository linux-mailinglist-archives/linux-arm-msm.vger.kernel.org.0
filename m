Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A1C635AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236125AbiKWK4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiKWKzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:55:21 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C93D7F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:44:46 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z4so4012559ljq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jH4aljA+w1T0Z649dDtQqsVnBdBM341tSjMAtxabFJg=;
        b=YF2kg4wG8959hxA7KOnbUjvEPYuj8EQ6wadfttNzKh9CzDua1m0IF4ZgZiucAM2Qyx
         PZKXmJSCQnTQq5dqbyJS2S8O/GSON5ZBhcxSWjYpDrmJ77jcOwMClmMmERpBni2GGdX9
         nV/E5DIzUBgS6cXQw5wwqt8Qid4geoVlljC/EWdY45To4tvNtLRvvF9qpLqkEvSNINPd
         dla44MGSDudS31oSwCJc79G0QaA9mUGCVCwhyzM8zmWtTfwiWPjrZbYKGLTA+774OQ5Y
         /pH4/TJxZ70XUKREk6snR2sVIWbrywL/3Tly0XfR+KMqeY9oX0dY39B1NCHr8KD9ccpQ
         qoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jH4aljA+w1T0Z649dDtQqsVnBdBM341tSjMAtxabFJg=;
        b=dxAVbANz6LgH64gdLVB5wp7N/HbM4DVNbMCvS+7LIUj/mCmMdL3p20WYkTailRfxgg
         QxyutrIhhQWtfyCG46ave0IGstesMxQeNMuOUL7xDxVvzV+V1mlMG5r4x2iZZzcrKwks
         urCNN5aAEPW+CH0r+W69JnR7T4lWNkA2UL5v4smgTzT6Af0HvifSH11+VO3PHSVjfWd/
         Lm+LB+cKXMx29oNWi4IBzY8BfkHwzjdj62FE5z/5r70ghz9G/xlwKK+QuhAj8/LqjJT6
         3LUt8IETpAbiVt5ELVoSRMrEypdQwhCpuXRhv9KHhmsOtWdkhLew3t6UkRwieKaMfpk/
         i/Tg==
X-Gm-Message-State: ANoB5plrMQVosV197L9HlkS3mtoouX1UE+XEpI4seOrXVE+42HP9A4BN
        +K25b3yLszNPrw4xDkeNSQRC9w==
X-Google-Smtp-Source: AA0mqf4+o9Lb0WHylI+egb6zgCOsG8itakJoTDMrkVj3qdrA4RFBixayWKNCcRT3kRh9+0jq2+glIA==
X-Received: by 2002:a2e:b88d:0:b0:277:452a:473c with SMTP id r13-20020a2eb88d000000b00277452a473cmr2682008ljp.454.1669200284638;
        Wed, 23 Nov 2022 02:44:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b0049e9122bd1bsm2869082lfb.164.2022.11.23.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:44:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v9 0/4] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Wed, 23 Nov 2022 12:44:39 +0200
Message-Id: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v8:
- Send proper patchset this time.

Changes since v7:
- Rebased on top of phy/next
- Renamed the clock registration function (Johan)
- Dropped rogue qcom_qmp_ufs_ops (Johan)
- Fixed the comment following Johan's suggestion.

Changes since v6:
- Added bindings change (Johan, thanks for the reminder)
- Added corresponding dts changes for msm8996 and sm8350/sm8450.

Changes since v5:
- Rebased on top of phy/next

Changes since v4:
- Rebased, dropping merged clk patches
- Fixed whitespace errors
- Added linebreaks to fit into 100 chars limit

Changes since v3:
- Rewrote asm9260 clk driver to fix the TODO item by using parent index
  rather than calling of_clk_get_parent_name().

Changes since v2:
- Added error handling to phy_symbols_clk_register() (requested by
  Johan).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver
- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs).

Dmitry Baryshkov (4):
  dt-bindings: phy: qcom,*-qmp-ufs-phy: add clock-cells property
  phy: qcom-qmp-ufs: provide symbol clocks
  arm64: dts: qcom: sm8450: fix gcc clocks order to follow the schema
  arm64: dts: qcom: use UFS symbol clocks provided by PHY


Dmitry Baryshkov (4):
  dt-bindings: phy: qcom,*-qmp-ufs-phy: add clock-cells property
  phy: qcom-qmp-ufs: provide symbol clocks
  arm64: dts: qcom: sm8450: fix gcc clocks order to follow the schema
  arm64: dts: qcom: use UFS symbol clocks provided by PHY

 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         |  3 +
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  3 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  5 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 25 ++------
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 15 ++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 57 +++++++++++++++++++
 6 files changed, 84 insertions(+), 24 deletions(-)

-- 
2.35.1

