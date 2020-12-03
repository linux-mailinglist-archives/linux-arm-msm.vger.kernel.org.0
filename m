Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B0D2CE2AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgLCXaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgLCXaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:30:17 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31BDC061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 15:29:36 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id s9so4467987ljo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 15:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKu/jMI1IpzvPqYsdG0R1IGMZmwZbkPfv1HEYZbnPkQ=;
        b=prClNp+2PRo4zcz5Ms9MfAtzP2ea8/tWA0PnKBMoiEz1uKJjVCU0TqFdv2S2pNWcVm
         tr1ObxS2oHx8cJyH1sloT+W6ty5s0AtrSX1h7WanJIBYrM6GJUR/q7CO6WxdzoOPv1mx
         ERrWh0YLheG7DHATFSDEJjBuV9JmASTFZYeKLRjy62xSQPF+/tVQZo/j4X8zZFUasTHU
         g3DtBEHoomjhRTlwkoT+jYlhzc9YtiKCLDFj5Rb8CpntJfgt6yWA/xDsGqTz6nvkyf+b
         s7PznPQglX0NW0M+qnpz/OwTvdSRxF1K4iikRJBgjYDDIbDmRaz9bxEwPKu4aD+QgfjF
         CfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKu/jMI1IpzvPqYsdG0R1IGMZmwZbkPfv1HEYZbnPkQ=;
        b=jEagimZ3SqWKx0R4mGFeSFx7pwiBvdiMPiKakNyIUoKiLXzz7lW8YwG78YsV6Nlh0V
         /QAr1Mby55I0YQLInqZUOn3qWlLtajR4Sp6mLWhzgzAIklPX2wqvx+4rVLeOFIJqgI6m
         VpNW9BcG2duvtoIZD3c/+k9ZlnaSuv/27BYFu0B7dSLJalbfvaCDb2yGKqP9J1nepnw7
         Vut5EsK9BQSS+ljYefb5TBo9m3Exlk793cjluZsIJPLmbQfhA8fHglt3gdZlZzW2rdxh
         InhS6/ybeltYQ4Ge0d4vo5jYN5iCaRTbq4uanCuVDnRVM25s82Pgzz+jv/IhMrmoG2z8
         pzAA==
X-Gm-Message-State: AOAM532O8HCGyEzx3+2nBgsgvM48uMqk8L2LH5zoQaVd0KzT5263kLvf
        CZ4amM48GTGCpH4l4QVU3AWrdvewAL5NuQ==
X-Google-Smtp-Source: ABdhPJy8tmqVD/AxU9okgXGDdyPf7W3J96B575DvuqgVa++UntRb+5f9HMT8O1OdckJrt52mkvc94A==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr2143121lji.460.1607038175358;
        Thu, 03 Dec 2020 15:29:35 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id p196sm1010895lfa.68.2020.12.03.15.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:29:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: add CPU capacity and dynamic power properties
Date:   Fri,  4 Dec 2020 02:29:32 +0300
Message-Id: <20201203232932.1004345-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the relative CPU capacity of all SM8250 AP cores.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index bdd9bd303415..7fe71d8ad8d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -95,6 +95,8 @@ CPU0: cpu@0 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -112,6 +114,8 @@ CPU1: cpu@100 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -126,6 +130,8 @@ CPU2: cpu@200 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -140,6 +146,8 @@ CPU3: cpu@300 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -154,6 +162,8 @@ CPU4: cpu@400 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <533>;
 			next-level-cache = <&L2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -168,6 +178,8 @@ CPU5: cpu@500 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <533>;
 			next-level-cache = <&L2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -183,6 +195,8 @@ CPU6: cpu@600 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <533>;
 			next-level-cache = <&L2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -197,6 +211,8 @@ CPU7: cpu@700 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <642>;
 			next-level-cache = <&L2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
-- 
2.29.2

