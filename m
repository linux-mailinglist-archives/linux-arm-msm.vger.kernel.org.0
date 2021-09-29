Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1657041BDB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244155AbhI2Dp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244156AbhI2DpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:45:13 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A698C06177B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:27 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h12so635659pjj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UOOcJZV6gj22BRd0bEA+ZluqkkhZsRM/yGjJb6jNii8=;
        b=nZ0GLUYtczh9yl8f041gAKYaiilhRGXWN5A2duArMR1h0EKOF1xaUvSlqBJ+PGlr4c
         rYyUrPEoXI2/E1NvNsvBNfb70Rreitk/pKTbfqxJPxgV7YuePkwDv2e643cDyP4EsjUi
         nEF/aBU6+ZMS/ZX914DM9VNroP5tmYEx00oGtBewXPQauaKb9rv+c4khkKyOjU9lQ44m
         PdvmvbBlhxaupvSflY9nJHAcuEz0P55rWMJ18Ggi6TaIrfLAKqOr+yNvTEy7quAXvCDm
         m/gdYeacnv0vYCTs5t3xynX/b6O3TEkmXVs08xb06ugcH4jNQejTr25WyYBYSntmf5rm
         bGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UOOcJZV6gj22BRd0bEA+ZluqkkhZsRM/yGjJb6jNii8=;
        b=m7dr11bw/06JaGzA06lC3GAP70z0ei0bHcbGBcHA5arBqRyMugtzrLsgVKB1uVdJ82
         jg62zrtM3sfSn8LbZTIb4/VkvVB3rVBRew516m1OBlIzKkvBD1JMZKNOcYWxVoIZ1Um7
         MGqeQGfMjqDVRJvvCW2zjcTSFZgCy+MzFUBi3l/LvTQWs4jns3a3I6PPzpizlTGdv5ws
         4IENFguW576Raj4AyQxtoa/rBTMrEXVGLfQ2NoVirz81S156594tK7EwhZS+S/nuJm8k
         3ewCokHtPkp0CF71tajfSRr3pgxHyT1qMYIOGc4bYL+rKR8ettkF+fphQ2JZSe9lrTRv
         I/7w==
X-Gm-Message-State: AOAM530i3r6p7Jwthlo0MngwTaUXG6hn1BzUQKDVEfuzD/b0YDRtgBoq
        gPfXiO1eb+lMJFP4J9y0R2DNEA==
X-Google-Smtp-Source: ABdhPJwOmW1xXVQTKFzcANawDyvW7PxTPcC/EOfu0SikxfCQs49KtBTqf7yGEhqldXzGJE1UJL7jWA==
X-Received: by 2002:a17:90a:5ac2:: with SMTP id n60mr3793208pji.184.1632887007063;
        Tue, 28 Sep 2021 20:43:27 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:26 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 09/10] arm64: dts: qcom: ipq8074-hk01: Add dummy supply for QMP USB3 PHY
Date:   Wed, 29 Sep 2021 11:42:52 +0800
Message-Id: <20210929034253.24570-10-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per QMP PHY bindings schema, 'vdda-phy-supply' and 'vdda-phy-supply' are
required for IPQ8074 QMP USB3 PHY.  Since supplies are not added in DTS
for this platform, add a dummy regulator as the supply to QMP USB3 PHY,
so that dtbs_check stops complaining the missing supplies.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index cc08dc4eb56a..b5e1eaa367bf 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -24,6 +24,8 @@
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0x20000000>;
 	};
+
+	vreg_dummy: regulator-dummy { };
 };
 
 &blsp1_i2c2 {
@@ -97,10 +99,14 @@
 
 &ssphy_0 {
 	status = "okay";
+	vdda-phy-supply = <&vreg_dummy>;
+	vdda-pll-supply = <&vreg_dummy>;
 };
 
 &ssphy_1 {
 	status = "okay";
+	vdda-phy-supply = <&vreg_dummy>;
+	vdda-pll-supply = <&vreg_dummy>;
 };
 
 &usb_0 {
-- 
2.17.1

