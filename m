Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729D7735CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 19:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjFSRCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 13:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjFSRCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 13:02:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09DC187
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 10:02:00 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51a2c60c529so4584501a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687194119; x=1689786119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CVX2V9zY9Zr4mVjQxPBpI/yV4vv6hWG8lH91L0wJKU=;
        b=LI9GwyX0Td0abqCUKUA0+yxKakRrbMpo8y5IL9FlKNUlNZ5OPJi0q6TmoKP9uCWzIW
         MzCd2VPnc9PJN18VlTuL0Hj2lJtp1SbuB2CrwCG19I7OdEiz1ZKeFbO9TA2PRPfkDTSG
         99PEgw3m0C2LW0Y3z3cah75ZyOukshdC9+h6kSa6vyKojoIttxHKoznRqzoNAjA3F1iG
         T3CXgB+690BQ3pBpS8qcFrdKug+Wfjsud8GXarisgmlcxj73KG3zJzYMZ25ikazC5TfH
         QNxzf4R5YFWePYO3teF32iNcFsLLeCImM0fcY518mpcL7wULCRTEwaoqgZiFQbN/uWgH
         EHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687194119; x=1689786119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CVX2V9zY9Zr4mVjQxPBpI/yV4vv6hWG8lH91L0wJKU=;
        b=JQhCRdFBUZkQe52kNhROs7i0mlDGaxhMWTDGn4nmub5GfOEMSRJ35+CBNm399SP2tV
         GAizGMdFiGqMOTsz2262aerhXhkUuiuZ7z7wE1QSHDlNer9jIvJL0TwByCom+Bl2o08e
         +YMDEWvFWj3I4TZUg/6840BbzAF7NQT+rOXvrGumE+czOxFsJTMaizNVQ493XEUg+MH3
         nznnSs4C71hPfCxo7E3SCwRU3MUEpGLd+WlaoBmuNt77qQuXElCrSVwmNbCsr5Kc30cp
         wydVtkOHRnYkkya8iLrwGozfRsEGJhe/63L4xcE0XQS1mHi95PmizfinLBFjYY/pG03C
         XRRg==
X-Gm-Message-State: AC+VfDwir3b9VeCjrdQiz7597gcgdYI4ep8HFpkemV11zFg/Nu/MSi0C
        0eiI97oqPHJu0/m75P5ktz/grg==
X-Google-Smtp-Source: ACHHUZ5CDOMpM4CasGTH50dZ1YNUc55eOzXIODX4KiOAAFUg2vUEvjwsjZeJtCEFbz5vuPGc77rNpw==
X-Received: by 2002:a50:e604:0:b0:510:d0bc:e130 with SMTP id y4-20020a50e604000000b00510d0bce130mr7283121edm.33.1687194119230;
        Mon, 19 Jun 2023 10:01:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p9-20020aa7cc89000000b005166663b8dcsm13136672edt.16.2023.06.19.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 10:01:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ARM: dts: qcom: msm8960: drop spi-max-frequency from controller
Date:   Mon, 19 Jun 2023 19:01:51 +0200
Message-Id: <20230619170151.65505-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619170151.65505-1-krzysztof.kozlowski@linaro.org>
References: <20230619170151.65505-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

spi-max-frequency is a property of SPI device, not SPI controller.  Drop
it from the controller nodes.  No functional impact expected, although
qcom-msm8960-samsung-expressatt board does not have any child SPI
devices thus the property disappears.  This fixes dtbs_check warnings
like:

  qcom-msm8960-cdp.dtb: spi@16080000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index fa2013388d99..d13080fcbeea 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -364,7 +364,6 @@ gsbi1_spi: spi@16080000 {
 				#size-cells = <0>;
 				reg = <0x16080000 0x1000>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-				spi-max-frequency = <24000000>;
 				cs-gpios = <&msmgpio 8 0>;
 
 				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
-- 
2.34.1

