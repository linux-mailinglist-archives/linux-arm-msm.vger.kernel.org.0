Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949106F3928
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbjEAUeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjEAUeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:34:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5197FA6
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:34:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so3569121e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973242; x=1685565242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtgi4uzBaMRQQUHqbLY1bdwg6cIPE7Uii87M8LpnWmA=;
        b=rEhWSX3dH48zVGSj5JE9V9+i8SDvsaaRsuuwKI2+Ynq7VsEahZpYe24pzSmbOHygir
         Py+pPRf15zFoyAU4EKFvkBDfeHFzhx1uH5tOcsFbSQhgkP09XPNSxMML5b6pGq5m8xCs
         sEv+s/hEGoBRhegCuGlnvLJ3qTqQrw4BJuFMtnWX2k0iuvW1O3pW4UYUJXAi47jmMg4A
         LwkAgUq8Rg4CBpLdvdv+VPBabPkPZVyxZGg7ZMe/OuGYXNveRpiMQazwOC/qZ+jf3uM4
         EFm22IlxfWpoNR5ggqL8EJuUDmXcjgjgClcO8hsmmdaed5xCHME29sy830myDDQawg2e
         pq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973242; x=1685565242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtgi4uzBaMRQQUHqbLY1bdwg6cIPE7Uii87M8LpnWmA=;
        b=dqonW6wszzbB6iqDgcXE25MhZ93CRvx9zj096ydUt7P9Ikz6L8kSyDpGgxFsCm0vJy
         PymOnuvquIstUlDZI7127v2eLQQfipuT4xDVeOfqCluBpbuPuJZj6Ehj4BUJtnmUer7m
         UD68XGVDvpQW92eQVfoIbcPklvPl5uXK//MbBtQZFAgTKoDiRe94KYBpcJVvUJA0dJk3
         UNnfRsDlPWmptoW6mtyq98cJk39RsuLZAHR74YYCnDwDsJ1meSmCov4JzT/5NdeuhGqW
         WJ02sGorRmWXVK8cuA8knWNeaItT4DuiVtCy5zDL71+kq+tdvo9N9gj8qlMjN4bWziRn
         KqJA==
X-Gm-Message-State: AC+VfDyHmoGG+VI7sR81smU766gTGTIoRbtX0TCdC5LsRJZP1G54nBsu
        EOb/4APcp84e6kGT4QUA8uRMrQ==
X-Google-Smtp-Source: ACHHUZ5MrScGDH2NSzMAJf2M5gAdGxGy/Kz+NEvowWWh9C3OfRreq4LFeopP9Q6zQyoz5395nH3aAw==
X-Received: by 2002:a05:6512:376b:b0:4ef:6ed9:7af2 with SMTP id z11-20020a056512376b00b004ef6ed97af2mr4010525lft.8.1682973242612;
        Mon, 01 May 2023 13:34:02 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 00/10] clk: qcom: convert mdm9615 to parent_hws/_data
Date:   Mon,  1 May 2023 23:33:51 +0300
Message-Id: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

This series concludes the conversion of Qualcomm clock controller
drivers to using the parent_hws/parent_data and declaring all the used
clocks in DT.

Dmitry Baryshkov (10):
  dt-bindings: clock: qcom,lcc.yaml: describe clocks for
    lcc,qcom-mdm9615
  dt-bindings: clock: drop qcom,lcc-mdm9615 header file
  dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
  clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: drop lcc-mdm9615 in favour of lcc-msm8960
  clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
  clk: qcom: gcc-mdm9615: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-mdm9615: drop the cxo clock
  ARM: dts: qcom-mdm9615: specify clocks for the lcc device
  ARM: dts: qcom-mdm9615: specify gcc clocks

 .../bindings/clock/qcom,gcc-mdm9615.yaml      |  53 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   3 -
 .../devicetree/bindings/clock/qcom,lcc.yaml   |  34 ++
 arch/arm/boot/dts/qcom-mdm9615.dtsi           |  21 +-
 drivers/clk/qcom/Kconfig                      |  14 +-
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/gcc-mdm9615.c                | 256 ++++----
 drivers/clk/qcom/lcc-mdm9615.c                | 572 ------------------
 drivers/clk/qcom/lcc-msm8960.c                |  19 +-
 include/dt-bindings/clock/qcom,lcc-mdm9615.h  |  44 --
 10 files changed, 263 insertions(+), 754 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
 delete mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h

-- 
2.39.2

