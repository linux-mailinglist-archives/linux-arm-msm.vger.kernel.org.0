Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F4B47CA3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239439AbhLVAZg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLVAZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:25:36 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41149C061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:25:36 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 45-20020a9d0a30000000b0058f1a6df088so627036otg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GlatAavy7Fomh56/ZYdtVg3JLbpH742/1IfeF1igMjE=;
        b=oYA99ve50DOz/uXnvujpBooTpUsPQakmp5rPxdw6ZC/osg4KyMsxdywztJFqb1RnGf
         T5Lt2jpEcD9HKmiISCn0tGRI+nx1fw7h+i+OG+Zl8E3Qx7mmWmRELRjpQ2xXJ7YXZp3L
         bmHuyn5a7rP/EErf6fIuoAadJRqb8BP13Whf653hHeiwbxVbgK9N7/KIypT/hBWKVJjj
         K7mRY+7PEXChx5AcuYqS2Qypa+MBgMyhGPuRy4ESXu99ZwL+BsLQQMFb00rney2W9MeC
         k4oegx7BfOZglF7wOuBGxfUYtRbR9pX+j7NsyiRkbrCQSysAi4drDtdovPfJzfU+jMQ3
         YBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GlatAavy7Fomh56/ZYdtVg3JLbpH742/1IfeF1igMjE=;
        b=iLiajSw09d5d3faTZC4jmyjP7lSTMB29rbkFGrLQ2T8kqE1OyjK5lzrpsJtyoH7vNe
         dXy3wuOmeVbIZd+a95NWNw+c0awCCHxcrRSUd+OfBWZGS58meugeUjEe6hh7RU+4tEpg
         fI+TinG3IRRO/yhEMREopQlL+NDdPlD1OleBoBSCp/8mzlF+vgr7+fAZeToYFS+icoFU
         EzkukCPIdUsG5E6uEpn4Zb+B2KnXkXMo1hlx+VvkOMCr+h+LP4NR/590nsDWHagnSUCO
         7tIYbOieQyLAGWFCMrEXfYFluo6nEcRdvKo/jOhT6DNazASV4PyI5Gj/vFEKhcUhUF6q
         G0zw==
X-Gm-Message-State: AOAM533Qqm1ufqqK/K6syUcwSWF/Cpi6+7BCvTicp4kHnqgHokWwX19V
        +ne61tfrE7wutkbsvODQrb+fow==
X-Google-Smtp-Source: ABdhPJyM+6fi4zx1ka4RK/IUEJiQdwsWJkQb6v4yBj0cz4YQNrb0EevT/CzP60g5aj83xPDo+44vXg==
X-Received: by 2002:a05:6830:183:: with SMTP id q3mr505352ota.285.1640132735532;
        Tue, 21 Dec 2021 16:25:35 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q2sm83086otg.64.2021.12.21.16.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:25:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: Correct UFS symbol clocks
Date:   Tue, 21 Dec 2021 16:26:44 -0800
Message-Id: <20211222002644.3396011-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The introduction of '9a61f813fcc8 ("clk: qcom: regmap-mux: fix parent
clock lookup")' broke UFS support on SM8350.

The cause for this is that the symbol clocks have a specified rate in
the "freq-table-hz" table in the UFS node, which causes the UFS code to
request a rate change, for which the "bi_tcxo" happens to provide the
closest rate.  Prior to the change in regmap-mux it was determined
(incorrectly) that no change was needed and everything worked. Instead
mimic the configuration found in other platforms, by omitting the rate
for the symbol clocks as well to avoid the rate change.

While at it also fill in the dummy symbol clocks that was dropped from
the GCC driver as it was upstreamed.

Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index bc176c252bca..ceb064a83038 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -38,6 +38,24 @@ sleep_clk: sleep-clk {
 			clock-frequency = <32000>;
 			#clock-cells = <0>;
 		};
+
+		ufs_phy_rx_symbol_0_clk: ufs-phy-rx-symbol-0 {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		ufs_phy_rx_symbol_1_clk: ufs-phy-rx-symbol-1 {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		ufs_phy_tx_symbol_0_clk: ufs-phy-tx-symbol-0 {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -606,9 +624,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
+				 <&ufs_phy_rx_symbol_0_clk>,
+				 <&ufs_phy_rx_symbol_1_clk>,
+				 <&ufs_phy_tx_symbol_0_clk>,
 				 <0>,
 				 <0>;
 		};
@@ -2079,8 +2097,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-				<75000000 300000000>,
-				<75000000 300000000>;
+				<0 0>,
+				<0 0>;
 			status = "disabled";
 		};
 
-- 
2.33.1

