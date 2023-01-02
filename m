Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D482B65AE6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 09:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjABIzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 03:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjABIzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 03:55:01 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1142666
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 00:54:59 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j17so31284748lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 00:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xd4pU6bNJXAmA0DRMKbQh8++iQzAoVOYwtwMn3h+yQ=;
        b=HSduBPi6SnT0EJdkWTEwds2p7S+I5laQ6jab5j/hZ9qZSa9MVsVd8OncWrFQo67YCj
         VA7yJMnZxmJlPVGAniDfNDwMMf/QNOuUCQMmbmhg4ZiuDu9mnIyc6+r040pIjZL3KiXK
         Xl/wqpcdlNf5E69kxsnT5v5/VVH4SsRYLWpshWOsxP2RVPHyC4iWB2Fhms2onsUAvmiV
         YPrJlh/3NhTXpkXTpml/iPO1bEqS4/I6nWW2R7Ot6pK9ODMvMYwdHP9qA/MnCfiY700D
         6+JlWEte7lO/NU87OJ7IuTTPuzQWWxKjYcPXnYvur0q3HCuaiifxPQQDVaF+C0M42x3A
         8EcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xd4pU6bNJXAmA0DRMKbQh8++iQzAoVOYwtwMn3h+yQ=;
        b=CYmtR/L01rzDMBopk43dr8b00l39aXN1lXk3K8qNrU1e7ReZqu2cT0MNW9gGIna4iE
         LpDwcJzpzmWEpZnOtNIu9/BPAGIH6LxWWo1/BNrh9+rHl7w10oRbWPmrjzoWmp3fYmNd
         S2BF6d/6BE0e/GRGQJ9JeW1PrqOlKJ0QVAf9bNS0KzRGfUfUp+xdcz4l6nJA7C3tmosU
         Fa4JYmDcmUG0p5e8kwKTzAtQvYO5CPZol8EZ+Jl3LjuglofS6mFV78EuIQrV13n6lZlc
         8iMemH7GO0QCSM4nZF5nkHARNTfGpT9sToI0FcTYfDCJzAFuJktV60bC6F9+6UkuTWFT
         83VQ==
X-Gm-Message-State: AFqh2kq5X4FFTVIME2qnbV4An5vmPS/IVZuYKQjGoUgdpfFpuAiOSN4b
        4t4msmluFbyWwQKaZJkvKTwSUpUdbAUQ7SFI
X-Google-Smtp-Source: AMrXdXuhL0542tuDQfgRQDDyiAxKhZETN6HWCegQdVorrthr90sRPjxVKD8rdU1HgmNdHyk2RacDCg==
X-Received: by 2002:a05:6512:3fa7:b0:4b5:cda:44cf with SMTP id x39-20020a0565123fa700b004b50cda44cfmr13568210lfa.67.1672649699420;
        Mon, 02 Jan 2023 00:54:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25108000000b004aac23e0dd6sm4408815lfb.29.2023.01.02.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 00:54:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8450: align PSCI domain names with DT schema
Date:   Mon,  2 Jan 2023 09:54:52 +0100
Message-Id: <20230102085452.10753-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102085452.10753-1-krzysztof.kozlowski@linaro.org>
References: <20230102085452.10753-1-krzysztof.kozlowski@linaro.org>
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

  sm8450-qrd.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6',
    'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9f6b689c0edd..61575f6fab0b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -302,55 +302,55 @@ psci {
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
 			domain-idle-states = <&BIG_CPU_SLEEP_0>;
 		};
 
-		CPU_PD5: cpu5 {
+		CPU_PD5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
 			domain-idle-states = <&BIG_CPU_SLEEP_0>;
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
 			domain-idle-states = <&CLUSTER_SLEEP_0>, <&CLUSTER_SLEEP_1>;
 		};
-- 
2.34.1

