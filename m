Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A32205B546C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiILGVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbiILGVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:21:09 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15F32C647
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:06 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn9so9326223ljb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=e91Jrvw0byDqU3CWt6E5mPoWrF7xdNn1DqHo4tKVYDs=;
        b=r13KarNKK5ee3JgywvFlXLxKsjaraY1VicrvUPbB9VD8UJfG2zoVaqOKpy3NpmT7jz
         yFDUpkEtnYRb0TCmtyWSAuUws3fq/Xjg1PGO9Q1L+fV+AF1mMfKmRSjxDAs61iwkv6ha
         +xs28HP+fPMNtZo/8km1RpdfUjbSTjkctGLmw0+C8CAJ+asTfrIqI9n9erJivduaMs2K
         n8YOHhZbK+JdWFSAdeD7YpH3veW+IMkFfky+9bOjtKQf9D1hISMWYd9a2sAQQBtvdXig
         nbyv+E8LEkGnNHmfGH/1GiWlUNUXBoeJrVGkXxluyHKOnmjwqa2mMEZsw7vVP6ebzpm7
         eRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=e91Jrvw0byDqU3CWt6E5mPoWrF7xdNn1DqHo4tKVYDs=;
        b=PDvYeHv10f1cKUzVC+lVJrcP6OlUGPban6eQ7LJAIE0yBt9zptNtAj1RP9FExXAsTh
         9VD3tAS95Uflx2jcAPb7ucmIMY7aOdUYM6CfZJEseg+aqfNSd+ljuqSWCLWaIsR9rb6a
         NdZAnaSSevAVrnKNtNLmP/+HvYH7S3Xl9nmPCEjRZs09wpqxnBbhKcBcEm/atEYX5GPI
         sDNdrCZw1NPj5ek3KH216mkoXKYHOkmC0+8zSH3oPLWZ2iPXF1oPAFz4AvTbH1OJLcKp
         F2KcECZvHSM8cVvxIevgxt7ozHuU2c7Ld0KthvyNJezmKZLq5AYn3cgEYUi/36RoHNf7
         Mxkw==
X-Gm-Message-State: ACgBeo1PJkJQIkdDWrDz7ooHzIj4BVtoeDg2Y4lEdDLA/GM9BcelNIqZ
        3dCAgWYGl7w6euo0Ni7E4khgzA==
X-Google-Smtp-Source: AA6agR5c/r/NiSr82VLsI6pynDVo1A+HrcRDt4+K2JA3uy3KqvQ5lMGUKNHcAxjzW8UzH1/i0M2ccg==
X-Received: by 2002:a05:651c:88b:b0:261:ba8e:717a with SMTP id d11-20020a05651c088b00b00261ba8e717amr7168298ljq.401.1662963521401;
        Sun, 11 Sep 2022 23:18:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 34/40] arm64: dts: qcom: sm6125: align TLMM pin configuration with DT schema
Date:   Mon, 12 Sep 2022 08:17:40 +0200
Message-Id: <20220912061746.6311-35-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with '-state'
suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts  |  4 ++--
 arch/arm64/boot/dts/qcom/sm6125.dtsi                   | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 0aad2e94e757..6a8b88cc4385 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -87,7 +87,7 @@ &hsusb_phy1 {
 };
 
 &sdc2_off_state {
-	sd-cd {
+	sd-cd-pins {
 		pins = "gpio98";
 		drive-strength = <2>;
 		bias-disable;
@@ -95,7 +95,7 @@ sd-cd {
 };
 
 &sdc2_on_state {
-	sd-cd {
+	sd-cd-pins {
 		pins = "gpio98";
 		drive-strength = <2>;
 		bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 8c582a9e4ada..1fe3fa3ad877 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -387,19 +387,19 @@ tlmm: pinctrl@500000 {
 			#interrupt-cells = <2>;
 
 			sdc2_off_state: sdc2-off-state {
-				clk {
+				clk-pins {
 					pins = "sdc2_clk";
 					drive-strength = <2>;
 					bias-disable;
 				};
 
-				cmd {
+				cmd-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
-				data {
+				data-pins {
 					pins = "sdc2_data";
 					drive-strength = <2>;
 					bias-pull-up;
@@ -413,13 +413,13 @@ clk {
 					bias-disable;
 				};
 
-				cmd {
+				cmd-pins-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <10>;
 					bias-pull-up;
 				};
 
-				data {
+				data-pins {
 					pins = "sdc2_data";
 					drive-strength = <10>;
 					bias-pull-up;
-- 
2.34.1

