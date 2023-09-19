Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96AEC7A6371
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 14:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjISMqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 08:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjISMqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 08:46:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E03B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 05:46:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso6953226a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695127567; x=1695732367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Aj8Gv+tiuDZcymBcA5+44sWc7PVlwPM61yOxENISt0=;
        b=QFvoPxcWxC4AInGhfcpr3jXInoOj9Z8yuVESonyQSvAbur0SuwG5HFwW76b4iXh/nI
         EXqmpYPJ1UTGea6KjCCI065YeUv16qJ+DaZN9WI8s0o/jbIyCYACmt1Vz67dQZBGPBA9
         fj0Vl22RISTwWkXiVJ878qa5QwcYbM+89JT48dSFQCex9ySu6NPEbUnomgzxJAJSJ9I9
         w59DtG7xU10sc6do+Mx+9bMyMFCQzklR27rcpi40qQ+KhgIExicJergjAxj13KP80tJi
         lNM1h8Zcc57ZmYq1oyktGTpRinf1Ay2niJpkS8FOVbWqDBRpHwgRwqr6k0XrLDBrs4Df
         m8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127567; x=1695732367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Aj8Gv+tiuDZcymBcA5+44sWc7PVlwPM61yOxENISt0=;
        b=Rhjp6T4N2FKK44YVR32loy4Sjz8GSi2zmc+cPKo8yWVTaBnnpM2UAdeScmb1p82i2d
         XcZ7xTEAmtIAOnDfSi1OAqXGOME9Q7GrUFQNj0QEcvKPx6kcF0jWRtLZtaX8eNlxNZU2
         KZ6d9cQ8Yk/Lsc2k4394dJMRT5Lwn60f2UizaPH1OC80z+2AqPhSwcRvsog8OGYbF4J4
         ho3aj6fvqs194UcYECRR6oamue0wZ+6+ptxK6hEfNQImnEK5wICnk44ttOOsriRryyDi
         P1jSVGXKCfSDN68RFGq0QZ6aBPBUWZ9qxTFzUBcZhXY4czJ+Jh0fE9+f044EeN6PWIkN
         iwrg==
X-Gm-Message-State: AOJu0Yw7AGTHx6T1NSGBw+BH8NLLpBb2RGXgZSXCLTP7THXaItG/0Lnd
        iozWLsxtmG5ZH9EfU8qu5eouHQ==
X-Google-Smtp-Source: AGHT+IHY4XkH3n3f08uxPsLLePpLe5k2m9wL4+D7Lpa4GDsuvM4bqhqKckSMAs66C27gXJW0c+//AQ==
X-Received: by 2002:aa7:d954:0:b0:526:9c4:bc06 with SMTP id l20-20020aa7d954000000b0052609c4bc06mr9723390eds.18.1695127567821;
        Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm635878edb.66.2023.09.19.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 19 Sep 2023 14:45:59 +0200
Subject: [PATCH v2 5/7] dt-bindings: pinctrl: qcom,sc7280: Allow
 gpio-reserved-ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230919-fp5-initial-v2-5-14bb7cedadf5@fairphone.com>
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow the gpio-reserved-ranges property on SC7280 TLMM.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 368d44ff5468..c8735ab97e40 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -41,6 +41,10 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 88
+
   gpio-line-names:
     maxItems: 175
 

-- 
2.42.0

