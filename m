Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC6D63632E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 16:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbiKWPUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 10:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238695AbiKWPUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 10:20:08 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E64E903BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:20:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id e11so16968912wru.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ziwsq9banwczERpMX+Bo3ns23w7Dd8VFWVq2lIRwuKE=;
        b=h+z4P+mLFJgnkVRXVdp3prIBBPkAdi+FwhU/MWCM+45GjS344kKmGvvfC2NWJqctNL
         /b8fuSL1ttsIggGguMPLdLrNDm7QUjnWFhx1eKOzGTWwc7ABYnK8CYQn+mKfE6i9vuwq
         jhwmETeTCYfTEC8YfaPYjjA8FG+UsOIFbQPcZkes8iHOP2u6ioYsBCdYSq5Z2IS8HHWX
         sCTmfDmipwpLQN2bayLosN2jXgN2GknoCWPZwFLaQu/ac8PlZVf1fmWWEw0opiJnqw1z
         hWUWqpSuWYnYRc/ITfDNE4+8FKZ7UVQiQcHqQol87JeGPzcsTjd/cjsAq+QRTtsA9EZG
         Mn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziwsq9banwczERpMX+Bo3ns23w7Dd8VFWVq2lIRwuKE=;
        b=nA47kqrmTI8vApkOx8K/T8fI6vvMbG4Y6hP4rZYdbtxPz/k4IIYEjaucb5mKS44Y4Y
         njItYdr/4Qgvzn8xLJ0LKFJN6hrKgrYs+hYfe+hoUXzaEaLR6JwM6b5p2IRfi1YXm7D9
         hgg2qyroRcWGsR8fmNLeZ2sla00YEQwYjG5KnZhIwkFIMGH78eQKvjy1HU5lwCuDdCum
         yBE0AT8WW3fVhDez+82JTel0jm4+404ijtNB8MQPmXH/2W9PFMPaS41VKTAHV3AeWPBd
         aJAtaggD17jzSsQiSz3Tt1nEjwi9NqUhBeoe5l0pdcUTQuAEZrCTbTRfSSqJiiVB++aX
         ItHQ==
X-Gm-Message-State: ANoB5pmtIeggXgHwJXCBVTJcd5D9hvb3ptN4/GOwc3b0G+f7xEXsAUP4
        9dZgOaEhIPSHlN6iirMUE8E1KQ==
X-Google-Smtp-Source: AA0mqf63XHGjwyrqrPkF1+AicWGQJXD0EFyrzQk6d2t/8H6zregd0KnivxFbLhZYRfMBIHYCQ0kaNg==
X-Received: by 2002:a5d:48cf:0:b0:236:4983:285f with SMTP id p15-20020a5d48cf000000b002364983285fmr17585786wrs.576.1669216805925;
        Wed, 23 Nov 2022 07:20:05 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b002366ded5864sm16764914wro.116.2022.11.23.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:20:05 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 0/4] pinctrl: qcom: Add support for SM8550
Date:   Wed, 23 Nov 2022 17:19:57 +0200
Message-Id: <20221123152001.694546-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds pinctrl support for the new Qualcomm SM8550 SoC,
One thing needed by SM8550 is the I2C specific pull feature.

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
  dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
  pinctrl: qcom: Add SM8550 pinctrl driver

Neil Armstrong (2):
  dt-bindings: pinctrl: qcom,tlmm-common: document i2c pull property
  pinctrl: qcom: add support for i2c specific pull feature

 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml    |  163 ++
 .../bindings/pinctrl/qcom,tlmm-common.yaml    |    3 +
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c            |   20 +
 drivers/pinctrl/qcom/pinctrl-msm.h            |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8550.c         | 1790 +++++++++++++++++
 7 files changed, 1988 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8550.c

-- 
2.34.1

