Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B70641B14
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 07:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiLDGQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 01:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiLDGP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 01:15:59 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106EE1AD86
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 22:15:58 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z4so9984567ljq.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 22:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvehFUDvmlwbe0bLOZWtJlblAYTrgpn+Xb3UZ8w37ns=;
        b=oFKZwFPq2sFRHO88iwMuefuNNHQDKZ449Z7MB/ubmAj4d40k7KWf4mdsv6cS+/bc+Q
         U1axE/MjHpWgG6xs1n9MEuKKHMUUbiOw/+9RPkFTY2qKSE72a4YLzZdPjzbTsseSjkch
         0hX3q8eFuaYbH4R3naoJcds82rhJpeOJYEZNXZGfmijnHOiqujI1nxXCNv2gbYiZUNtE
         nk5yDjQ3I9altrwHGvavmJIPCYMYXl5rYypUUp1NuwJ3d0BL8UWiS6FgjdIepYFTFs9g
         nMVR4fH6hVSViTwcpa0PW44uB/b11aWOYms251k4jhRd9hEx7CSKDJ9GlKdK2WUC1El9
         AxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvehFUDvmlwbe0bLOZWtJlblAYTrgpn+Xb3UZ8w37ns=;
        b=Sq7C1eFP7apzcTOSilNUUaSmqgykGstAu8AQ+yzaUvj69uT8c8jAl/pebVqB+D3RLl
         XHTs6Iu4BF8rhw/14DMJsbldHJ8uyJiVS5DFUKkch9piKtXYM+UxlilUkj7PGw/mMCMY
         30rfOvtcvs7r2u4/F2QmH94aBjnBijpYA5t7iiVPZiqamnLF+1bdoYU7s9um+oLBUOER
         QLhtGK8n4CVeivbVp/bgYcxe2efzanx/pqM/iZUOEtirn/AxLEpT6nHfM7/cyXc7EHBQ
         dNkcIe9pmg3Nz0EgdJL0c8xAmnjxgJhmr9i6zCia43L2hPQAUjYicgG6UO5slIkW7C7c
         UKRg==
X-Gm-Message-State: ANoB5pm42dKUcztQoEfAHUj9GH9EDTwOtAGI8kdZbqrv4/rPSUchfne7
        Vqov9SQexWZSB1X3BvhfzKk8fTK6Ob1EiaFZ
X-Google-Smtp-Source: AA0mqf54caa7v+m0jl8ZO1ZC99ocLHSUkpP2NT27/UzSJUdcd2pn7cLhl2mxOKsWYSr6l0QV47pDsA==
X-Received: by 2002:a2e:a224:0:b0:277:309:f1ad with SMTP id i4-20020a2ea224000000b002770309f1admr18563059ljm.244.1670134556412;
        Sat, 03 Dec 2022 22:15:56 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512110c00b0047f7722b73csm1650725lfg.142.2022.12.03.22.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 22:15:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 0/4] dt-bindings: add missing subdevices to qcom-pm8xxx schema
Date:   Sun,  4 Dec 2022 08:15:51 +0200
Message-Id: <20221204061555.1355453-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Update the DT bindings of the Qualcomm PMIC devices sitting on the SSBI
bus.

Changes since v1:
- Rebased on top of [1]

[1]: https://lore.kernel.org/all/20221201131505.42292-1-krzysztof.kozlowski@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
  dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
  dt-bindings: iio: adc: qcom,pm8018-adc: allow specifying MPP channels
  dt-bindings: leds: Add 'cm3605' to 'linux,default-trigger'

 .../bindings/iio/adc/qcom,pm8018-adc.yaml     |  2 +-
 .../bindings/input/qcom,pm8921-keypad.yaml    | 93 +++++++++++++++++++
 .../bindings/input/qcom,pm8xxx-keypad.txt     | 90 ------------------
 .../devicetree/bindings/leds/common.yaml      |  1 +
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  | 26 +++++-
 5 files changed, 120 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
2.35.1

