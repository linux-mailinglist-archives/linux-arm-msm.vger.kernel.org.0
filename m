Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF98C6992C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 12:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjBPLIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 06:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjBPLIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 06:08:31 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D448B227A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 03:08:09 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a13so1538800ljq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFNh/v5PyRba+b9OKuV/fo4Fg+XrIWLYeu/MIaQD8HI=;
        b=nRZdpd2TJ5NmFJKugptl9/m9MnrT7wgZMwQkXPOvJQDdKoJvd6euQdl6Z9V195G0QO
         o9cRNbYokee/fxzuLNr52eb1c0y5avjQPG9RsMaF1XvsNmhJcnSOTAS3jKSS93N04Uud
         cDurXwMwWopkyqpAGLFhzwvB8DDeS04SUi84MFLu1VPWEBcvww4EAqVJ6n8+aXKsBtOU
         yaD7UjkpaaXOuBfAGZZwmPO4wCYJWOPa2IQMqrNDIsiuFe9hC3R452fFXwgSf/zJmOOf
         QNKVeZr6YMDPtTpJWjeLXPO8oHB8cRWa1ImVq7SiKQFrcj169Fcr65cb/o48K30DkyX9
         yK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFNh/v5PyRba+b9OKuV/fo4Fg+XrIWLYeu/MIaQD8HI=;
        b=jWtwPpWqwIHwvUR9knEt4TcucVZIZB8m7J6kDX6FA1V1pIzj0uLJsUZu+CGqgVavg5
         rzAeqexrpqCp5UGeJgzC7wzEWNdh73mgbUb9N6cVtqxr2gzexgkkPtMaDaQmz+MWKHqA
         pyQzqB1/++yNdPjrQn0DcXsWFDY02gyqyDMOlxZzrluQzEEiKvMT/Ev5el5oXW8ytVA+
         YqmrPrn0UlSboedgi9ChxYscFHQGEsN1xm/OV5vphXxb+ivqhM9Ha4341ngDvOdUHW0a
         ucLnBTReM+Qea3To5FWWQHaPrExqK2/JBdba7bcYO/xWfF5vjDAMpzw5ZqkrstnZyQzm
         +cuA==
X-Gm-Message-State: AO0yUKWytT52Gdsz9c7p7EM3ripihpS1lz7ggKfI9rEnyY6nuAvb/tf4
        z5zqSRLezXetqfnVaNEzNtpebMWyHadO22Vf
X-Google-Smtp-Source: AK7set9psRJZOenjDBzWRsX8u1qwYgjPnrP9p1UNfWJAEa18c2fgh6dKrd6v7bpMUmutB4Ypho19LA==
X-Received: by 2002:a2e:b88b:0:b0:293:4ebc:98e0 with SMTP id r11-20020a2eb88b000000b002934ebc98e0mr1980800ljp.17.1676545688047;
        Thu, 16 Feb 2023 03:08:08 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id d19-20020ac25453000000b004db20d07decsm255993lfn.209.2023.02.16.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:08:07 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550: Use correct CPU compatibles
Date:   Thu, 16 Feb 2023 12:08:03 +0100
Message-Id: <20230216110803.3945747-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216110803.3945747-1-konrad.dybcio@linaro.org>
References: <20230216110803.3945747-1-konrad.dybcio@linaro.org>
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

Use the correct compatibles for the four kinds of CPU cores used on
SM8550, based on the value of their MIDR_EL1 registers:

CPU7: 0x411fd4e0 - CX3 r1p1
CPU5-6: 0x412fd470 - CA710 r?p?
CPU3-4: 0x411fd4d0 - CA715 r?p?
CPU0-2: 0x411fd461 - CA510 r?p?

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ff4d342c0725..a65c3151baf3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -66,7 +66,7 @@ cpus {
 
 		CPU0: cpu@0 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a510";
 			reg = <0 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
@@ -89,7 +89,7 @@ L3_0: l3-cache {
 
 		CPU1: cpu@100 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a510";
 			reg = <0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_100>;
@@ -108,7 +108,7 @@ L2_100: l2-cache {
 
 		CPU2: cpu@200 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a510";
 			reg = <0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_200>;
@@ -127,7 +127,7 @@ L2_200: l2-cache {
 
 		CPU3: cpu@300 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a715";
 			reg = <0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_300>;
@@ -146,7 +146,7 @@ L2_300: l2-cache {
 
 		CPU4: cpu@400 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a715";
 			reg = <0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&L2_400>;
@@ -165,7 +165,7 @@ L2_400: l2-cache {
 
 		CPU5: cpu@500 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a710";
 			reg = <0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&L2_500>;
@@ -184,7 +184,7 @@ L2_500: l2-cache {
 
 		CPU6: cpu@600 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-a710";
 			reg = <0 0x600>;
 			enable-method = "psci";
 			next-level-cache = <&L2_600>;
@@ -203,7 +203,7 @@ L2_600: l2-cache {
 
 		CPU7: cpu@700 {
 			device_type = "cpu";
-			compatible = "qcom,kryo";
+			compatible = "arm,cortex-x3";
 			reg = <0 0x700>;
 			enable-method = "psci";
 			next-level-cache = <&L2_700>;
-- 
2.39.1

