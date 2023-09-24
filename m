Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCA17ACB6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 20:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjIXSja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 14:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjIXSj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 14:39:29 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EDBFC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:39:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so57714675e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695580761; x=1696185561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wH0YvnQ6jYF96S32ROkmjHWrFGPo6jeHbTrwGY3q+c=;
        b=gQRtcWNs/cGrHMvV3Y1tE74aeOwAwsUxfYNbKtOS+BQ4MqEC/mppx4zLx2iPI3uInG
         Cd5Mi1aRAakqr6OlIJ7senBvfIMi786QKs6JSwm6ojq6l2I/jiQLTnW7v76v4yAhbla/
         G4zgM1s6bpJKk7185w8ThCuioCRKUzJSifKmGxtNtEWHEZ5r1735/0KVyq4KZ5TEAGK2
         /NkM+aXpWkmSqQtQd8boQncINyl09gNhcxgx4Wsm9kbwHeZPbD39ZsETrfWShD/srXUT
         Jd7G/XmEYOigOjk9l7Vk9nReTo4oOiOO9tgC7qj6Z4039M3RcKCYQ8d++5A+1AflFIrC
         xWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695580761; x=1696185561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wH0YvnQ6jYF96S32ROkmjHWrFGPo6jeHbTrwGY3q+c=;
        b=b8EESm2SYN9dS++hPRRGPBqWP1me2R4ljanYJmrFAUkKJfTdYZJHKILBAPkqiu1DpO
         s/JfZCWv6vOuqx5snNYrmfQQtJolJSFOk/UwiTCKvC7nKo6ggVQBFnG/GhmxH1fE1y11
         6CYnQn/tj87xvDvZ9gwoyTgaokV8cGnmmEooiZ86ni/V/oJScdfOy5zr7sH7G8fsgezo
         0sRn0TAEaHxZqnPuEYohAxcSWN7h94Gc4jEoV2dpDsSmf/5RS21sn6aAifGuassFsuQw
         3/X87yxjWibC3jytaHdzo7LuY1U5howSLOwoh/B5tV9+p7yp0NilBTWcYpcVH2z8ddo9
         zhbQ==
X-Gm-Message-State: AOJu0YzzgER3D+n3V7KEk5l/suPIPNYdpq5/cuZYutndabW+mWZbY7vn
        18cieiNUD92PahKujVwCz6aAoA==
X-Google-Smtp-Source: AGHT+IHCYmAWmcznj559KirBLhBzR+i8/f7MKpHRODcKELxTE0B2hw31PjM19Y+vN7jeDMI8BwxFqA==
X-Received: by 2002:a7b:c8d0:0:b0:402:fec4:fddc with SMTP id f16-20020a7bc8d0000000b00402fec4fddcmr4262928wml.17.1695580761727;
        Sun, 24 Sep 2023 11:39:21 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id v20-20020a05600c215400b00401b242e2e6sm7570446wml.47.2023.09.24.11.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 11:39:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 3/4] ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
Date:   Sun, 24 Sep 2023 20:39:13 +0200
Message-Id: <20230924183914.51414-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org>
References: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org>
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

Fixed regulator put under "regulators" node will not be populated,
unless simple-bus or something similar is used.  Drop the "regulators"
wrapper node to fix this.

Fixes: 2c5e596524e7 ("ARM: dts: Add MDM9615 dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index fc4f52f9e9f7..63e21aa23642 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -47,14 +47,12 @@ cxo_board: cxo_board {
 		};
 	};
 
-	regulators {
-		vsdcc_fixed: vsdcc-regulator {
-			compatible = "regulator-fixed";
-			regulator-name = "SDCC Power";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-always-on;
-		};
+	vsdcc_fixed: vsdcc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCC Power";
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-always-on;
 	};
 
 	soc: soc {
-- 
2.34.1

