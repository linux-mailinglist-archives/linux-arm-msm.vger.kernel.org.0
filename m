Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8982553C7DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 11:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243164AbiFCJra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 05:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243179AbiFCJrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 05:47:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86F613D20
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 02:47:17 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id q1so14874154ejz.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+dNjsHpB7ATpH/qWV5MFMXentqFiCOjrR0y/9QOhAEs=;
        b=tkDkQTLWDnU/7MMzprkcxAw29BEnH+LkSj1ONc/JFnELm3w7cWG7OE3Qjv7V6J1vdi
         mhTTknRKGQaudtX1ZHC638jQpbJ9pzNQf8AwNOErcnl6k5Q0GvTnWgUY28n2S3QHXf1u
         t5ocphgbXHKGjvKAZmNCK4oKQwpS2LFqTbFEdJLMeQfz4/fqPR8KXeQRBko7eVcYDwWH
         l84p9c9mOsqFTN+Sl/sgAosZvme0LUbE1awql0yS/xwjlorLZyNxpJVtZJDRpkyDLueC
         ZkDhis5uIX+Tc7D2EIhkoJBSwTKDP1jgRd4R5GNPLYQULRDz34rWrjUFRUPSs7nkR0Ee
         gBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+dNjsHpB7ATpH/qWV5MFMXentqFiCOjrR0y/9QOhAEs=;
        b=XdjImZ9bVRZHXw74hCF1Xh02vPZ+nPLtj6cdxYmR8vkBcOEBp6gsLSqj6K1W/7WUiU
         Aqy4QFkA3+dTkiT1R0t3ArfPsvJ1je9i6irZVmlc/Z2q0np5DhvmC6MxDjTTCjZMvgfP
         EvTru6SQ9GqqP2Xoc96f4op88Q8Wo7B86q6ANOnVeSHquARyMlQpHN33eyJoNoEX2dMe
         xP2U/7xm9J50bppx5gJw+FokWhnOhvVyHhWoxonXBzhyL+MhLcNOh6Vhh2BdSuk1Gsck
         0GHIbTBuFHGTTAwj+X6IIox5z2zdX0fgQ93F6o2XCnEdXWp9Qj2p8AlKxR/UVb8/y6bP
         qYow==
X-Gm-Message-State: AOAM530XZHxdEek6H3Wa1P9GvJKlbG3aLILKk6wqIViXEq+jm9soBH0/
        W3djNLA3Ki48XdVc9vQ1d8oVifzHr77NWA==
X-Google-Smtp-Source: ABdhPJyHJSDgxB1UFvg0p0jq1Iud89ayDEeekEcB+oS/QciVMHdFD3KOFW3i+Dv5I2bmRQ2W1El/fw==
X-Received: by 2002:a17:906:d82:b0:70d:84d3:b6df with SMTP id m2-20020a1709060d8200b0070d84d3b6dfmr3007077eji.464.1654249635726;
        Fri, 03 Jun 2022 02:47:15 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a15-20020a170906274f00b006f3ef214e42sm2661009ejd.168.2022.06.03.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 02:47:15 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: use constants for audio clocks
Date:   Fri,  3 Jun 2022 11:47:10 +0200
Message-Id: <20220603094710.64591-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603094710.64591-1-luca.weiss@fairphone.com>
References: <20220603094710.64591-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The use of these constants was removed during merging, probably because
the patches adding those defines and the dts patches were merged through
different trees.

Re-add them to make it clear which clocks are getting used.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dc2562070336..fb7a82c3704f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -2188,11 +2190,11 @@ tcsr_mutex: hwlock@1f40000 {
 		wsamacro: codec@3240000 {
 			compatible = "qcom,sm8250-lpass-wsa-macro";
 			reg = <0 0x03240000 0 0x1000>;
-			clocks = <&audiocc 1>,
-				 <&audiocc 0>,
+			clocks = <&audiocc LPASS_CDC_WSA_MCLK>,
+				 <&audiocc LPASS_CDC_WSA_NPL>,
 				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&aoncc 0>,
+				 <&aoncc LPASS_CDC_VA_MCLK>,
 				 <&vamacro>;
 
 			clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
@@ -2239,7 +2241,7 @@ audiocc: clock-controller@3300000 {
 		vamacro: codec@3370000 {
 			compatible = "qcom,sm8250-lpass-va-macro";
 			reg = <0 0x03370000 0 0x1000>;
-			clocks = <&aoncc 0>,
+			clocks = <&aoncc LPASS_CDC_VA_MCLK>,
 				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
 
-- 
2.36.1

