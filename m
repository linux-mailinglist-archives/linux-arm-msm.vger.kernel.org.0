Return-Path: <linux-arm-msm+bounces-80630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2BC3C0F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A85544E442C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EB32E7F3A;
	Thu,  6 Nov 2025 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="JS3CCsCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EFD29E0EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443092; cv=none; b=VubRrD9PGPUs+erpGyJVkH5vXh9mr/hkQIlU0Tk2iQU5duu/xYN74VnFRgGR/NkjYsBK6jtKg7g0+ynfenLnkpm0njMtb2fEMnfrECluE0mgvGRT+f408hzMSvKhoEXqCOuzhmFg8dzMuFTa0h2rIZFlmin1E+GWfeMi2fNCCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443092; c=relaxed/simple;
	bh=nFTMiixlNvRzTbq7OpBGOyWd3t8zjaGziikj/c4xkbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiUM3d8yaH8zCNYbcjyiy9zAJR+G4VDwHdzK4o0MGjVohzM/I2P59RS9M8gI5mHiI/4PecwIQRx/lxN2jU7tOo8MTxtWDmNf2IPGRlF2S6S4n5v/81v6CZT0n58wzqxAs+cwANJftD/Bh7I/ghIv4PuW9t+rzzuIp3Kkjt5Z0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=JS3CCsCE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429cf861327so859005f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762443087; x=1763047887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDJBjo0tk19MxLFIW+Axiq3QKZE3M5MjCU5GisKJEXQ=;
        b=JS3CCsCErJMWwevyobg0lxKdWUylGvqCGp6BmIqO8HOmVSe4JNASTi+TN+VWD3oPWA
         vxyJGFCT6jpmj6q19Z465yO5VR2/kbtR4uzr5ui20Jbw9/AnaP6YG0hs8RnZGcnJU8fK
         OOYP254loNWu7pfHLrKSWlvm21ooFBMYRlvS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443087; x=1763047887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDJBjo0tk19MxLFIW+Axiq3QKZE3M5MjCU5GisKJEXQ=;
        b=wRd+RQqJwP9KyFMwTN7CrUPlr8830OM37GsGjWHMXmdp+BUYn4ZnnJvozw+boa3067
         RTSkSFiza4aEx1IEYNOW8rYiAd/x1mFEBeBWlN1s51ib04GSdcRhdrhPQzWjn+elMCuG
         +HsRffG7HI9BvVRWHq9jCNenfpIRhUXNJOyiysot+EVVtBMJJwKBXtQLU6TJ3iJTtp/m
         JOlIW2wLKofT/y3b25/5HePSMgddh7G8Jmh5fW0hfQbyf6MjjEJS1fOZM+Ct2LrD6y2X
         GD3btU3CmzWU48XBWx9JQzoy2tvZh0sqiM+/t0BL3uUIeB+XzAmaXIRrBEBrJNz6S/xI
         mzdg==
X-Forwarded-Encrypted: i=1; AJvYcCWULClqtsStK2t5fTVZtzjG5KyLKWXZlggvKV9guU14s5xLQ0zVwCJ6yzhDshqu/OIZWOYauNlJbGxq4J+m@vger.kernel.org
X-Gm-Message-State: AOJu0YzRWilZ2ZwyxKFYIo0eQW/9ZsGoAa3BUjIGuzV5PvwH312YRi68
	l5po/y1ex+7TUo3EiGugVGUSCpOFdsWVQpQy1UW2l7/XZOtfzb6uk5jo43cg9ImjUFM=
X-Gm-Gg: ASbGncsoyQgfgDdAntMIJiw8wIjnepoT4detide7ByPXMXldUagVUgvWvPtU1vXUmog
	BP9Q7rHn/0FFwp1WxXVyPzN5g+8/8ksu3k46O5GOwWNbXyQKlniTOW5/X1FLHSjJagp8JR7iPgx
	Es2rR3rMs+ssy4XsCXIn3xNePxbRlPGuIC/y02T9JTC4s8iEyU5iElnuO4nmb69CzegRD7R3xyN
	pkqHgUcUoS5Fel/XF2+LMsIESH+z9ceBYr9IFmYmHPMprZezRAGAqmiAvFcxk2xHTGsbbbpCKgJ
	6ACWpohZMQ2rlDgHglmMx+jZ7IjFGkTu1DCjBI7Wr+30e759bxnrNeK7WCXqlSlhwzXPopVspgt
	FcAAP77AbRJauZFB+lRhqovnkOe3Qs7GsDXR79qz9oA6Q5s3McRyal3PoXIu5FIj1Xow9P5tmKT
	wMhNY4hxR/ieVDai+UncoZkDSN
X-Google-Smtp-Source: AGHT+IHCZAr95mKcE9yjFtJyCN1KyzbJ3I4nTiFSTQevwcerBzM8hslgjP0KyUU+ToTYxmAmb25Lmw==
X-Received: by 2002:a05:6000:310d:b0:429:c5b1:5c63 with SMTP id ffacd0b85a97d-429e3337679mr6689753f8f.61.1762443087151;
        Thu, 06 Nov 2025 07:31:27 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm5966719f8f.32.2025.11.06.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:31:26 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
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
	mm.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 4/5] arm64: dts: qcom: qcm2290: add uart2 node
Date: Thu,  6 Nov 2025 16:31:18 +0100
Message-ID: <20251106153119.266840-5-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106153119.266840-1-r.mereu@arduino.cc>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uart2 is used in Arduino UnoQ as an interface between microprocessor and
microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..32d58e66f57d 100644
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
+                                compatible = "qcom,geni-uart";
+                                reg = <0x0 0x04a88000 0x0 0x4000>;
+                                interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+                                clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+                                clock-names = "se";
+                                pinctrl-0 = <&qup_uart2_default>;
+                                pinctrl-names = "default";
+                                interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+                                                 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+                                                <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+                                                 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+                                interconnect-names = "qup-core",
+                                                     "qup-config";
+                                status = "disabled";
+                        };
+
 			i2c3: i2c@4a8c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a8c000 0x0 0x4000>;
-- 
2.51.2


