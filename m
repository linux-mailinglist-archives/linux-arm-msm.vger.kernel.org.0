Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1543474E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 23:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233727AbhLNW7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 17:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbhLNW7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 17:59:06 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780BBC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 14:59:06 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id k23so30622615lje.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 14:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wy6PRuTmEIMuhgtUQE9Eh1epb/l1hlZtagcw8/LrEbU=;
        b=R/Q1qLweiMg0Zg8xw8/ozd5KkUXh+rN8xbCem+FVbK/T1ZJdrb02PUcny/52ZtLB6o
         at3kTysu4Prk36hXg/mexDkQHcs/fyqnJti2fAyKTnAmMNtXuPS1qaQsL7sv/pi3fSng
         Ym6IAypWRN272NzDA6X1CBymfHqGP2GGYxkzv0ZReNUDNcI5+/p2hieqnKFCTc214ZII
         WQd6jsaPTSoNg366XLjscfaKXBSHzpDltyCWBefDexCoXlj66vlqfMX0lywcEbDzrZYe
         C555Wr3bdrbVH8w+NiM2VpPNWGvjUql270YLuJFsLi35XTy5e4EZH07JbsR7fRxwMNh+
         r5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wy6PRuTmEIMuhgtUQE9Eh1epb/l1hlZtagcw8/LrEbU=;
        b=ZLgagcbDcmWZf9luxUTLKBOH0VZnrTwhSUoc3sKF8ukpnlsj0b/3uToBHb7ymieYom
         JGo5C76eDOfMr+ap7iWdIWBPMee6Qdy905HSAu0PtCuSPahBYcU8cqyh1hHSlVEPpbII
         Q4DupsJLQtJkxO7u+MnOlaS66NYm8/gurfpUiedVcxzqKRbzV7eEfgexfPwDzFW1bJXa
         MKLLyfLleSog1OzdVNigUfYgi1LesSVvxPp1lXAP9v9TEign/1F/oRHF1wwh/0jG3Eg1
         alSqaeTZ6YuKGpQbiMubiYrgJC4LmHpaJeyNXBqaAxG1LEwa1XxdmWq6X/Pf8cZAPOXX
         t1kQ==
X-Gm-Message-State: AOAM530hap+VbujY8ok5Am9lZbP6u2GiK8fT9AFGq52i067NvisGPszZ
        xZffIUuN5hW8diMxUbBMuTZQlg==
X-Google-Smtp-Source: ABdhPJyjdqL7mJ7Cld7u5cyp/CtCpC4tLposHIT80fAf5Jt7jLr8cc3MS9MDNcOerLIXwxsnhh90SA==
X-Received: by 2002:a05:651c:50c:: with SMTP id o12mr7664423ljp.88.1639522744780;
        Tue, 14 Dec 2021 14:59:04 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id t10sm45115lja.105.2021.12.14.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 14:59:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v4 07/10] arm64: dts: qcom: sm8450: add PCIe0 PHY node
Date:   Wed, 15 Dec 2021 01:58:43 +0300
Message-Id: <20211214225846.2043361-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211214225846.2043361-1-dmitry.baryshkov@linaro.org>
References: <20211214225846.2043361-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for the first PCIe PHY device found on the Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 16a789cacb65..a047d8a22897 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -558,8 +558,12 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clock-names = "bi_tcxo", "sleep_clk";
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&pcie0_lane>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "pcie_0_pipe_clk",
+				      "sleep_clk";
 		};
 
 		qupv3_id_0: geniqup@9c0000 {
@@ -625,6 +629,40 @@ i2c14: i2c@a98000 {
 			};
 		};
 
+		pcie0_phy: phy@1c06000 {
+			compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy";
+			reg = <0 0x01c06000 0 0x200>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie0_lane: lanes@1c06200 {
+				reg = <0 0x1c06e00 0 0x200>, /* tx */
+				      <0 0x1c07000 0 0x200>, /* rx */
+				      <0 0x1c06200 0 0x200>, /* pcs */
+				      <0 0x1c06600 0 0x200>; /* pcs_pcie */
+				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				clock-output-names = "pcie_0_pipe_clk";
+			};
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8450-config-noc";
 			reg = <0 0x01500000 0 0x1c000>;
-- 
2.33.0

