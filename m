Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E43680E82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 14:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjA3NIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 08:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235534AbjA3NIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 08:08:16 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEA82ED43
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 05:08:01 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so8127410wmq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Se5Q1lXw9K+Pz2pZOS2n30yDozh7nMIeUh0ec9tbew=;
        b=sYqkr9eqZ0fdxEVtcBLHAy5FfbUAp/4Dsxxuvd6alsL9M67rKWmCLdl1LxFH9debQg
         d3kfUYXnQzX9UE3tW0P9hIWpYc0X8IY4pccYCoQy6eLfXZEB9X/03KtRhbxWxLaWSbxh
         XHMVnDvJU5xX2qjHLN4SApu3NSYBRaWFsmDP6GXAgJMTtE5jS9uXRfWMop3JO1v97a1A
         kXuXZzZSVoqLpFWLEnokjmj71dCa79fpVHfPBUGEtHyapRnOATYxNIrjaHd/cTjH7uw6
         SUZpq/NZPF1bDP/94tz5hkHz0d699Iq6M8JzCi6e3nSRzz6f3wiN3DPcbaU72OfgwQ88
         2YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Se5Q1lXw9K+Pz2pZOS2n30yDozh7nMIeUh0ec9tbew=;
        b=FinfFiUs0gGyCLm6F142rzMRUH+uX6Z5scpBgU6Y1+7vuykM41dTg+Sa/yNI1CEcEb
         Q7WE+6AUtoW35dz5qANwU22PcacvkSLIUNaLfMZqdrra/eEmSKY4JpOwQcOwxCJyGIMC
         DhYM4C6C0DUVkrBmEU+VdVP8fcdzD46Ex3RoI5t+z+1QN6Rn7jUy2tFV1mc+W4hP0euJ
         eo/DDvR0F7LHYQmuUeow27THKJZiQEzHayFM3/z2ja43Sgdohj2kaRAoXSDRJ9GNibX1
         024NwtlmyUCuo9HKYnz/Ur+EkE569dMfdtJQro1TGIcsP8l8U+g8MLgaz8Ceg4swzBY0
         yZ8w==
X-Gm-Message-State: AO0yUKWg6rJFX+73LpljhdKQnWLAP3+oKg+GnvnKa4HDDKkrl1j7YlCi
        igPR2ExydLNUNyr+ynkQAzoAtA==
X-Google-Smtp-Source: AK7set8GSjb0s93vkK1fliYHVJS234DkIT5hqqeHwHaj3yMD9zznVEh8poWvWYbSp0ttOIg1ksF6/g==
X-Received: by 2002:a05:600c:1d12:b0:3dc:58a6:bbe6 with SMTP id l18-20020a05600c1d1200b003dc58a6bbe6mr4007541wms.31.1675084079443;
        Mon, 30 Jan 2023 05:07:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b9a5:a1fe:d3ab:6b40])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b003b47b80cec3sm17776021wmq.42.2023.01.30.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 05:07:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: add qcom,apss-wdt-sa8775p compatible
Date:   Mon, 30 Jan 2023 14:07:56 +0100
Message-Id: <20230130130756.144160-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the sa8775p platform's KPSS watchdog.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Krzysztof: I'm now adding any link here as the v1 of the sa8775p DTS patch
did not use this compatible and v2 is still WiP.

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index d8ac0be36e6c..27fb484d5f8d 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180
               - qcom,apss-wdt-sc7280
               - qcom,apss-wdt-sc8180x
-- 
2.37.2

