Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771316BEC2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 16:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCQPFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 11:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjCQPEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 11:04:35 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033EF145B5D
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:31 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso5309472wmr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yi0KT1ucsEEq66sYgPaMAK5HL55WHJ6vgtRsWKkAHtM=;
        b=z6rd0A/t3reMcWvga3RNcafV9U/CZ05zCcuI9ll0G4RBUoMsJUAKG/tD7jXhcgIX7F
         +bxi8CvTO8cM/yTEemO/Kan4vwpyaxsQ+KLzh3dBFaeiYE4fpjho0YAV3U8haCJrVfE2
         qhhHHl0VYl3BxKpjaNy5ry1dTLQEO/XFwGmnSPv7X2lypJUaPgialAX7ljbt1t8JROZv
         jw4jEFcYfHbMNL8pNBcV3KcdOFl/iDr++DKRSnG7fbOv0yYCdJyi5sMiEiNjV1xWbCKQ
         P/m3m7PkjUFBU7lxVK/IBWDjvhT/JIEkxMfqi9zazGyMXWtgzazPB/7X9T3XroY6FfZZ
         I0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi0KT1ucsEEq66sYgPaMAK5HL55WHJ6vgtRsWKkAHtM=;
        b=b4+MgZtjdjTx3K/xb0qXvdRjcps/Equg2Q8aVzxdbRF3iBtjleAkVXz+tjp643/DIB
         ERVta6Ox4jYB+tysINgTlzdSGSpQvNxtxgyMdSxIpHrOW11y3lHElXzCcy1wgq3XNgvw
         Lnkr7OrkTW1SHGszKuMKRtH0zeJ5C5tQXenQADAm96QYv/oyGxRjjvww/UTStSL/FtQK
         siPGilw6vLT6iN3UPFjb76EINk8nsV/BEKY4gh5llTEIqwmYoYfBsYqTlt2Kin721GXc
         IHta+b5O8xZcQT0laiiIw4oet4KOuKVKCKCk2ITbWnSuZhbjhq0IOukY4OVLToffeQ6z
         cRyA==
X-Gm-Message-State: AO0yUKWIVik5XUuP8nNmFRjYWw1QLNm/lijv9Sal2R4ojdm4XN11hWdl
        bkBMk/73EwR0K77Px1piKyy2Gg==
X-Google-Smtp-Source: AK7set9Y811TRmRMjrFAGFV6qH0WTFKjopJudt4vZb0AJ6lgwJEvDkACYXQIGZngKK25pqYA1uVMyQ==
X-Received: by 2002:a05:600c:470e:b0:3ed:1fa1:9030 with SMTP id v14-20020a05600c470e00b003ed1fa19030mr19464082wmo.29.1679065469489;
        Fri, 17 Mar 2023 08:04:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:29 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:21 +0100
Subject: [PATCH v4 05/12] dt-bindings: usb: snps,dwc3: document HS & SS OF
 graph ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-5-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the optional ports subnode to describe the High-Speed
and Super-Speed connections as separate OF graph links.

The ports property is an alternative to the already documented
single port subnode property.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 16c7d06c9172..cce74c59bf0e 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -379,6 +379,22 @@ properties:
       This port is used with the 'usb-role-switch' property  to connect the
       dwc3 to type C connector.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports should be used with any connector to the data bus of this
+      controller using the OF graph bindings specified if the "usb-role-switch"
+      property is used.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:

-- 
2.34.1

