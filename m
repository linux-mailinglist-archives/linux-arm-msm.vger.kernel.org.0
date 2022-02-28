Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12BD74C6B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbiB1MEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbiB1MD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:03:58 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83ACE17A88
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:15 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u7so17020037ljk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=llyo1vt8nztwq9vuzChH7ZX+hL5GQL+RCx/E9zX9FlQ=;
        b=jig1PrXmtI6DQFsrrZZPbfkPW/kd4F4C97eud7gOQE/RJ+A9kmrWOs0XfHFuE5Xh9E
         TgnMN5eYdHLfk0V35dgYoFgcPdviKh3f+bUyz1tYNbydOdMIn2HniMo71K4SlPg27oWj
         Yuof6Mgh8hctVzZ4/AfgQt0RtQEVSRZUPyXXvzQ/8scnNNguGMUNpGimAbXj8INBNDpC
         zGUUAQxwRqFakTPR44aZ3bMb1HC7wqA8bkx+3xXwInvreDyWq1p0siMWPSqoWdDe5Aga
         aQbjWS0czlznWIWe/7uKJiF6GN2VWSqrbIG7mdtpUgaBTN2e8PQXn8Q6QyWAq6skhobn
         rNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=llyo1vt8nztwq9vuzChH7ZX+hL5GQL+RCx/E9zX9FlQ=;
        b=4wgbVuJ0tgVMPFF6qwYXjKW3VDkQmthOv+Pn6HHnq/TxUYJ49RIBpM5eSaGmzdq+Ob
         mJ4vQchCJjqi+2XMLE5Zb/J8b8ScGpeEC68GKbTcpXfr0K1QBsWpcb1PaEzdyxoAgV8G
         MIoVO6zn6AzfBKHyxiKNd7EK35I/CQt7mNdIHPO6oA96XNyr8m6tFSechRtwVayj5Abm
         W4muFzi4h+rzvqWtBWdigXBlrG47u5EJ3tqSQYa3wiNfs2LrUMitcLnLtl/XL+3oPD5M
         aMj15Tmx1kSDTZ1mQg9ispkj2NfgaiR0TuUSZJL6kdDG/ZvrvXezbpOF/Ffv15JlFsVe
         bNWQ==
X-Gm-Message-State: AOAM5327i/WikDT7DXT3MPJXtrRsmIzx/N0LVcj7jrFHMBnWSiVop4/q
        RuFyJHVy3L941dloEgU5YVOIAw==
X-Google-Smtp-Source: ABdhPJwzGV33FpCY/Mjj3WaO+AWk2tV7z5IHci8HwW6CnNcWT5ts7Xh/kk3h/YosKv52jZDfqOHgtA==
X-Received: by 2002:a2e:9d46:0:b0:246:1605:7802 with SMTP id y6-20020a2e9d46000000b0024616057802mr14405425ljj.264.1646049793877;
        Mon, 28 Feb 2022 04:03:13 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id j19-20020a2e6e13000000b002463d2595fbsm1284253ljc.7.2022.02.28.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:13 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/8] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Mon, 28 Feb 2022 14:02:58 +0200
Message-Id: <20220228120258.997027-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 10c25ad2d0c7..54d1a5df1048 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,camcc-sm8450.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -672,6 +673,24 @@ usb_1_ssphy: phy@88e9200 {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
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

