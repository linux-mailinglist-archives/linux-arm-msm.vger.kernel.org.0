Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02597B4BF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 09:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbjJBHAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 03:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbjJBHAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 03:00:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1552E0
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 00:00:19 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso2328460866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 00:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696230018; x=1696834818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktFRr1CyTGjJizjBCavkn96vmdNuVPfuYSai3Lj20Ho=;
        b=A8rTHl0bHs+fQRldcQ2EKRUpzMdadYZwDJJBbKmb1acAmtTL6s56RkTMynTuXRjW4q
         NJzre3dW/lyhnPmR4x6oLoyjwNfY5r24iNX6vRsR1HGq5CdO6tFJn0Am5JeVFC05ycfK
         iTvNuAUT1XyuVIqEhu3q5lfj1JW649Wn4Ld+EIXSc2t28q3oJ2ghc6YtcvuvrhttxkRd
         8k4X7MY/JMI+kqeD4xO1gd/kjglvyde4Wc2VWeD+t+FuKtXJc/1kIkcQUfOAZNgg+LZB
         3N3ri1Qugg8Bm7GiOoEU0l3reA2QcuTWv7h3sf5JduTReMpMgWIcvcumlYo6pppCQ+HC
         wKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230018; x=1696834818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktFRr1CyTGjJizjBCavkn96vmdNuVPfuYSai3Lj20Ho=;
        b=VcjmsJzk9CTn5078be6IMOC5/q3NU4gK6wz5oxCAEjgu9Nw9A1vEZcpxr4Kklq43z1
         zBMD+Pcf36nrDj9jxnn2XwKlalWpOwwMnxcH2rRyPIkuXDY48dxk1iOhciXyttyk66Rg
         wLLpupxrvRaCF6rUP1b1XAcr/1SlVGnDUaPLzQCcbYlT3B4c/9YQw4eOTTCuptwrzGEF
         zBUngz4WRUVNOIMi0iXX5Ytp1alWgyg3wHUNv6A2GG2HUTg/D4SOgfD7AMgbReJBw5L5
         f36bfjItpmFzNLbkaMfwV1K8QF9ierdU9uhU48Cym2b6+G6hQxsJP83bDySumUHTUa9F
         WpUw==
X-Gm-Message-State: AOJu0YxOnZPAPNQwmErUtJ5eRSXHkUUNE/sKSPJ3jK/iB/Wr8Ap5Lg2x
        D5FGC6Z7PbvMcEAov6paEUYWdg==
X-Google-Smtp-Source: AGHT+IEJS20GX9/Mz9Z0qBVhL4ZNvgD0cSbmWS3xm8ggW22h2lQIbSpD0NnWIB2Ep/fOKv1woD89+g==
X-Received: by 2002:a17:906:cc15:b0:9b6:53a9:792c with SMTP id ml21-20020a170906cc1500b009b653a9792cmr238046ejb.15.1696230018260;
        Mon, 02 Oct 2023 00:00:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0098ce63e36e9sm16692013ejj.16.2023.10.02.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:00:17 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 09:00:11 +0200
Subject: [PATCH v2 1/2] dt-bindings: mfd: qcom,spmi-pmic: Drop unused
 labels from examples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-pm7250b-gpio-fixup-v2-1-debb8b599989@fairphone.com>
References: <20231002-pm7250b-gpio-fixup-v2-0-debb8b599989@fairphone.com>
In-Reply-To: <20231002-pm7250b-gpio-fixup-v2-0-debb8b599989@fairphone.com>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's not much point in having unused labels in the binding example,
so drop them.

This patch was originally motivated by ea25d61b448a ("arm64: dts: qcom:
Use plural _gpios node label for PMIC gpios") updating all dts files to
use the plural _gpios label instead of the singular _gpio as label but
this example wasn't updated. But since we should just drop the label
alltogether, do that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 55e931ba5b47..9fa568603930 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -239,13 +239,13 @@ examples:
         interrupt-controller;
         #interrupt-cells = <4>;
 
-        pmi8998_lsid0: pmic@2 {
+        pmic@2 {
             compatible = "qcom,pmi8998", "qcom,spmi-pmic";
             reg = <0x2 SPMI_USID>;
             #address-cells = <1>;
             #size-cells = <0>;
 
-            pmi8998_gpio: gpio@c000 {
+            gpio@c000 {
                 compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
                 reg = <0xc000>;
                 gpio-controller;
@@ -330,7 +330,7 @@ examples:
             };
         };
 
-        pm6150_gpio: gpio@c000 {
+        gpio@c000 {
             compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
             reg = <0xc000>;
             gpio-controller;

-- 
2.42.0

