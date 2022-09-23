Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE75E7F73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 18:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiIWQQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 12:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiIWQQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 12:16:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B7213571D
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so1089031lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O2OpEAAPFwNo068HiZEkERwNKenc5oVwQC2zPGrto2w=;
        b=T6RqEtrtI+OZtEu3SZ1gfjFsTBFVG66Ec3xG99jnU2NdLO3wzBp1iU+QuGTut0MdJH
         sd2V68cAa6px5RDji+IIbWAfBZ7kae1/81NBq+lHICf2TnsJDFANgySfbuaiJG2MzHBf
         QOndLXZHX5qSO+9YP5yyaU+CDLKVKMLkeCrN1gOqmsxqJsuut0GiMuQ5rKLnv3T426xp
         C62QHbPS0EKMlrFgxMseiiCA5HQkS9eaWFQsRYX8eWh0Nhj9+fZCaKhp+r0ySsZPHxpV
         3RNHqpliUaNU+X9yyEweNKM+HuUSwExkhC9+iNq8xJaPi0Z7JVK3sikx+gpZsth9HC9+
         jyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O2OpEAAPFwNo068HiZEkERwNKenc5oVwQC2zPGrto2w=;
        b=un6GxSYfGM32CqAnPAuJyfWn8LIUJD7jNF9BnX36qFlrDFnUW6SLxThvj6ooZjl22G
         5VcSaY/I7V2dkZHIs+4WTnRgljxnJDB5wnmCj6n4xu6NsAbd3j2ltkCBIXIHwCnOKHyt
         NP/9xXFfhuKdwxthNWLMbYjbrj4iZlRBMl+Vn2ZyhDla3yBDuXdsoRB0fBe2tm9gzMkY
         0FzhATGzx4BkYcUozKwEjQ1zCFR7uH/XtRtTDyz7/5CUOICXii283GsUK2A9ryULXSKz
         9kqfrmZiwPqAiaHjP0xUW6t5povdMB4n4hZi5WCesUeQaDbKu94P5eV/Ruw3HoH/n01Q
         2j4A==
X-Gm-Message-State: ACrzQf1BPNcMhxznbHaBadcupPTwnigP9s65w/RT9PtSPkuEXXphh6YK
        ilhTUwavS60sjtPWlmoKHj9uiw==
X-Google-Smtp-Source: AMsMyM5SI+ZIibEjrIWvEpRPOE+a4Th3w2+pDwkqoSQTxxVnBD3JN24iNtRFFsou/EJijJKdLZfgRQ==
X-Received: by 2002:a05:6512:6c8:b0:49a:1765:335d with SMTP id u8-20020a05651206c800b0049a1765335dmr3432834lff.29.1663949773901;
        Fri, 23 Sep 2022 09:16:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 09:16:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/11] arm64: dts: qcom: sdm8458: align node names with DT schema
Date:   Fri, 23 Sep 2022 18:14:49 +0200
Message-Id: <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

New slimbus DT schema expect only SLIMbus bus nodes to be named
"slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
called "ngd".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1213f78a8b7a..7b62efb180d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
 			status = "disabled";
 		};
 
-		slim: slim@171c0000 {
+		slim: slim-ngd@171c0000 {
 			compatible = "qcom,slim-ngd-v2.1.0";
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

