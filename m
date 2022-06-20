Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C79D5516A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241436AbiFTLIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241316AbiFTLHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:07:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4DF15821
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t25so16672190lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62OO2yCwxwMb/L2GgmcHraQZ1ek3MUdm3J131ESPihc=;
        b=eLtGXgDOOr7siYqeE0W5flGwpG8fq6utLJznkhQXy1kxcY/K4yyTBCY8CD41npihB6
         zPpgW6l3WzOxKVU4ZRxnO3ORUNaWmTfSVX8+2F9OY4fsFyDEqlBj3yoKdcssKqCmKsNY
         T1jpLcHxQ4KqAvD8kbgPQqzeeqdoN0HYI9XAY7c/kWr7tIw4Il18ZwrA+eQOy4/dtZsU
         z5nQxrgWta0nDV2zXTt92RFDLBZyK3EaFa656wTeTObSZ30DKPOzaHkOIbUtZClV9xmn
         aWZrQwRwygb7qYI8PBpLL7nTT49SOY7C1UiUAbROalLTOeg4odgTxDDHuPL6INjskAMT
         TJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62OO2yCwxwMb/L2GgmcHraQZ1ek3MUdm3J131ESPihc=;
        b=dV5A7HpYTvmyOgYPssVrhplRcBlo2r7BPUn1CjyBvQLB0sCvm8LY/rUcd/4gk9luR7
         gfa0NIItmEwRYTED8T0nHv5wteW0pfWX4wYvFv0b2WTgs9ELMCh9Kufth7ljCeDJfJw3
         0E5b4Zg4GMFlOFMojziZDG8RopaydxNur3gm9p0Y9OGFzLJdfdQDzjy3T9YNUsZNRml1
         dKG4oJXcaQnSPsP6Tiu0CjpAnTQMf56psaugo98TQtemK4R4VEP4IvdlAKtuevvaaSgU
         Vg02X4oRuz8PLGB4TXW88A8zdcjj3KzDYYVk2vQaytj+Ft4G+bJ6pYcfkkhqWchWiJ+C
         Malg==
X-Gm-Message-State: AJIora9pVTZyo/p3Cb83/7iUaFs9StcQ9KXm7JPm53bCG/ag1tzm3X8W
        xCalg6B6Psz366Hc3Z0HXgDs6Q==
X-Google-Smtp-Source: AGRyM1tANibob6a8MmrreIwp6HYYGHRayHE7zSb9+om8OHS3yYzXteisDCzPfNzWiUSJYWSfW36fQw==
X-Received: by 2002:a05:6512:3da7:b0:47f:56b3:dbe7 with SMTP id k39-20020a0565123da700b0047f56b3dbe7mr8620964lfv.226.1655723267409;
        Mon, 20 Jun 2022 04:07:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b00479a825aa5esm1722564lfb.154.2022.06.20.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:07:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
Date:   Mon, 20 Jun 2022 14:07:39 +0300
Message-Id: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pxo/cxo clocks to the GCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 47b97daecef1..61e3ab0ebfd3 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -50,13 +50,13 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
 
-		pxo_board {
+		pxo_board: pxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <27000000>;
@@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&pxo_board>, <&cxo_board>;
+			clock-names = "pxo", "cxo";
 		};
 
 		gsbi6: gsbi@16500000 {
-- 
2.35.1

