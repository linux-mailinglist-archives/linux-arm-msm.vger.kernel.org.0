Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F13556F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 01:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377348AbiFVX3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 19:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377337AbiFVX3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 19:29:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE4042496
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:29:02 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id w6so10286904pfw.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ry6HLkGyc4JY1yzT6QsAW5x1N1xm0JB7SEDy/5pktSE=;
        b=oNKxRsOU4pc50gLSBldZGqm/bcScOvod55uXzAd3x3ksz/oGD/RnPyNuOlg3WB+Wnm
         vAHIXs7S2vgid7AjgLP5TJKsluRi1xamubIqmtiICAqjPaPCJXz7M0oD5pIC3SvHJRco
         yXhzOgtbakdSQrZ+fkHTrTI7xpFxl+OuWDomZl/pSbls0HyTmivIuFLyHVrtgOkKPRvM
         UOh8fQPTHXwpFjYUqbVTJ7DawBSg6YKIRzNYqNt+oxJXSQDCSSroj765vsfGhQ1Gx1tD
         0eMM4oItqK/+f6ZeXRk8RxBDcugtomHgpS8p6nN0Kr4/YMdAgHBYt+7JzJ7F8ValfotQ
         Mo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ry6HLkGyc4JY1yzT6QsAW5x1N1xm0JB7SEDy/5pktSE=;
        b=FhwhlAS7K0fzuNNRCb6SGXA1TUDm99cBy4WTb8pxWQqnHdL0l57Ri5XUi/ILnnQHAG
         lyHxnZsV+G5EEAftXR9OTKgQbieDGl7lbZakpl7E6ut6r+IjsVUGRE/8rdKMkaG6aIZM
         vLLnkqVsHUqsZjYjoIyrwCFh86ZsD54E6/oZbCdfRE+CSZ6yD97oRFHYFz6Bbmg7bvy/
         vphC7YmfOTRhV8Qxh5Gy+Acztyuc4sIZELyarpTLKJlko7F+Hrx6Kvgfk+sIfCbQo5oJ
         1I+NTX1iAbJOcZGu15zQIqzod3VJuDD69pRRVdWQ5zZ5O0xlJObzxhCqNeNAaDYsAPNc
         7SuA==
X-Gm-Message-State: AJIora8uSWJvER39eHSd7dhG1Dg7jhJWn4N3+cltj3C51UoL9U9oHBqm
        Ux9sW6FHuN/UM6zYVaV4y/ATnA==
X-Google-Smtp-Source: AGRyM1seRUK0Zn7SnxHrspJOLxYW5N5KYB2xwrDRlbpkDSrBE365AschZ8QAd0viGvrmai91z1+NVw==
X-Received: by 2002:a05:6a00:ad0:b0:4e1:2d96:2ab0 with SMTP id c16-20020a056a000ad000b004e12d962ab0mr37790377pfl.3.1655940542086;
        Wed, 22 Jun 2022 16:29:02 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f70200b001622c377c3esm13297863plo.117.2022.06.22.16.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 16:29:01 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v7 6/6] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Thu, 23 Jun 2022 01:28:46 +0200
Message-Id: <20220622232846.852771-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622232846.852771-1-robert.foss@linaro.org>
References: <20220622232846.852771-1-robert.foss@linaro.org>
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

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---


Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index

Changes since v5
 - Revert .fw_name to .index change

Changes since v6
 - Add r-b - Konrad



 arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52428b6df64e..99464cd1299e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2525,6 +2526,31 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

