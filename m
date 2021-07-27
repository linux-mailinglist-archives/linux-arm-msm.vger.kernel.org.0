Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20BE3D79B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 17:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbhG0PZ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 11:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237136AbhG0PZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 11:25:50 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4F3C0617A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:25:18 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d9so9723225qty.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntT/Xa5byubQbwDu0urUsSHird8hJ+TeLYM9dR8idTs=;
        b=TZP49lgPHr9t+TONHDq0g9pLC7alMPadX6iPtOLan+BYDMWWubRFUdq7Zo51D+sA+J
         6lCb1tDm1Dn81K+NPUXsn4MgrRbVVKtv0clLDfkc/XOPVcBP8xPXHyjdIaGs3peRhh8X
         6MIYfCHgue8SyQJQ5RPeJYu1saQ0sCGQoeLQ/5nnQUwB7MrWpZWPfjkgavrsyaQQCNDU
         o3dw5vDgnpIUeVUeCTXIsuS8/ENfhSqRzMkpGiXWTTFly8MRJpbfDTsFknLEfds8L6j9
         P3zYL5IXzA6f0dxROQGYATyYQVjm/qMbZ+A45ardGB+VNWTEe4JHqTc9leOmE67cAmfm
         0oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntT/Xa5byubQbwDu0urUsSHird8hJ+TeLYM9dR8idTs=;
        b=UOWyaL4zJWjgSrJ+lG+gy4LlAiYyj7dYehOXF4tjCC4slRvoWCyR8NGGNeYwngvfmQ
         tkuoGoe1SiLmiV8DNthyRebm81dO/Ez3TYwVO1RfQUtuufZcFFvYgZJhNOMaVFybqMSL
         1cNDsGPUrM+/edjA4NNoO0w+6S1Wu6IXL6g27xTqGetEvdd2Y8GJ1EPXvVFZ/HxF6+VZ
         Tp2Q36y95E126GoB8S5lt9HUhMZwO4MrtF6Jlk6IT9XeZS5kfymVtwOPcOzY4n0hOt6p
         am7r2E8JG+20DgIe1sGfhbdR/bTEcdS5X6MJoo+5GIcgg3t7kdSj/MJHGfgz1woMNYR8
         pqTQ==
X-Gm-Message-State: AOAM532XK3dOT2fzYNwDQaXk2iUcYsKnMicG+gzwBRPvNJUxR4HzQ8a+
        0n31P7WZUYkBcbhc2ckk4ou6LA==
X-Google-Smtp-Source: ABdhPJyN4xvS7j0iHB/Pemn5TA0Wugvg+mt3bM9okk9yOBDTytyHu8TeKY70pGPGHC06HeTEZ0AO/g==
X-Received: by 2002:a05:622a:16:: with SMTP id x22mr19935879qtw.90.1627399517548;
        Tue, 27 Jul 2021 08:25:17 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id q4sm1539663qtr.20.2021.07.27.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 08:25:17 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     steev@kali.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [Patch v4 4/6] arm64: dts: qcom: sdm45: Add support for LMh node
Date:   Tue, 27 Jul 2021 11:25:10 -0400
Message-Id: <20210727152512.1098329-5-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727152512.1098329-1-thara.gopinath@linaro.org>
References: <20210727152512.1098329-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LMh nodes for cpu cluster0 and cpu cluster1. Also add interrupt
support in cpufreq node to capture the LMh interrupt and let the scheduler
know of the max frequency throttling.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

v3->v4:
	- Changed dt property qcom,lmh-cpu-id to qcom,lmh-cpu and made it
	  a phandle pointing to the cpu node instead of a number as per
	  Rob Herring's review comments.
	- Added suffix -millicelsius to all temperature properties as per
	  Rob Herring's review comments.

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
index 1796ae8372be..0bf98f072921 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3646,6 +3646,30 @@ swm: swm@c85 {
 			};
 		};
 
+		lmh_cluster1: lmh@17d70800 {
+			compatible = "qcom,sdm845-lmh";
+			reg = <0 0x17d70800 0 0x401>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,lmh-cpu = <&CPU4>;
+			qcom,lmh-temp-arm-millicelsius = <65000>;
+			qcom,lmh-temp-low-millicelsius = <94500>;
+			qcom,lmh-temp-high-millicelsius = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		lmh_cluster0: lmh@17d78800 {
+			compatible = "qcom,sdm845-lmh";
+			reg = <0 0x17d78800 0 0x401>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,lmh-cpu = <&CPU0>;
+			qcom,lmh-temp-arm-millicelsius = <65000>;
+			qcom,lmh-temp-low-millicelsius = <94500>;
+			qcom,lmh-temp-high-millicelsius = <95000>;
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

