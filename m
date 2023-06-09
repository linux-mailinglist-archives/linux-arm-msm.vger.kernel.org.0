Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8993728DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 04:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjFIC0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 22:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238517AbjFIC0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 22:26:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D8E30F1
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 19:25:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1b3836392so12956161fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 19:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686277555; x=1688869555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1i8s5d5YkSHs6Ggw62o5jRROVt2oF8voOd8NTFgAH4=;
        b=AnHHOPfgTDCJ6xYNjH2MRl7VtMqTUsCfez5IzujeOZJX3qs3F3lx4G4jIYxg2R+Hnz
         zpET7aqhEmxwfvQuBpGEEZDKNCzlivq2m8VJa2fwYD95kPcAyv7jRTpbelhe3P5MK5pz
         e4p3E/9VBcXnJn46tOHTuZHcnzFhTgkv8hhioJ0wkmVKI2xf64+ucQ63lTtCsj3gnIZy
         BAgmslYb7/p3qJZrhcqqplBqUKJmMnD7xtzsjBwnZLNVKiPWP2R8DqGWWJe5jCSG0PqP
         7HtTHx1HqF19WQrn35WNmTKn2B+XAU+qEWsl7fEDnMDw65WasDsxBVhx7liGBXflL6bz
         6Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686277555; x=1688869555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1i8s5d5YkSHs6Ggw62o5jRROVt2oF8voOd8NTFgAH4=;
        b=S/xucyd4R7bF/MX7aAFU/cvo2ojiOCX4cR/G7oNpKDSl5paAKJgtBUNFSU5aNA7EUa
         60WSbzx8GnEffjtd2b1C4xTRPaWS4DA5/J2/IuV1JhbyqErOMgAIO30bVQvWYVxVW6fn
         D7JejaTWpJT1hZO5+ZXv8ik16TMoFsT0kg8aJG1X2QUWOykb15sMDymaSGIB4bN6arEI
         oe4E35jofnWGHOv5jqLKctx2Un7lWMy2KvWbKUgJJz0xspGBK3VYs7DCfhfWf4lzZ+J6
         EMvPofqoRePObYqascpzuaOvoHHxrQ7GaCO23Y+BQnCXDUoMEjdP5DO2NDxPXIwTdlHj
         x8Ew==
X-Gm-Message-State: AC+VfDwwY1NLOckhVoZ7+y00z0oqJVfA/0A/7qWElvCNowBIrEVvwHyk
        jMVZcmBjccV0yVdgIhokwkk/YA==
X-Google-Smtp-Source: ACHHUZ4L27Klo5Ib4GxvHr2AFNLUGfjwCgnBSg4Pf6G/5FjC8CAZG3vdJ+satx13PpWeecKJYzx9KQ==
X-Received: by 2002:a2e:87d9:0:b0:2ac:8283:b67d with SMTP id v25-20020a2e87d9000000b002ac8283b67dmr140100ljj.25.1686277554671;
        Thu, 08 Jun 2023 19:25:54 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9dd4000000b002b21089f747sm167429ljj.89.2023.06.08.19.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 19:25:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/4] ARM: dts: qcom: apq8074-dragonboard: enable resin device
Date:   Fri,  9 Jun 2023 05:25:49 +0300
Message-Id: <20230609022553.1775844-1-dmitry.baryshkov@linaro.org>
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

Add support for reset / volume-down button found on the APQ8074
dragonboard device.

For PM8941 we don't have a defined field to store the reset reason.
Support wrapping pwrkey and resin, but without writing the reset
reason.

Changes since v3:
 - Rebased on linux-next to solve the conflict

Changes since v2:
 - Split non-pon patches to separate patchset
 - Changed schema to disallow reboot modes for pm8941-pon (Konrad)

Changes since v1 (noted by Konrad):
 - Changed to use freshly defined qcom,pm8941-pon compat
 - Fixed indentiation for LEDs definition
 - Reverted the order of pinctrl fields
 - Moved status field to the last position
 - Removed unnecessary pinconf indirection

Dmitry Baryshkov (4):
  dt-bindings: power: reset: qcom-pon: define pm8941-pon
  power: reset: qcom-pon: add support for pm8941-pon
  ARM: dts: qcom-pm8941: add resin support
  ARM: dts: qcom: apq8074-dragonboard: add resin

 .../bindings/power/reset/qcom,pon.yaml        | 12 ++++++++++
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  5 +++++
 arch/arm/boot/dts/qcom-pm8941.dtsi            | 22 ++++++++++++++-----
 drivers/power/reset/qcom-pon.c                | 22 +++++++++++++------
 4 files changed, 49 insertions(+), 12 deletions(-)

-- 
2.39.2

