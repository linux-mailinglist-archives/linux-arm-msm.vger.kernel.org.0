Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3C023097A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgG1MBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729371AbgG1MBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:01:11 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5105BC0619D6;
        Tue, 28 Jul 2020 05:01:11 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id di22so7425109edb.12;
        Tue, 28 Jul 2020 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vT8ZV4Bq4gzHVcR91/D21EVr7w9iR11fQIpmJgM0Dvc=;
        b=b/fy/zDOmY78YcvR22i9uHPf+2jBxYwFvQbMFWvlk9MeWqridccNEJTDranDM7EsjX
         2ceJURiFs9EyS+YSBekTpeJ+YV1YRddDuFqmdPHl3HRUNXcJrpbumxcA48mTqq/f8zt0
         TEd95IrfcRuMYivwcTD2Ah/+dVWX5XY3pGiVrqOElLdk9GW/dsqbNuIioMwy9gu105bZ
         45RIgCvjYVhQdIQSTwRxDMd8482WEfwLsh02Oni5foa0L5RSuQoZmb+jR7JbbEKPaY/d
         PVbGovYbTsOabg1FFFps3C/4bOcwlx74nw+ARVWJX/6JmBlW+GqQYBGgHiJzo+K6igSm
         xIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vT8ZV4Bq4gzHVcR91/D21EVr7w9iR11fQIpmJgM0Dvc=;
        b=T0XxvdkT/1Mx/P5qKG+7JsUdecprDxfHIjHkIfz1O4WgzgFFC4nCL36uxe8M8ye9Vn
         KDLrMDlGHR6j2XxzjQhUXpIw4J3UC0cbHMuNSRuszJ2JtAeNQg/EFJAcqhPBJGZP9dOH
         6ACAcoNxu5Sldu6Z5g/uKNLLSFEbn3lIFUGStOftVTaKUMN48bq+0AFCtxR73xXd+GZy
         e6cgpkizAl2LoC5bbdnzbYrq4m2CgifQXTjJI8vkUlGs9GFqvW8muZCyIC/CeB8HVQK6
         c/zPMpnliPfJmMw76Xg4Mwf/m7loA+2rfPCuofo3yz/4qisYVEc1CrBM+uMbmMwKQQV1
         2jeg==
X-Gm-Message-State: AOAM533HAMEpmhYIrEPI0N/t/5mRO5F+i9AjtFksVo5HyHVx13sreszd
        zQh6JwfE6RZCEcpq19Zab7A=
X-Google-Smtp-Source: ABdhPJwe4ZEVDE4FkHAKG2x8LbFNgryPXaH3YyrGBpsWxx6ONnPXJf166yCsK9ac9CUXk3hHEZcvjQ==
X-Received: by 2002:a50:dacd:: with SMTP id s13mr12961085edj.271.1595937670088;
        Tue, 28 Jul 2020 05:01:10 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:01:09 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: qcom: kitakami: Add Synaptics touchscreen
Date:   Tue, 28 Jul 2020 14:00:46 +0200
Message-Id: <20200728120049.90632-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All Kitakami devices seem to use the Synaptics RMI4
touchscreen attached to the same i2c bus. Configure and
enable it.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 4032b7478f04..696cd39852f4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -138,7 +138,34 @@ &blsp_i2c5 {
 &blsp_i2c6 {
 	status = "okay";
 
-	/* Synaptics touchscreen */
+	rmi4-i2c-dev@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <42 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+
+		vdd-supply = <&pm8994_l22>;
+		vio-supply = <&pm8994_s4>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <220>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
 };
 
 &blsp1_uart2 {
@@ -233,3 +260,19 @@ &sdhc1 {
 	 * vqmmc-supply = <&pm8994_s4>;
 	 */
 };
+
+&tlmm {
+	ts_int_active: ts-int-active {
+		pins = "gpio42";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+
+	ts_reset_active: ts-reset-active {
+		pins = "gpio109";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};
-- 
2.27.0

