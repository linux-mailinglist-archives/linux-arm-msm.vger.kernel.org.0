Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF08551157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 09:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbiFTHTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 03:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239254AbiFTHTo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 03:19:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E23EE07
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s14so4139121ljs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPsYv4tbVwWiYXC6sZCcnirzxiFFJoM4l2y8/NvMmSY=;
        b=eHpw2W34xfQhip9YsGBmijl3fBIE272Ccp8TLm6s1GZEMEVNODIQM2yQr9mrXFPxEn
         9FGWosSA6Y08Em7yaI+uhIqc0ei8PGI/BtvvyW3GxW5aTGQF/JLKERrq+op/O7tGuZUJ
         KkmJtr184dB5vUm2aZti35zesEAnxF+S9KGHdoJZ+Np+HK1KwoG3E7A/Q6vmXeLrduUC
         W4mVG5twARLjjgdFzRohLO6M6oRyGjvYjDnQ0JKOq2egDcrADIl8n+sU98IrrXp4kj0/
         WC8ORGnLVqiRQrRerYtutVpdWitmJ57ER1ByqPhUn8Yf6noPGknbHKBWW9DfsAfEq+OO
         6gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPsYv4tbVwWiYXC6sZCcnirzxiFFJoM4l2y8/NvMmSY=;
        b=iegwWEVCu02fktLQwdETuiyXnYpWu5+ue8mQJjxHAz085b4Ug+NyEYhVoTM/SQXRnj
         YHn23qbyqe7tWbFmszmMatAhsvNQav5O1xNT66VwN7wGe+9X4CAHjCHwCgm5bzxSMA5D
         8MjcfANAq2NODB9xgx4zLM8ZlbRBcAfQbi/v2V1NXNE50y+ADApQfvCGcSgduvCUtmnk
         dJUwNrbThG9FaZoXCu5UWdSmXcJMZHDeIi3r+3B+mEJqs0XnfTm4TNue25CGrJp2K4Iq
         F7cULbCHcvEXkVRp0qOGmOPtPk98SY6pX2No+BBOQftWsF7lRCc7pVMy6DiP6lfcbQnX
         YpUg==
X-Gm-Message-State: AJIora8QkVG3kuIJNpSm3dVcz3p6hpktJiGTIL7gUyGtQDuTgaOKFZQe
        /KeOcn4fmlrMrx5SbqViK9m2Fw==
X-Google-Smtp-Source: AGRyM1sUqPw8d62ZkrJuPbF2ElEhIZTPV1tdh9wkXZRYu8bxCNy541wfjNH5jBBnopF2wjvenPJqmg==
X-Received: by 2002:a05:651c:ba3:b0:25a:6ea0:29e9 with SMTP id bg35-20020a05651c0ba300b0025a6ea029e9mr1980360ljb.482.1655709581924;
        Mon, 20 Jun 2022 00:19:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t16-20020a195f10000000b004795bcfe953sm1649775lfb.214.2022.06.20.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 00:19:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: msm8996: add GCC's optional clock sources
Date:   Mon, 20 Jun 2022 10:19:35 +0300
Message-Id: <20220620071936.1558906-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
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

Add missing GCC clock sources. This includes PCIe and USB PIPE and UFS
symbol clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index e97f193aefd3..6c7380f86383 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -689,8 +689,22 @@ gcc: clock-controller@300000 {
 
 			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
 				 <&rpmcc RPM_SMD_LN_BB_CLK>,
-				 <&sleep_clk>;
-			clock-names = "cxo", "cxo2", "sleep_clk";
+				 <&sleep_clk>,
+				 <&pciephy_0>,
+				 <&pciephy_1>,
+				 <&pciephy_2>,
+				 <&ssusb_phy_0>,
+				 <0>, <0>, <0>;
+			clock-names = "cxo",
+				      "cxo2",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk_src",
+				      "pcie_1_pipe_clk_src",
+				      "pcie_2_pipe_clk_src",
+				      "usb3_phy_pipe_clk_src",
+				      "ufs_rx_symbol_0_clk_src",
+				      "ufs_rx_symbol_1_clk_src",
+				      "ufs_tx_symbol_0_clk_src";
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-- 
2.35.1

