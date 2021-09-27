Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64808418E7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 06:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhI0Eu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 00:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbhI0Eux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 00:50:53 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AB8C061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:15 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m21so16562510pgu.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KEllPcS5Xq9Pyinz9uhBulFqCz5TInIHturtjFlsWfM=;
        b=WM2EeIm1wj8U7p3dSs4qT1PBkVz95JLECHhhF76wdghwMNg0xNB2164OkwndSL6yFy
         ur6UlW4JHnNVOkf66Lny3SA+LVU3RiiwUp89aiT7fV5ytTRM/yAKQpDBZBhF+EfQhgjx
         lp9s+Fxo/090Xkf7r1hOGAhxW4DgznTqwvVbJdfNatbeWO8O4qxO4djgj1KRKtIkzMVb
         iWD+KrDhsFw4mAzDjlkl2j8FRSbZT4wL0uJhcJkCKfgJdqFziFLz/MF7+7G3cA5sAe41
         8sRv5yZIadb6pjbbwP4pC+SOqBEcltI8WLmeJyS4wUXrQnotTiLCx74jGROSGaQshpys
         MDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KEllPcS5Xq9Pyinz9uhBulFqCz5TInIHturtjFlsWfM=;
        b=ltpkHcSXBIHHpIx0bSXAznUwSt1kgffx0kbYR0tZ3kdQuMXc7U3cnAWwYbr6xAOm0l
         RBU5vd3d/aUesBsrn9RuV+JPj0sGjRJk0dFp7SgoKT5ybGbpIY2Fc0eknrKIQhaEl8os
         EBcOKTFppSuggZQitmxF3czq8y18dgXsQUWhHlcabfGYLxvhoIJ4mozX6A5ILpbPHHjB
         /xGusu8kF5nFsu/YMdmTfsh4Q3L96V4saPchOPE4JYjQyKwXAlqG5M6Sh1uPYVBcc0/9
         Rlpf6dS+IoOMoIUb+34iPZ87QII2N5yzaK0TPz4R6D/AFMZ148kO6KK33KxWnwrnDcPV
         yFgw==
X-Gm-Message-State: AOAM533qXHztvuc5RFRYcomlTBcSQcS/o4J3lMoaEOWyAeLLJGxiv0Ka
        7RLuyb1F0y+burN23y5B0TOUkQ==
X-Google-Smtp-Source: ABdhPJz6318vaYRozdHnWkfE6r+tiX+DIdW2eKCEVjnV+8J6EOsiAgQ4pN3xc8K+59T8+3apfAllAw==
X-Received: by 2002:a62:5584:0:b0:44b:62ec:1ac1 with SMTP id j126-20020a625584000000b0044b62ec1ac1mr13348937pfb.2.1632718155039;
        Sun, 26 Sep 2021 21:49:15 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o8sm14550651pjh.19.2021.09.26.21.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 21:49:14 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY
Date:   Mon, 27 Sep 2021 12:48:24 +0800
Message-Id: <20210927044824.30246-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927044824.30246-1-shawn.guo@linaro.org>
References: <20210927044824.30246-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QUSB2 PHY requires vdd-supply for digital circuit operation.  Add it for
platforms that miss it.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi           | 2 ++
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi        | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi   | 1 +
 4 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 51e17094d7b1..d9826ce27e50 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -230,6 +230,7 @@
 &hsusb_phy1 {
 	status = "okay";
 
+	vdd-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
@@ -237,6 +238,7 @@
 &hsusb_phy2 {
 	status = "okay";
 
+	vdd-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 507396c4d23b..61ea6d4ef8ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -184,6 +184,7 @@
 &hsusb_phy1 {
 	status = "okay";
 
+	vdd-supply = <&pm8994_l28>;
 	vdda-pll-supply = <&pm8994_l12>;
 	vdda-phy-dpdm-supply = <&pm8994_l24>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 125d7923d713..4f823974559b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -102,6 +102,7 @@
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 0f5c7828a901..243f4ee5da8c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -260,6 +260,7 @@
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
-- 
2.17.1

