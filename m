Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3B265A442
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 13:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiLaM7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 07:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbiLaM7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 07:59:17 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E0495B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:16 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id j17so25675428lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+ipLw5suspFYXyK3GuaVyqet6j2yEOptDlFPK2wkvo=;
        b=TiCgCWGkdxMagDHygoTWwRpxIHzJHre4JLQAVqX1rtgbzPp8+PZ5ggQnFALRuR4NJI
         7C5LvzNRVslzZUAsQT3/McfFAQ4SDcXEIEevjD96B6LX8P2QUKWi/v66y/Xy6yQdRyno
         lJ1OLx/SJV2S47rXt5i+iA+rkF/3XCIkyg31bQMqptbti60iyHf6hlMYHKKbTCkBOl5G
         K98hzkSTj9p8lEk+iidBQwA8r21MrO/Qf7tQCKvN9uxqs8Qr9tXSbaGvz0T9cubaKnyI
         BhIZB/bSQpS2Ory2ZXdy6RGn9vQ6+SRXGRnM64vQuk8oWvjII44OK8tuNXA21jhXPp+X
         9Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+ipLw5suspFYXyK3GuaVyqet6j2yEOptDlFPK2wkvo=;
        b=FlG1iEyas+u7b85yakUzFsUSLNikbARjK4HWs08VNn5nF6q1U6OCMYgtqWQq3wekYL
         FdzX/B4frpSvR1XIkC+7BuDTiwyrWAnoipfcwWtlYrrPUDCA9ZR8o264yCEQCPC36IWc
         9yoK7gD+mONBtlawVCaD1Z/LOLJlWAq/2Ib5j4upqAw+i1B0cQJXC9Q7AU/WfNcjJhi7
         GHtouQswrF0xg406zmMFkJFVgeMKqt/VHMSFkEfdMb8wkpsvHStKAjUv9CDxHyRxy/aQ
         fIKNGJcto9tVpb24qGqDMpm3Mudy98fUYKE15NSpqa4pM9lcHPSj4vDgPejF3Fd1Gy0D
         3QDA==
X-Gm-Message-State: AFqh2krzooWUGLC7yatzSGdZDoeuytTmHwCbAz0/M5495z2kxa2AOvrN
        mgRG/OweYOzQ+hfJBwM7oiwIgDsEXaNetL1W
X-Google-Smtp-Source: AMrXdXvXo4IdMyU8lXgXL1igPmBM8Tvu8BgPM9z3kCC2Ceuh0McAoBcj2NAsLkmrZJ/4CYrqFFjEFA==
X-Received: by 2002:a05:6512:4014:b0:4b6:f22c:8001 with SMTP id br20-20020a056512401400b004b6f22c8001mr15596480lfb.56.1672491554956;
        Sat, 31 Dec 2022 04:59:14 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id d10-20020a0565123d0a00b004cb344a8c77sm22266lfv.54.2022.12.31.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 04:59:14 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/18] Misc DT style fixes
Date:   Sat, 31 Dec 2022 13:58:53 +0100
Message-Id: <20221231125911.437599-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

As part of trying to write up everything we care about when reviewing
DTs [1], I put my regex to a test and removed some reg inconsistencies,
among fixing up some other things in ipq6018.

No dependencies as far as I'm aware.

Konrad Dybcio (18):
  arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
  arm64: dts: qcom: ipq6018: Use tabs instead of spaces
  arm64: dts: qcom: ipq6018: Sort nodes properly
  arm64: dts: qcom: ipq6018: Fix up some indentation
  arm64: dts: qcom: ipq6018: Add/remove some newlines
  arm64: dts: qcom: ipq6018: Use lowercase hex
  arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8150: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm6350: Pad addresses to 8 hex digits
  arm64: dts: qcom: sdm845: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
  arm64: dts: qcom: sc7180: Pad addresses to 8 hex digits
  arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
  arm64: dts: qcom: msm8994-octagon: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8450: Pad addresses to 8 hex digits
  arm64: dts: qcom: msm8994-kitakami: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits

 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 548 +++++++++---------
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  52 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  46 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  46 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  68 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  54 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  16 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  48 +-
 13 files changed, 461 insertions(+), 463 deletions(-)

-- 
2.39.0

