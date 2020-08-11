Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C601242034
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 21:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgHKTZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHKTZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 15:25:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C3BC061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 12:25:05 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so2361710pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Th9F+Ys6njcnXzjyOUMQAgDagGiaCGUsjwgut8vgfCA=;
        b=hWEBPhJHpzylK4ONAg1gpYb9KIbwqmMPtXitCIHPnAw9YWb10rGjpru87lXragFiLz
         1/+Kpcu+HvtIoXL54Vnk6MZAo3jkVnkcLBm9F9014pGcL3pmxrfCh57lYLeTX3wlhlX7
         FywIHupGsfeUSlmjvwHyV98MhAgYCpI40YBJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Th9F+Ys6njcnXzjyOUMQAgDagGiaCGUsjwgut8vgfCA=;
        b=NRCVZcrrL9Qldbi7ySyP9LmdrVCK6iV9ZLBBUfOtzA5wzwkNQMaKkI+gR517J3ynGr
         5dlqA1OSdTm8uLwkqi18lhBRX3/VOOrm88bIx9bnRhZDD+mnMNPTp1tBjpvUh4IFh0MD
         SuuTiH525rsasSONhAiz3c1uk0SZiJG5CXV0vNYDYamzc4hQyILgjMsM8D2HcAlegNWr
         dOGs7k0Opyyyg6EEbLYERF3DmVvEUqKGuxaT6vLa5DW92xu3siym05vMDzHVRcMXRY67
         Es8irkI2D6NISxBuN/baFMg8YP+3/liR7rXoTyu9P9JHDR598qb58Lr0Vp8xhXDVV+KN
         Rjrg==
X-Gm-Message-State: AOAM530ZDbj4diKQXXr6SpOQRKpYvqAQ2dXCh2J2IdBz4qlaI3hVuFGV
        NvWUlnMm81CfkEE8S4F4Bfj8xQ==
X-Google-Smtp-Source: ABdhPJxwDq2Ukpnrjta9HOf8EzBQkMdphnR9aadRRe8ZViQFmoGG6OMd9DM7Ta7RY6yTK3Z6LOitAA==
X-Received: by 2002:a17:902:7205:: with SMTP id ba5mr2112076plb.230.1597173904802;
        Tue, 11 Aug 2020 12:25:04 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id i14sm3432227pjz.25.2020.08.11.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 12:25:04 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Drop flags on mdss irqs
Date:   Tue, 11 Aug 2020 12:25:03 -0700
Message-Id: <20200811192503.1811462-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two
where the second cell is the irq flags. Drop the second cell to match
the binding.

Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: Harigovindan P <harigovi@codeaurora.org
Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217bb5bf..9d1660e1a6f0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2357,7 +2357,7 @@ mdp: mdp@ae01000 {
 						       <19200000>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				status = "disabled";
 
@@ -2380,7 +2380,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,

base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
-- 
Sent by a computer, using git, on the internet

