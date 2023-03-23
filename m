Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D636C6F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbjCWRbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjCWRb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:29 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D4C26CEF
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:26 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id s8so13619842pfk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrlHsI5Z/NNnOc1NjNfOu1jz21Q+M+e28AawYyOfx3M=;
        b=edHQ2+I5cm1iMvu/Yj4j6Xbo05S5NenSnnJ/8+XM+FqQ9x1iG7FiNzB4IqHhkdKkdy
         I7hNLoWg0LzzdN1YAC5hKBHtRdEq0ZUvRvp4YkxNHFhYoF36rHr7JoId7M/TCNQpSQj0
         2YixmX4hf3itZ3gWw9KyqAqkg0eMTKQYXPTgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrlHsI5Z/NNnOc1NjNfOu1jz21Q+M+e28AawYyOfx3M=;
        b=zHDCJPiYAL0Yq2lN+ViCkEzJbsx4rWiFji+i6sk9NmO0rtyCL9ci3m+UHgM6CBaaT/
         zHxkGEAeKgRnmWWOCF6NJgChMwcCE5m7DgGJEcOY5DE7krvxsOfFwjAt8cnatR0iHnk/
         vejL8Kx53I+X0jKxqn9+bpRuZWoxJSq75JDvuG9yHEWSET4gxV2/W9wtH4OGsWyi53hM
         Sj6W1Y8LSlBbSEgropO317k08HP3LMjCb0N42h21G6irjI5UuHdYuZ/vng2/v/bfRYMP
         GLLFq9kyWk5ps+SXwx/eFzJAzbrkXNYdI+HpgHyXB0LbPIiK/Ks8zcsG0F+Y33Adntjf
         RgZA==
X-Gm-Message-State: AO0yUKXJvAuvOKFmE4nbb61q93cEqal9n4aHpKBB9IH/dLC4y0YezYsE
        +PFq+aklhin6ZerZ0laDoJndCQ==
X-Google-Smtp-Source: AKy350aipydQzWbD4aLzbW5qWar+RQQyGCphddK1U85iT9QM7zEOrgHW0QB0QuHoYtR6mtAQbvOAAw==
X-Received: by 2002:a62:1941:0:b0:5e2:434d:116b with SMTP id 62-20020a621941000000b005e2434d116bmr179799pfz.23.1679592685919;
        Thu, 23 Mar 2023 10:31:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] dt-bindings: pinctrl: qcom: Add output-enable
Date:   Thu, 23 Mar 2023 10:30:11 -0700
Message-Id: <20230323102605.7.I7874c00092115c45377c2a06f7f133356956686e@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("dt-bindings: pinctrl: qcom: tlmm should use
output-disable, not input-enable") we allowed setting "output-disable"
for TLMM pinctrl states. Let's also add "output-enable".

At first blush this seems a needless thing to do. Specifically:
- In Linux (and presumably any other OSes using the same device trees)
  the GPIO/pinctrl driver knows to automatically enable the output
  when a GPIO is changed to an output. Thus in most cases specifying
  "output-enable" is superfluous and should be avoided.
- If we need to set a pin's default state we already have
  "output-high" and "output-low" and these properties already imply
  "output-enabled" (at least on the Linux Qualcomm TLMM driver).

However, there is one instance where "output-enable" seems like it
could be useful: sleep states. It's not uncommon to want to configure
pins as inputs (with appropriate pulls) when the driver controlling
them is in a low power state. Then we want the pins back to outputs
when the driver wants things running normally. To accomplish this we'd
want to be able to use "output-enable". Then the "default" state could
have "output-enable" and the "sleep" state could have
"output-disable".

NOTE: in all instances I'm aware of, we'd only want to use
"output-enable" on pins that are configured as "gpio". The Qualcomm
documentation that I have access to says that "output-enable" only
does something useful when in GPIO mode.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index 5a815c199642..90b7d75840c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -77,6 +77,7 @@ $defs:
       bias-disable: true
       input-enable: false
       output-disable: true
+      output-enable: true
       output-high: true
       output-low: true
 
-- 
2.40.0.348.gf938b09366-goog

