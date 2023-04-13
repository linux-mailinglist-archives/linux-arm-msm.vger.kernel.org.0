Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA3466E0C9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjDMLfU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjDMLfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FC4A5CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:51 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i3so4581566wrc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385685; x=1683977685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=S85O+0n/rIuhvSBM9bIHQDStbL8bpUcvxknAk/vge3Zt0JnQ9iBlKFau5YkT6VTKpB
         1PLdDXQwdbKkTfQ44urjf2kbD76P/umGmjSPAfS703By1cil4Pfga1Wa/JKzydd1WcIG
         spDoPmN4+VaseH/U5fDCgGtLts63kaieoGx0wI+gvAdOBm8Jb7Y+k5CR8/YkYiGnDV9h
         PnlRiiUdHY92nZIJ8R1zIIgFOuAJgrNs5oUplPA/dNyqpIUlR+ovrcaOimd1eZqI1nOC
         Pa4UMzDIee+WJCZAl6kA6q+bp8bYWqwVAgLyt+ybCaRZQnA0zrQT7tWpauVHmHlfvSmb
         Gd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385685; x=1683977685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=iYgme9iHSJtOTf23VCRtwUIhsbg5LULqhttBvE2A0PSrsp9jdKA2ZXovftmCi76p0L
         JVdeDk5oGFWRDOcqcmUiNOwo/OMVtc0PbUSRWH5DnLMpGoIdv40XV9saKJX0sK1Tn9a7
         MBg+1qprpqkFvxoi5Y5+jJUc8cjH1fYCT10HLR1ayd3j1hZxADiebMijdpbVNPuEMNX8
         05Iw4RrWnqPqfC8l6RAKZnvku/40YN2nyLYHCUXvJnnYLki6QQFgiDN9wM1RUTiOQByH
         92KNPhRyPfvLAvEOwXIxtseebcmK0F/J9cLDm9pD3cTkxP6SKZwNZNitCWoA6XNSJAmi
         hQ0Q==
X-Gm-Message-State: AAQBX9d0Redb0FKN9ICbD5BSDq445BclYVHIJsOjmg1t0YLkuS2Cg1ny
        QYWhiP1qdtGFpXABXQZaP/VRzw==
X-Google-Smtp-Source: AKy350ZaM/KCN5TsZEDfIOJ7TwON5dPBA9y/Ba1Hi6gZFpiZqvja66eL5daBBaKwNswW3IlxVq6aKg==
X-Received: by 2002:adf:e2cd:0:b0:2f5:9800:8d3e with SMTP id d13-20020adfe2cd000000b002f598008d3emr1137746wrj.47.1681385684860;
        Thu, 13 Apr 2023 04:34:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 03/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch as optional
Date:   Thu, 13 Apr 2023 12:34:27 +0100
Message-Id: <20230413113438.1577658-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

orientation-switch it the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation change
messages.

Add as an optional since not all versions of the dp-phy currently support
the orientation-switch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d4669..d307343388888 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -61,6 +61,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
   resets:
     items:
       - description: reset of phy block.
@@ -251,6 +255,8 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
+        orientation-switch;
+
         usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
-- 
2.39.2

