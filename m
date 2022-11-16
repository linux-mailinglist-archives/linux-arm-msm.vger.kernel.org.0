Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098E162BB0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239073AbiKPLLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239061AbiKPLL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:11:26 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F43391C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:57:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h9so29304918wrt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBCkLhCRqVmaPTqUxxl/AYAsKRro7tO8FF+xV1WMFvM=;
        b=sRNCqI5cmmFzz7JYD6J3P1xBg94DEzNRlvVngsv+chCHPDj/yG0U7Slqt7lJNnttsi
         MMxk9zFP0rcEPkHqZhIQg7hZoZbspOEo/QVM1hu15T0Z/lBRK7MMBs0ZxJi4OKbnQO0k
         r8njnuYeH5k+oH93+fjIUpCnAHbSmaoEj8PG32D/tZguxzRnpcq952C/4g8McKItWT3o
         7ou68yFk7Gn4bGwllcFPK0xurPqpbEvM0Ebu+FCofumsYGxezuo54B9zq1EwPahci18N
         U1Uz3qXsT656mi0t/4jbu19Tl/qS0SiAdQwgaEn240GmAt3BgGwvp/FUqp2JLwCRsXz4
         eeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBCkLhCRqVmaPTqUxxl/AYAsKRro7tO8FF+xV1WMFvM=;
        b=FcKHa+XPO7pwrBK/cp8vGihc3uR3FGDBx5zmAIrvGbmLCNNNZHj+LeZRnzb2UemEY6
         B/q9OntLMbdVSx10s+kQFbmaOIB/64mtxMUlz+5HJy1zs53A3j7g3jlqfUbgGV0DAJyq
         4Uj53p20tav/Q+83LtIYtC8UL5MtZrQ9/C0hJbUqZcmBivqpbxETSrLrkKQYLAYbem8D
         LOu6tJ37ayKABJM0Zm3r/qAJPe34h3UZzWxcbq49we4pBogiTRSEPhBddn3PVfsRM/KS
         drZfT2akmqXCROVLGNCeKrse4F/K4MQ7PZS+cnJsSfEjDNtr5Be4J2FuhBKZg1C1pgHx
         D5Tw==
X-Gm-Message-State: ANoB5pk0eUApnptygczBUgLtTJnwM4cy1uRz5Tcfoi7AQzdHq5BEz3hn
        6F3eAxN90rVkwjwZiXPZnYEpjg==
X-Google-Smtp-Source: AA0mqf632jI0KK8mGZvNda0VwpT9Zr+Fjxyfb8L7VCi5IIpxobDc7gFSMPd1jtezCmzDfzdOMFFXCg==
X-Received: by 2002:a5d:568b:0:b0:236:8322:4bf1 with SMTP id f11-20020a5d568b000000b0023683224bf1mr13120973wrv.119.1668596277689;
        Wed, 16 Nov 2022 02:57:57 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00236e9755c02sm14935053wrm.111.2022.11.16.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:57:57 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH 0/4] pinctrl: qcom: Add support for SM8550
Date:   Wed, 16 Nov 2022 12:57:20 +0200
Message-Id: <20221116105724.2600349-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds pinctrl support for the new Qualcomm SM8550 SoC,
One thing needed by SM8550 is the i2c specific pull feature.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (2):
  dt-bindings: pinctrl: qcom: Add SM8550 pinctrl bindings
  pinctrl: qcom: Add SM8550 pinctrl driver

Neil Armstrong (2):
  dt-bindings: pinctrl: qcom,tlmm-common: document i2c pull property
  pinctrl: qcom: add support for i2c specific pull feature

 .../bindings/pinctrl/qcom,sm8550-pinctrl.yaml |  184 ++
 .../bindings/pinctrl/qcom,tlmm-common.yaml    |    3 +
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c            |   20 +
 drivers/pinctrl/qcom/pinctrl-msm.h            |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8550.c         | 1789 +++++++++++++++++
 7 files changed, 2008 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8550.c

-- 
2.34.1

