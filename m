Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082E64FBB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 13:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244459AbiDKMAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 08:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243012AbiDKMA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 08:00:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914183150B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:58:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x17so17053559lfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JERDklzk6s2PPnC39j7OE/TDaMRzZiYeptCBbWpUsQY=;
        b=kGfoP7QX0DheOWSDXhB0V0+uy/TMBASl387iU1f1T4I8HFCyKFJATC6+1RSOFkuggF
         +1IesTEfHM5cALAlib9tDK/NEPq7zlVpNCrfFRi1RgFkaQakLTl9VFe0zQ5EGFKhGDW2
         4STVo5Fc52Gkqu/ymGeQeHF8ihJmdpEDald4qntioc3Lpl3x6e5LgNqPN1Nb5efHAoY0
         sdm8aMhplI8VvGdh+/B3S7ZCBul8kChuwSheR1bTZ9OfgKfiUHRVgWja0lTFO9x04u3O
         eovfMzwIp9GgNx5wS6dA4UkpNPfyZg6XdyPAm+Wyzaa7+Uuj2JrWB2iXy02eprAABVSS
         bEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JERDklzk6s2PPnC39j7OE/TDaMRzZiYeptCBbWpUsQY=;
        b=Rdksg4m0oCW6sGeFMHX6I/NK/7+uhqcKkdBlHajp3bv/lay1ubXmk4szI1WBbYSiXL
         Em6w8GFMAfaqxm/qR+iklY7msvjWB4aCyyaAmFkiT5NOCBxIQz1gkhMtQvC1/TNx0JzQ
         WI/TkZh74VoJJkNosEBbkQjd6fsp2A0wPMERVHRxpU7JYGXfNr9VItyeO2AzzbNvrqsK
         NRRoSmEWz34L9yI8nViEBVT9XHa3uF9ZvIxSI7BgJs0IdJEuHzLm4BvMHJe5N9g7Bz0g
         3R6I7OiX58qfO3X0iElIRiWwOZfmDAm3+2/GdMeoY4XljuazqFHZehqqaT2UqvfBi+sj
         OKaQ==
X-Gm-Message-State: AOAM532cDLf/fxPp16zZrd6j2u8xRXU2JfONdu2ciWcgLkVMW2ZzTHHX
        iVlnzZgXbAxwqrO1G9/04nDzxw==
X-Google-Smtp-Source: ABdhPJxqmO23mZBG4CwQbUtvXHX2UkcmmekWE4l7sENTYkqPXLSAV2nDGOrXYXyiDfd3gVSTkwDJFw==
X-Received: by 2002:a05:6512:1045:b0:44a:6422:4c8 with SMTP id c5-20020a056512104500b0044a642204c8mr22075360lfb.253.1649678291767;
        Mon, 11 Apr 2022 04:58:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p7-20020ac24ec7000000b00443d65ea161sm3314171lfr.291.2022.04.11.04.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: remove snps,dw-pcie compatibles
Date:   Mon, 11 Apr 2022 14:58:08 +0300
Message-Id: <20220411115808.1976500-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411115808.1976500-1-dmitry.baryshkov@linaro.org>
References: <20220411115808.1976500-1-dmitry.baryshkov@linaro.org>
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

On MSM8996 PCI controller bindings are not compatible with snps,dw-pcie
binding. The platform doesn't provide second (global) IRQ, it requires
additional glue code. To prevent it from probing against the dw-pcie
driver, remove corresponding compatible.

Fixes: ed965ef89227 ("arm64: dts: qcom: msm8996: add support to pcie")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9fdac8a1c322..2612fe91bfee 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1666,7 +1666,7 @@ agnoc@0 {
 			ranges;
 
 			pcie0: pcie@600000 {
-				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
+				compatible = "qcom,pcie-msm8996";
 				status = "disabled";
 				power-domains = <&gcc PCIE0_GDSC>;
 				bus-range = <0x00 0xff>;
@@ -1718,7 +1718,7 @@ pcie0: pcie@600000 {
 			};
 
 			pcie1: pcie@608000 {
-				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
+				compatible = "qcom,pcie-msm8996";
 				power-domains = <&gcc PCIE1_GDSC>;
 				bus-range = <0x00 0xff>;
 				num-lanes = <1>;
@@ -1771,7 +1771,7 @@ pcie1: pcie@608000 {
 			};
 
 			pcie2: pcie@610000 {
-				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
+				compatible = "qcom,pcie-msm8996";
 				power-domains = <&gcc PCIE2_GDSC>;
 				bus-range = <0x00 0xff>;
 				num-lanes = <1>;
-- 
2.35.1

