Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDE15A383A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 16:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbiH0O4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Aug 2022 10:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiH0O4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Aug 2022 10:56:45 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78602AC6C
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:44 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id k17so2201515wmr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=d59BHP8LjgiC/vFkOq9u6rHRr1lJVrcf1fthrMbrMYs=;
        b=neU8EnMDrTYjUFIcdHT5iDjGC8iG+LPIASVNb40+7ik5/ohDQ7Snwg4/WpXjlw8iSM
         VmDee08hiYpQTwFF284ruhbj4M8dzWCKUeflE8WK47YZPZUwbNYtrcEoOOQkOGAyqTqf
         TRdljnovoCKAflxVdCPbi7Dyr8Cv7Zf4G8V5lwG9G08/88gPaeKIF6JklFaUjJNbQNT0
         YioekLdiF8CTwBuHFYoGPIeS6PJZ3bMq3ag9Lbs/9wRATPFSjActJu3kxbHLkunYinrS
         tJgn3f/dbJmaQrM2fXI4JG3N3hFDUrf7fckHBt6j0HS1i45s5P8msIUqDnghhrV4XDu9
         oEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=d59BHP8LjgiC/vFkOq9u6rHRr1lJVrcf1fthrMbrMYs=;
        b=wr6sYOf3bsVrPIkipTQxPuwC+72Bz5yrf2z4I14DS6IMqa3So1gQWSXnudU6aDGrnd
         WIGEuxfLg8Wd1YtkHvcsDs8a4pBBhdBia+gBU7shjHjswd4FqOM9NPXNM4FeEyzOT12b
         3KduTZHcu2eQD6anMQt1G2r1TObcpAdeCh3sxyzhVY4mtvVQbzZK2PYMOOTfrrT1uNoL
         HCSl+MN/91C7neNnkNIIiJ4w56FStPn47eJlKpPzHjjtZBimF7aUA9SXYfr1EhCF4g8S
         q4jAzoA0ULAk0weSwBKMdhrU3XRZiAIpBIjwK1hAkS1AesuH0jyXFHDnZK7ftQkbRXFf
         ps5g==
X-Gm-Message-State: ACgBeo3VyV6CQXJvCp6WKzcfpbPBKIz74NTGPnPkL5rzP2HkP/BjfTq2
        xFbhXs/V0LUBJP/IHwF+4xSQNQ==
X-Google-Smtp-Source: AA6agR51rl8snFyBc7RwDbRYCHlGF2RaKPKu2H7JXXon4/CUz5EGu37aeFu8jtDIyMHW5eRM+/UXMg==
X-Received: by 2002:a05:600c:4f85:b0:3a6:243d:3b7d with SMTP id n5-20020a05600c4f8500b003a6243d3b7dmr2520932wmq.84.1661612203223;
        Sat, 27 Aug 2022 07:56:43 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m186-20020a1c26c3000000b003a5e7435190sm3407395wmm.32.2022.08.27.07.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 07:56:42 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: pwm: Drop PWM reg dependency
Date:   Sat, 27 Aug 2022 15:56:38 +0100
Message-Id: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
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

V3:
- Splits dtsi and yaml
- Uses Krzysztof's suggested commit log in the yaml

V2:
The accompanying patch removes reg = <> and pwm@reg from the yaml and dtsi.
This follows on from discussions between Bupesh, Dmitry, Bjorn, Krzysztof and myself.

https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/
https://lore.kernel.org/all/20220721195502.1525214-1-bhupesh.sharma@linaro.org/
https://lore.kernel.org/all/20220822120300.2633790-1-bryan.odonoghue@linaro.org/

The previous discussion tended towards either removing pwm@reg and reg = <> or
extending out the yaml to support multiple reg declarations for PWM compatible.

This patch does the former. I've left node: label in place, dropped both pwm@reg
and reg = <> I kept "label: nodename" though because it looked more like what we
already have for rpm regulators.

Per our previous discussion I've modified the yaml and dtsi in one go.

Bryan O'Donoghue (2):
  dt-bindings: spmi: Drop PWM reg dependency
  arm64: dts: qcom: pm8350c: Drop PWM reg declaration

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 arch/arm64/boot/dts/qcom/pm8350c.dtsi                     | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.37.1

