Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD6BC13880F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 20:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387395AbgALTy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 14:54:28 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42435 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387413AbgALTyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 14:54:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so3815042pfz.9;
        Sun, 12 Jan 2020 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9M3dlkPvAA74ZA3Dz07VUPHZPdx7oFweuiEOAHoWN1M=;
        b=GTq8olhq3p+o5nwwODwkds2g5yTd6UB+6v/XDM8BPwRZeMADFiH8YZ1Ni44TcURnBj
         VvRlqpR+kB20Ux7C7kDIkqObcxLq4ib2T5CkIgL4wVHMOefExmqIdzW4vfevzhzNJ1HQ
         iw8CudWouK/PM5OBRvSOya7XbJRj/CUOgKshFFrvreQt0cUxiKDcK3CpRovxgDlZ37h7
         hEsFT/1OTxgZsSZswWeTz9pBqI+wBig1Kt6JZQNjzO54UA9kUY0OchqgIZyJuqHCDJKc
         Cvm1jF3yy5DMjMDzQcqVodvcUqqjprYeoO/zsu3PBKe/o78N2NZYIrqnRYeyxN7TsfJb
         +ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9M3dlkPvAA74ZA3Dz07VUPHZPdx7oFweuiEOAHoWN1M=;
        b=DMnztNyvwGZ9aqie5YXFj3bydX0Sk8p0j/zQX10uU7xFzBEQU1LBtcSSyeOqf8guoE
         o1fG7nuvjki6VkHHW+3YIZUSD7ylmisk5ZuT6nI/A5dvozbL7zLR1VUEPxb7yC1Va3Ta
         yLedO6r7WV5jDOfnLUm8SFWQEX4YMrGnBBi9vPj0x2ithjqy13MSbr8QfXwVLQNZrtte
         NTfjRRJLAgYWt2Kxx1/vcN4L/AdHhlFcDMS8EmnwTSOaaNDhGosPEXqPluAycGUeqZ6g
         zyys2va1CQ+vv6URDxZSd49Tq9ihFlgO+gAC/46BTmUlWA80tmrqYxhBFCuv7ELjqXG9
         bKfg==
X-Gm-Message-State: APjAAAUl7YhwlYaNAOU6uL2kGW+tVGGmcCzPiOY+VVTAr/t8D7TjKRJv
        mrtK/hSjmRaYxlU+DfSDJ/s=
X-Google-Smtp-Source: APXvYqxgtDha2wIIkYQ0s11XiURON/vwog3S3qZJcZWdKW6/HnjDdywO8lijSbdzd2JcnS/+b7qgug==
X-Received: by 2002:a63:4a0e:: with SMTP id x14mr17052016pga.360.1578858862865;
        Sun, 12 Jan 2020 11:54:22 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n24sm11082138pff.12.2020.01.12.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 11:54:22 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] arm64: dts: sdm845: move gpu zap nodes to per-device dts
Date:   Sun, 12 Jan 2020 11:54:00 -0800
Message-Id: <20200112195405.1132288-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We want to specify per-device firmware-name, so move the zap node into
the .dts file for individual boards/devices.  This lets us get rid of
the /delete-node/ for cheza, which does not use zap.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: use 'sdm845' for subdir for devices that use test-key signed fw

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9a4ff57fc877..2db79c1ecdac 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -165,7 +165,6 @@ panel_in_edp: endpoint {
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &cdsp_pas;
-/delete-node/ &zap_shader;
 /delete-node/ &gpu_mem;
 
 /* Increase the size from 120 MB to 128 MB */
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index d100f46791a6..6cd9201ffbbd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -352,6 +352,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/a630_zap.mbn";
+	};
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c57548b7b250..09ad37b0dd71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -360,6 +360,13 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/a630_zap.mbn";
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <400000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..601c57cc9b6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2804,7 +2804,7 @@ dsi1_phy: dsi-phy@ae96400 {
 			};
 		};
 
-		gpu@5000000 {
+		gpu: gpu@5000000 {
 			compatible = "qcom,adreno-630.2", "qcom,adreno";
 			#stream-id-cells = <16>;
 
@@ -2824,10 +2824,6 @@ gpu@5000000 {
 
 			qcom,gmu = <&gmu>;
 
-			zap_shader: zap-shader {
-				memory-region = <&gpu_mem>;
-			};
-
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 13dc619687f3..b255be3a4a0a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -245,6 +245,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+	};
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.24.1

