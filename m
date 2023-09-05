Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C876792B03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237726AbjIEQqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349943AbjIEQez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:34:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EFF1BDA
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:33:22 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401ec23be82so28761585e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931473; x=1694536273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSrCRSGbYpW5ai6iRwGDzaSKxkP5+0TJhgHCmN0LPbE=;
        b=RdS8+0Zxq0BfLvcHzVL1KdOueAjidNbcuIwnO5gPPiksiGk4YKJ4wU+Z0kU8nDV4xL
         T46ufHkE/rNpg1QIRbhc4hJmdlzKD7amyahfWSikNjWh50IyIpKj2AJuungIXtIxuFNS
         vm7+kJlmJj6gz49iHUezdHgL+rGKvHknyMoRgTmaoSzcUZI7edM3TBwLaJoVoAp8bJTd
         fk83bJMsH3bzcy284ojuId/mh/S+3xdHeoSXvEVILs5xldz3gGmc3qRNBYiXWGuKGF6Q
         4yDa1XfOkG7WRYIrC1+thbj1IlOPr52DmhlRDVHIhcFEUlNLGGast4xgvoYvI53b5LBX
         1e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931473; x=1694536273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSrCRSGbYpW5ai6iRwGDzaSKxkP5+0TJhgHCmN0LPbE=;
        b=Hu2B7Bya6wCRH67CWV7itKa9CisCIR/sKJ9IMn/9uKa74aCCIsha3VeeIYQsrkGT4j
         ugzhucPXc6cuBVF5QPEh9P5l1QZTMtWSUeFuSX5V+EoV9VNxIadGOP3aYjp0C4TGwh+C
         LCIEPol6ouA5oI/N36s8X30JzJOhAn1BZLsTrsQWCB1cojHlJ3yLUsGdy6j69J5p8v6A
         NOyd+fQRgnR0TNZF3PI4BO0D5eEgZjtnpUHmce1QmMvFXSxbLxfQ2C+tk6WFPbqJeXwc
         1f1rttF/WyOpBIhiovfB2SJA8GIUCimFSC6esXZtbmVCtkEjosy/GR7k8Hm76/CxXW82
         GBfA==
X-Gm-Message-State: AOJu0YzU/t91qHSEsdy/k8brOJlKvIC1epqruKJwgxffxoe33gpoAxJ9
        VxVdtcYiXV8W1k0mM1qCfDKkn0JD3zvLFo+JECA=
X-Google-Smtp-Source: AGHT+IEvHvDkL/lwj2z18NbyDp5Lnix22wGCXyb6dsIf/iVENXsMx/XhwkxQAS0wyyCd41yNwAxfYg==
X-Received: by 2002:a17:907:7811:b0:9a1:aa7b:482e with SMTP id la17-20020a170907781100b009a1aa7b482emr259657ejc.26.1693930773471;
        Tue, 05 Sep 2023 09:19:33 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:33 -0700 (PDT)
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
Subject: [PATCH 05/12] arm64: dts: qcom: apq8096-db820c: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:13 +0200
Message-Id: <20230905161920.252013-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
qcom: remove ufs qmp phy driver").  The original driver and its binding
used vddp-ref-clk regulator supply, but the new one did not and left the
supply unused.

The Qualcomm UFS phy bindings were also migrated to newer ones and
dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
("dt-bindings: phy: migrate QMP UFS PHY bindings to
qcom,sc8280xp-qmp-ufs-phy.yaml").

It turns out that this regulator, although with inaccurate name
vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
similar, depending on the SoC) used by UFS controller.

Bring back handling of this supply by using more appropriate regulator -
UFS controller host supply.  This also fixes dtbs_check warning:

  apq8096-db820c.dtb: phy@627000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 385b178314db..d2aaff3e0d02 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -1091,7 +1091,6 @@ &ufsphy {
 
 	vdda-phy-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
-	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
 };
 
 &ufshc {
@@ -1100,6 +1099,7 @@ &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l25a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
+	vdd-hba-supply = <&vreg_l25a_1p2>;
 
 	vcc-max-microamp = <600000>;
 	vccq-max-microamp = <450000>;
-- 
2.34.1

