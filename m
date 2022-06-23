Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437B35579E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiFWMEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbiFWMEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684334B42E
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c2so32987820lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6GZSLpARs8pL0zCmx9cgfCf82OgOkttPAqT8tjyQvgc=;
        b=UVHPINSc6O4CflctkxPo7vJSFupqTU9kq63buOk/Y7Hn59ecB8pqLqsXSX9h9v3bFB
         NNRNGslwKCEjsc482B+naOxzEhRRerV5W8+2Fu2a/wU71tL3yVJmEbD2Fk6WeaE9BWjL
         xD2Bmw+MRZ3yIzW8TXEFHeIDzfKSlvOrzPIBftvAbHRkry/pWrbGB1z6uDm7QeiZMHxC
         ETQCXKVFzLSZE1xUXbqG8QmDlfkRjuie+JMgYdrtYT0ycAOR+Kz+QCudL7+Hu0brKJPW
         Z7Bvpfh5huRCrULH2xxxsyhfO3WIAeSSSjZWfMw71lBL9EmSS1iRBcuSPiVCrkhS6xMO
         P+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GZSLpARs8pL0zCmx9cgfCf82OgOkttPAqT8tjyQvgc=;
        b=ivELFQuNbVe9NMkNuUBj7jD7+YllO+nc2wmEdCN+LKH03bFXAASkzLRv136IypPBeD
         gY4BB1Rzl68CCdXOVH8Pvw0QxgndoXgoerGo5FQ0KDtwjOSBg2pBTsrBJ0aGFNY/TZt6
         HR5+pfneJt/ENf4gbf8z53WY32+d9Cz0rSMQeIEAnN6MVMrCmvBMkOqjBn8UoQ9P9umT
         japqLKKRdGmrYzJz3qJDVfMaDjM5W8FTp5Rrmn3TLwVmYMdoXcmc5QYEuG4oybOfK7dw
         mbgA0jjtb3D9FSOizEUNNN0XGminZ+bCjyGSBCH8Wy+rtySR7ZMPba+lrdGpTP0Z+NtL
         RAkg==
X-Gm-Message-State: AJIora8ZyLjdAYOUTpWHQkGdGRHrwRWnkbPF2cRxda2tTLBn1cb9Fz2K
        pck/W/hdg0nbIWcxnawhCkvDYw==
X-Google-Smtp-Source: AGRyM1v9dJcSjMJeCsVOzH0xYqDdQUMzqilrcKr0GdLiEe41q69qoJxMQlwYoiWH8j2ageRw7xi5Ww==
X-Received: by 2002:a05:6512:b82:b0:47f:5e0f:49fa with SMTP id b2-20020a0565120b8200b0047f5e0f49famr5181993lfv.635.1655985869773;
        Thu, 23 Jun 2022 05:04:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 13/15] ARM: dts: qcom: msm8960: add clocks to the GCC device node
Date:   Thu, 23 Jun 2022 15:04:16 +0300
Message-Id: <20220623120418.250589-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the GCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 3d58846319ae..c7058da58be5 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 
@@ -56,7 +57,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -130,6 +131,10 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&cxo_board>,
+				 <&pxo_board>,
+				 <&lcc PLL4>;
+			clock-names = "cxo", "pxo", "pll4";
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.35.1

