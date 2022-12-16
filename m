Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E2064F512
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 00:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbiLPX36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 18:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiLPX3x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 18:29:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1AB264A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671233345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KiNEfpGaBG3teD1hO8rk7pFV8NF3plZeCu2feOarOPI=;
        b=FRQc2KZbJps4pWa1X6Vg46pMEFGU6fFLv7uZbvfC67L7PCZdCE/oI29CGIXFI7spOGi6pX
        RfoBuBVfxzHEHIXu3Z2tTOHkP1SQqJhE1MHwfXonUzTXGWpUB9hZgswS/oPsNyWxmnxLFx
        iqMaQTxdnim2+K6D+QW92LF02SXAgJg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-b-6ZOUbNMoaOtdn5BI07Lw-1; Fri, 16 Dec 2022 18:29:01 -0500
X-MC-Unique: b-6ZOUbNMoaOtdn5BI07Lw-1
Received: by mail-qk1-f199.google.com with SMTP id s7-20020a05620a0bc700b006fcb1a3bb9dso2913575qki.15
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiNEfpGaBG3teD1hO8rk7pFV8NF3plZeCu2feOarOPI=;
        b=EtvBnZj6sbkg1vydvzoxmuSwvcLlqhs9ks3i+JLprz69za+zcCrkkPu0SuayAZ8eX4
         ZrWscaxtv+R/WADGcrB3c3KZd0Hi2bGGRMwyGk6srQ0ZTV3NQSq8fydehBZqW5Ix7lH8
         fyKJMgo0b6Txp5fjMIchd2OEoKMT96s+OK0IyS9S6PohHg6Qe/rt1Sozp1OOJHrn+jve
         WdISxqdRZmLpeXq9rvPX6OhNCF/8M7yfOwUPxvMNW4NTyIhxgCDDWweUQi0069kLw5Bn
         G5sbJ5XFgUYXUf2qLWAxMUZ2l9ghP2+ACQOn75Nfqo/BZ9V5qKcaLs6O6Dnl4EWJ8EHE
         GKiQ==
X-Gm-Message-State: ANoB5pln01dFQFEmio/k9gdnG9JQJOPMUaWk06r5wPTXNexkNzZB2Alb
        57hWl3D/yWGNwUOjTNmMRrtgTkUYn5UxWqe/1DfJC+GADrECkJ7tZKsQXjZ/7s78fvDoFY+4tBL
        eXpV9bMwbd2V6S1Lr0tel1iC04g==
X-Received: by 2002:a05:622a:1309:b0:3a5:258c:d6a5 with SMTP id v9-20020a05622a130900b003a5258cd6a5mr62238047qtk.12.1671233340622;
        Fri, 16 Dec 2022 15:29:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7/8dbu0njX5TZtiTTddppjlgg2Gwd1BgAe/Jel7JEjJTLPajh1BgAGO/rtNV0KG83pWdcD6A==
X-Received: by 2002:a05:622a:1309:b0:3a5:258c:d6a5 with SMTP id v9-20020a05622a130900b003a5258cd6a5mr62238029qtk.12.1671233340403;
        Fri, 16 Dec 2022 15:29:00 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id p12-20020ac8460c000000b003a7ef7a758dsm2099936qtn.59.2022.12.16.15.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 15:28:59 -0800 (PST)
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
Subject: [PATCH v3 4/4] arm64: dts: qcom: pm8941-rtc add alarm register
Date:   Fri, 16 Dec 2022 18:26:06 -0500
Message-Id: <20221216232606.2123341-5-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216232606.2123341-1-echanude@redhat.com>
References: <20221216232606.2123341-1-echanude@redhat.com>
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

A few descriptions including a qcom,pm8941-rtc describe two reg-names
for the "rtc" and "alarm" register banks, but only one offset. For
consistency with reg-names, add the "alarm" register offset. No
functional change is expected from this.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi      | 3 ++-
 arch/arm64/boot/dts/qcom/pm8950.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi      | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 574fa95a2871..db90c55fa2cf 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -121,7 +121,7 @@ pm8150_adc_tm: adc-tm@3500 {
 
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 08f9ca006e72..e2a6b66d8847 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -93,7 +93,8 @@ adc-chan@f {
 
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
+			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
index 07c3896bd36f..d7df4ad60509 100644
--- a/arch/arm64/boot/dts/qcom/pm8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8950.dtsi
@@ -126,7 +126,7 @@ xo-therm-buf@3c {
 
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
index 20c5d60c8c2c..ee1e428d3a6e 100644
--- a/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
@@ -108,7 +108,7 @@ pmm8155au_1_adc_tm: adc-tm@3500 {
 
 		pmm8155au_1_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 
diff --git a/arch/arm64/boot/dts/qcom/pmp8074.dtsi b/arch/arm64/boot/dts/qcom/pmp8074.dtsi
index ceb2e6358b3d..580684411d74 100644
--- a/arch/arm64/boot/dts/qcom/pmp8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmp8074.dtsi
@@ -74,7 +74,7 @@ vph-pwr@131 {
 
 		pmp8074_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 			allow-set-time;
diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index ffe9e33808d0..22edb47c6a84 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -125,7 +125,7 @@ xo_therm: xo_temp@76 {
 
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
+			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
-- 
2.38.1

