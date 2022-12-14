Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B77A64D1A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 22:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiLNVLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 16:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiLNVLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 16:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A978D2F66C
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 13:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671052255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LmjUSyg67D39D4GXwHdsjU8ybX4fVmhyxG/436wX9C0=;
        b=HVg7Pj2Gg1S99Kf3mG0xJ4R0ByOPPBMtITmpTfWXgXlShIvrh1Nz7h+O7CNFuGdQx9Vhjb
        Gi3aWis36vm5fOmhcizDjupaCT0aw4oCDpqA1NO7UZLEofw+qEdFz2zKBfD65SIYXBW6ym
        0SmcaGsdPM46FgWQ1KcxpicWxI9Q/KI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-9oACKNqWO3qL_wa_67IVFA-1; Wed, 14 Dec 2022 16:10:53 -0500
X-MC-Unique: 9oACKNqWO3qL_wa_67IVFA-1
Received: by mail-yb1-f197.google.com with SMTP id k7-20020a256f07000000b006cbcc030bc8so1177780ybc.18
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 13:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmjUSyg67D39D4GXwHdsjU8ybX4fVmhyxG/436wX9C0=;
        b=VyaXAII05dDXW/BmMA3FDcU3npWga/5sSNUiMcsKI2tKKNtorAPXqgZMgmRfUbIm2t
         /DicBy+69C5b7qoGRyogL7DTQcuTUTSOCtR97Ioe4RpVtCY/iB98kKk7srMjyqwhMvOl
         xdWZsp2af9SS/fS56CjvJGPZC/GwqEwMtCnmVZZ2sWFeaqiHyhgAfGw94hT2wgxohZw3
         ZlI0YdBuLIdMuUgjo5ElVOabvkkyPamz+x1wPxWB2VGZECyOkSkQssSPWab+jbIOeCHo
         lkrFX7TLBzM92VUswlaQvKR0A1GuSCXryXZ/UE697JMLUVZLfQaXUOserOEMrdjMleGp
         8xPw==
X-Gm-Message-State: ANoB5pn3EPF9GXnoN8Vci5mfXX/WHanYUAOD+gi5DN0dYn5E7lpbZ98W
        ycHF2pvKePjh3p/TPlT/cFXIpz66n6GCml8SItn5ZM6DQA1rmzlawk+yVlG/jFahf47gCpBPDF2
        iUKm2lpaKg7hOQvD0DKdf90mH/g==
X-Received: by 2002:a25:180b:0:b0:71c:52cd:fad3 with SMTP id 11-20020a25180b000000b0071c52cdfad3mr17470908yby.54.1671052252968;
        Wed, 14 Dec 2022 13:10:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5XKPZgWply1k688HeenolESiyaXxlmuHoy8v64dWdS7ogBcS7mrLpSIhHlgMvK5FZO27LsFQ==
X-Received: by 2002:a25:180b:0:b0:71c:52cd:fad3 with SMTP id 11-20020a25180b000000b0071c52cdfad3mr17470885yby.54.1671052252715;
        Wed, 14 Dec 2022 13:10:52 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i15-20020a05620a248f00b006fbae4a5f59sm4542505qkn.41.2022.12.14.13.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 13:10:52 -0800 (PST)
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: sa8295p-adp: use pm8450a dtsi
Date:   Wed, 14 Dec 2022 16:09:07 -0500
Message-Id: <20221214210908.1788284-2-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214210908.1788284-1-echanude@redhat.com>
References: <20221214210908.1788284-1-echanude@redhat.com>
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
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 79 +-----------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 84cb6f3eeb56..889259df3287 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/spmi/spmi.h>
 
 #include "sa8540p.dtsi"
+#include "pm8450a.dtsi"
 
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

