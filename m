Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC8752FF4A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiEUU1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbiEUU1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:16 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CDD5A2E2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a23so13006277ljd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XsPIyRiO3kLR77i7SyckjpuTZ7T0/xMqL7D45E3bcGw=;
        b=ApZLcsHiPm8T7jiYfUoJaY05+GNVjKj5fOfygXdEYZ1yZL1JBlVYsQXXxCGLLG79Sy
         cM0lI0hBHD40htvnkIphbQm+VvtYiqAIEULiaczB1vGaIxhsqmTfG83TTaaJ9j60naN0
         QV+g9abUeRESZ6ICGcetrsOimGwUzaF0wuTZLWxSQimSF5pw6u8zov3nScap0a6FTe/w
         Iet7XjQmS4wzljb2EgV2fZrFd5V2moi5SgbKOWa9Pak2hmotG0+Wvyiq4NGUzxuV2rjb
         qre66Ka6wzr3DH7VxCQKuBD9BxJfZ6VDgrNZe4gBSejUaXlGBNABsvAFoVQ0vMV1sdiH
         jgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsPIyRiO3kLR77i7SyckjpuTZ7T0/xMqL7D45E3bcGw=;
        b=t+i0IF8f3Rt9oznJKO51x/jUk+UO0PHnElyCIj33/AbmSvgr4BCHc4dPylcONCjjsX
         oNyIy3L/Sz3vptVn0vohXLKg5drKgsn/74exspdXWXWqfl7o7SyEIFQ+O+1F+TfMP9wk
         QLuA3v5W4QtOw+bSs5NF1Gq6kfY+81+ogagF4BlqCi4ovaRqn1CZfYHJy2TVoaEcxPiX
         PQXEOKFIowwAF2dNIqUiWj/WwJl5CEGMZirLqkM0A70xwK1pBjL2Kb/0rAKG+h6bDZnl
         xc215hv7LvwAVVd9ugx9tEVp7TItaT+RwgKaBrIXY76oArh/KGvttRr6v76dO9RhMKhw
         noTA==
X-Gm-Message-State: AOAM533udxokkSuItwE6M7+yTey6CejqZHftGzjkmqh453FZdkzqazRQ
        bSlmGW3w7dxMcB/lnOtlBHcSRQ==
X-Google-Smtp-Source: ABdhPJyp5c1eTEcrWwaneOvVmUVpiF7WzdxKXksA64k9CsQ+HFT+Y+d/n7twl8sP7zT0t/EU5W7k8g==
X-Received: by 2002:a2e:894a:0:b0:253:e36b:83c1 with SMTP id b10-20020a2e894a000000b00253e36b83c1mr1941600ljk.520.1653164833677;
        Sat, 21 May 2022 13:27:13 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v7 02/11] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Sat, 21 May 2022 23:26:59 +0300
Message-Id: <20220521202708.1509308-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 1d748c5305f4..c92f1cef3d3c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

