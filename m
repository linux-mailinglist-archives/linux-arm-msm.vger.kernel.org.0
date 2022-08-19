Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652FB59973E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 10:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347730AbiHSIc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 04:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347676AbiHSIcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 04:32:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D722DE9AB8
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i19so5211380lfr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=kO40mQ5LLiZM72PI1BOZaM3hZEnsq6qb9gCyjdGLi8E=;
        b=g1vh6m10ovfpwnHEpYd5bleuB3ieTl0HlOZy9kcgToeIlnHokH2a6h36qB/Bz7bqtY
         rnjOjsJydffU24SgMyQLzR+6ldMGAEFkIrt4kJVVujYzUHiP3VOC6HAY7nebnULJnFDn
         IlL06PdoFY1GpUlxMT0UqPrQD3SE9lB97QmIoTP3GIMcseDK6XXBjqYnW9ogMstg9IjA
         gcdesJFbkkrDkbKEL7KrXrhIn7XO+3SSWFRIUoCNwWukhk2aOe7Tq56YEhN+66aHASN4
         6joodtqmahp03Bw+KMQvjvkLNs7kHDbFhp/YdfaIH0+uvRnkuXamKGbsmvju7zj8J6Cz
         +PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=kO40mQ5LLiZM72PI1BOZaM3hZEnsq6qb9gCyjdGLi8E=;
        b=1rzKYYqfYAvx7EYxx4NyjfVScIXo2ccI/I2mEzT4nwex7VlDFnLp7VnbIyC0NAKHA4
         WpMcMCo9hBsXWLleorxPYCD2AZPPe4T4yMZPh5wxDXVOEJyd+9hwFEqI3AWAMfx6Yg3+
         46x//OkjSunEGSsmux896yF+HQiW/Y63cGxH7SUJAuJh89aGLlgktXK6thPAMVVQUQv+
         LRjAqGQ1Q4NplOe+gVBNhhk7oNYXOc8xksjIMOnTYTZQJV/tzTe44j8YslQCbPIcStTV
         bYaf2cQeH9UhkNzYPKSk9KhEIG+fkuXCYnCz6VVqMGQUReTlMVMW17Qi1t5IDXMzJ4AU
         uQPQ==
X-Gm-Message-State: ACgBeo2oXzxqp6++zRk9w2a2kizi+T4Q+RkdIktMrBm3JMIR10BySYm0
        nzm1zuuN8xlF5u/bEGAZWlSy2A==
X-Google-Smtp-Source: AA6agR7KumzH+lH7XCNHMJ0xX3epEUY1/e/6aC/dy4l7Gna3s4wt6/o6JpLuJTOao+IuaHNwqY2TGg==
X-Received: by 2002:a05:6512:3090:b0:48b:6e1:1b55 with SMTP id z16-20020a056512309000b0048b06e11b55mr2325331lfd.535.1660897955437;
        Fri, 19 Aug 2022 01:32:35 -0700 (PDT)
Received: from krzk-bin.. (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id j8-20020a19f508000000b00492a54f0be1sm545355lfb.284.2022.08.19.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:32:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 16/16] arm64: dts: qcom: sm8150: switch TCSR mutex to MMIO
Date:   Fri, 19 Aug 2022 11:32:09 +0300
Message-Id: <20220819083209.50844-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
References: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sm8150-mtp.dtb: hwlock: 'reg' is a required property
  qcom/sm8150-mtp.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6df2e6828282..da737ba54490 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -585,12 +585,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -2054,9 +2048,10 @@ ipa_virt: interconnect@1e00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_regs_1: sycon@1f60000 {
-- 
2.34.1

