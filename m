Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F0C659A4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 17:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbiL3QCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 11:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbiL3QBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 11:01:47 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F8D134
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:01:46 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f34so32204178lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNLqnNrwtc8egWj6ivupuCwXlXZg5s9E1n/tTglQYEU=;
        b=wPx2pAEmsAUWbvfzuQMjiE1KEzljM+N5Xu3sJBC2lch5pMld0M0++fBqvfryPzSXMG
         oTFTPDWsoy37gyBkZkoS5QqoAyMZ6KKs9lHC6EZAEulmg778r+GCRujJbDrao1oTsODq
         eJz5PU6PaNiQehcOFHWDQjH4RZY7qawkNa//oX0jnVdCyRtnls2Hxe76UXBlMEGQdpUE
         hX0z9uZIS9B4v/Q95dAJruSoogJEovBgo/AMlSNYvsNDCtEpkSzNJHPwcffRkleDHT74
         I9dCQj79lbXRyfjZxhrRf8C09bmTmgu8JmbPI7UkF2ZSHX2A+jIJCddTvTVeAIXJTEyG
         qpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNLqnNrwtc8egWj6ivupuCwXlXZg5s9E1n/tTglQYEU=;
        b=VSFpvAnNsSp7uEB28TSs2ZLeGFPRK7/DewexBfsqekLWWr1UTTGPIp0yKcni3zIQiR
         hIhL69fcbEDxt69P+sZPg5pfaVdVU51JRDqmDs801Jj6xOtoLMRit4LZEmyqUlU61wkK
         MrQGOuTBfRCje0zTvvBOGKyBT5IOhOUAW5W0wWaRdf3D1Ucfu/FQB371qPp0lF/9cenV
         Jjuna0UCKaQfjBUiP51XT7EG5xFcBd4YYTeKssGV6biszYD5GItjtLXrJvGnx9iuFccX
         f1QJ8V/13NpWow5QwDLraBDNVYwJJl4vyyC/3wLMle2Rg2QYowxVNi0yownORO7pah8F
         Daag==
X-Gm-Message-State: AFqh2kr+Dn8HKVvA+kOZRxSCuVKLArLN0lnwwKzdRebT+ezlbsdFEiFK
        Npd8/81LGPqsJuQmzn7ZlT7ic7b5qlN+CuW/
X-Google-Smtp-Source: AMrXdXvMYpOhnBQBBoyUs18vmPYhsX6pglmbRNV8MTyri6s3X7HHj0F2O9eOwEfVOK8XbUO+Yp15KQ==
X-Received: by 2002:a05:6512:1507:b0:4ca:f9e4:4d57 with SMTP id bq7-20020a056512150700b004caf9e44d57mr7896210lfb.11.1672416105032;
        Fri, 30 Dec 2022 08:01:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p1-20020ac24ec1000000b004b15bc0ff63sm3520874lfr.277.2022.12.30.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:01:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/7] arm64: dts: qcom: sm6375: align PSCI domain names with DT schema
Date:   Fri, 30 Dec 2022 17:00:59 +0100
Message-Id: <20221230160103.250996-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230160103.250996-1-krzysztof.kozlowski@linaro.org>
References: <20221230160103.250996-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings expect power domains to follow generic naming pattern:

  sm6375-sony-xperia-murray-pdx225.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6',
    'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 12cf5dbe5bd6..31b88c738510 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -264,55 +264,55 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: cpu0 {
+		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD1: cpu1 {
+		CPU_PD1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD2: cpu2 {
+		CPU_PD2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD3: cpu3 {
+		CPU_PD3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD4: cpu4 {
+		CPU_PD4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD5: cpu5 {
+		CPU_PD5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
 		};
 
-		CPU_PD6: cpu6 {
+		CPU_PD6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&BIG_CPU_SLEEP_0>;
 		};
 
-		CPU_PD7: cpu7 {
+		CPU_PD7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&BIG_CPU_SLEEP_0>;
 		};
 
-		CLUSTER_PD: cpu-cluster0 {
+		CLUSTER_PD: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&CLUSTER_SLEEP_0>;
 		};
-- 
2.34.1

