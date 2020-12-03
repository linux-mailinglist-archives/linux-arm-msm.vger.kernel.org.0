Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA112CD8F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgLCOWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389118AbgLCOWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:22:47 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2B0C08E864
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:20 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so2915943lfl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kW9Z+5MdERH4UOzelJv9hwVH2KR54qJRrBP7D3NwCS0=;
        b=eKJI8a9D4w0n8SZ0JixosfLCvSMpNfv2p8qIs/R4aeJLnhF8Wb6eSNWFEV8ILtJjiU
         mBfOUyCIMuAUcry29WGBMYEdXPQivx4n7sQnvGAkEGr98sgLUbErxNLfxNYWEhlmmUAv
         fCmjpc06rxT8FrrlmHYSQiVxBrymST7mmyKou9Su0pfTV1ueX5FHb56D/CSC101/MYK+
         SxmMpp7o/WzF+93kquKVzADM3gt74mtKu5IO2BP+xGn+i5daqoMMI3T2D3xG15akXJNY
         wVXd5+6rYxB03nNZrEMDOhiQrOr7Ptngk8XfykJ6ImzxKOrf21kmYO3xoXoQzFUOyMXN
         euEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kW9Z+5MdERH4UOzelJv9hwVH2KR54qJRrBP7D3NwCS0=;
        b=bcE+gp15ky7r2AWEoHIDYyHH6s48Xoc0GbDI1snuPGCLo8QP5bL64NY9pwRN8HzVcV
         gJ5LBoVB3PGhz7SccwRNFNGT/aswg26lLwQs75irg6RlnqStRetSa8kmHXlGvfcaFLIy
         7TV48kxcm2yfF1XYjNJInS7PH86KM2Ahy0nBOQ0+ZEoy38TH8L1z73THC2daIbopDTf/
         KUT+as2yWrZBNITfBNIr86X9iQEeFvpQKbCpdaQv3c0sq+lMqOhoZrFNgylROHxAs4Lg
         si8dISQPg9I3vF4qdRGzWwBUtR72uaqeXMbR7O+xFN1bYnL0jdgJU95RmlOngIP6Z3Xs
         MloA==
X-Gm-Message-State: AOAM532ehfx65ux0VMUbI5d8DcGntIWJrL7jZT9jkgXbnALY9VFTt1Oh
        RkhFrtD9NMCR+YRh9DzeWQE+iQ==
X-Google-Smtp-Source: ABdhPJyh/n2Zqwbk2j96o3ojqlKi7LNF7FYUqU4XGk+4t59n7Hn7/E5gojwsZ4nGmqSx2o0dAsNF2A==
X-Received: by 2002:ac2:5044:: with SMTP id a4mr1348872lfm.583.1607005279289;
        Thu, 03 Dec 2020 06:21:19 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8250: power up dispcc on sm8250 by MMCX regulator
Date:   Thu,  3 Dec 2020 17:21:05 +0300
Message-Id: <20201203142105.841666-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
References: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller on SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f4cae2b82e2a..0c7986bf60d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -216,6 +216,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8250_MMCX>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+		regulator-name = "MMCX";
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -2058,6 +2065,7 @@ opp-358000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
+			mmcx-supply = <&mmcx_reg>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.29.2

