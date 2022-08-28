Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1255A3DB2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 15:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiH1N0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 09:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiH1N0x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 09:26:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3C722BC5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:26:52 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so6833653wmk.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=PDTfrzK71W/o04iAa1virUBaf640I/nTCc/1bfKOb7k=;
        b=RNocqq3gNlE0xVmJj+Aau8CzoOzhqzyxTfO97IF1cBR48x+5lCMX1Zn4Pz5Hfq7qPC
         XJisvqSpQvpbFTRO6RK9vbyORPCMblAZ59R2ExzvGfNFuWaA3DMCH81EwkjgKxFHxeOF
         2qb2x5mqSUP6DYEVZcFdQ9miM5Hmt1xfCo9JUv6kiTSWoiRBoFZRnuD4+b/kHRFGaDla
         7WTOiIhUrZzDH3e/0/fjz+iEitxrGpL79b5lCMUPW4LAg2gu7fj2UkUr5McVKmUuBrfM
         NvxSuZYQ/hrZS2ALAQIAjamTbKs2nYFBNELmHA12pexFfJc3oh43Lx2aAyOfCogi2f3S
         jljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=PDTfrzK71W/o04iAa1virUBaf640I/nTCc/1bfKOb7k=;
        b=6jIUJSVeCcSTurYOZGRiaOOc0BpJakVQT7QVD3juRnKdusxwCUa1Ggq6+T2eODF96H
         CcMS9Bxp+M+SqKH51GgEToKvJuz2LZTMAO8whVI/y/88XbeewZgVbaXg7TuOi+224YRL
         xCYq6v6COPgdFsB8QENdr9DGs2F8P0EPY59PEaTnqSUIKTBMttqVmJhc9vMDPxEADa/P
         BJjkcEiZBJggGXIthpuJ2QQkIfIR++FX86iX2UojY4w9FELqWW0SlxedgnRf3uboHo8E
         jB/dEsnLm16UuqNzp0kNMDg0/s1VZXkALWK+P1FCDJ9q9smhBo0M/NxK+fsLM+1rTQzP
         7fdQ==
X-Gm-Message-State: ACgBeo0Fuoi8fAZP0L7rvlP/s+wNNdMMqfsG/3vIQCHNkbZdMHUEV2bS
        ZgOUakhNtQ46rGPUeuBfzrVFpTMStokxUQ==
X-Google-Smtp-Source: AA6agR7NaqotNpWI1xvxAZzDha1Qpl53eXi9+P6gdn9yy0SBlQOWKtD9FbbFnSSC/Ich31Bid8KfGQ==
X-Received: by 2002:a05:600c:582:b0:3a5:4f7b:3146 with SMTP id o2-20020a05600c058200b003a54f7b3146mr4511714wmd.152.1661693210271;
        Sun, 28 Aug 2022 06:26:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e15-20020adffc4f000000b0021e51c039c5sm4518874wrs.80.2022.08.28.06.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 06:26:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: pwm: Drop PWM reg dependency
Date:   Sun, 28 Aug 2022 14:26:46 +0100
Message-Id: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
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

V4:
- Churn patch#1 prefix to "dt-bindings: mfd: qcom,spmi-pmic:" - Krzysztof
- Add's Krzysztof's RB as indicated

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
  dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg dependency
  arm64: dts: qcom: pm8350c: Drop PWM reg declaration

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 arch/arm64/boot/dts/qcom/pm8350c.dtsi                     | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.37.1

