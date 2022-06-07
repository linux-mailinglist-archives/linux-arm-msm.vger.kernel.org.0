Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AED65404C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 19:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345558AbiFGRS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 13:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345652AbiFGRSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 13:18:55 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1C91053E2
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 10:18:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id o7so3267636eja.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6NqSxocNhKaG4qk4NIveSuVUXzSaCSlzdQqklUZykA=;
        b=toKIBfxF1DDsLOVkjJC8AngOOShSW7LZTzWYwvuu1WEAnH9wUf9XUwJhg99w3jzD8s
         uyPFOsHBlgFl1/rE+lQ1O3A/6SkxffPqHzkgpzGmTd1aHaS2IjtCp1EEiJJZz3d2byMU
         4mZjFcuDuVPDcwiSAgbyPDCT4SyXq1AxFymgQHXWQVYf8TFz0UT5KH0GdHkJhJvjYhEd
         Y8SeClym/2ft/NqkxFrAQsImY8H+EE/l9GRoBCBUyqA8gm5Ng2sSAnVu+nLqKK2NLWYh
         fMHbFv0oa1PVVg53Ltt0ow2jqrK9qKMUOaq0rcgWbuqAdcgUuNlM4tfuYSZ2UuIp3ATe
         oJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6NqSxocNhKaG4qk4NIveSuVUXzSaCSlzdQqklUZykA=;
        b=JOnMQudNam5qJXdQBW55Gh3IYngpA4NDnz9V7h31RJQDzUuLHoxyPOhlJuHW+4Ztp/
         rcVl3KGTau0BGDtkrENJzrebNPQHGzdEsZliI8KNc/tsV3+H0UJ06O31M/TiebWeEbCx
         vC4P+4og4ytw5D+i7PejERnystr6S5V5/X3pBxo5patH9jmjMBaaSI8Z5iLtxNFNKe5s
         gbGo4AKGGhQ4P+woxr0VnfnDWuFHDuNAf4liZ+lzkb2hY5ABuRKsKLptugmmLR3LzZYi
         N94vW4SZuuzdGcNCpHNjb920vK9VVzgf0suC6JDR72OeDvkCdKrkojioTa8Z2g4VBBlG
         uJqw==
X-Gm-Message-State: AOAM531w/VsyvyQI6XddbTrwC3TO2wG5zzZo8LPnrtYeF6OMkQsNPfLK
        Vi7giaE/Ok6Kj+IWFfXbaHDPiQ==
X-Google-Smtp-Source: ABdhPJziyEJu6XDIg6R0YDNNr7ghG0UDjqN4KAdb6x7Ukb3SmDHw20QIlGdp6xLiQQivKt9yPTH/Nw==
X-Received: by 2002:a17:907:9619:b0:6ff:5c3c:bcae with SMTP id gb25-20020a170907961900b006ff5c3cbcaemr28491983ejc.585.1654622332368;
        Tue, 07 Jun 2022 10:18:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm5876540ejp.96.2022.06.07.10.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:18:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/14] dt-bindings: sram: qcom,ocmem: cleanup example coding style
Date:   Tue,  7 Jun 2022 19:18:35 +0200
Message-Id: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the indentation in the OCMEM example and use generic node name -
sram - to reflect the type of the device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
index 930188bc5e6a..071f2d676196 100644
--- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -72,10 +72,10 @@ patternProperties:
 
 examples:
   - |
-      #include <dt-bindings/clock/qcom,rpmcc.h>
-      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 
-      ocmem: ocmem@fdd00000 {
+    sram@fdd00000 {
         compatible = "qcom,msm8974-ocmem";
 
         reg = <0xfdd00000 0x2000>,
@@ -93,6 +93,6 @@ examples:
         ranges = <0 0xfec00000 0x100000>;
 
         gmu-sram@0 {
-                reg = <0x0 0x100000>;
+            reg = <0x0 0x100000>;
         };
-      };
+    };
-- 
2.34.1

