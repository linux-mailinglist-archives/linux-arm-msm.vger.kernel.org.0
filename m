Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF387172E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbjEaBQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjEaBQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21A6C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f50470d77cso3153932e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495785; x=1688087785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/caFhQp7Iw95ymi/uGFBz2t1WW3xwlGAOA4olG3h9M=;
        b=T0AKYEL/EOlt7fzc+EakSsnA+2o9fCC5CSllcsJH39hh7PAr2AX8gFLQGoCRR2/1LD
         jnmuCGzup4y2z39CciG+TCjQKdfWVMRJGhgCZeQ9JefOo6xkyxQUhp36U3X57Rl+89eq
         /fINWCQCV1i95oUN7UPqxBVxCiFMLfGA8I+ea8eSrzOoByMllPhK5lOtoBQnmPWwaxWX
         Izas7e2M+REFOPJ8v5ax3UU6TgLy/49PLsfVox7cH70LsZA0CbSNRivgIVAoiObkeFOQ
         rBX65PBZdylwpKFy1uocMKe+uXfCgtTi4WSGK7ydY1YdZtO2azYMi95TOBdrHtr8hVNC
         u7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495785; x=1688087785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/caFhQp7Iw95ymi/uGFBz2t1WW3xwlGAOA4olG3h9M=;
        b=bbYaRCvnySOoz48QVTMRWDHBkOJ3+9W5bgYjW1HHwppQzOHQJYFQYvY+Jzgxz9lRIA
         foH63yPbIwevCuMw0qqi/gnDbeqwljhcfCRb/iDCd64lHThemc/b/U/z1c7EGmbILAzi
         ZLIgOdvaha4UB2wsAiJg3zbyS3QMufGiF6z+KouyWkW54jHxN7jbvgitrP3f1DJdFYag
         fvtX6FNGN12UxIAvplIe3F4HSO56IFM4/iE0OFu38vK7xpIT1HNWprzriinxuBGGKqxR
         0b3W8BulJODlB6gxBZUc5N5E7sRkVvQ3wJPnA/BW5oFHSvTdBzHNdqY1YjVkxFLQDnDf
         SrhA==
X-Gm-Message-State: AC+VfDynG002YkI1R+OPp9JZErmvxI+qsO0uZl4RuWfgMi9Du4o3y1LY
        DLDTFciv+FCIPwQjT8pMTkLYBU7joDWwhx8jqXk=
X-Google-Smtp-Source: ACHHUZ7/cz2jQmdHbgDH9CJNkoRpQcjv5/J07wkVHTuhtdR6o034j0klJMNdtd51mS5axq1MvdMplA==
X-Received: by 2002:a19:f61a:0:b0:4ef:e895:cff2 with SMTP id x26-20020a19f61a000000b004efe895cff2mr1551598lfe.64.1685495784888;
        Tue, 30 May 2023 18:16:24 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 00/14] arm/arm64: dts: qcom: MDSS nodes cleanup
Date:   Wed, 31 May 2023 04:16:09 +0300
Message-Id: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Conclude several ongoing cleanups of display-related nodes for Qualcomm
platforms:

- Don't disable MDP/DPU node, it is enough to disable MDSS device itself
- Remove useless mdss_mdp enablements
- Change labels for DSI and HDMI nodes to start with mdss_ prefix

Note, node labels on APQ8064 were not changed, since APQ8064 doesn't
have the MDSS device. Later we might consider to change labels to start
with mdp_ prefix.

Dmitry Baryshkov (14):
  arm64: dts: qcom: sc7280: Don't disable MDP explicitly
  arm64: dts: qcom: sm8350-hdk: remove useless enablement of mdss_mdp
  arm64: dts: qcom: sm8450-hdk: remove useless enablement of mdss_mdp
  arm64: dts: qcom: qrb5165-rb5: remove useless enablement of mdss_mdp
  arm64: dts: qcom: msm8953: rename labels for DSI nodes
  arm64: dts: qcom: msm8996: rename labels for DSI nodes
  arm64: dts: qcom: sc7180: rename labels for DSI nodes
  arm64: dts: qcom: sc7280: rename labels for DSI nodes
  arm64: dts: qcom: sc8180x: rename labels for DSI nodes
  arm64: dts: qcom: sdm630: rename labels for DSI nodes
  arm64: dts: qcom: sdm845: rename labels for DSI nodes
  arm64: dts: qcom: sm8250: rename labels for DSI nodes
  arm64: dts: qcom: msm8996: rename labels for HDMI nodes
  ARM: dts: qcom: msm8974: rename labels for DSI nodes

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  24 +--
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  16 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  36 ++---
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |  24 +--
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  50 +++----
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts  |   6 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |  40 ++---
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts      |   4 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi |  30 ++--
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |  22 +--
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |  18 +--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  52 +++----
 .../dts/qcom/msm8996pro-xiaomi-natrium.dts    |  18 +--
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  50 +++----
 .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  32 ++--
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  14 +-
 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    |  10 +-
 .../qcom/sc7180-trogdor-quackingstick-r0.dts  |   2 +-
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  52 +++----
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |  10 +-
 .../sc7180-trogdor-wormdingler-rev1-boe.dts   |   2 +-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  46 +++---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  28 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  22 +--
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |   4 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  24 +--
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  |  16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  20 +--
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |  24 +--
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  40 ++---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  98 ++++++-------
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  86 +++++------
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  76 +++++-----
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  76 +++++-----
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |  74 +++++-----
 .../qcom/sdm845-xiaomi-beryllium-common.dtsi  |  66 ++++-----
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  76 +++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  36 ++---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  40 ++---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 138 +++++++++---------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  36 ++---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |   4 -
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |   4 -
 44 files changed, 768 insertions(+), 786 deletions(-)

-- 
2.39.2

