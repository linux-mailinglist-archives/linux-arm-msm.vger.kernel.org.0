Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D504925B3D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 20:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgIBSkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 14:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgIBSkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 14:40:05 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F341C06125C
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 11:40:03 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f142so613763qke.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=hhC3vT59TxPLb3rFe0HnRM66J/M9V9UidUla1thtjU123Yl/POs3Zqp/Qm7U9R3D2y
         W2JpYl/HxalGjIMxHgjU+/fM2eKI9HdWFOE7s/ri2XQpk5l0JyKB8IzyHuZEyocV8NB9
         x+8zqjjqDY3nwcsighUhDTZQx2RK9C/xu2J73qrVp4jHW5pgpg/aiv3+4tdPs7gwDL3y
         TLaJEvKHyS8x5ZFarJ7CRh4y2zaq+sUOk8ocqs5hLiPOTd0pdCCCKKUS629fyWvSc1Hy
         xc6v9zyiiOs5qrb9quNu2D5+mSZnPt0e5i7gUIAoD4BGoQ88PJE1ECs3UzQmcNuBW65Q
         4BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=rYnylNqhAnBKU9MdnkJJdcsw0REhA+JkEP45Av1CFgXgELYdrhg6g5ym6VbqCJQN4D
         iKlOtQWyzqriImVBTArdVPQtcD7AnGp1lOHW2Tkfga50Q4W8qZPouqrrWP+Ad3gUifo9
         Ytj5IWRmZo2YILJkStdwY9mt330D32y+/iGCLm0hVh6pag+3JOs1fqHR7d6SgrjcBzc8
         G9vUlUvp0GktJ0SoJDB1M6NKacFf6PZrmIExJnbel6KhvhZJQaFzUWCPrTp4k5sysxYz
         nDXvADvtEg0sB2GYpcXc1KO1zCXzsuiHQLwVX8YXje9QPKgwVzB7MqSS4D3sOh2zpM3t
         YiJA==
X-Gm-Message-State: AOAM5319FA9WbOvhSDnMCVqLj4UvVE0T6RVzkkBftkmJZIBRfyNVKODb
        HArbkzZEjbEc4Xs3qeGbweLoaqdLCn+4qcEIuUU=
X-Google-Smtp-Source: ABdhPJxPRGDyQv3ibszWeA3WlU9WRxYEUMu3g+2vz1499sb+s4ys67PEdYMn5f9sHQWJjOZP6neZsA==
X-Received: by 2002:a37:b245:: with SMTP id b66mr7861577qkf.179.1599072002249;
        Wed, 02 Sep 2020 11:40:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s47sm208004qtb.13.2020.09.02.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:40:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/7] arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
Date:   Wed,  2 Sep 2020 14:38:42 -0400
Message-Id: <20200902183852.14510-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902183852.14510-1-jonathan@marek.ca>
References: <20200902183852.14510-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.

Note: nothing upstream provides these clocks and the sdm845 dispcc driver
hasn't switched to using .fw_name for these clocks (these properties are
ignored), so changing this shouldn't be a problem.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..8184d6204b33 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4139,8 +4139,8 @@ dispcc: clock-controller@af00000 {
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux";
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.26.1

