Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8E765127E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiLSTNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:13:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbiLSTNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6005E1261A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671477129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DYlcVMZxZ7sfT1YBoo0lGgFw3p0ugJ1rt2fQWCu4fB0=;
        b=ah8UnNL11wxcc1BtzKX8aixnh2xWUzObgSFiR5RLCHR4uNcUI74u332mxwepoSv2KvTYFU
        4xjwu9imoAXcV5AJZ3gobPeLgL5RzIzUIv4nNJrtASfsEfFwnVt+z8K2IEBFwTNMY0O5xH
        IcKrI3/ZIRLFZBvffP7nqOWUiZkD02g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-5IGLlKNOP2uGcs_9OYkmGQ-1; Mon, 19 Dec 2022 14:12:08 -0500
X-MC-Unique: 5IGLlKNOP2uGcs_9OYkmGQ-1
Received: by mail-qk1-f197.google.com with SMTP id bl3-20020a05620a1a8300b0070240ff36a0so3936024qkb.19
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlcVMZxZ7sfT1YBoo0lGgFw3p0ugJ1rt2fQWCu4fB0=;
        b=R8Uk1iGQsNLQA3jcKtgQujcBGFnQBodcVyJYNdTnikGT7CZdPt3PImpWv0aMnvv8hO
         NnjE9f6jg8yc9fKa9DOOyMs2ntYL+RE5/hdxJdYGpebzuJyL4iT8ZkcY+GE/eltOgXi1
         frkMeUzrNfb5IYA0x696QRAWCTR4YmySHC2yTJr/hzwLb00rXjReQDEuqproO1ihMhSD
         nsdCA+JOtzh/KVHcAQco21C3X5P0WuBdhyxNmAnmf0at4FmW3tNrbmK7C2nZxbRTW9iR
         pQD1LYmp7MQy+75MSeu+wPjgkpmKIk8kGkO+qZvLvKmnExscCj3wGGXh9aXZgPmtBCzD
         FRLw==
X-Gm-Message-State: ANoB5pmjs1/Jc1MtS/Lkit8xF5DXh8dUw/f2uEAbLt+E0MS5Gzx8K/rG
        qOhMTQhtlGHR6HxrF7f0krwCRJG13BeDeVV/P6ybD1RlpwNFh9dfkyndp6u2nCM3djo28WQ8eZT
        vQdo2/LA5qoci5UNROh75bgLWDg==
X-Received: by 2002:ac8:5f93:0:b0:3a7:ff9c:3f92 with SMTP id j19-20020ac85f93000000b003a7ff9c3f92mr66970861qta.22.1671477127502;
        Mon, 19 Dec 2022 11:12:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4WZ4e0TT78I6BTj+B5J6OCvTNSxvCbTJ0iT7YPslr/wN/iwITTWRX2ZLzl85CPVVxNqytY+w==
X-Received: by 2002:ac8:5f93:0:b0:3a7:ff9c:3f92 with SMTP id j19-20020ac85f93000000b003a7ff9c3f92mr66970838qta.22.1671477127286;
        Mon, 19 Dec 2022 11:12:07 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id y6-20020a05620a44c600b006fcb4e01345sm7694158qkp.24.2022.12.19.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:12:06 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v4 3/4] arm64: dts: qcom: sa8295p-adp: use sa8540p-pmics
Date:   Mon, 19 Dec 2022 14:10:00 -0500
Message-Id: <20221219191000.2570545-4-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219191000.2570545-1-echanude@redhat.com>
References: <20221219191000.2570545-1-echanude@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include the dtsi to use a single pmic descriptions.
Both sa8295p-adp and sa8540p-adp have the same spmi pmic apparently.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 79 +-----------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 84cb6f3eeb56..c8437efe8235 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/spmi/spmi.h>
 
 #include "sa8540p.dtsi"
+#include "sa8540p-pmics.dtsi"
 
 / {
 	model = "Qualcomm SA8295P ADP";
@@ -260,84 +261,6 @@ &remoteproc_nsp1 {
 	status = "okay";
 };
 
-&spmi_bus {
-	pm8450a: pmic@0 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x0 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		rtc@6000 {
-			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
-			reg-names = "rtc", "alarm";
-			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
-			wakeup-source;
-		};
-
-		pm8450a_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pm8450a_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pm8450c: pmic@4 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x4 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pm8450c_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pm8450c_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pm8450e: pmic@8 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x8 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pm8450e_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pm8450e_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pm8450g: pmic@c {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0xc SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pm8450g_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pm8450g_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-};
-
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
 
-- 
2.38.1

