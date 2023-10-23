Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01477D3B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 17:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjJWPin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 11:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjJWPig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 11:38:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B74127
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 08:38:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so50260921fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 08:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698075511; x=1698680311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/dkqG7TFqhS22WCtOJCYFAnzbujpg+JGXvYF9Z8Jtw=;
        b=qWTNjPXBXo02bg2JHbXcWVUvQi6uUlqULZ4dp/6ehrzn3gZJ44BxqzyYbkjS9lZd4m
         eqJbN3ArmiAJhidSJuggjX7OrQmw9udwlQdfXwmXBN8SzDp5dDGT8abNR+5SYQVxnzAZ
         oqUThjzYBHxpMftXe04NAbtK5LYRTuIvixecYgfP/FMA1HnZ+ot4WOyBspMQgkXQeMLh
         PL/lg07mLYfiYU2yXIthAKnICyUXPJ2GXE51iG2Z5rwrt45Wi0u3MkSH51gMoXDPBsfj
         W6Ql6WuIamK8yeG9fNeLsOgifZuWHl6ORLZwUTNveXbfMYmAe9Z6Yw1xPdGKMuJHob+G
         mv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698075511; x=1698680311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/dkqG7TFqhS22WCtOJCYFAnzbujpg+JGXvYF9Z8Jtw=;
        b=qPzFA5lCisi/GmufSLYabT+ZeWltHC7jdgfLeBfd5wLaJm7gmSsWgldrinWgGU+UX4
         z+d/NRwwQV68iNB2zAceAT0fQS0MZspTYU4/hibsbDKj7T5m7bOJ4rGslgy1tgFiECO0
         nqkTvh/zn3fZ2e9eAJbQz6NY8UTA4N/4+WfXixBjesEJPVC7cLYJK9ol00rzePnHnE78
         ot7IVuh0ANgbk+ovaC78dJNk3LU87T1r1TrOyHsacSdTvgs7OqCjhjj9RP7wUiein72F
         GsvMEJ1WZ0FgDpRGe7Gb8l+1Yotj7a0mH18SqBubYBy10Km9Y9LujnCeyVKPFPaV/7QP
         OZ5Q==
X-Gm-Message-State: AOJu0Yz1hxY48153TBxbzaZuoZRE8k0MGSYZ54PTC+dtC4KyyuMMzX83
        +xSo0LVwXjF6WOvdwTcqH0gALA==
X-Google-Smtp-Source: AGHT+IGngUR8rAtE5PrJsk2wr4hxv06C9qj0fa4jQ7I8UYFXCU2Nwn1OFEnlZtFqOWcVgZkXoUM5mg==
X-Received: by 2002:a2e:8619:0:b0:2c5:1989:ce1c with SMTP id a25-20020a2e8619000000b002c51989ce1cmr5983085lji.26.1698075511078;
        Mon, 23 Oct 2023 08:38:31 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d50c4000000b0032da319a27asm8096929wrt.9.2023.10.23.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 08:38:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3.1 4/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
Date:   Mon, 23 Oct 2023 16:38:21 +0100
Message-Id: <20231023153821.189331-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231023153821.189331-1-bryan.odonoghue@linaro.org>
References: <20231023153821.189331-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
similar to most of the sdmX, smX and now scX controllers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..fafea0f34fd9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
@@ -3450,6 +3451,20 @@ usb_1_role_switch: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sc8280xp-camcc";
+			reg = <0 0x0ad00000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sc8280xp-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.40.1

