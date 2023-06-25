Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E486C73D3FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjFYU0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjFYU0Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:26:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15542E74
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb7589b187so206818e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724766; x=1690316766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/gIGR5p88bRbqFIR3bdructdjZtrGeYMyqpAN9LK2o=;
        b=Hr4NYCYDh9Ejr8ZwKjAjGQdntwzW7Z5jEqehZ8+GoP0hJ1WR/H99CzIIfQzFh5EE1X
         pi7LGA9BnB2BcYfD8Tk+Kj52cXQqJ+6JlFP3zxnM9CnAx6igkE3g8PXzAWMSwVoWj/Rm
         PaYCHDMPuCFd+GVjtYN6cf0c/VFdlZ5MyFk6Kkm1JN99xUJ9soQ58ERxgQ2gcQIMcnay
         Bgfy88Udq/dO6VvhH8adShO/pURPQEzMjkZkxzkAPaMh7Jil2Xjbn9WovrNhtrW1Hftm
         3MrYozMF/eugpFeRQmjqAWtWq5XWiKwjx6rcdl2QoychMzqm3VNTUSRciA1rcEJahJ9O
         ibeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724766; x=1690316766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/gIGR5p88bRbqFIR3bdructdjZtrGeYMyqpAN9LK2o=;
        b=ag0a7I9Z+78vt+LOiWrJkvY5JCRlXh6AiY6riQmk5pisRUcjL2CKXbUeIQ3a+0ArPa
         lGKQboFZjaNvJ+csoioetZwFVI502kUdjbcDWN8ADWouxMQg//4FB8dlRvOd1FS+KhW0
         eDkb8+pwqbRqvtFDhcND75k3QDWa4DA4iJ8ZZ7FaYBnBVCSQ2YpRkXbtcTUMDLaQm/wo
         BtAbSWSgV4GMjWRmHxZcMENwlgD74N700SNNepO9QkCNmKRIrIoqEovdsiM2HUhORw/7
         e2m8v3a8jLe7TEqt1/i3GL9UuSxs8SLW7FFtjMTYhILylb8vjll73VtrsypeKej2cxS5
         G/hQ==
X-Gm-Message-State: AC+VfDwpPc8rooy6tS69BBo8lwYxK/m/bVHt7grGkMrsDhIMrgP+tkXD
        SkTRLKU0JarnkWcUcvu2zV7M3g==
X-Google-Smtp-Source: ACHHUZ5jvaHJPeX1ZeYJTC+I5cSM+HJV3traT6tMQJ6ckNnZHG9OislZcpY+YLOCRm63ccgatJi0yw==
X-Received: by 2002:a19:ca5d:0:b0:4f8:5ade:44b5 with SMTP id h29-20020a19ca5d000000b004f85ade44b5mr13231254lfj.53.1687724766408;
        Sun, 25 Jun 2023 13:26:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 19/26] ARM: dts: qcom: apq8064: enable passive CPU cooling
Date:   Sun, 25 Jun 2023 23:25:40 +0300
Message-Id: <20230625202547.174647-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
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

Wire up CPUs and thermal trip points to save the SoC from overheating by
lowering the CPU frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b97d88517805..f38e3394b422 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/soc/qcom,krait-l2-cache.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -701,6 +702,13 @@ cpu_crit0: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -722,6 +730,13 @@ cpu_crit1: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -743,6 +758,13 @@ cpu_crit2: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert2>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -764,6 +786,13 @@ cpu_crit3: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert3>;
+					cooling-device = <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.39.2

