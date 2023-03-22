Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3B26C3F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 02:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCVBOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 21:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjCVBOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 21:14:47 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4765551B
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 18:14:46 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q30so5459561oiw.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 18:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1679447685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gTZseNIfPdBe/0NuqBE26CCNGdGPf26kM9+Ru7h+44=;
        b=TrH+dk0EXzS3HGqqtjcqdZ4Fubti3ErYYie0R2TMzVWqXr4cDCdjBiwIO6eeiGxd0G
         Mm6mflQch7aa7Y4bgl7rhsTPVGNebZvk6GOyR23wGV2pJyp0PvQQsNBN0FEkopFuZ3Ed
         AVS49QTNG5CvYlSB+VzEv+7s6tQJazV+mM9EUsdsw3Tgj01ERc4DrfBw0HuJLOqPIl8N
         9K659i+HGMW8p8KZOVpm/bzdNmdM+WYgqFdcQOM4KdgMA50VgrzKGtIbbi7dyT8rBo+o
         XYhkH5eU4i53EKcaCNVW6Ozq9Ve3VuGvEyCC7Oz078ioMvee5xOywtGPdQyIEK0joc3r
         TOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679447685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gTZseNIfPdBe/0NuqBE26CCNGdGPf26kM9+Ru7h+44=;
        b=C87mycwY7yrbLAl+qTh7ZE+3MbhtIuZUbEXzIfZuHPcI0nIzCECavBOC3gaUidFwbe
         3ebUAMNqqPRuWWjs4qszQPbWs2mhRK2ghEwxBQe6tcI/zVjpF/X2FyWU8oJVsZCr2X8b
         CUVxaJMRin0JZrkZ45n/3vpf2RJcbAvzil98fXLjyTG2Qf8zNBPZ2REQgva/i+qH8gqu
         Zl+bjYI0U9J4UYpAQNa9oL8SbmtclOV/vNQNhADFFA5Fj1UcWMSOkXEvNHFxRltzuaZb
         3Rnj/D3+YHfNrbwn1X5XfGaN778v5/ie7cTR3Og1PZhvphULb7Tszbss2qz52OPn3VGr
         84wg==
X-Gm-Message-State: AO0yUKUAqKDcUwcvqlJ6k3YmIkUmLeaVHlcCo5iytcMM8kTIfT8B9ALe
        cPlbKcuD7NsMGGSMFn/57HXGfA==
X-Google-Smtp-Source: AK7set+gB17zX+JyMlvxgHvJlgFOOvTWlXwtbz30b6VRPvN7jPpWC9VC/NSloAstlDVcGDg2hkeMkg==
X-Received: by 2002:aca:190a:0:b0:383:ee1d:f489 with SMTP id l10-20020aca190a000000b00383ee1df489mr590575oii.0.1679447685426;
        Tue, 21 Mar 2023 18:14:45 -0700 (PDT)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id e13-20020a9d63cd000000b0069f9a73a65fsm40505otl.29.2023.03.21.18.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 18:14:45 -0700 (PDT)
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
Subject: [PATCH v7 1/4] dt-bindings: net: Add WCN6855 Bluetooth
Date:   Tue, 21 Mar 2023 20:14:39 -0500
Message-Id: <20230322011442.34475-2-steev@kali.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322011442.34475-1-steev@kali.org>
References: <20230322011442.34475-1-steev@kali.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the QTI WCN6855 chipset.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
Changes since v6:
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
2.39.2

