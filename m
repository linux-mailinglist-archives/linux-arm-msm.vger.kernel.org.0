Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAA37B2D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 10:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjI2IRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 04:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232835AbjI2IRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 04:17:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64631AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53406799540so12024097a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695975466; x=1696580266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm9WOtxBCPM3Yn/lK15TeRCQSRheb4lkHQZlX4Ty2GE=;
        b=G8iiBj8i+miDWCMG5WNBK5wxogmHOByk1LuD3aNObX4TvzWkJaCwDV3uDaiz/oGeuz
         LmCJjNzVxF5bi0X+Ahvu4YhpR1kiOy5ZysgchBM84Faf6uMAq9cKGSUum07mvGl8Iffu
         lRDDueCPhjjYOoGBUMAmpoHpgQ2BF0nQCmr3IfiAuUZK1Aixy/KGXpcpNuQU2BQAmwRx
         FydKpRQcaPQ8LxKi6ZyiWf+cM9LYN1CpWmiWq82YD5vbCtAtoqUZPALAuGloYnq3qkNa
         5SvAvlakxFOTtfNSjWVc8M33rgqNr23pfjmWAHT7rzeaWKoBNTP63v+fmHpUYt+EJt7l
         vHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975466; x=1696580266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gm9WOtxBCPM3Yn/lK15TeRCQSRheb4lkHQZlX4Ty2GE=;
        b=a7rRQc/yAELZ8JR2rHevgb7e2W1U20KK15QGELdvtE1oTAX0A/yG7yJ8Mxv4/yUNZH
         cyoggNNjGOtHbiX7OCaEgvSLtRjLe7dt5BwwL98sX8INYxRAcM0k1xIp4iQf2WTg1Pqe
         08QRdYHE8Q2qF2HLW8YBSG0z5rZLZk2fb2jReR9VrwYKo7jDvyl1131AfAnUpCO6s8fb
         M5tuFuF5AKGUgNgdyEv/KYjxjFM0kqxE0sVU4G81rqG9gfx6uI7TXG0laG9TwnIxhUKR
         7/RLvEL4VIbxV7m1tuWdAhm/drWXpUSwmZhxxjVy7XnKUyla1/V5vD4LtiSzU1MF+nRu
         Nwqw==
X-Gm-Message-State: AOJu0YwvW5JJ//HceFNEc3L5s1RMWC2SX9pVP2ulKAMkaoTTh0IqKpK5
        szb4N0PCP5/XRMqKXSfJRB4muQ==
X-Google-Smtp-Source: AGHT+IGINqs5nJ8KMqVtQEztg+OrPreyXl50J3r+XObF8O0aLsRDQu1o0rWUe/zbyC8FBt/WGp6twg==
X-Received: by 2002:a17:907:75e1:b0:9b2:a769:8afc with SMTP id jz1-20020a17090775e100b009b2a7698afcmr3002090ejc.77.1695975466085;
        Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm11873803ejo.118.2023.09.29.01.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:17:45 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:17:38 +0200
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: Update gpio example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-pm7250b-gpio-fixup-v1-1-ef68543c1d3b@fairphone.com>
References: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
In-Reply-To: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per commit ea25d61b448a ("arm64: dts: qcom: Use plural _gpios node
label for PMIC gpios") all dts files now use the plural _gpios instead
of the singular _gpio as label. Update the schema example also to match.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 55e931ba5b47..e4842e1fbd65 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -245,7 +245,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            pmi8998_gpio: gpio@c000 {
+            pmi8998_gpios: gpio@c000 {
                 compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
                 reg = <0xc000>;
                 gpio-controller;
@@ -330,7 +330,7 @@ examples:
             };
         };
 
-        pm6150_gpio: gpio@c000 {
+        pm6150_gpios: gpio@c000 {
             compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
             reg = <0xc000>;
             gpio-controller;

-- 
2.42.0

