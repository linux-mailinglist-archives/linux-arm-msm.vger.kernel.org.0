Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE4C51F7F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbiEIJQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiEIJFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 05:05:45 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5D51B216C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 02:01:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l19so16171082ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 02:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHJ6XJyQPeCvPLKk6nbDjSu1vpI5YnaVOsLEeojtwNE=;
        b=JcWfHnctUH8ce4+49cIHsarGdQMCcUOljWdnzo1OhBGLpCWNka9KlBWQuFVXm56keU
         mZcunC4ggaR4OY/VkxdE482ovddj2kV67guLy+nEpG7nRiLUuoSf/pV0HJjIbsnLUkKr
         /ABtvRpUOhN9tfXhBcO9Jy93zFAudQrWcxzRQEBsFU/tcE3Mdm/f7C8aK7jh2mTIhJ/S
         oPjucvFcuGv1CcDA8sfGyPPtbMyb3r9/sq0o+6Rh6rcWPBWCXefgOcSZXwLm+O/yVyOJ
         7GKTHCFdx6BuiLGBuplhyJfRU1kfhlAUbPBBDfcK1+NlrB6ItEvDpLGbxzgzWlAwDrXr
         2dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHJ6XJyQPeCvPLKk6nbDjSu1vpI5YnaVOsLEeojtwNE=;
        b=mhFqSPUYzJ01EBSECxdV1+I6ZrSnLXOBm/oVZVNvEqbsLAmaTlpcCIPs8bD2zmWN9F
         DOKs9Hjsniq+AMtXZhdsjqLaiF3TBiG1csVEuErUUFhz74/ii9xx2qCSzqh3Oeimm9Zr
         CU4QevXsp9FdB8V4fc+Ex/SV5DvG2qtXU5fj53ykUwGqLf03dTgViChdkSP23MemKH4K
         kJOq3MZznXUVpAQ0DP00KXH85CCoT/YXyz7V26r87zWjDaxmNb5sIFk75SPJaKMziIhx
         u/xRr4ztLp79q0LmIL3d//oPwtEJcHECyDFIoEtrTlsdEWDWUZFE/FBUY+dTS3CBJaTc
         2CFQ==
X-Gm-Message-State: AOAM530HXLgfKRL2ZkaQWHbDsM6AsX1FXGwKr69DHsIV90++IEY6n+Y/
        lRKoUa5x74Sb7HMyXkhJI2/2WQ==
X-Google-Smtp-Source: ABdhPJwKrKmCsR6/OnKs0fDyvyn5GpSp5OEKT4Jz2rOG+IhN6MT56YERkKnrPPuspC6j699kakmSxA==
X-Received: by 2002:a2e:91c7:0:b0:24f:1114:86fd with SMTP id u7-20020a2e91c7000000b0024f111486fdmr9812957ljg.147.1652086865600;
        Mon, 09 May 2022 02:01:05 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id t3-20020a2e7803000000b0024f3d1daee8sm1749824ljc.112.2022.05.09.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:05 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v5 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Mon,  9 May 2022 12:00:59 +0300
Message-Id: <20220509090059.4140941-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
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

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v3 to v5:
* none.

Changes from v2 to v3:
* account a renamed header file.

Changes from v1 to v2:
* disabled camcc device tree node by default

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..dc819f2f7651 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -1011,6 +1012,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			status = "disabled";
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.33.0

