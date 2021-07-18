Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB973CC894
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhGRKwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbhGRKwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2034C061766
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y42so24293566lfa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Qkf7InvNZ2y8KQubxZPlzmD4hgwtxBXZ9UnPUjB8P4=;
        b=RRsoxHGBvjH2xV4InZKCB8jOFlbCa/XTumOyjqOHXt7VQ1Po5CC60loafdYxQocVrM
         BS/MM4jEmbn2JKMz9vOnMgvUzGBx/2QBpHfvXY5jvK8oowuE4GYyJfpMv7DVQMkL2bxe
         5wwA294Mx7y4FfC1H40ZFvG8SrKhNIQOGAwyEFFo1Bnga+1vml0qs3y/2dxiMoinfT2Y
         Y1AuFD2tV1jIQMnif3r0JuetkWWKnlaO8bRJVJRFcdI5AtOKVSdLu/FEP7TDnOLVy/1V
         dowS+s74qQDatxb1q2RvDvefoI+OiWcT7XMO4m6+rfkUOLrNJMgjGcmp+ddk1nwmVjCD
         fG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Qkf7InvNZ2y8KQubxZPlzmD4hgwtxBXZ9UnPUjB8P4=;
        b=pqOGYU01I8uUuu5FG7BKkaCfpd9xKx1Ofq7MZHdpm6iYpRBv0MQ+fbgdps8PO+IHnp
         m/uUr2QOe8BafI+Ya9Ihe+RE7x9Vxz+30484UhCcxudTXmhwjFax6yikZQ3fXbjc/o6Z
         JgmfSRB5umcXavQhB8SZi49echNwCYvG80sh8UXO3bSl5tr9izchUFW9WFd5Y3ucYudR
         DipKYEyDoow9Wo0foHypoDaX6GFAGB8b2eZzLmWD8OmKpI1djT5672uqJ2S09Y1Fo5Rd
         ZvQ+s8jTVvekd+wQQ/ToGXI5BAbsqy+bN3uTUF/T68AvETJV/HrOUnF1ETI4ru5nQeyV
         5Xxw==
X-Gm-Message-State: AOAM5308uVCQK6vw45nXVoI+yeLpeqW7ZQ7PsG5O/OavJQlnZpHPKo+g
        DL26zt7+g9rHXJmZiBF/1hqVrQ==
X-Google-Smtp-Source: ABdhPJwfoDB/iCADpwV6UyFERAs3JlCxRFghSDlCbj31LETCI1eN3BwtLgm8iSqeX1UbXeHFOhmXIg==
X-Received: by 2002:a05:6512:2347:: with SMTP id p7mr14932342lfu.253.1626605353126;
        Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Sun, 18 Jul 2021 13:48:59 +0300
Message-Id: <20210718104901.454843-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch dispcc and videocc into using MMCX domain directly. Drop the now
unused mmcx regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4798368b02ef..bce5e9a9dd84 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -273,13 +273,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	mmcx_reg: mmcx-reg {
-		compatible = "regulator-fixed-domain";
-		power-domains = <&rpmhpd SM8250_MMCX>;
-		required-opps = <&rpmhpd_opp_low_svs>;
-		regulator-name = "MMCX";
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -2451,7 +2444,7 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2720,7 +2713,7 @@ opp-358000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.30.2

