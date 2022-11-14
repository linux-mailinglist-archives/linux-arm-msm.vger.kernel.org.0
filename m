Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00811627AFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbiKNKuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236174AbiKNKuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:50:50 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEC81D661
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:50:49 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id i10so18615015ejg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jEIIMdH+bHUnCusoZlsBLpgW72FxK2y1KO0ygQf7HE=;
        b=GJwLxdz10nd1d9AeLrqj4WNiSr6+YwokTQkOvBeSJph/jN9DSNs637RQeBxV4ky7eL
         x0wmKtcgkhhlRjzdApu5hYMFvJd7teOOTUsU0xQXz3w9ddPwv5J0lGGrD54pY2eUvO1a
         KoepsL5KBdeDz/khsPP1wrV3Ls/1L3T42FEBi7Oz6ljUYQqbyDei6AZ/f9B4T8Mc+Wgb
         7Ampox4QwCpxVjoUqR3EFsds2SBB3eLX9j8hE86bq0h0vwJo2MQRfdBnRTWQeeCJr+G2
         HkIeJHVjJPu6R2ozaV9JCjAKo46ExzcZS12OluWEYeBVZQjLADiCOH/w/1FzhSzld+qI
         gybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jEIIMdH+bHUnCusoZlsBLpgW72FxK2y1KO0ygQf7HE=;
        b=ZIV+TknHirweEZ6ZHKiwamFmi6tuHTWM6/ffd9xetAZVasH8VktrMBfIlnOi3LkBiR
         1OA0qDg3yEq3JUCEx8VDtpTQMt3gcY4l00jeINUFksjpXjcs4pkLYBDA7eRq/4sEjKXz
         6BNwmxHtGj28FGTl4XPPnf/Z5a1gpxg+uhlikoDtiAaUqg30GBQ3Vg0ZyKqY3JAeBDWI
         83JFW/TLAc7msg1am+eQKGF1ty01r88Y+fagsGYQHtGy5x8bz9OUd1aXRRC3U2oSM0Rd
         SnMY3+j5P7NXoacKmAfQ4ecWl6HCanXVrIkfdHEC+kAiK24glE5snmnvGlxHBsICNN2B
         +R5Q==
X-Gm-Message-State: ANoB5pmjOh4MuYWAAmBRUJwVxwcTU9AuG1u5ITKqP7uxgDmXraQcOEDD
        tXJ8EQAYaNS6L4SUW9+9QQehoN9zDpHyq3tw
X-Google-Smtp-Source: AA0mqf40tDqd+cGVv2SXAqIClBeEbobDHQ5s6XPLVN89bs2/qmuus1MWWM7vp1SZAwBpWQzsiQMZog==
X-Received: by 2002:a17:907:cca7:b0:7ae:3b9e:1d8a with SMTP id up39-20020a170907cca700b007ae3b9e1d8amr9291195ejc.581.1668423047852;
        Mon, 14 Nov 2022 02:50:47 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b007402796f065sm4037053ejc.132.2022.11.14.02.50.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:50:47 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/3] SM6375 / PDX225 SD Card support
Date:   Mon, 14 Nov 2022 11:50:40 +0100
Message-Id: <20221114105043.36698-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

Add SDHC2 for SM6375 which effectively means SD Card support for
PDX225. Nothing unusual here, some regulator dancing was required,
but that's expected.

Depends on [1] and [2].

[1] https://lore.kernel.org/linux-arm-msm/20221114104222.36329-1-konrad.dybcio@linaro.org/T/#t
[2] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-2-konrad.dybcio@linaro.org/T/#u (merged)

Changes in v2:
- remove stray newline
- use mmc@ node name instead of sdhci@
- pick up tags

Changes in v3:
- rebase against new pdx225 dtsi additions
- pick up tags

Konrad Dybcio (3):
  dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
  arm64: dts: qcom: sm6375: Add SDHCI2
  arm64: dts: qcom: sm6375-pdx225: Enable SD card slot

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 33 +++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 82 +++++++++++++++++++
 3 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.38.1

