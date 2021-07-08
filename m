Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCFC3BF9C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhGHMJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhGHMJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:09:45 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9BDC061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:07:02 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id f12so3619487qtf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZoZEqyfgIdTo8A7XW1CRS+nO4NmaGJyQkY5P5vIXU0=;
        b=mkU9sDTGZHmmBoAwf0kVKy6TGoZrKU+zFlMb8EdmHDslxRaS/5a2VUHjfRFdmPvqX/
         uqaxN3kzlMwZ10UgEyUhf1q3xKvK6lZAYs959m/HlERaY7J+0gWmscao+l+vgI+HB8c7
         cAfHLMGO0OSFWaosSFaktckHVZXZdrlYbIq4bepTyffFCas2qxWcOm5mWWcslbROKXZm
         lIWiROvDwiiOdC+BXtWc5HK0D/41pkcKVXipK69q3oEM8iZZbZRD26J82dxCKF0HXLCB
         sUaM+QlldnxDCMnV/g3dv/XnPbFRHJLESCM/66lMG1Fbcdl0fjNEaIxJPaILObcWXFT1
         kWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZoZEqyfgIdTo8A7XW1CRS+nO4NmaGJyQkY5P5vIXU0=;
        b=hNPdf08U2EDvtA009bWBi0Y/tJHVPr39aQiG7CgGRnSAi8NJ8p75XPP25jPPhvHw/j
         xfOO9U+wP+P/aQbd4M1Um17RvjUoF0jYdmpAnerQrYFQaK7NsWYytTMb2a/Td/FX2RV1
         2nx6Udppt2ZsZSACjcgvN1Nchc/KpLH0cMVAlK3ow7VovLx5t6sR5BC/RY6vR6EYuZqM
         JoKDlumAJdztUAkDsw+RtSpQyAjRpZUD1rF+VgAIdMwfkZ0gH2lThiNvleK8x3/lZi0t
         heDMiD+3ZDs/iSR/Zd1q7SeVN50Oz7GateFulxx7bDfBbSz7MXRtKIEaIDI7ZV2sYhwv
         yvXg==
X-Gm-Message-State: AOAM532V9+/zFtSXyUATJRyOgUof7iEj9DQvTnFWkWnYhQ3+YB8dXsL/
        1NyJtIBBhGQ2r1t5mLXpYPLXIA==
X-Google-Smtp-Source: ABdhPJxsR/qIIaFhjYYt7Bo5zG7tTqBU9+dBdoFzrvbjWiiyTWSNExtbid9Y1s7Q0NmuExaEXSEA2g==
X-Received: by 2002:ac8:6716:: with SMTP id e22mr10392070qtp.58.1625746021705;
        Thu, 08 Jul 2021 05:07:01 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id i2sm912541qko.43.2021.07.08.05.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:07:01 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [Patch v3 4/6] arm64: boot: dts: qcom: sdm45: Add support for LMh node
Date:   Thu,  8 Jul 2021 08:06:54 -0400
Message-Id: <20210708120656.663851-5-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708120656.663851-1-thara.gopinath@linaro.org>
References: <20210708120656.663851-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LMh nodes for cpu cluster0 and cpu cluster1. Also add interrupt
support in cpufreq node to capture the LMh interrupt and let the scheduler
know of the max frequency throttling.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v2->v3:
	- Changed the LMh low and high trip to 94500 and 95000 mC from
	  74500 and 75000 mC. This was a bug that got introduced in v2.
v1->v2:
	- Dropped dt property qcom,support-lmh as per Bjorn's review comments.
	- Changed lmh compatible from generic to platform specific.
	- Introduced properties specifying arm, low and high temp thresholds for LMh
	  as per Daniel's suggestion.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0a86fe71a66d..4da6b8f3dd7b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3646,6 +3646,30 @@ swm: swm@c85 {
 			};
 		};
 
+		lmh_cluster1: lmh@17d70800 {
+			compatible = "qcom,sdm845-lmh";
+			reg = <0 0x17d70800 0 0x401>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,lmh-cpu-id = <0x4>;
+			qcom,lmh-temperature-arm = <65000>;
+			qcom,lmh-temperature-low = <94500>;
+			qcom,lmh-temperature-high = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		lmh_cluster0: lmh@17d78800 {
+			compatible = "qcom,sdm845-lmh";
+			reg = <0 0x17d78800 0 0x401>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,lmh-cpu-id = <0x0>;
+			qcom,lmh-temperature-arm = <65000>;
+			qcom,lmh-temperature-low = <94500>;
+			qcom,lmh-temperature-high = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
 		sound: sound {
 		};
 
@@ -4911,6 +4935,8 @@ cpufreq_hw: cpufreq@17d43000 {
 			reg = <0 0x17d43000 0 0x1400>, <0 0x17d45800 0 0x1400>;
 			reg-names = "freq-domain0", "freq-domain1";
 
+			interrupts-extended = <&lmh_cluster0 0>, <&lmh_cluster1 0>;
+
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
 			clock-names = "xo", "alternate";
 
-- 
2.25.1

