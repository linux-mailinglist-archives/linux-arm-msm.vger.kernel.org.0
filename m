Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F26D73D970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 10:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjFZIQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 04:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjFZIQS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 04:16:18 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770D095
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:16:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991e69499d1so21090366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687767375; x=1690359375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzrG3UTQMv24aqqyJ4HuHcMxqLMgWVT3rshhNA4f4yA=;
        b=AujfvBqUOERGZYcrtu35naU40C2xZtvAxwYUyprrz9GGpKUikKYkuO/cT+ENo6uAS0
         ++9QHTIrY0XlgtSVlKcmj812+aYHQIZtsCCXpNnkX4VPqKVgsD/+2N0a/AN1eHEyZmvw
         uGuenuFXo7ZUrN078schSxTrY+8ry/BzduSXodfy2XZ/vvGB4D0MVlxytUYEhcPWj/qg
         T/348a9anyrLsF/sz5vmkLVRC0/TyrxkQlv3xYJXek9UhSzqeulTCNJ62+2XTCEfxycR
         o7M0xL4phPnRucrcGSr4Hkk9A2mcSQ3hvpPSE689sweXkBb1CbCskBWfZa60v1oRLUvU
         Rvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767375; x=1690359375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzrG3UTQMv24aqqyJ4HuHcMxqLMgWVT3rshhNA4f4yA=;
        b=RqGt+k33hvHnuVL3C9PjXeoIZZ/bBPQ5CyQM+oRF1xnQO8VUOmk/0F9qCh7zJrDqPh
         ik5OZ3Ll29JvvM9MO98DLLQpJDuhoOl1E4u/ITc0MIln2l1qnaAD+99ZwAf6FUf2zC52
         F+GB2B3xcrKM4Xyk47Jp1/a0Ohq61FTdy9FZ+hSI+xjtOOYgkS7vgjU7pRIVWH2hGv0I
         mEkRpOOZmxTKaO/VtBLbGokqd1p5Fq7ikDv8z5Gn47EjDJKb2J+FzDLQO3dmHHggx4xW
         XMambplnlyJtuG5dBDW8EnFJEjOW42BHgtVSFG7Wi/+oAuxMBcGipfFchqSIMIMkecJa
         o7QQ==
X-Gm-Message-State: AC+VfDwH3fx9GFeUcgICUaQMcNjuVI+iDJee28cWbvE3tPukz0eFsH0F
        8QlNIhyBwSd3BfTkv5XPYlE5Fg==
X-Google-Smtp-Source: ACHHUZ5F9fvoXgjhnq9skj8rdwunM3W0BZNCjB4r1eGM7eWvK9W+EP+t99/yg7EAa+Ho+4nd24m56g==
X-Received: by 2002:a17:907:6d20:b0:991:edf7:4115 with SMTP id sa32-20020a1709076d2000b00991edf74115mr247285ejc.2.1687767375026;
        Mon, 26 Jun 2023 01:16:15 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b0094f07545d40sm2935617ejb.220.2023.06.26.01.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:16:14 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 26 Jun 2023 10:15:59 +0200
Subject: [PATCH v4 3/3] dt-bindings: ufs: qcom: Fix sm8450 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v4-3-14ced60f3d1b@fairphone.com>
References: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Eric Biggers <ebiggers@google.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
bindings and the example to match.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Iskren Chernev <me@iskren.info>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index b5fc686cb3a1..04baa98bf7e4 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -119,7 +119,6 @@ allOf:
               - qcom,sc8280xp-ufshc
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc
-              - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
     then:
       properties:
@@ -150,6 +149,7 @@ allOf:
               - qcom,sdm845-ufshc
               - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
+              - qcom,sm8450-ufshc
     then:
       properties:
         clocks:
@@ -275,7 +275,9 @@ examples:
         ufs@1d84000 {
             compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
                          "jedec,ufs-2.0";
-            reg = <0 0x01d84000 0 0x3000>;
+            reg = <0 0x01d84000 0 0x3000>,
+                  <0 0x01d88000 0 0x8000>;
+            reg-names = "std", "ice";
             interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
             phys = <&ufs_mem_phy_lanes>;
             phy-names = "ufsphy";
@@ -303,7 +305,8 @@ examples:
                           "ref_clk",
                           "tx_lane0_sync_clk",
                           "rx_lane0_sync_clk",
-                          "rx_lane1_sync_clk";
+                          "rx_lane1_sync_clk",
+                          "ice_core_clk";
             clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -311,7 +314,8 @@ examples:
                      <&rpmhcc RPMH_CXO_CLK>,
                      <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
                      <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+                     <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
             freq-table-hz = <75000000 300000000>,
                             <0 0>,
                             <0 0>,
@@ -319,6 +323,7 @@ examples:
                             <75000000 300000000>,
                             <0 0>,
                             <0 0>,
-                            <0 0>;
+                            <0 0>,
+                            <75000000 300000000>;
         };
     };

-- 
2.41.0

