Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C695EC7DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiI0Pes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiI0Peq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:34:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56041C27
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:41 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d42so16380095lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZL3t03EQvl9mHvGpFybHkv480XEe974dhXgVTeybEX4=;
        b=dbnNysgG0XYWDDfkYPwEEF2Kq1F0PifZCOgGFORNmq+QkNXSr+rU3zjtNJ7hkzldNt
         y3UUELTICwaQQ+R1tV6OQQxdBfA8eLM/YCaSAOMbVaSFr3XefNrZ3VGgBw1/uDXamI4k
         CjWLwQEcuajJjKeuIibqs61YvJsHKxVAZPuGrfupfPOsF2HeSg+U7WjX6HcpajOh8lrC
         Mzt0wMCsOlHzttWGd0A875a/xg81pzRfdCkouMEp2imBhn7rFoGYdB5mo6zkqRCfCDQu
         cImV2eqYyWyT1EIDtnlsGNIoVHQpRtLRrFmUNScmtjfDQ6fMkVMDooEO8iOEVCKpAywA
         KQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZL3t03EQvl9mHvGpFybHkv480XEe974dhXgVTeybEX4=;
        b=u8x0JhPvpni87apZZLsqzp6qLc2kl2VAYzQ36Se6/fU9oBfVMvpnOwxeSzRd3y87xy
         kA9SP2nNzecFMe6l5OQkk9tlP7eNkpne99tuSXEwGhO0D8DrydYClkTpcoxvS2BAh251
         EUzqzqz1+kMmwHzjbmQ2lAmJ06GsvHhc36b+Ziz14KCIWgjPLRUCEH0l0mYuYRq+M3l0
         3/iQ006pit5hcc6OUzx3ftWnO6gyQDoOOSpGlShPTP/aA5fc/41W5KwmOlKUOY/ZF293
         o8tAbIhj89rQHXVCvD1TOnn5PE+XT9qwzoU8JFc8Qg22ODK996XfnuXYGVEBY+0dJRlb
         VTCg==
X-Gm-Message-State: ACrzQf2iCSjMDa4IT1raWJIzAhll9WBrKKQoG3sPKFFz9KVZH/777/eG
        jZDJUwuhOlxQed/0AXL5PJ0nls3uZHcD4w==
X-Google-Smtp-Source: AMsMyM6M8TEnRKBH7blo7l6uhJp6U50XP548dWbIGw2tS11iWONM0nWkCh9xDcAaQVPxVZTkGZczLA==
X-Received: by 2002:a19:5016:0:b0:49a:deeb:8681 with SMTP id e22-20020a195016000000b0049adeeb8681mr10796490lfb.331.1664292878101;
        Tue, 27 Sep 2022 08:34:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:34:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/12] arm64: dts: qcom: sc7280: drop clock-cells from LPASS TLMM
Date:   Tue, 27 Sep 2022 17:34:18 +0200
Message-Id: <20220927153429.55365-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin-controller is not a clock provider:

  qcom/sc7280-herobrine-herobrine-r1.dtb: pinctrl@33c0000: '#clock-cells' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8d807b7bf66a..8823b75a6f1b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2432,8 +2432,6 @@ lpass_tlmm: pinctrl@33c0000 {
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;
 
-			#clock-cells = <1>;
-
 			lpass_dmic01_clk: dmic01-clk {
 				pins = "gpio6";
 				function = "dmic1_clk";
-- 
2.34.1

