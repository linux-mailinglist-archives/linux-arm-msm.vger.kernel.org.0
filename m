Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D095C10F70C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 06:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLCFYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 00:24:09 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36231 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbfLCFYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 00:24:07 -0500
Received: by mail-pl1-f194.google.com with SMTP id k20so1217711pls.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=z0wd2bkKduQ+i5fk/EQsJPpFHH3ALeC9IpHFk2IOC4U=;
        b=I97wPUn5AdpqoulNYp4MLektHFnqlZpzv1q6Tple/h1X9kp4o6h9qh1FQIG/VBV0BE
         Tvl3InjLcCwxYV7b+gpFhrSZQdo0MlgijP574fZFNyHv6Nz76r7nqs/B7m+kT5wAM7m1
         vwG5QeygVMxOqAy1yRrhuGSM/gRdLCVnt/Vqc5NhiccxGRfpys1DnV++S2frxyKP34xm
         /qkuWYgBjLO0Nm+YfuTbVGqorGkiaZQr9GbAsLODRkJsoA5Hi/MTxbHgNL3WCSfUvLkb
         lNH6nfwLml4FcQOwJm3vh2wmEvVpb/D3CE+rxzG5MJfi44HPyFH1Lf4jkDN5hwoPmlRX
         9Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=z0wd2bkKduQ+i5fk/EQsJPpFHH3ALeC9IpHFk2IOC4U=;
        b=Ma6SugZ31DNxrpQMWcnOL2Iy/h/wIVHwh77Jgv62msdN0sxjRDS9V5fLhxXenQNjTZ
         gOpgHGmKCJ/Ghi/1/tdgSnUHWtd2IsW9J8ni+gSfY/F1M8zYFuGNKxM3ID8WxYRRZhSQ
         SKZJj05e92cVZa1YaNgDivD/HqVLTiJ2izuBOczalCQ7f2Edp6BuCQ91SxRIkO//gjp7
         tIl6BMDR6pbv9rOfCzHH/v05EsAsFVCiMuKfvWgznYnr7pS1nc0YYkmDfVjzaxTEfGom
         WOM5xCaUGb9laC7BVov7WaNjxx19TrGmhzT6J2j2hB2I+WKI3cmUShgywmSZpbiMvPfE
         BjqA==
X-Gm-Message-State: APjAAAXhNb5ZgM/lleyAfEgsFh2IVzCrLRXo2MpuVj2NNULRcx4wIp4/
        M6dlDQg8QpL2XxedlHl196r9o4lZWSvAjw==
X-Google-Smtp-Source: APXvYqz+n883h7TApBIYHyvjaAf7Zr+4v90MCkLzZ/Urywenueq6LOa0pUx8KSfoS0Bqxxy1cArcbQ==
X-Received: by 2002:a17:902:b403:: with SMTP id x3mr3255707plr.28.1575350647017;
        Mon, 02 Dec 2019 21:24:07 -0800 (PST)
Received: from localhost ([14.96.109.134])
        by smtp.gmail.com with ESMTPSA id u26sm1419005pfn.46.2019.12.02.21.24.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 21:24:06 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 8/9] arm64: dts: msm8996: thermal: Add critical interrupt support
Date:   Tue,  3 Dec 2019 10:53:29 +0530
Message-Id: <53d8f7b922ec889ed11380896c2a367ae0998db2.1575349416.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4ca2e7b44559c..fec0e50fe4fa3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -591,8 +591,9 @@
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
-			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -601,8 +602,9 @@
 			reg = <0x4ad000 0x1000>, /* TM */
 			      <0x4ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

