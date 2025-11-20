Return-Path: <linux-arm-msm+bounces-82706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E945FC7534B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0DEE1325FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714EE3644B6;
	Thu, 20 Nov 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="X8z/tpKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C033559C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654319; cv=none; b=Mx6feSHgQOp7RSOc3Nkeb5GZifNG0gFWxFY6ay+0G0BohqRbU2C/4Hnr5QvsOdczoribuz2D58kX+4khZg4tHYijiveublDzrCDNnC4l5oXxkZI+aqfvaxRQPHrvkSlciMS3p+28rp7CcC6THooCj2YufSqeEeyUEfTpDaUaeS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654319; c=relaxed/simple;
	bh=uPzdYBC6E4XepqZlvRuIW6P2PBSjJWkbAqDhA2f0Q3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQLYJSO7tlWX6Daf+K2qj+6YKN00ixl/jbic99UZKY8vhe72Rm5Ze8oudTFoOZeKuDSBS3111ws/saSqJIIamPVBx8+AkJ45X2V/HK8Z+mTYmMzW5uwZKp5a+6a4B6lqPEA+GQZo8Ya/ihjF7vdQbvEPP0/DsL2GF4gdBBWgnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=X8z/tpKU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso6681155e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654315; x=1764259115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MFhP+e1GLg3I4lzWFY09q7GFkpOYU5+AuflKR7IySs=;
        b=X8z/tpKUTTqT3z73OIXaLW1qdJCAJMoa/IJVoCkO8rRgokm735wFmTkVqLMUh5xkUd
         t7Bv0yU9JvqHhPKdJaQDrIbvVZiFtp4pTA9nfaMtm7CuS63kBP/63x7O2CarAmz8MmRu
         NE8KqwdcyZBFmEAYqfscZCUoRfoZwt86EG994=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654315; x=1764259115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8MFhP+e1GLg3I4lzWFY09q7GFkpOYU5+AuflKR7IySs=;
        b=SZuPzkrVz2Wd2u0E1nR0Nm8qSVZ48opWzzmOgiIxl+3Ksr9RvF7VxAPKENqwU634yc
         QFs3mbbj5nClh+KX6Eu0SJytd1uTnwL/ntl1dhFRX/fviyuQktSSWjorGjHKMlMGZjFp
         QNe1JSGA+992V1uOurr/5WJFd+CRAnWGuWRHy3W9OKo0Bnb96INFa4XvpeuY/Ia6czTk
         j8UZCk4PVr/5kmOpWsrDDMYstuOo7L9qIHiSx8VVbRPkW5B9W/yn6NiSp7/uMiJTc6B6
         VZ+d2G0o45P6NLABNzFfQkdNDcbOhnvF9p8S++0+Vh2fLjrSKwZPsHCxg2WVwA1asl9K
         rwqA==
X-Forwarded-Encrypted: i=1; AJvYcCVPvjw0HLl2QpL5Lf4lrPTcyBHUDyEhM/REz439L3R9ejOdh0+h3IdoO+iR/3OJLY8M94EC9WVTnj9HC+Gc@vger.kernel.org
X-Gm-Message-State: AOJu0YzUByTStPViubRZqqG4yrRNx1OFdHV4syusmfbEa3HWasyVZn76
	vjA+XivhT6CIcCyj5mr1jVDGD5v/Z9y144YwvzSWqlvYIGuisuk5SBeLkKNAzKST+7g=
X-Gm-Gg: ASbGnculfUuT9QcF71b9nsf5EGIhyJ5LK1FOKKIxYCkk5gORS7r7K2f0tK6cmDADA22
	kHvrvvmtHWQ6N0WO6qnjFMqotY2Bbk1cfFEhMe3plNPlH6l+lzhOwAkoDk2/EaZe9yzH6B2nTQ6
	r0MwkW4kT21uiPn5tuiFS4CJxIWGI2nhdRwHhcF/hYXTpylKx0U4aNFxcysXOWjdinNuZVqtmxP
	GKEiRxSJIDL2Wh3v2f3JAzrNJhBwKH6ew2BQOiCS/YGPmrErJPuJkz11fyLuS61VBGQ8pD1FF5e
	JuiTKifD3kBEdAv6H0RyS7ju7rDyFVcqidnxk1Fw5pwTTLG4gL8OLHxRm+j/QwV2dvRN35dt7FB
	hfxe1PjqG5lR5nWReLneustzNX/lSQ2VSFK7QQV5EQ3MDDwMdyRmI8hyqGdJliBJ5QO3QEsxRd+
	k1mbl3b6uLyX+og/irdDZ0252Z0fkgIV36EZpz2DQKc5+a
X-Google-Smtp-Source: AGHT+IHLGhbeSdiUjWR7kKS+/cj5B6fBPMN3SWhcUsAyNW9dSM9wygMKznRi/DZk0P6gk1llzMP//w==
X-Received: by 2002:a05:600c:1caa:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-477b8a9b2edmr41014445e9.26.1763654314985;
        Thu, 20 Nov 2025 07:58:34 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:34 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: agatti: add uart2 node
Date: Thu, 20 Nov 2025 16:58:24 +0100
Message-ID: <20251120155825.121483-6-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

uart2 is used in Arduino UnoQ as an interface between microprocessor and
microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..992a157c571f 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -562,6 +562,13 @@ qup_uart1_default: qup-uart1-default-state {
 				bias-disable;
 			};
 
+			qup_uart2_default: qup-uart2-default-state {
+				pins = "gpio6", "gpio7", "gpio71", "gpio80";
+				function = "qup2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart3_default: qup-uart3-default-state {
 				pins = "gpio8", "gpio9", "gpio10", "gpio11";
 				function = "qup3";
@@ -1315,6 +1322,23 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart2: serial@4a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a88000 0x0 0x4000>;
+				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-names = "default";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c3: i2c@4a8c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a8c000 0x0 0x4000>;
-- 
2.52.0


