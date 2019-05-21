Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2AD24BBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfEUJf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:35:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36335 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727723AbfEUJf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:35:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id a3so8310755pgb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=dTr1UCKgplI1VGB/ZytO9oL3rPosZf7DuDvgJME+3jg=;
        b=AIHFm7Hp4l+4xNPyW1cX8dxq1awTwXVWdpBPVIR3sn4SXcSKSHlVgGImRIW5bXDUa4
         lo0tOlSuFOBUL1R3fbgd7cJUHoMk3my3qscAJTjjlf/AViZ3Vv/IgzxGSayFt4cE7Uu2
         0yWa5KvdgnE3+HdLj8ccnl1VQk3XVLm0yogjlk4FzbxrTC6hy9u35nLQCSB1cl/ytpsd
         AyPweRXFYA029GowWgM4Ql7lqa32mdbC2QzGMEhwG3atEB8r1k6aNOXYlrFd2IWMEY7F
         yCU6/Fy2CcxuhHznLygRhUT09LrZukpgH9Ftt7fSNGiz7zcuSZqAYVm6a2dVYdDQE1Lf
         s2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=dTr1UCKgplI1VGB/ZytO9oL3rPosZf7DuDvgJME+3jg=;
        b=a68weXLglbU1XFAws6ThyR0DQceJoM+tanH24RSEev6BZ+6TKLGHIt/hjZNIQdaQLq
         01upijBUjfkbDRo4OwCjDjmenz63uO1hZk9WiTBseCTNBrEtZi9MRD/ShUMJdEPK4lvg
         2hlTCHfqNV/PXVKKquNteA4/CKtmdppVuxlwQYpknl9DncWbp4J3zomKAYbAY0MTUFDy
         gSX1lL4jLmo/84nRPtVZfZ9RtttJ/gPBoVUEPTz9PQb9l2LanSNZoVq1RNrrWaPEaLDL
         L+tr5c+Ban/WS8olv7w79LH6fuHEP/Cir24615/TIVxRlk0le4FKi99uu3SAD1io16T8
         s1SA==
X-Gm-Message-State: APjAAAV6B4nbCotoO2taJU4yLeMt2vPSKcnuW4HpmEjTDQbEBVgbUddg
        AShnTpezwmgdAkTLUB9NEOXp6w==
X-Google-Smtp-Source: APXvYqzQdvlEjQclsKdTI02SGo59gbciI+RW4++t5Gve8xz66BCTyu7A7ZIpVyC7VmIiuxCVrOmnzw==
X-Received: by 2002:a63:4c06:: with SMTP id z6mr80149345pga.296.1558431356498;
        Tue, 21 May 2019 02:35:56 -0700 (PDT)
Received: from localhost ([49.248.189.249])
        by smtp.gmail.com with ESMTPSA id q20sm22215653pgq.66.2019.05.21.02.35.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:35:55 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: msm8996: Add proper capacity scaling for the cpus
Date:   Tue, 21 May 2019 15:05:19 +0530
Message-Id: <5224535a7ef5b257e3baa698991bf6deeefccc36.1558430617.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8996 features 4 cpus - 2 in each cluster. However, all cpus implement
the same microarchitecture and the two clusters only differ in the
maximum frequency attainable by the CPUs.

Add capacity-dmips-mhz property to allow the topology code to determine
the actual capacity by taking into account the highest frequency for
each CPU.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4f2fb7885f39..e0e8f30ce11a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -96,6 +96,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
@@ -109,6 +110,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 		};
 
@@ -118,6 +120,7 @@
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 			      compatible = "cache";
@@ -131,6 +134,7 @@
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_1>;
 		};
 
-- 
2.17.1

