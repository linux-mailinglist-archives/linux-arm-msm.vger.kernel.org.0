Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E78D5E9AC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbiIZHp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234107AbiIZHoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:44:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047B66320
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:38 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id p5so6403481ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2SQmi2lgJlQQmepGaN3TdkXlKQrqpQ5shsgKmrI88Zw=;
        b=hLEBMBkUQnTu66gPwuoyTTNi5PQhQQstNA5T57JYzLZmjdtag/c+vxrV7q2lSg79Qv
         uiG2DAxj+Uz5uVY8WBLq1k39MsbL8HXjKzGQRlCjQ5+d76kZUwEkL2iMdhb3f6SLbE5I
         S1I+f9CoUAYHf8RlKXV7VbWSZjTesnHqgCvz5uHOut8YRh6qqIcWfiXm6eue8WikQDt4
         aTx5N0zQShCzMLjUsWfwoHBp1NUV69zxqknOuqo0u6exh1xpShDnFa3pmulV2ItNF47I
         3RiGdDPqTQLApHV73uPJ3GE5jtSNGpcR45NxvfCKr0gl3MTHZEtx6N9Xsmu/uptE41aQ
         yYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2SQmi2lgJlQQmepGaN3TdkXlKQrqpQ5shsgKmrI88Zw=;
        b=OiMuumfypSw/3yNp6oXmSc80ZJj+sMDuJ/oKBpHshBRY44ZC/bTQHtmgPLjPU1bl9Z
         CBA1/Br7PB9ukY7PjtMlQ+UeE5u7X3t4NpRg55wQ71JrL8Wt5yK9WSLoTLDv3bqSTpyA
         piXBe+Ng3jR8ofhhJJDO3LXOeeEuBHf9zIPK4mOG6CdH6l4CmlZneMGO4qwiri1/nFcz
         bs2L3O0jZF7dFm0OqM0Px9n2DX2bS0J7l5K+i5we+NeTWsP2E/M9DO09T+44whjb9JSc
         5V/VsSoCrVbV2FhPBVNNZ/Y4ya9m4z/Zad5a72Ck6/fnN/5EDb2hghwEFZ3U8EA7ispi
         0FOA==
X-Gm-Message-State: ACrzQf3sAj3nx/6APx/YuKPH8GUcjvI1xFdCDqUuWLkj1upP/g2L8nq5
        O5a2RjX7NJl8OB/eIiHWBSnarA==
X-Google-Smtp-Source: AMsMyM5Cpmn4SZbtLlkr/IjS5v/5fDqqhZu2ALFeO4mFSA717YrqIwB3Su0koBjrq3G9rpBQpoybow==
X-Received: by 2002:a2e:9cc9:0:b0:26c:3dc3:cda8 with SMTP id g9-20020a2e9cc9000000b0026c3dc3cda8mr6941537ljj.498.1664178276375;
        Mon, 26 Sep 2022 00:44:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 06/33] ARM: dts: qcom: msm8974: align TLMM pin configuration with DT schema
Date:   Mon, 26 Sep 2022 09:43:48 +0200
Message-Id: <20220926074415.53100-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 6daceaa87802..8138f37233aa 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -573,43 +573,43 @@ bcrmf@1 {
 };
 
 &tlmm {
-	sdc1_on: sdc1-on {
-		clk {
+	sdc1_on: sdc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdc2_on: sdc2-on {
-		clk {
+	sdc2_on: sdc2-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <6>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 	};
 
-	mpu6515_pin: mpu6515 {
+	mpu6515_pin: mpu6515-state {
 		pins = "gpio73";
 		function = "gpio";
 		bias-disable;
 		input-enable;
 	};
 
-	touch_pin: touch {
-		int {
+	touch_pin: touch-state {
+		int-pins {
 			pins = "gpio5";
 			function = "gpio";
 
@@ -618,7 +618,7 @@ int {
 			input-enable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio8";
 			function = "gpio";
 
@@ -627,25 +627,25 @@ reset {
 		};
 	};
 
-	panel_pin: panel {
+	panel_pin: panel-state {
 		pins = "gpio12";
 		function = "mdp_vsync";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
-	bt_pin: bt {
-		hostwake {
+	bt_pin: bt-state {
+		hostwake-pins {
 			pins = "gpio42";
 			function = "gpio";
 		};
 
-		devwake {
+		devwake-pins {
 			pins = "gpio62";
 			function = "gpio";
 		};
 
-		shutdown {
+		shutdown-pins {
 			pins = "gpio41";
 			function = "gpio";
 		};
-- 
2.34.1

