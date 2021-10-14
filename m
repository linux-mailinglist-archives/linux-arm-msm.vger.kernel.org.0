Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B8C42E3B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 23:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhJNVo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 17:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhJNVo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 17:44:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1842C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 14:42:23 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z11so31546577lfj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
        b=de+MsU0Qj75+aFoPTFEa8N8j4oU0lNy4gc1xqYBp9cPtS0aqFpbiS5aGWOacufpcg5
         xVE2HF6P5vnbDCG9eM1YpY/ZlT+t9GUhcp3xTcdxyRTxpJgsbIprIuJZJJ0VxVmbZClM
         4zfY1oOR0Ro51APygd+6TC1zMlclXLnnNec8kxhoIuAm/PvgJd1pEAP0XduSREhsDxaf
         S0Fig6lSuSiso7p3KFGYeVCEt8aUt7yiKDdTLMEfww8ZIXp7ZhDGZmrJ5643zOPu32RY
         vv6+gbNN3JKTzl0mlYuq9JK4YdQtg37beUr8y37oGRaY5oDcxtHn1lIsXaQHyaoYk0B4
         L4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
        b=5/Sj3iQQnE/rvrcQFJWivhj2Jc6Ug/LurNf9hq8XzgNmz0lUg2R3w94oS5XsLvTtL8
         bpTeC9P1qKEfRJJS4cxwI2Ld1WL3PTjgjvkoy7GIUzApEmQHPkACrqOSRkVtBxx8FMjR
         IHPudGDx+rIW22hQnM1fe3BWb2fHZAprCrLKpwxjh4wHT8BMgHdPvr4nhtUsE9efOmvG
         O/hOSJYA6HA1v1LgEtR6Nbot0r4GTn6B882MkFpronp+CZudQdFMAfqER4CVmLiyfwBN
         xAZ6/EkxMY9tmjHl6UNjUInYhCj9ZKyi/v+TfhwU/HpGO8wGUSh6KIEcYTMqus1lYyiX
         UuFA==
X-Gm-Message-State: AOAM5318iYVosfaOsjT+J/kCadiWukb/EW2oMFgTMh6dJRPLzBTgrBMD
        RTrPCHKmg5XQ+GIb0oAWLQlSR6dtAg+S5A==
X-Google-Smtp-Source: ABdhPJwXoKb13UGNSiQ8eOg0XJDg6uLdUtqzN99nvekkRjTiOtOeSq9+tsYVCxkJVH1Z3ZGS5o7QKg==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr7447165lfq.9.1634247742039;
        Thu, 14 Oct 2021 14:42:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y19sm301970lfa.123.2021.10.14.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:42:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
Date:   Fri, 15 Oct 2021 00:42:21 +0300
Message-Id: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
device tree nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 87e5194114d5..6a51cf014994 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,9 +1420,9 @@ hdmi: hdmi-tx@4a00000 {
 			clocks = <&mmcc HDMI_APP_CLK>,
 				 <&mmcc HDMI_M_AHB_CLK>,
 				 <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "core_clk",
-				      "master_iface_clk",
-				      "slave_iface_clk";
+			clock-names = "core",
+				      "master_iface",
+				      "slave_iface";
 
 			phys = <&hdmi_phy>;
 			phy-names = "hdmi-phy";
@@ -1453,7 +1453,7 @@ hdmi_phy: hdmi-phy@4a00400 {
 				    "hdmi_pll";
 
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "slave_iface_clk";
+			clock-names = "slave_iface";
 			#phy-cells = <0>;
 		};
 
-- 
2.33.0

