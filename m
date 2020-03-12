Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33256183315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 15:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgCLOat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 10:30:49 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:38588 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgCLOar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 10:30:47 -0400
Received: by mail-wr1-f44.google.com with SMTP id x11so2989505wrv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YwUqcbSkfiGcYWBIGYa6fyAd0dVAA7TWBNYQrjCfOhE=;
        b=DgaapTg5RX+RM/6VrRELTPI3+/XW/sUo7nLw+QWisSsj0esPnFTRxK06CDNVuS6dk0
         wETGh5t0ExN2ajH6UrJSEU0XQSf0F9wx63May9wtKWq/qW8oWeroPbVznFuDKJw2iNHO
         pSsiqxvr/KVgWfLDNcbpF8SYaRBoUeFVkixCm1jXJGvZYQM0u4irTOucpPcvpfT4eTlk
         eanB9yuViFYQphQTu0I/T9vH2IDD4OpN74UTpXmcJw9EzWwcOU7+hf3CSjaR7LTtkOeh
         d6yJA1HRSNNMksR4UmlMsFsJfw3Va/liICmyuMjJXGBFLOmagMqfzwiAvTSj1V25JfUm
         ZKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YwUqcbSkfiGcYWBIGYa6fyAd0dVAA7TWBNYQrjCfOhE=;
        b=s0Y3W4iqvd3UiFJifrLBF3hWRmPErNTjY1TEwzASB0z5iEW0JE+wDgRHQgV7IdEa/U
         O9mlG6xjhB9WtrcRKWY4OHCaLJHHFeVtQyBkmwRZyXTU0QVKc0lyuTvIs/CY1Wpma1tU
         4krEMFuQ158TjUowudcQtjw3WGSHSO6Z8NhqalcmtsJZKu7cxaW6H5mNo6ZCtr6IFjdV
         yzjXJC7U+nNedKYZ68oY2+M5Wect6tRGw411+HchyKufei1ZR5KDFgU46R64tjadkI/+
         HXcnsEtVsf45983p8rpimPdNLzgKw9u3FN7cQUb73E00iaSlroYnl+CAHZmSmmijCjep
         gC3Q==
X-Gm-Message-State: ANhLgQ1JqaIFogPibsXIbxJ0IxpOWTM3yyVxBvu1a16L18N/BUoN+Dzo
        IsT/xMSfNTDJoo7VjVZ0zQYujQ==
X-Google-Smtp-Source: ADFU+vtNye5LXYq43J99KhyYyK+mxSC1U8QCons7K7iPov/Ue1YnNXFCphoEgn8CM88EVDQV1vPf+Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr907979wrm.247.1584023446356;
        Thu, 12 Mar 2020 07:30:46 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id v8sm72860454wrw.2.2020.03.12.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 07:30:44 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdm845: add pinctrl nodes for quat i2s
Date:   Thu, 12 Mar 2020 14:30:23 +0000
Message-Id: <20200312143024.11059-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pinctrl nodes required for QUAT I2S

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 136 +++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5b7626f2a27b..c565948e322f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2152,6 +2152,142 @@
 					function = "qup15";
 				};
 			};
+
+			quat_mi2s_sleep: quat_mi2s_sleep {
+				mux {
+					pins = "gpio58", "gpio59";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio58", "gpio59";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			quat_mi2s_active: quat_mi2s_active {
+				mux {
+					pins = "gpio58", "gpio59";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio58", "gpio59";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			quat_mi2s_sd0_sleep: quat_mi2s_sd0_sleep {
+				mux {
+					pins = "gpio60";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio60";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd0_active: quat_mi2s_sd0_active {
+				mux {
+					pins = "gpio60";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio60";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			quat_mi2s_sd1_sleep: quat_mi2s_sd1_sleep {
+				mux {
+					pins = "gpio61";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio61";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd1_active: quat_mi2s_sd1_active {
+				mux {
+					pins = "gpio61";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio61";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			quat_mi2s_sd2_sleep: quat_mi2s_sd2_sleep {
+				mux {
+					pins = "gpio62";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio62";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd2_active: quat_mi2s_sd2_active {
+				mux {
+					pins = "gpio62";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio62";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			quat_mi2s_sd3_sleep: quat_mi2s_sd3_sleep {
+				mux {
+					pins = "gpio63";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio63";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd3_active: quat_mi2s_sd3_active {
+				mux {
+					pins = "gpio63";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio63";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
 		};
 
 		mss_pil: remoteproc@4080000 {
-- 
2.21.0

