Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D605F6D235C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 17:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjCaPAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 11:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjCaPAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 11:00:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4D67687
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:59:47 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id iw3so21467899plb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680274787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cLECZLQ8q3bDfrArD9DeZIfU0o0VB/2VF4oNp5hSRs=;
        b=ACKRxH2iGlrD0d8f8RUQAX9ZMlpjS1hMZ88LqXbUCetZFPZE2zDG9MSZWpNdu9ttzu
         kWROm4rzvz5kXG9RZeRptogLcHcRxt2fBYHMPC607RDd8IZoF18D7rkUJ5ylnkkITPtY
         VSy/CHE7f8YWG0UBX/tUx/6JhN6/KDEl8uYxWFyrJ8oRKKWgQ8bSMAXh9FANXmddQozt
         oQ7ebISyf+8RJZn2056bCMvCYADVKrJiXvK6pGCc7LekD8uOMjShcdgdSM5rk38kDeVG
         c7YbwCjQSssHq/ih6d58jfy6QNQWZRnqBvq9drkfEBdkYOZwBwY8AIF4KZmFxl+ow2Lt
         PjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cLECZLQ8q3bDfrArD9DeZIfU0o0VB/2VF4oNp5hSRs=;
        b=vO1B5xbc8NYN1lyY7J85jvPZV2eZYsx98KcA0ebdMNG2uvE790R47cH6Yd4W1rLm9D
         ph600QmovYl/BhVHBcgjiHWy20wlx0EvqOTqm/8/7zlgJjP0DxfoHDC7KUto3T2G+sp1
         OV9uzSnHDq/jNaNTAzwxNjQwsRd0FbKMa3lNGEZOWxWJhbiUGcEAapJ9XPsfyFIraOL4
         NL0yR514te3jV5I/t72O1qPMeiDlF/8Soh7ipUeZSMOdUJpKUIb7XvZzKL1oXk7xhkMZ
         /NE/JhR15GPwZHvCIU7a92+vy2+YM4nKUO+VUA+EzPLimhxBE1UvYxSkxYfI5ll7iOOP
         CJWw==
X-Gm-Message-State: AAQBX9ed/vWaYLYJjvj7B/oc6DtRiWlURX6EPymHlBIEAh5nKvTZDz34
        XO42nRXWMVchGjlAMhO//0Hl
X-Google-Smtp-Source: AKy350b1EvPF6PwvNUEXvOyhaTG+WR0+fLaNdP0niJ0+o6PFHNHbHNqt82Zp7IK9OuyMMa9b8ECdDg==
X-Received: by 2002:a17:90b:4a51:b0:23b:3939:9c50 with SMTP id lb17-20020a17090b4a5100b0023b39399c50mr29050021pjb.8.1680274786797;
        Fri, 31 Mar 2023 07:59:46 -0700 (PDT)
Received: from localhost.localdomain ([59.92.101.186])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090a938300b0023b15e61f07sm1617194pjo.12.2023.03.31.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:59:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: sdx55-fn980: Move "status" property to the end of node
Date:   Fri, 31 Mar 2023 20:29:15 +0530
Message-Id: <20230331145915.11653-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331145915.11653-1-manivannan.sadhasivam@linaro.org>
References: <20230331145915.11653-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To align with rest of the devicetree files, let's move the "status"
property to the end of the nodes.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index b73b707342af..91d13c40496c 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -243,21 +243,21 @@ &ipa {
 };
 
 &pcie_phy {
-	status = "okay";
-
 	vdda-phy-supply = <&vreg_l1e_bb_1p2>;
 	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
-};
 
-&pcie_ep {
 	status = "okay";
+};
 
+&pcie_ep {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_ep_clkreq_default &pcie_ep_perst_default
 		     &pcie_ep_wake_default>;
 
 	reset-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
 };
 
 &qpic_bam {
@@ -265,8 +265,6 @@ &qpic_bam {
 };
 
 &qpic_nand {
-	status = "okay";
-
 	nand@0 {
 		reg = <0>;
 
@@ -277,11 +275,13 @@ nand@0 {
 		secure-regions = /bits/ 64 <0x500000 0x500000
 					    0xa00000 0xb00000>;
 	};
+
+	status = "okay";
 };
 
 &remoteproc_mpss {
-	status = "okay";
 	memory-region = <&mpss_adsp_mem>;
+	status = "okay";
 };
 
 &tlmm {
@@ -308,16 +308,18 @@ pcie_ep_wake_default: pcie-ep-wake-default-state {
 };
 
 &usb_hsphy {
-	status = "okay";
 	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
 	vdda33-supply = <&vreg_l10e_3p1>;
 	vdda18-supply = <&vreg_l5e_bb_1p7>;
+
+	status = "okay";
 };
 
 &usb_qmpphy {
-	status = "okay";
 	vdda-phy-supply = <&vreg_l4e_bb_0p875>;
 	vdda-pll-supply = <&vreg_l1e_bb_1p2>;
+
+	status = "okay";
 };
 
 &usb {
-- 
2.25.1

