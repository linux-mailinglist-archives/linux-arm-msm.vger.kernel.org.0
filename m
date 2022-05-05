Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B323D51B628
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 04:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbiEEC4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 22:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiEEC4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 22:56:53 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539014EA18
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 19:53:15 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l16so3101893oil.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JtMcRY+9JipAU8C1bkMSmvF0PCdAKtGbjYynT12iIQ=;
        b=s/7YYm+ykBqWwHsrdfzUnctOAAIiD3SMSXkA5/lNxfZqFYKJnzyeuwCq4vXUdN1MA1
         hScfyde5HQZDEe9qcmDEyqMr+l0PTrsXmTnzahIoQzDcN+uXZleuWB+C+KRc4sBHtkjZ
         D63o+e94E4iV/kRbgx/Y6n3mCBqBXwAPbkKcs9fbq+VPacbTageksLm54LucC+k7egry
         eq10zmOlBy/XDA3wk9K+1mPx3CM1tDOGee5ZfipVtj5MlQPXzqc0+Oc2lGOgMXoOqdHj
         7lmD/TKbcoYxcGMGuIQIiQ3j4JFDJKF+S65M385CpZKMi255Wi+xJ68jN1MHYDvv1KHT
         B0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JtMcRY+9JipAU8C1bkMSmvF0PCdAKtGbjYynT12iIQ=;
        b=XMaqzIKaBR4fra8TXKJJ7kpVJtG69c6EQjYT9y/dsAnucBG3MisYsKpNPC0AN0XL1y
         18T1jXQenX1U7ynAK1OYTlBENmFlfE1gLNGxvBGgLg1gG9bn8LtvR7Jg+LB9YMiSBQXP
         S7ej9tG4y9guF1Wjz/qZ2Q9T0Nh5GXmidtzAvqp0hRHw8hrvH/R+B3dtUA2fPeDUf8Rv
         4UXqgtr6wIB1oaZhYYmD3ebkEbL6v3JbP46EcCoCTwrJo3+ymNEtmjjTX0aoS1/kyvbf
         izWsm2CmrjVXTImJ22bJvf17uPZlTmaTECUgS3xkpnoXX/GI98LP7Ykfod4J6E6/gY2u
         m2Gw==
X-Gm-Message-State: AOAM533EU17fujEI5/TSFn2BGqjTy+e6E1biPe93qRyqIjrrBGEZzUFB
        6ZBVaEjuV7JYhYA36T+MdeQs6Q==
X-Google-Smtp-Source: ABdhPJxdPv1yS48+PtUC0XC2ujBEDklgGUJAlp2EVPL/sKrWpGR5jQTUNF2lsFYfn4x5wW42fwqKvA==
X-Received: by 2002:a05:6808:20a0:b0:326:5283:7614 with SMTP id s32-20020a05680820a000b0032652837614mr1344376oiw.55.1651719194711;
        Wed, 04 May 2022 19:53:14 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 1-20020aca2801000000b00325cda1ff95sm242572oix.20.2022.05.04.19.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 19:53:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] clk: qcom: SC8280XP GCC
Date:   Wed,  4 May 2022 19:54:55 -0700
Message-Id: <20220505025457.1693716-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This adds binding and driver for the Global Clock Controller (GCC) found in the
Qualcomm SC8280XP platform.

Bjorn Andersson (2):
  dt-bindings: clock: Add Qualcomm SC8280XP GCC bindings
  clk: qcom: add sc8280xp GCC driver

 .../bindings/clock/qcom,gcc-sc8280xp.yaml     |  128 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sc8280xp.c               | 7488 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  496 ++
 5 files changed, 8122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
 create mode 100644 drivers/clk/qcom/gcc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8280xp.h

-- 
2.35.1

