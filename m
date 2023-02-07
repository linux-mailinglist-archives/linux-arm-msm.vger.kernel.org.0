Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19C668CEED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 06:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjBGF2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 00:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjBGF2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 00:28:34 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E2123660
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 21:28:33 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id r192-20020a4a37c9000000b00517677496d0so1322394oor.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 21:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LZT5UqZL/4spyb4nQBTM+1EEn8n81bydAtyWcmYTa8=;
        b=nWEuSWJuoU4uTeKtMWdUTK4BktXnZg1Ds96UmMNyFTL0oe+Z6vz1u/K2VmavcRVEMs
         JbCF3sUAg8WsED0egHoV4VqEdkvvT4IUh5avtKeSHrZQGFMgbgG4xsu2xh7xOBM+rQHX
         AWGR7kO+T5GrgqTW+7LYChBQTPERx9fa5i2JcRwKQWefAUU986urHoIAW3WIXlBIrNQv
         IqiwQ8McjhH8Ar9dC0HJaBD5HVPkWzM/hInsoWDirbCxETvLTZQw6+RD6YkI6XK37fIb
         JjFkbgLOpBaPWo/+k2QJNuUuTjVl6XEnMvbR276Nkc5oihaCxNUDp/84/rInGbk3ZZZi
         gdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LZT5UqZL/4spyb4nQBTM+1EEn8n81bydAtyWcmYTa8=;
        b=EHCYwDdtlJJ9ZCVmL441Ug8CZyIMll1KFUZpHdjJRfde40gJs+5voJj7/88XeMTdKQ
         xn7TlDQOFqlgTsRQpbkFCjFhf6XKVaTJteTqpFpz4mscY2Y1TC7ZRw6fE+ry5+613uno
         Hbz4VOZv/RXtVxNA+PdE2JFsQmNDR3bbW3DY8eBP0zzvDP4ggQ6YBzriD/bU+OejEK9S
         8FLlFBPEWVK4HB8jeaNWWEvj9cVWMLrGNMFPTIBE5ng5pIv6tJegh4oPt8tYyDqv/FcO
         5gT61cq3cz448NOGhwhqOobKOKWvxQKqZbqRYVAM/f9+ocgiUBr7nqRwSO2XkfDa1+fw
         umbQ==
X-Gm-Message-State: AO0yUKWm2ODf8zD3XxHqNakKd7s1r2D7G9X49krDs5fNB4N9rxGWkY1a
        QNyiazDG8whTQyYTi2DYniq13A==
X-Google-Smtp-Source: AK7set9dKc2GjLZcBjIzabDjcJDyhqapS5wfQJJRL3j3AZKy0mBUDOtr2fmDvHHlO/XHuHkyfCCimg==
X-Received: by 2002:a4a:3347:0:b0:51a:2ba5:4356 with SMTP id q68-20020a4a3347000000b0051a2ba54356mr866061ooq.7.1675747712780;
        Mon, 06 Feb 2023 21:28:32 -0800 (PST)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id 1-20020a4a0901000000b004fb9a65daf1sm5531339ooa.43.2023.02.06.21.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 21:28:32 -0800 (PST)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v4 1/4] dt-bindings: net: Add WCN6855 Bluetooth
Date:   Mon,  6 Feb 2023 23:28:26 -0600
Message-Id: <20230207052829.3996-2-steev@kali.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230207052829.3996-1-steev@kali.org>
References: <20230207052829.3996-1-steev@kali.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the QTI WCN6855 chipset.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---

Changes since v3:
 * Separate 6855 enum because we don't need 9 regulators like 6750
 * Drop Ack because of changes

Changes since v2:
 * No changes from v2

Changes since v1:
 * drop second binding in subject line
---
 .../net/bluetooth/qualcomm-bluetooth.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a6a6b0e4df7a..68f78b90d23a 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,wcn3998-bt
       - qcom,qca6390-bt
       - qcom,wcn6750-bt
+      - qcom,wcn6855-bt
 
   enable-gpios:
     maxItems: 1
@@ -133,6 +134,22 @@ allOf:
         - vddrfa1p7-supply
         - vddrfa1p2-supply
         - vddasd-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wcn6855-bt
+    then:
+      required:
+        - enable-gpios
+        - swctrl-gpios
+        - vddio-supply
+        - vddbtcxmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p7-supply
 
 examples:
   - |
-- 
2.39.0

