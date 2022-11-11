Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBFC162566D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 10:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiKKJRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 04:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbiKKJRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 04:17:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A88617E32
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 01:17:43 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p8so7432127lfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nPlbKpBD0wKljEf7tisLD35jOw8oky/FUJbaNHDXDIU=;
        b=FHcbu6fDH/RFtvqwucotS+pvyGY/Xx9aapd69IoMT+MqjxmKgCMXbER26Dwea+sPzL
         +n4ysAVthsBSBw7+errjtRHSiCe+ay4wpku9H5qyWz2ZcES0nMt4niN4x0POIRG04Eut
         LY+Nm0fZOOE2t5zOXodf3JutS9I3c4MMUg3DH1ezQDynvzsCR5bLgGVlxLfGpnI4++ln
         ASZ0Ga1ixawq0SpZX17qWyRxTTleKPyGFRpniqE9B2QRJYtcUnDTa1wrnQiPHjpAryfN
         QDfzz5ht7w7vnD5tsnhxN53K1/8qMdBD1cahrmxXjpEfirDXEnYPqrI0HYTnv9ySPqJL
         4cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPlbKpBD0wKljEf7tisLD35jOw8oky/FUJbaNHDXDIU=;
        b=HXCO+WapU2DnDhkk7Q0r4JV9xBtDKguGgqqpLkEgbJY6AhNwp6QmqXHbZFnySoWKCc
         KhDp7JhaXdk0bX2eT51I5b5zp4D3OB6MwCd/MB6mckuN5ZybXADwAk7utGFKvjGQWGZF
         T5CvcoazYgnuF/z5MeutEVCxQTWQjk1e981/ufUP6myXWFewpFJyU7AKylvv9l9Izbjq
         leMFLbnpNxE4H+TPJE9NMfy2w8QfMBkp4XBzwOywuSuw8LqHxZiABlqay5Ky6HirUKIl
         o9LUt8AO7UTMvG1c97oWw0a8kdaWcthoyOhAP/KPmUs1llyWThc9Cz9hO6LTW3MdZlNb
         dJ7A==
X-Gm-Message-State: ANoB5pnHjXsAHge/JuOd/J6Q5gpdIhq/dULqYstUwTuFI3QSeJEQ6tZZ
        2nfP4JcpATAaAstuWM6jb9z6RQ==
X-Google-Smtp-Source: AA0mqf6IvaGdXlTe2+QL7qgXki4ORVbtUiaQ0mEhBXJKSWWq7k50zwCSMCisOJGWTfKz8eLqFXzZ1Q==
X-Received: by 2002:a19:f704:0:b0:4a7:7d62:2807 with SMTP id z4-20020a19f704000000b004a77d622807mr537837lfe.77.1668158261582;
        Fri, 11 Nov 2022 01:17:41 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25e31000000b00498f23c249dsm231756lfg.74.2022.11.11.01.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 01:17:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,wsa883x: Add sound-name-prefix
Date:   Fri, 11 Nov 2022 10:17:38 +0100
Message-Id: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

For multiple speakers attached, it's useful to give them some name.
Sound core already supports this, so reference name-prefix.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 99f9c10bbc83..f3fb1de93ba2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -15,6 +15,9 @@ description: |
   Their primary operating mode uses a SoundWire digital audio
   interface. This binding is for SoundWire interface.
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     const: sdw10217020200
@@ -35,6 +38,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg
@@ -61,6 +66,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrLeft";
         };
 
         speaker@0,2 {
@@ -70,6 +76,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrRight";
         };
     };
 
-- 
2.34.1

