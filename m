Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176FF3579D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 03:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhDHBsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 21:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhDHBsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 21:48:01 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF10C061763
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 18:47:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o16so322258ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E3Z+Q+wmuUr0KYMXECLxkHWsFWhoDF0jH3lckJMwRAY=;
        b=KM8+BbdRTlLusM2hMlQEQxZBDRLj1WI608H1MUXbvBF1mbUX5XgtNtQNNC7/5WeiGq
         deil8UqGha9GzcdsS6shTB7HTvi/YMAO/rnmgAbBK1kF/ol70okFyxzF4RJwsCmcNzm7
         r8c3kyTKb8GGRwocWmKqVhRxhtR7ukLahnJ5/hXHA3+RClUN6QjU5I+GMh5r7sWD/0Yq
         Tp/f57Y8odgpXo52Z6SeFSaWDnRZBQsZ8oMwabi2sVeWlgKE06yGFybap/e499JnG9pV
         4+hKfykxGap8nqxT3RV+DQVTGA6pYt4XQR1wgbglIWNtp35Rhk6XzFBraSV3CNIwqINJ
         Mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3Z+Q+wmuUr0KYMXECLxkHWsFWhoDF0jH3lckJMwRAY=;
        b=Nz0/CAt07BI9FF6fHhEcxHgGbjU3QFipy9/g4P2UeJJ62eBfdmtMtv06MErmDlgvr9
         XmPjDNH73xUl7P1YVcqZ5jgdOnWHW+NZ4xrTqTlfNrrvts8mHo2OuIHCpj8I0Ia171rb
         F2V+xbDHwrzemnfeUiX3CF5zuHB+1iHmyi8wPWnTkRc58LI6rRIehW5/JfRFoVsDR26H
         YYnwBl7cqkqVMtmnBZiPZLAiqcEaDxlDCXavZY3VHSNvArkM/ZnsdFn8RtGejOxLX37l
         SdD9r1yc4eXn2iQwwZpBkM+Qc0zEnxiVRMjEUmdVv5cG1qcUtDgOT8yAJOx04LlIblyG
         7liQ==
X-Gm-Message-State: AOAM532cJDH7nyxfALJnwNM1EigXZE+/C3No/+iT1cXw5VdbIeL4dS8q
        9Dkx2mJ6G+FiE9p4Ozi8N+4OWQ==
X-Google-Smtp-Source: ABdhPJxYbOJF1ePOgpSOYy9nEldxcpdvl2WbQOJUqVyK6MDLF/HcTJTEHxEFrJQeYOWsGRqSTsJQHQ==
X-Received: by 2002:a2e:a312:: with SMTP id l18mr4041558lje.106.1617846469666;
        Wed, 07 Apr 2021 18:47:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w24sm2686705ljh.19.2021.04.07.18.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 18:47:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm845: add required clocks on the gcc
Date:   Thu,  8 Apr 2021 04:47:38 +0300
Message-Id: <20210408014737.955979-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408014737.955979-1-dmitry.baryshkov@linaro.org>
References: <20210408014737.955979-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify input clocks to the SDM845's Global Clock Controller as required
by the bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..86f717d5bfb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1061,6 +1061,16 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sdm845";
 			reg = <0 0x00100000 0 0x1f0000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <&pcie0_lane>,
+				 <&pcie1_lane>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk",
+				      "pcie_1_pipe_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2062,6 +2072,7 @@ pcie0_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_0_pipe_clk";
 			};
@@ -2170,6 +2181,7 @@ pcie1_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_1_pipe_clk";
 			};
-- 
2.30.2

