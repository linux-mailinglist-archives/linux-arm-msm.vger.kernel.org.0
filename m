Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D34367E9D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 16:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbjA0PpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 10:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjA0Pov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 10:44:51 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031E68396C
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 07:44:32 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so5316170wrb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 07:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hN2o/e9rRLgXbQAGcxrtMiIjFe2ewgcFKUp84Rc2SBQ=;
        b=datZ6QYgnHqP8hAIoPDHYYDGC/cBUeRmTQ8Luf3cZtxE80Rks74cwizgo+XiOTw6IN
         NqhmT7BCRn/NxsMxGAG9bhizk6pNH8JrvJ2K9RiXCkeBDAR2wuryGp5TQip19g+E54X9
         Rnfq7Lv5rWS2dytr0L0vRUspsOsWZ8uLDFp0tdd1o4QPhebet1CVg0b2PAKFnDkCtw9U
         hNHMuZlJLJL5ieVFIHisLz/aZ+vl+Ar+7Xd4RW8XCbIQnNmW80YcVz+nJ+adEWBN38/R
         S1/LJ6QHFb8w9vbVOKTUu2zODThtgVonLXNYUhF0Km2klt5pFYbP471M58t0fHMjQjQ5
         UhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hN2o/e9rRLgXbQAGcxrtMiIjFe2ewgcFKUp84Rc2SBQ=;
        b=6FJ6PqgmxwJ6A/DSMA4YZ2lGqv7+6lOnfViamFj3RI293xyhM4yenI9X+2S5TFHcbC
         j8UTlZAmpBqNckIzb1+4xcaSJ8U0KSa8PUAP5RymENmZGr/7tUcf/S7dfTovTff0Q6f9
         eyOBjJ9J+7sDn/Mq6yj8OBtudVgqV516SUvUG7NeBWFIs+K/uhzCUkyTiEUqwLbd8x9E
         xzQCe11QruHxHLbZCgnNCrhTNidwApy3Hud9AeJcnIUSb6a0I7+RNwHNPO+WpsTM7vGq
         J6nb/ejkyjmPB5GFvZ1Cq9t2tFOJ+SPPKZWw487JCe1dZLaZkwDfLT6tNuF+HaPZCOQU
         Nnfw==
X-Gm-Message-State: AFqh2kqwnqcfNnWr4qHHCUdJTrDpGPCsFvdVhjBNEtltSVHX5SvoECJV
        8M/qE9eEoM8DIDEdJeT4Vo5v1g==
X-Google-Smtp-Source: AMrXdXsdmCOJBAPLIp3vyZLghATYApCU0bxcIo7S20HDOGqd4C2GVj3EmATmc7HrPTA08bCQoJqCSw==
X-Received: by 2002:a05:6000:1f14:b0:2ac:5b46:9c85 with SMTP id bv20-20020a0560001f1400b002ac5b469c85mr34470662wrb.68.1674834270301;
        Fri, 27 Jan 2023 07:44:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:624:f1a4:edb9:78d5])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm4755229wmi.2.2023.01.27.07.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:44:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] pinctrl: qcom: add dt-bindings and driver for sa8775p-tlmm
Date:   Fri, 27 Jan 2023 16:44:24 +0100
Message-Id: <20230127154426.173863-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This series contains the device-tree bindings and the pinctrl driver for the
SA8775P platforms.

v1 -> v2:
- squash several functions into bigger groups
- fixed the emacX_ptp functions (they were generated automatically and the
  script made two separate functions into one)
- fixed the compatible and DT bindings examples
- added missing DT properties
- made sure the bindings pass tests
- coding style fixes in the driver

Bartosz Golaszewski (1):
  dt-bindings: pinctrl: describe sa8775p-tlmm

Yadu MG (1):
  pinctrl: qcom: add the tlmm driver sa8775p platforms

 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   |  136 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sa8775p.c        | 1537 +++++++++++++++++
 4 files changed, 1683 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p.c

-- 
2.37.2

