Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4012B6F39C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 23:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbjEAV0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 17:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjEAV0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 17:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90BC2693
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682976322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8c5WPJF11ihr/oNejbMdPXQbVSmYhsjYnYYtzg1kHm0=;
        b=B4RvMkzIpMWzPmuG7Cgu74VucR4t2a+ZuT4md5eoc+ZXhPMxrgTdqyCnjzot4J5HEbYQFL
        2zjt+wJL254gYJSf2imCC0rR87ypW8hYq2sHPdmSxvgqmXptWPt/ECaox9vpdlIR1yoAq5
        vsfEf10fc1WEp9mHFF1ayU+bXYWl8qc=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-pFGlBR5MPse9CQvr66MRJg-1; Mon, 01 May 2023 17:25:21 -0400
X-MC-Unique: pFGlBR5MPse9CQvr66MRJg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-38eef8f6aa7so1976263b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 14:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682976321; x=1685568321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c5WPJF11ihr/oNejbMdPXQbVSmYhsjYnYYtzg1kHm0=;
        b=l+T/8cDb8X47yTtDmKbqk7akgMFdwQtmNF2s20JeNrqZwhDqgSA837dGi629WrUxX6
         IhViHEkCIZDsXi5VJDgTSn4IaOwtPH5ugE5xxfOZHlY05SP3zqcW+4oaqu/RE5+dzvp8
         9hqA2aPFdutqGd4lkPnAzPrN/iPHyu3LuGJqkmcWwA9gV8XdzOkuD5uka8aQNPASZHFn
         1j9A3Yrfjfi1u+DoIan30zu0cJhEjnewtyM1m157viRB6HF2FoYlyOEquwD/4qQ9Ols3
         kkaaQ5IOpQhoD7v19b4ZkmCWbMQqBgAhWh1RFfaly1/AAQg04C0Ilm4ni0n30VCgXb4D
         VChA==
X-Gm-Message-State: AC+VfDzA0wBsOf8rSSGUKqrI8PZn8/4IUtNIWzKZwFDdnI/zwWOXnpUA
        OBvqWllHYgsqrL/D5wlQeT44CtiQIxsAw28ZWpVI4JM9Ta5lMcXqiDCKM6Vu6X39og1Uc8QaLVb
        Q+skndD2Mpludw8SLrbCszKy3/g==
X-Received: by 2002:a05:6808:295:b0:390:43a9:98fa with SMTP id z21-20020a056808029500b0039043a998famr7242307oic.33.1682976320989;
        Mon, 01 May 2023 14:25:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4b9UrOY8vDozWqJ1pwOCcrPApFWuY2pxYYR2O1g9/yIm7n4imMdiM8vyfRLUPjNSUHVcVOpg==
X-Received: by 2002:a05:6808:295:b0:390:43a9:98fa with SMTP id z21-20020a056808029500b0039043a998famr7242301oic.33.1682976320779;
        Mon, 01 May 2023 14:25:20 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id q5-20020acac005000000b0038756901d1esm11911385oif.35.2023.05.01.14.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:25:20 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v4 2/4] arm64: dts: qcom: Make -cells decimal
Date:   Mon,  1 May 2023 16:24:44 -0500
Message-Id: <20230501212446.2570364-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501212446.2570364-1-ahalaney@redhat.com>
References: <20230501212446.2570364-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The property logically makes sense in decimal, and is the standard used
elsewhere.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * Treat all of arm64/qcom at once (Krzysztof)
    * Dropped Konrad's RB tag since the scope expanded
Changes since v2:
    * Collect tags
Changes since v1:
    * New patch (Konrad)

 arch/arm64/boot/dts/qcom/ipq6018.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 14 +++++++-------
 arch/arm64/boot/dts/qcom/msm8953.dtsi        |  4 ++--
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts     |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9ff4e9d45065..ccaf8e57668a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -571,7 +571,7 @@ intc: interrupt-controller@b000000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			interrupt-controller;
-			#interrupt-cells = <0x3>;
+			#interrupt-cells = <3>;
 			reg = <0x0 0x0b000000 0x0 0x1000>,  /*GICD*/
 			      <0x0 0x0b002000 0x0 0x1000>,  /*GICC*/
 			      <0x0 0x0b001000 0x0 0x1000>,  /*GICH*/
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 84e715aa4310..0bde1303bb9d 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -29,8 +29,8 @@ xo: xo {
 	};
 
 	cpus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		CPU0: cpu@0 {
 			device_type = "cpu";
@@ -106,8 +106,8 @@ scm {
 	};
 
 	soc: soc {
-		#address-cells = <0x1>;
-		#size-cells = <0x1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
@@ -321,9 +321,9 @@ tlmm: pinctrl@1000000 {
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			gpio-ranges = <&tlmm 0 0 70>;
-			#gpio-cells = <0x2>;
+			#gpio-cells = <2>;
 			interrupt-controller;
-			#interrupt-cells = <0x2>;
+			#interrupt-cells = <2>;
 
 			serial_4_pins: serial4-state {
 				pins = "gpio23", "gpio24";
@@ -666,7 +666,7 @@ intc: interrupt-controller@b000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			interrupt-controller;
-			#interrupt-cells = <0x3>;
+			#interrupt-cells = <3>;
 			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
 			ranges = <0 0xb00a000 0xffd>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 602cb188a635..eeebdab58c04 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1505,8 +1505,8 @@ apcs: mailbox@b011000 {
 		timer@b120000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0b120000 0x1000>;
-			#address-cells = <0x01>;
-			#size-cells = <0x01>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			ranges;
 
 			frame@b121000 {
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 59702ba24f35..358827c2fbd3 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -27,8 +27,8 @@ &ethernet {
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii";
 	mdio {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
 		phy1: phy@4 {
 			compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 029b23198b3a..ac52a8dfeba1 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -353,8 +353,8 @@ &ethernet {
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		/* Micrel KSZ9031RNZ PHY */
 		rgmii_phy: phy@7 {
-- 
2.40.0

