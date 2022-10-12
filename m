Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE155FC99C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 18:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJLQ7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 12:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiJLQ7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 12:59:17 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59216DED19
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 09:59:16 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z18so11275839qvn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEi7mCU8aFQrq7+X6TvhVYf4QcPUFRJ3UuljS9y8koA=;
        b=seNl6HDTdPRmel6AJpVZSoutBpRKvr+Fl5eYJyJfzmQ09TFhOHG7w9fH+YZ3MeaX3F
         tfa7o/90smt5ohP3CfyZPWln986aidkMqSi4xH2UYQ9hZoJ8z6JUt1B4JfkBOSnPTckU
         L2MHRFVagT6JJTCYwIMABOuiQo/EistC7XK3lst2zcDplPuzbulJk2xRM77d+knDeRDc
         Qj5EJdZX95pei/CPMjqLwpAOlcilE7Jsd/rzS7t21U4xn9CNNdtyt+JPESojYzpV5l05
         rHVYLTKefmG1zjpKjqH/Xs500V1Hc3V8SETGBP8WM6aKSbV+h+AiAJIdofSsAPID6mq8
         4vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEi7mCU8aFQrq7+X6TvhVYf4QcPUFRJ3UuljS9y8koA=;
        b=VitDoN1cvJtboRjvzaVEFvRyqhsuWfvFAG7pXt2NNE/fIv31vDfCPvhMCYFI+5dGB5
         qaYzny9Xg70hmWRgYTnylGqdx7bi6/EGHdjbKq950bhYFgy75bJYyE0BzNMaPIL5UXSi
         h1KqIQ1N5uxOojKQpt4nwo+XkxB3VxTbY1ZuJL8udQBttG08L2GZVLptvZ6bj3sfKROu
         VARdNa+61+UbaP8Mj1exUvH545fn6n0td1MLNqcdvZt3ILbdCm13MHhGc+xqn0LqRt7H
         47qT8WkEo6rAbf4AGd71mgjRYp5Fa052dgrBd53oLJgDg58kt/0zsShXQd7Scho6/viK
         xFwA==
X-Gm-Message-State: ACrzQf3Xfn+J/zE2vBaaaXS92p4NK/HUOvzB5187cavU/pl+Ls0SsHsT
        fjlKEN0g1wLrD00gERGRdIoSdO99uv50QA==
X-Google-Smtp-Source: AMsMyM6x34jR+AP+1/mSelLoInUqYH5ACE9NR5sY5Ibk5fqjjftS3t/PO24LF9V3ByCJkQ+scARgvw==
X-Received: by 2002:a05:6214:d8a:b0:4b1:9f67:450b with SMTP id e10-20020a0562140d8a00b004b19f67450bmr24107709qve.119.1665593955541;
        Wed, 12 Oct 2022 09:59:15 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id r4-20020a05622a034400b00398a7c860c2sm9476039qtw.4.2022.10.12.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:59:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8994: Correct SPI10 CS pin
Date:   Wed, 12 Oct 2022 12:57:10 -0400
Message-Id: <20221012165712.93053-1-krzysztof.kozlowski@linaro.org>
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

The GPIO55 is part of SPI10 pins, not its chip-select.  Probably the
intention was to use one of dedicated chip-select GPIOs: 47 or 67.
GPIO47 is used for UART2, so choose GPIO67.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index ded5b7ceeaf9..7a582a5fe3a8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -897,7 +897,7 @@ default {
 				};
 				cs {
 					function = "gpio";
-					pins = "gpio55";
+					pins = "gpio67";
 					drive-strength = <2>;
 					bias-disable;
 				};
-- 
2.34.1

