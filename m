Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217E4133895
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 02:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgAHBjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 20:39:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35803 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgAHBjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 20:39:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id i23so777310pfo.2;
        Tue, 07 Jan 2020 17:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THEg3QFZEQa/O6HzLLi2uHWnREbCmXjTJPDpWzYvpYE=;
        b=bFJiDvvzRPYy9tdXQ0hkK/djyuBrFTMSlg2q0m8p/LFtm9htcOMfpSjWHqApL/PkM1
         hjQIkMC5uFV8SbB/E1pKh54o/9vCh+9nmWdBu3HaR3xo4o6SpQHrIBL9bgxcIM7XM5n5
         ligtnEa3e6CeS/jpbKV9flDmO4A/oM+A1c7e25lpjOkA+FpY+zHr/ot9xfxSlu60X6C8
         S85g2bu68aqCM+Tpg2hGTVHvaNjPvHj6zCHJklt8o17So2Co3W96UWMIXT8C0pLGT1pg
         qdNQMPfkQKuBTx8p1/poFS+aWKOBCPydbaELEEYgcN7FF4LNdOzP1VJBlt996eRPax/w
         hMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THEg3QFZEQa/O6HzLLi2uHWnREbCmXjTJPDpWzYvpYE=;
        b=LlOafNyLwBOkPYr2zTQPriSoZsq1LAammv4vH+FYFjBcu2gXTRcUVSmBF96qN8DHXt
         6gJ4xEhR/a8VsmcuaiVVqcj/jMS8az+zD2zan/5TyXxoYQ+47zUU48BX9AiFF7B89m3q
         0KmuGnIURkNYPi1kEulSNhSwqySd2n+FPnKJ9iBR79dNLcMPEoiys0tfuEeXKDmsw6+S
         oQkN34JFp0RMZIp5bKviKZ6McOdBj3Oc1+airqvrEthegXS3OUvU+fQZMrfUZukcVBj2
         C9GPPp39qHu4EzKiT8izClNWVxdViF8iV+lNlZcnrBCng1dLpHD4SWAUKMM91b/g6EqX
         qy4A==
X-Gm-Message-State: APjAAAV+6ZIc1VPleR/+oA1NITjqVvTPnJmZ/hms4CKM3YXaCGRIT/9R
        vzYBVtpWxw7Fi3VtHNJBHLU=
X-Google-Smtp-Source: APXvYqyW+M9y0psHwU0NpMvkTavrh7MZTxAMiyVpc4pqn2yNLfg6OeaTa33ovYQ/omgdDo7LgmmXpQ==
X-Received: by 2002:a62:1944:: with SMTP id 65mr2476029pfz.151.1578447550936;
        Tue, 07 Jan 2020 17:39:10 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id a6sm994334pgg.25.2020.01.07.17.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 17:39:10 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] arm64: dts: sdm845: move gpu zap nodes to per-device dts
Date:   Tue,  7 Jan 2020 17:38:44 -0800
Message-Id: <20200108013847.899170-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
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
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
 5 files changed, 23 insertions(+), 6 deletions(-)

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
index d100f46791a6..c472195e44fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -352,6 +352,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/db845c/a630_zap.mbn";
+	};
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c57548b7b250..876155fc0547 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -360,6 +360,14 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		// TODO presumably mtp can use same "test key" signed zap?
+		firmware-name = "qcom/db845c/a630_zap.mbn";
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

