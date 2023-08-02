Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE976C9F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjHBJ6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbjHBJ6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:58:04 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CCB196
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 02:58:03 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6873f64a290so831730b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1690970282; x=1691575082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KMY3jKjpj9Y4G5MJKHUaAltNKivkRclyRQy4joDVlU=;
        b=3JIL8T0umSJ2Bv/wgwu1s+94R4dXPMYOoOnAAHjJy3WRl8sNFE9M7L32L6PgBiYQ04
         M2EQjS53t54huDtJ58cLWSFpX6MzWzfUMEUllck22CS55F7wayiEOrutMCi8d8+ZP1bA
         +jRyi1FCTc3bA5FUAUpIBD5VFQ5/KGYktUcDm0BsrVqszbHCxuJJ30MM34JF+Drwu+yV
         taQcsku5FgFurWMYtbRmBybu8evirJGZg8I1cLjl807sf0GR9E4aU7/l+pgDwuht1aHI
         /62Wo0j8iFq5SvTGlQTbXaDk7Sqf/oj6kKWkBINGPi9l5ZL4Flrxk4//HY8S30wZ8CpZ
         7gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970282; x=1691575082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KMY3jKjpj9Y4G5MJKHUaAltNKivkRclyRQy4joDVlU=;
        b=Iy+PmxyHqrLs1GY7FrlaD2cxlcoq4ND54Ct8kMnsnxzVS33/tYXnTrX2h+xVSw0d9w
         vVCy1mGTZilsb7heepmmTqhw9gdH2PaUytILEYguakO9eF4foIeRofYxeI0rzhx33Or8
         gVA/iL9j7I08gfChiAkaYOezvS1MiSsJ5Enwqh9u6jzeDIhmv4mcNmBgfE/JHcpgZ6ht
         sy/ELbwBxspbrsy1cclm0f2K6F93j391wQFzM75nBDBHI67WGoTDQ68DhCGFexOE3bRO
         eseZ8I8f3fFeTSdn7+nVveibh+5yfIlIM0Mwmlx6XI9vsjaKl3TfJc6f+P1w7U2glKEx
         rqUg==
X-Gm-Message-State: ABy/qLYWnd7rFQAmxw3o4lnx6Ahysa5+Nd+HOKTGtnfKO675s7t+U4jh
        Np7TlBHyTO6FiMwsKjw6EMffUw==
X-Google-Smtp-Source: APBJJlF2lJsSLrT9hU3elETjOzumY5L/oAT/UkrKUbFImaJyAlNX7DjURF+Eea9dnINN3A4RQr2jbg==
X-Received: by 2002:aa7:8316:0:b0:676:2a5c:7bc5 with SMTP id bk22-20020aa78316000000b006762a5c7bc5mr12899143pfb.1.1690970282583;
        Wed, 02 Aug 2023 02:58:02 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id m11-20020aa7900b000000b00686f048bb9dsm10742544pfo.74.2023.08.02.02.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:58:02 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] Add no-esim sku for sc7180-lazor family and new board version
Date:   Wed,  2 Aug 2023 17:57:50 +0800
Message-Id: <20230802095753.13644-1-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

for audio codec ALC5682i-VS.


Sheng-Liang Pan (3):
  dt-bindings: arm: qcom: add sc7180-lazor board bindings
  arm64: dts: qcom: Add sku_id for lazor/limozeen
  arm64: dts: qcom: Add board id for lazor/limozeen

 .../devicetree/bindings/arm/qcom.yaml         | 43 +++++++++++++--
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 ...sc7180-trogdor-lazor-limozeen-nots-r10.dts | 39 +++++++++++++
 .../sc7180-trogdor-lazor-limozeen-nots-r9.dts |  4 +-
 .../sc7180-trogdor-lazor-limozeen-r10.dts     | 55 +++++++++++++++++++
 .../qcom/sc7180-trogdor-lazor-limozeen-r9.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 33 +++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 37 +++++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r10.dts     | 29 ++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |  4 +-
 .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |  4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts |  4 +-
 12 files changed, 246 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dts

-- 
2.34.1

