Return-Path: <linux-arm-msm+bounces-3439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1A8052C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 081E7B20C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E1969781;
	Tue,  5 Dec 2023 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WxO++xJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096CF171F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 03:23:52 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33318b866a0so5164107f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 03:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701775403; x=1702380203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6sGRXmJ2vFZwbq7OvwUrXyLM1kjgTEB3KpBaM2KT6U=;
        b=WxO++xJACxUyyaG0e+BvdYboOSN7SLb2Rh7B+wNO6wB5Df1IrZx3xjSqt4urDdMA+L
         l82/rdY93hVPkkXlGcoSy3gBXKy4mcwIjnxXafCcNRvnzFG4BEoCthPx2D7T0KCEBfYp
         bUa+sQYR9YhBR903/uYKD3660fhZv7yZMdMdpnUp8QeZ8hzFcfJJ3AXtXZvbpO5g5W31
         7fANJUSKvdMtUXA/g15lVGzbo55s6VX8K4w3qkeSgojfrlggxSj+XdGWnCoJD3IefdXS
         VxOrKs0QBrNqMvBPXys6r3swA5f9Teaw6M78/xSeHPYD8wvYNp6w7B1xlxQ3VdKz2k9/
         /IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775403; x=1702380203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6sGRXmJ2vFZwbq7OvwUrXyLM1kjgTEB3KpBaM2KT6U=;
        b=s0PQjR3ZTOVLoaJVTllQ5+r9c55ad2ay3Yb56CkNJdhVUiJhg3vf+7kc/Hu7nkeuIn
         JOT2OIykEfnssxNTE6EafCZ/tmFH1nfN2xLUDNDdSPX5CXeeKOPdgCKj8KmyM81u4hbO
         n0vG61SRO+hVskDxESoYI4oBLqZNEQVvdRPYde0OgzpmA6vLRGY1osM0m4H8B/gEtasi
         L+Iavau2oxo3O/XKZqmsnP369lOihjkZjDzw1if5gG9pwl/455kGYEb5um1rDPt/NbS+
         dYOxWr8YRRPlBTkcEQz/cNdLVlCDB7MDWk+UEukxpqURBT+s8S59PnpGjbc9ADQ1fiTF
         mG9g==
X-Gm-Message-State: AOJu0Yyfq4Sq+92V4Zf+qXnCoLkDI4qphCB4oPPpfkVU6j6S1hm5IIPz
	OktDhPkC1iGfdgm6zFXFHxwBBw==
X-Google-Smtp-Source: AGHT+IG8kRfC4Kuhw3jHxqdgrgNiTzCNx9TNRsyxtfxsUFLhZilZXEA06L5+jvWkFRz9ZcHxl/V9/g==
X-Received: by 2002:a05:6000:71e:b0:333:4c89:f44a with SMTP id bs30-20020a056000071e00b003334c89f44amr1683678wrb.2.1701775403066;
        Tue, 05 Dec 2023 03:23:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2dd9:dce:96c5:9e9a])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d59a8000000b003333ed23356sm8127775wrr.4.2023.12.05.03.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:23:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: qrb5165-rb5: add a pin function for BT enable GPIO
Date: Tue,  5 Dec 2023 12:23:10 +0100
Message-Id: <20231205112311.16391-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231205112311.16391-1-brgl@bgdev.pl>
References: <20231205112311.16391-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Set up the pin function for the Bluetooth enable GPIO.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index ce6ae0771d34..ead0c45ba60c 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1264,6 +1264,17 @@ &tlmm {
 		"HST_WLAN_UART_TX",
 		"HST_WLAN_UART_RX";
 
+	bt_en_state: bt-default-state {
+		bt-en {
+			pins = "gpio21";
+			function = "gpio";
+
+			drive-strength = <16>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+
 	lt9611_irq_pin: lt9611-irq-state {
 		pins = "gpio63";
 		function = "gpio";
-- 
2.40.1


