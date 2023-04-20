Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3E46E8BCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbjDTHvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbjDTHvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:51:32 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7D355B7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:10 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u3so4223037ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977065; x=1684569065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT98ZUIOHQDisLLzR6txJBqg38B3hjy7KWFju1C2swM=;
        b=QS7RnNkxeEH+4rY7j7xPTO9yVEcj1PTTf0APLQHLSIaq9l+AyrIAkSTQBRnhXzymIx
         AztwSZWf1Zvkj4Oi7ITLVTX3j+r+AHaOoBiYKgHFHSvYt3cYkCW3RwUYiIbJUWzg2Avv
         nqn7jqZiM1eVR/tquNM5RHgZIAUQ55SeWN5ZxHK8Nld4FLFK/OEhugoaw6xWjiyVgmZQ
         gw0kc1oG9IkMhqCEpy3Z8S10lHKW0Pt1v28hDjxB37W+hOIc+U+UV9wpnlmPTr1QQUdv
         S/NDUrm/7rQZpIWwOYpNvAzUTqA5TF/NKXtr9nTorcC/J+MAFh5rbGZ0W1I14sN1PChL
         LAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977065; x=1684569065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT98ZUIOHQDisLLzR6txJBqg38B3hjy7KWFju1C2swM=;
        b=Sfqm7mEjyxtQ7fA0y/qEbJ0IpZzOjptwFhTRRnkMwYYZBlvHQfs7bk87BvOH5/eBmx
         zSp+YyZAoY0wOJcssfYGYoJh/Zj9bMcnb1Wij/jeWyo5WLeyphkye9L7jXCdFaGKhXRz
         Bg0dwPBvFAdnUjz6hlzwER1ctamimoVwUzzuVEzaUMH7+vXMHrsp7Zxc0eEx8YEfDt4i
         JzwLEszwdFubRQByxi2Jum1FAfGXoiXTu8Jk56ND/aKTK8LaEvo79gvCKs8Z6pYEvzPj
         AEFCSkZolMdWivMdwXRQk0Vc1TrAG6zFEvQaFB4D/3VRyNJLJO8zmhYdEZOiUaZk1TUn
         3huA==
X-Gm-Message-State: AAQBX9cSAYgoSPDIUmCCB5AlLhKryZ0sevFEnA2++ngLbj+CD8Q47HG/
        ddA27gOD3SqZ27nOvv7B4plTPg==
X-Google-Smtp-Source: AKy350acUXyEmc+p2LiJuruYd8lPA+IdeiFYDUS+YtYv7txdejaOPxf4pTAKMsCU4lJnMHAm+r3HsQ==
X-Received: by 2002:a17:906:b20c:b0:94f:3804:5cd6 with SMTP id p12-20020a170906b20c00b0094f38045cd6mr586981ejz.66.1681977065614;
        Thu, 20 Apr 2023 00:51:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm447165edr.94.2023.04.20.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:51:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/10] ARM: dts: qcom: msm8960-cdp: move regulator out of simple-bus
Date:   Thu, 20 Apr 2023 09:50:52 +0200
Message-Id: <20230420075053.41976-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
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

Regulators is not a bus, so drop incomplete simple-bus usage to fix dtbs
W=1 warning:

  Warning (simple_bus_reg): /regulators/gpio-regulator: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960-cdp.dts | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index 8fa2befa629a..6c1bc3818883 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -15,16 +15,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	regulators {
-		compatible = "simple-bus";
-
-		ext_l2: gpio-regulator {
-			compatible = "regulator-fixed";
-			regulator-name = "ext_l2";
-			gpio = <&msmgpio 91 0>;
-			startup-delay-us = <10000>;
-			enable-active-high;
-		};
+	ext_l2: gpio-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ext_l2";
+		gpio = <&msmgpio 91 0>;
+		startup-delay-us = <10000>;
+		enable-active-high;
 	};
 };
 
-- 
2.34.1

