Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B64340EBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhCRT7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 15:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbhCRT7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 15:59:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777D6C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x28so6493638lfu.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vt2EBjJBXCElMumS8zwBKc0QOehEP6EtoAAqvcQaqEs=;
        b=qtwSUItzJSssoI284c3i7fLKfuVbD+hjHU6T9UwlOjhdHbCMgGEyM9HhmHjmIdp0m1
         iPJ/zu09jM9ErWvmyt/wazaDNjBQry/XR8TK5zgi1haT0ORQ5ApjISdZhToUzh5GWax4
         IfJ5XF96lX4AEXFW1scJpEJLtvENU54aK02mFApPyrp8CxlLKV2Q7IKSfYnfgFQaiNNI
         VJe1E63uiJj3sToGbOJiHI359Avv/3E8+FS0KMmRZ1zJN73D9FFhusnV/YDhOWQpBy6l
         I3Aqcf17N++r08jWWeeNa0oB7iIvZlAKJLFdbZutemak1BvLeJc03btmKFfXs1i8SawZ
         IQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vt2EBjJBXCElMumS8zwBKc0QOehEP6EtoAAqvcQaqEs=;
        b=AOeawdOGGEM5WKYSJhnQy99x8+RUbWroWOg3AtACbvw9hSrdt3x0MEkxN65bHsi3Tz
         uzL+3E9AmprBK/kuq5HUowX+4T8x1CS1yGpZsWGt194u9XKkpfK3LIl9Yfk15eYc9e2d
         7iH8s05L8oMV3aoiFYZjaI07MTa55vuneB1bBoLgTOj4uzW5gTqZbFVxrOLW30IGroE3
         7Y212r6DRinOnOkMNJa42ch+HByJyAfkMB5LiaVb53fsH1ChBlOeVitXuvDkf8rk2yhb
         V2NmSPxO8OFpBF1ef0hAX+rfmfIV6KwQucFXmz9R9aDKonO6eXlebdhtgjJJqzRYKouW
         YkRg==
X-Gm-Message-State: AOAM5300rT2Ds07tGMqsumvoZBQIq4vSThZucf3gbMWYelBBUICQYCzQ
        P7jcc8T9nrwiQbTUPH/HYYNX+XKStJvyMw==
X-Google-Smtp-Source: ABdhPJygwQfXIdOEcbcENcm4CVZV+MyH0fbuS7DZN8vyFSKM8zw1ewM49fhXoW0bN/gr8/rWOePLsg==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr5388746lfi.538.1616097580016;
        Thu, 18 Mar 2021 12:59:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g6sm344159lfh.232.2021.03.18.12.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 12:59:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: qcom: use dp_phy to provide clocks to dispcc
Date:   Thu, 18 Mar 2021 22:59:30 +0300
Message-Id: <20210318195930.2229546-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
References: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Plug dp_phy-provided clocks to display clock controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0f79e6885004..a2478bd3590a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2600,8 +2600,8 @@ dispcc: clock-controller@af00000 {
 				 <&dsi0_phy 1>,
 				 <&dsi1_phy 0>,
 				 <&dsi1_phy 1>,
-				 <0>,
-				 <0>,
+				 <&dp_phy 0>,
+				 <&dp_phy 1>,
 				 <0>,
 				 <0>,
 				 <0>,
@@ -2614,8 +2614,8 @@ dispcc: clock-controller@af00000 {
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk",
 				      "dptx1_phy_pll_link_clk",
 				      "dptx1_phy_pll_vco_div_clk",
 				      "dptx2_phy_pll_link_clk",
-- 
2.30.2

