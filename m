Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8EB6F9CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 02:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjEHAdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 20:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjEHAdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 20:33:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91D08A55
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 17:33:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f14e499ffcso2575939e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683505990; x=1686097990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d89H4uk7bZPbaOYXNlYZ9sQ+vDG47E+ZIce5rUW25ws=;
        b=KVn0ktt4JiY4v/EjZ1+utNPIEvZav/xwefP8yQxzQs1x0Evjx54MpAP7mXzSbRUSTD
         Dloy3KOzPJlQs+wX1XtxOAIiiIhKYWmANs41xZDKQhZlu12yDN5CrUtf8eKfdRVuudUB
         MktetROrUsB+m+9boaqYVUNx7MbJqfy1UokJz+w81O+0jCUDAtS4G2Tkrv/uDFZRySlJ
         KBcWnUcg4yIsDO4m+9OcIvNvDgjV4e29WrYXiZ+n47Blkq9k/zmb1qjVMT33mishpO9L
         KBnn0DXrQneuKXkm98smliWOVPaGlDo5Na06MaKHV2/YiR5sg6gW/NW5KWdeAupKTAwq
         n9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683505990; x=1686097990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d89H4uk7bZPbaOYXNlYZ9sQ+vDG47E+ZIce5rUW25ws=;
        b=VA7NwWwrtjZ8m2V1ma+KdcglR0QE0ycepm5tTSzR2+rHSQbdEaSXcPJaeQNxefsh6K
         54/5GWBtrGn727F8xrBMHQ96Yky1l9gdM5dk1qAjc2CWTU44BKx/OMgYXTsRoWiD0ho6
         YcflP+2Rm+wIFCu4qo6sGuOj7kDbFQVlg+fb04jUJmxnF3wPonJEkLoU6OccN0SPdAbg
         nhHKT1hdGlgjEVszsLmLqYDtiiMqZGfBnYmk+fhZTBEk/LTNSkbiBPyJrrOgK144SvFf
         L/e7K+jwQAGOQ7J0ivHOvBf7H8s8k+9CKrVzuBL4vnY3yO6UY/wDjU5OKPoCT1KCHkS5
         zTmg==
X-Gm-Message-State: AC+VfDysjNB4EFRi/fOQqqI2tlW6iOwnwUTE9jkKVoxqJAHlkgg44/xd
        UBh3fdkZ+aYzf5TnysExPcEaUQ==
X-Google-Smtp-Source: ACHHUZ7mczR1LcKSBlOe7unt+TZDzcFjB1mfG7PstMZxl74dL8qRAxf5yG/WlCuIEPHfXP5ZPXwWbw==
X-Received: by 2002:ac2:5ec4:0:b0:4e8:893f:8079 with SMTP id d4-20020ac25ec4000000b004e8893f8079mr2286943lfq.64.1683505990150;
        Sun, 07 May 2023 17:33:10 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id m22-20020ac24256000000b004eca2b8b6bdsm1114807lfl.4.2023.05.07.17.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 17:33:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] ARM: dts: qcom: apq8074-dragonboard: enable additional devices
Date:   Mon,  8 May 2023 03:33:03 +0300
Message-Id: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
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

Add support for buttons, LEDs and coincell charger found on the APQ8074
dragonboard device.

For PM8941 we don't have a defined field to store the reset reason.
Support wrapping pwrkey and resin, but without writing the reset
reason.

Dmitry Baryshkov (6):
  dt-bindings: power: reset: qcom-pon: define pm8941-pon
  power: reset: qcom-pon: add support for pm8941-pon
  ARM: dts: qcom-pm8941: add resin support
  ARM: dts: qcom: apq8074-dragonboard: add resin and gpio keys
  ARM: dts: qcom: apq8074-dragonboard: add onboard leds
  ARM: dts: qcom: apq8074-dragonboard: enable coincell charger

 .../bindings/power/reset/qcom,pon.yaml        |  2 +
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 71 +++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi            | 22 ++++--
 drivers/power/reset/qcom-pon.c                | 22 ++++--
 4 files changed, 105 insertions(+), 12 deletions(-)

-- 
2.39.2

