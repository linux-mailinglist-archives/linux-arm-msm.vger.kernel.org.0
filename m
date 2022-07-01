Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB80562B8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 08:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbiGAG0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 02:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbiGAG0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 02:26:52 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C2E45072
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:26:51 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a11so1428064ljb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cvn4OI0YG23eBzT25QIL10M0drau64R5BF4I+eueZ8=;
        b=IVRSFW2bwDcxAvPzl0Y9tKTZOwAwBG/SiOmsrTwNMpa3TUdRr7f8QxkZXWG4eFqVD+
         y79n1nP7BB8qFUUqmC+wk64rOX6mavRT/Gyrum7aE7e0WMl6xjT/llcG4EQKJui4Rffl
         qmzCu6URNMVjSWvjsZfi6FpjXV4hDh8R6dsVTmHSkhepFWFGtakazPZTXLRgcRe/Ouuc
         7iph2FT4XA+q0MgjmcEVnMqearb4v8BS9irsqdvswt5fFTSXqHj6awC3/ls+h+j/MOxS
         vvjHWJYbwP5cKg2Ko2C5KFfrMaOr8MTLCtPSBrIuRsoZnpg3LSWo4C483fKnJIk1XBM5
         +4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cvn4OI0YG23eBzT25QIL10M0drau64R5BF4I+eueZ8=;
        b=eJ7vkx1KAMCtCxi3XlfQ1U3jdjfbOG7fQCdWHxig28PUCB/I3FLO8SMPMlE83gBUVW
         VkZxQidsLi3e2nT0vmWOiYy0+gp/NJ9fZDUKjymcYQbMxJoznBG4R9wvTM9FQXTa2KN3
         If0OYSYJkW8hWULbTHkcYsmP4qny/DhMKpq6bO9gsW98hpr5J26rkm3CS5zo9TES3gR1
         FJF6nwbHdx9PCy0AhqmeQ4x7KEoMw0MOsmrNsJGa9JISGQPQWH5LgqsZttMw6shXLX4v
         WiKYl7XvSAvR6g9WeAXiRaWEtdS2o/+tNnvOdV34vVENTXgszvTNiU/Q4RRzjSgBcftE
         HdgQ==
X-Gm-Message-State: AJIora9oNZHAMFD6FOIacELADeYbFzXnSht7iDMiAE72ubNOGh2wvV8J
        ivTxoJslm3rzJG8cO4U6hWjnQw==
X-Google-Smtp-Source: AGRyM1uk0uvRkD2Sh3lsXaWFyQwKvZTKywf3CIAzDF5XV/pwfV80xy9qWvRaGMYSQHmP5q3+aiI9fg==
X-Received: by 2002:a2e:8910:0:b0:25a:7eda:e4df with SMTP id d16-20020a2e8910000000b0025a7edae4dfmr7267800lji.316.1656656809442;
        Thu, 30 Jun 2022 23:26:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047faefd9f24sm3476581lfc.207.2022.06.30.23.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:26:49 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v10 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Fri,  1 Jul 2022 09:26:22 +0300
Message-Id: <20220701062622.2757831-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
References: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
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

The change adds description of Qualcomm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes	from v9 to v10:
* fixed a commit message per a review comment from Vinod.

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

