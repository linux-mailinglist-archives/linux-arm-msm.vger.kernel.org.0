Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4645614A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 10:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbiF3ITb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 04:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbiF3ITI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 04:19:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8F355B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:17:51 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u14so8702298ljh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/Movm5xen2iEkwTgrvIPhJRE4iq2d4oy78OyTyLFgE=;
        b=hQxufYN09nA7vBrZAZxHHUf34VOjdG94Nr7Ao6mHwWvIPrKfLqf0IcG4Aonu0sYTBu
         dg53KU2/08QqsiD5pUSQUvLUgY6uJh7UgsaoNjfhPgsG4H1Z/Nrqm+fvXzQq3tAGeqv2
         qCMRG3o88jsl7gWFjh6ka+OKNDoyOGZejs4Z1mhNcEJ6QoHcpPAHOOC3rXYJ6o09jCsj
         8oGIdDmOQtJ+DxnObKoulTyqmRBWWQGMRxRrJOpbypggg7qIwBThQB2Z3d4yQzKSilML
         +kxfgVcfAR9LgtmyI4xD65wrT50sbnrVd2GQENRgfFnCBR+WnUa6z4BE+VK7MJ5ymDh4
         wr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/Movm5xen2iEkwTgrvIPhJRE4iq2d4oy78OyTyLFgE=;
        b=rBHZ7MsRi2K0LDl9Dbl+y6x1DkOnXgYZgi2srpOLRllEm+mMxofkWZ2hicipWnlRIF
         KqVk22F2Xxi8ANAP3rTDZzeVMtzsKOSs1z65d6Osis/mH0TapzEqBZq/Ukiwo3IAyBkd
         pe9M1fxEBdMIS04dknnutmY/tCtaSZfEbemi1KMoAitEcvxHOwCHZr7Lf3PPXzfF4LGi
         vWUWeLdmZH5z1wfBKBMnWSk1kL+8m1CwSp2cbtBaQGlKJwHV84ToY8wmL3ihvseeK94S
         t0U7NLve9B7P5p0AUJDNzbzvoRxVDKRel+Ed877Li9zf8WBvWW9LD9jB4cCQqgJH0kms
         oofQ==
X-Gm-Message-State: AJIora8wCfwiyiKI+w4RKqQ1Q9E/l4AojZ4u+4BnWVcDIiWrYApLsso6
        IxNzZT8wXlI59VhXWLSzZYmQhQ==
X-Google-Smtp-Source: AGRyM1tmglZmtE3gFOaFgbWW34WUupRKgOvRaaB1VfEJjaLAp1B/6hiB/6nG/x5BHXLFqIYtzO7Y/Q==
X-Received: by 2002:a2e:a90d:0:b0:25a:7edb:4034 with SMTP id j13-20020a2ea90d000000b0025a7edb4034mr4126816ljq.129.1656577071195;
        Thu, 30 Jun 2022 01:17:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb992000000b0025bda317bdcsm913623ljp.88.2022.06.30.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:17:50 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v9 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Thu, 30 Jun 2022 11:17:42 +0300
Message-Id: <20220630081742.2554006-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
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

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v8 to v9:
* removed a clock-names property,
* placed a status property as the last one in the list of properties

Changes from v7 to v8:
* rebased on top of v5.19-rc2,
* minor improvement to the commit message.

Changes from v6 to v7:
* rebased on top of v5.19-rc1.

Changes from v5 to v6:
* rebased on top of linux-next.

Changes from v3 to v5:
* none.

Changes from v2 to v3:
* account a renamed header file.

Changes from v1 to v2:
* disabled camcc device tree node by default.

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b06c7d748232..de83df1c73c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2301,6 +2302,21 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.33.0

