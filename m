Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3797717323
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbjEaB0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjEaB0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:26:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80505C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so5792023e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685496389; x=1688088389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAclgrLe04xZtu8ZxWTI5wJ+3HljZc+jH1KYSt/LSjA=;
        b=e+egXCwfDC3VeEyynyV+qYuu2gOmIEV3l+RGWdnc875IfLsEbAuARATYKKRQDiV+iw
         1WnnbQLHRVoJAr4OxMeKJKabxF/TTINyoSOWfM1DsdMCTwL839SHRD89YoG8cDvCNYJO
         /YVe/N5w9OFMxyig9KYcLuyhrl9kxFnIVBPma2ZfWqy4Ou7f8D3UOoEZ77sToY+WFHAZ
         OLvtPAkWfqe3GDmL9z26lHzNImvfA/5X2O2P8uQk08xZT+xTTa9s7iMCD+oR8on8MGUt
         PRn0esix9iHpwGfp95RdWkvQ2inNuVnh6v1uhqDSLi/8K3I2qUECQ19ZXLvGN/0OXeSA
         95yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496389; x=1688088389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAclgrLe04xZtu8ZxWTI5wJ+3HljZc+jH1KYSt/LSjA=;
        b=BP1kXHKzjj4qjYzATvJGtdDe94hhLesUmJoMWPBPF1HBmU3XorzqzdYKJs0pesKGFE
         NmDwtBY02kiQNjSNFwwY7s57tKI6ephD+dXFel/pqzGfauJ4g1yh8tHLYIlSLWQf6hrj
         2rGN3g91s5Rsq7evNrsRxyaxP37Tvrb623wWfG25aIVZOS1eNVwDVnHRNVjnw9KJQ/ED
         Q+4jDuDaBTMs6aOqdyZhcgfS+9zmauZUmY2bc6mtByqNIXpWa+u3W2Tgz+oLqv+vL/Vb
         ogz9nNJq9cHPxtdwKsGnXpXm5LYniuvqxnevf9RUoKOOxRAvgLtUU18MK/lJ7HIggwka
         lW1w==
X-Gm-Message-State: AC+VfDxQPA9XATp7xjHNDGH17bJlEl6QKgQmn+16khZz3L6y6FwJrtWv
        PR6go0otRkxRxQcU3kJvFFIO5Q==
X-Google-Smtp-Source: ACHHUZ6kmL+lZn9T6MfIgkz3UN/NpaJZKbXO4ziIcyPqzfBRuLpCwr1vXhsWgiLTWhJUSePCzerlrQ==
X-Received: by 2002:a19:f502:0:b0:4f4:db63:239f with SMTP id j2-20020a19f502000000b004f4db63239fmr1654997lfb.24.1685496388777;
        Tue, 30 May 2023 18:26:28 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id q3-20020ac24a63000000b004f27471e0aesm509992lfp.79.2023.05.30.18.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:26:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: qcom: apq8074-dragonboard: add LEDs and GPIO keys
Date:   Wed, 31 May 2023 04:26:25 +0300
Message-Id: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device nodes for the LEDs and several Volume-up and general GPIO
keys. The power-on and Volume-down keys are not supported, as they
require extra pon/resin patches.

Dmitry Baryshkov (2):
  ARM: dts: qcom: apq8074-dragonboard: add onboard leds
  ARM: dts: qcom: apq8074-dragonboard: add gpio keys

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

-- 
2.39.2

