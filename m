Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E6055FBA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiF2JR2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 05:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbiF2JRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 05:17:25 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67C42CDEF
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 02:17:23 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id k129so7545032wme.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1VS4ZR2kVMuM2BPvqXZE8kitmI8cxAl7zyv/R4Rp1g=;
        b=iErPEykS+awt1rQO9zFz1unwsp7n+QkqXRfHMKqOHEVZJ8N1+UCwe+dhajv0gjWob/
         7KtDraQdL4hfrWXCpYjIzAKF/2Z2XWE1MKvAoWZehqZEDtBCAT3QajB0KSh0bnYoStR7
         aKBYjA7PJyn6UgerZ7MAXojqTxjcsJ0bEE8PLurhgmsWjyrrmIVYyHaz6zG0Ov+pr1pD
         TOwGazP5csB1VJF2/Z/ds+ib9aki2627sN22Ubp21GW2F/WPYQP+ocpzMQnzV18+ueb0
         AM97aMLOGThXqa0vROhkKxbTwJPCQ1Dm71HJJb6OO8oiNKV7Q+VV1MAcy9Ajb2NBzKMa
         vSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1VS4ZR2kVMuM2BPvqXZE8kitmI8cxAl7zyv/R4Rp1g=;
        b=VzeFldi7gotcPP0LBhKVlAW6y3rh8QDzf0SswQYAKM33OmLNVB1Yid9atZPdmC/PWb
         VG1x4ASmqipfyDRmTB/EsX00pWlA8jQXVGF1mM3nJGY6USWsd5VCv7ao1MiHUKWZsQKx
         npLrJFD+87P++tWgJCv+rWorsuuttGQpXbFEUb5aiegcnqvWLDi5DQA479nlpTA0froL
         cwquL2e4C5ICVd9tOpwPC0EmZugPu97wezva1knasM69X4lpeP/OH0vtDD2BTzjqZypM
         NmBKpmDjZz8Gt+hBSZOVLBRFM3m9CFmp3qUjN7S9UO9nXJZuoH6LNQBr5nz/V4m4bpgi
         miMQ==
X-Gm-Message-State: AJIora9aDVd/7Np5/HsgeU2hsJrY7vBc1zCBjRU3yruar44zOrXUyU8m
        W2gItlTZPlq2LApQKTlgmbqsOQ==
X-Google-Smtp-Source: AGRyM1sVTNmfbruTJVZq71LNhDx/tYBuCAzb0/8zfTDBny0VdrsOoKltMvLwIRXvZDPHRPMC7aIFVA==
X-Received: by 2002:a05:600c:2055:b0:3a0:4605:df1a with SMTP id p21-20020a05600c205500b003a04605df1amr4519587wmg.75.1656494242443;
        Wed, 29 Jun 2022 02:17:22 -0700 (PDT)
Received: from srini-hackbase.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b003a03a8475bfsm2896443wmq.16.2022.06.29.02.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 02:17:21 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] pinctrl: add support for SM8450 LPASS LPI pinctrl
Date:   Wed, 29 Jun 2022 10:17:14 +0100
Message-Id: <20220629091716.68771-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds pinctrl driver to support pin configuration for LPASS
(Low Power Audio SubSystem) LPI (Low Power Island) pinctrl on SM8450.
    
This IP is an additional pin control block for Audio Pins on top the
existing SoC Top level pin-controller.
    
Tested this on SM8450 MTP

Thanks,
Srini

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8450 lpass lpi pinctrl driver

 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 138 ++++++++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 240 ++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c

-- 
2.25.1

