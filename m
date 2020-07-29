Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F340231DE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgG2MBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbgG2MBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F10C061794;
        Wed, 29 Jul 2020 05:01:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a15so21367509wrh.10;
        Wed, 29 Jul 2020 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vT8ZV4Bq4gzHVcR91/D21EVr7w9iR11fQIpmJgM0Dvc=;
        b=ngRZKqRT4+gaUBIIzctLQiEdogB+ttmF8+jpU6BbRVUzMm6sMWLhE2MHuwOVLN23c8
         TaxeEcSoUKW/dtxacIsCJ8IxOjqD01N7SJUzdq3Wyig8OGhAd/ZB7bb9YdxdCRYBF+ZN
         oou0Yd5RQBX5P6L4PEDLE4zyRFl7BnIydlJw4ukU9hLz2JN/ncqUqLcbTbulba8pTx30
         rHvkrFO13znOz5cmntHfEaTOLlhSQHcJSNZcjgLEC8NZSYxI8sdEgKDjzLXvzeZ00gSp
         E5Uk+A+6HXB6srlhUjmSyeitoddIZ0EXP5XjiVRGprDJ/GJTfMMgN+1OwTfbrmOC8eRV
         mUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vT8ZV4Bq4gzHVcR91/D21EVr7w9iR11fQIpmJgM0Dvc=;
        b=JqqKPSA6OOAIyaIDjuKMb71pY5DagyJ+efzqC6jeGlnxsDnPkc0LqdQPnoiwMSG1yd
         KYqU0GDa9kUKfMJUF2niePnKJY/9UMRjXJHopco1UckFfrcNBJRBp0o0Upd/FiyO+1/K
         6zG5MZ05azzNfWHYn/pf81oW+q7m2ypJyX2PuxPrMESLRYySSktTV8IKRmns1/0yvqwp
         fQEnHn5e9jEIkmkjegPnC/fYpgVaHFvOkaE+Z56tJO684pTI0HVuUISfgzKr7EFKKUuj
         vcMWs6wDrYcNjLrXh251qzy6Y1DjnXGo+6MI565rgk1/ila4gjcaTmlfuRT8fmUzhGxc
         kyFQ==
X-Gm-Message-State: AOAM532p1wixjKPgQwpwjDRjXqckjJk7yKpaH2SSvRA+ktO+OZthAQTG
        5Ae/puI5+4d5WeXpe0ujRQg=
X-Google-Smtp-Source: ABdhPJymKYYX8kIInl0J7sURQaH5CL4HhlAwE9Oq4KOSY5L5/epNGA3c+CKtBN2wM8PIIpkhIwfkcQ==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr29619790wrw.155.1596024076307;
        Wed, 29 Jul 2020 05:01:16 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:15 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 06/10] arm64: dts: qcom: kitakami: Add Synaptics touchscreen
Date:   Wed, 29 Jul 2020 14:00:52 +0200
Message-Id: <20200729120057.35079-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
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

