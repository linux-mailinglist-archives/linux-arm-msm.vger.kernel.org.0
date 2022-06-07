Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B8953FB4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 12:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241035AbiFGKdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 06:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241014AbiFGKdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 06:33:54 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590085DD26
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 03:33:53 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd25so22407562edb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yaAyEYart5W/dwFAnhvBseFevDB8DHepYlNxBeb2VnY=;
        b=QTf5Tf1f4M2ATD8dha5HBnZYU+wwAB7rNUuguGCymxo2IhPHFzJvJVIS6PmNbaOSR/
         o4SP7y5juUyn4QH+RxonEbP9PKZ/c+CDhyKx1ny7xAvHY5/Gr1cKTlKC7v45IVOcxzlL
         9hxRKSZa1FAjNaqSQMLeITT2UQDdAFJDxCK3vpWSlg0DxkmJ0+NFy+I0jUU6kjecmx9U
         AvHsDDSHmnSTp4mBn0iHzNsXUCjrvPoM+E7xEyu9ZP4hSvJjyEgE5EsjnPx2OkBydBzh
         71w1bPNyXsvGJoa+Z3k8cnSJg+LJfGAagwqqSmPdXl94pflhWcR+AAVU/mV8sRgqTByY
         ZbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yaAyEYart5W/dwFAnhvBseFevDB8DHepYlNxBeb2VnY=;
        b=HEx/6cHiWYBJbzovyZTcx2YRjmd48M7gr/xHSrIlffgtFlnki0vy5LNbMvR75H1E+R
         Y+l1TO2q/WfEgBP/ILuA4Sd9rOeLeSvPPHLGcwH0HJ8r95oWFYOij/7Wwcp58Uc0zHfv
         nZLBWxpY73DWyZLFHzcTareJ2/n/nuGuRNIHYpP973gS1tU3p3J7eOTQMEOCMwbOGWDG
         u9GQhY5gOerZbIcavbNOxWwmGEbp88lqAQoNSi4dAmBpDwRmZK3qNVf+DqeaYVDOUltE
         166H2O/yHvz2rHwAOoJajzZxeRb2j0m9NNWqTPqE8Blst8c/afDHpptBucX7AbmcPHYU
         ZYLw==
X-Gm-Message-State: AOAM533IjokPVxvDKqLSm23IIuIAAEZwzKzLWfm91E9AjtPtC+YKP7Xq
        4oN3ef0VCx3zFr3GAoqyCRyNlw==
X-Google-Smtp-Source: ABdhPJx+NtMDOSu9BL6XxbzXC2K3sqhCuYXgfSgA0/OPE2AkkzYXc/tOTPk27U9aJ8on5KZJeshETA==
X-Received: by 2002:aa7:d4c6:0:b0:42e:561:8c70 with SMTP id t6-20020aa7d4c6000000b0042e05618c70mr32042748edr.131.1654598031819;
        Tue, 07 Jun 2022 03:33:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709065ac400b00704fa2748ffsm7505359ejs.99.2022.06.07.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:33:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/10] ARM: dts: qcom: apq8060-ifc6410: add color to LED node
Date:   Tue,  7 Jun 2022 12:29:23 +0200
Message-Id: <20220607102931.102805-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
References: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
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

Add common LED property - the color - to LED node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2638b380be20..49607b7b2120 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
@@ -39,6 +40,7 @@ leds {
 
 		led@1 {
 			label = "apq8064:green:user1";
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
-- 
2.34.1

