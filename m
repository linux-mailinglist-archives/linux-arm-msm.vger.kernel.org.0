Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5965F1291
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbiI3Ta3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiI3TaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:18 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A8D2D1D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:02 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id x29so5820685ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Lb2yg7Pt4DxTka9+KV6Co4SrBHPOoUuiBCx5duzCR9A=;
        b=b7FJzs0y0ZOg+uDpLQWkuySxRK/xEdxb73N2jzPsSJuZf+nW58jEMPA3iQJMkW1iNN
         0uylutnZEq014/NLKw3YyGeUjVMuvWyWR84AVZOb2FdvjgBy4xF/3apFGKszY5YsKXw6
         Aixa9bxwx7SLB9JSBkOpXnIqz5CYq/HuaRC7zsUioNZqdGL3FVQCXcY546L2mglPZS/r
         23CaktcHLv/DoLeAcYYYCQKR6b1RlDiw/im2InpHcz4GW11L1wgq8+FN7bYN/ROyVLEL
         dm6cE0bfVx1N/UsP9vlDq2Bob5m7sx6+Slu8MmfRyJKMXT0VOxV0z4+1P3PGLXl726e0
         UTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Lb2yg7Pt4DxTka9+KV6Co4SrBHPOoUuiBCx5duzCR9A=;
        b=oH9Y928M9KrouAktn8NmWFmobXueFEQpjim+/n6FT+v3G/UDdXuWZs1yYaG/u9DgHw
         ZIrVQ/497C6nG8Oia9GS8bc94KZXaaAo+zBpqD9ntVyuSG6i2Ud+ZWc6B4gufdQeiVHM
         4P+/XEKtF7ZBTqmXjwAuYA7O3EMfp6l319EiVJgrjeEP9WSYrygdNNNpaNUJDdICKLjT
         JmDgu041LfRvF09UuDtkolizasP7wmHFQFHSRw9cT/ZwrMvH7dY0Y91cEK/Vn7i7SS8p
         CWsRgBfyqV8Ih+6ZcN2KHf7K6F1MRs/zVQ6Fopi7vI3Gq9erC9jcObVH8aQFA5+tiRjd
         GeVw==
X-Gm-Message-State: ACrzQf2ABlQiDWsHmcxR9d4KIFsORhkHgKGAJpkACUehn+FIhtQ2zgBr
        8R+Oeu6tMJSnzqAX4XTXBS4B6A==
X-Google-Smtp-Source: AMsMyM77CLzXh4xZxRxEciMDgQAB2TqSrV7Ow+HBHesd0WBCQkdu0+TKE7+uxlf/vB5B556MNZ62yg==
X-Received: by 2002:a05:651c:239c:b0:26d:94b8:781d with SMTP id bk28-20020a05651c239c00b0026d94b8781dmr3101983ljb.189.1664566200595;
        Fri, 30 Sep 2022 12:30:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/16] arm64: dts: qcom: sc8280xp: align TLMM pin configuration with DT schema
Date:   Fri, 30 Sep 2022 21:29:41 +0200
Message-Id: <20220930192954.242546-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sc8280xp-crd.dtb: pinctrl@f100000: kybd-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'disable', 'int-n', 'reset' do not match any of the regexes: 'pinctrl-[0-9]+'
    'disable', 'int-n', 'reset' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts            | 12 ++++++------
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index fea7d8273ccd..a2027f1d1d04 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -374,19 +374,19 @@ &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -410,7 +410,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -418,13 +418,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b2b744bb8a53..68b61e8d03c0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -350,19 +350,19 @@ &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -384,7 +384,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -392,13 +392,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
-- 
2.34.1

