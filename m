Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC37968FCDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 03:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjBICJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 21:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjBICJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 21:09:24 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3B819F3C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 18:09:20 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id g8so484332qtq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 18:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIypt+WJR6vATpFn1aHucJU2sV9ncXyGiHkb7V566WM=;
        b=VHNZeKLwQDQ/eaYcn57X3IMN//R0pwb46fuEh6UdQ+9Fz3AbnSgjUVCwbRfH8LzBUy
         fcaslPPBvVBK0+u3Q8NsvaeioRCWYIzECAwQOhQgMbDPnsg2D0ov9dwWaoB2sLvvFkCe
         WhxY1vGx4EIc1aQecGuUn8rs7VD0EI4Yz6hEthxHLcrJYbpRb+6IqI/qVrEp9vSLFTDx
         fg/kjJYWqNyg0T06ZsNXNNA1AYUbO47ervi707QjZPAOkM3jXkU828N89+HgqrGQQAwj
         SgDTqpx2XXYiOEbFXitaqv3L0Ledx5oJcMe3fLvwp53s6HlSooKUuxLP1oYhP1cTtND8
         twEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIypt+WJR6vATpFn1aHucJU2sV9ncXyGiHkb7V566WM=;
        b=1NJGz51iWnhjw34OLIZ30mbqZhku5/T9bVm5+sGKXl1qh+84b7a57klsh0zY51LGbl
         Qu6sIjnBOvkWXVzVx2BsN+reIlD6pT0pK1XjSje1+/6g0UutPx/foBAI931tsOwiZO50
         klQySMnq7C80D4cGGlTd5Zm3Cem4WgqofQU+Kb2jDvZ/tkJU29XBPJ6eIlvyHrsuBGWj
         cdQcqZiwB5aDlVoKzrbtN0+yDWe0rPvAELwFaGWjel0Jvln0/YuZZ/BB/8pJL9D36Imv
         oz4qAIucDeToYAK9C9iBtNJVKSOnybUM8D5NSxkzQsZ29YgwWBuukeSJa3a4pXMahExw
         1p6w==
X-Gm-Message-State: AO0yUKXWPxDCS+qDkdFFjm8l1g1vSO6vEFWu2lOBq6Pq1EVg8z7QP0Z6
        RPvG7fIE5SFeg50bc9eHVrzkHA==
X-Google-Smtp-Source: AK7set8Px4/Z7X7uWmjjepGWM/XhrUYQ9EFwyBj5n1UifquTO/qmYtLuqyPRhQkYesxV7pEnPSGERw==
X-Received: by 2002:a05:622a:651:b0:3b6:3a7a:d3c8 with SMTP id a17-20020a05622a065100b003b63a7ad3c8mr14909987qtb.17.1675908560006;
        Wed, 08 Feb 2023 18:09:20 -0800 (PST)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id d64-20020a37b443000000b0071f0d0aaef7sm367930qkf.80.2023.02.08.18.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 18:09:19 -0800 (PST)
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
        Mark Pearson <markpearson@lenovo.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/4] dt-bindings: net: Add WCN6855 Bluetooth
Date:   Wed,  8 Feb 2023 20:09:13 -0600
Message-Id: <20230209020916.6475-2-steev@kali.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209020916.6475-1-steev@kali.org>
References: <20230209020916.6475-1-steev@kali.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v4:
 * None
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
2.39.1

