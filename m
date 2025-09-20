Return-Path: <linux-arm-msm+bounces-74257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E704B8BD03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5284F5A3AC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C485B2153FB;
	Sat, 20 Sep 2025 01:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0lqCVxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869F214813
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332835; cv=none; b=tMjt+x9bF+lRS+Ne1Dqh7mnH+/c7i48phMhnxUmJ6wRh3AZU8RXHbrBcoA/skhZCOzRxn79yAoiy1+rww551zbItKRHHmql2SxnWtUZG7EkfJ1OiyMrnxvzEpltkQfUbF+fiG//sqsamBU9C/ZUW4mkYpnD7YK5HSqaJjfUILSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332835; c=relaxed/simple;
	bh=J3OQ/gbZXClh+gnMC9yVomxVT5i16d4sRMT1zK1pgf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkEKmCkat6/bGX+jyAs5xk/yoZZtpuROLOKKW6NGNM70dv8rCd0quzFFgeibxHB2JRGPkTS0i71j62LU/hKlrv3xSZzhGxS5EtFCKuQTJ4nC1072azlKrqdpdqednplhtsT8j4eyodA16j+WBvrWNtx4tsF0HcxSuaB2MoGmWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0lqCVxt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-267facf9b58so20266655ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332833; x=1758937633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeUIHWsKLh6gjLn9Z3+FbhnYjwlNLiSz3aZCwDtFUKY=;
        b=R0lqCVxtloWyypEeavKNztwcl+prrAy2NFsIkEV4oWTQtDjJ9y4pCid+szugR6TNjw
         cwu2y90eVqjOkhZqeE0tA5Eojnn1UfsgPNKQ/cd1Vwe5MOQtjBYspD+1BJ07WjXXmPCH
         rRHRTwnjrucG3GbbOOwkA6toVs1DKT4K2B5e7iVg3j9GbeHGdtczTljfdpXwjJcLqocc
         0KEgcSMNyBvljPSPTYIA/ZpCuv7puNxYMKI1kgu/Cr9hm0pdyKJ5g6t6/NZ2GDHh5Xne
         bQX1VbAvo86lBikv//knGSiUsxAiDILFdZiV+amLUSOeUaYLU6vLScLJyVw67Y+OSaAy
         RJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332833; x=1758937633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeUIHWsKLh6gjLn9Z3+FbhnYjwlNLiSz3aZCwDtFUKY=;
        b=f2xJtHlzRlEc48VUIVgpWhArtFeVLJzkhKl7Oc4tVl9WFs/9WkWZ50Mq3474CaEV5d
         5TQu3y9Z2Qh0k1dsH7dNoxRypmsO6RTd7vtG+IFoxtWmBJGBjg+JOgI8TZbd96OaAjk9
         NYnuIw4Jfw/44CbNhLX3g4mlRvK70LVVK5yT3qar4X/acWa/YLRPb4l9SEyZ02LF6oAJ
         BIMs6mBlRyBDZrXfahTw8QmTBe4cRx6S1un5f8qa+SiZHjwbcok/fRvrIPKXI4zVJpPV
         WYzRpJtZpPxWT+j9QDKxonCk+CxUuyAfljpYI62CEs6Sj2SLzUIawCekiSk08Myqn5xs
         mXXw==
X-Forwarded-Encrypted: i=1; AJvYcCWEBHxE13+7oHVpQpj86HPNy0CxcZGmpK8w8/LQxAv41FBxdUHGiNvfF1wwIvp2BKgaPt2QFdpUBwl1fBzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YylWk2ez/hg8OGUijcGZWvSLJ2Iqq8UtChqvAVw21LgoSP9EEd7
	xqpjYMCCLLj96b/uOSjDUppf5+U2FIUah+62GGOnxeRFYYGqOLk1ylst
X-Gm-Gg: ASbGncvFYhDtLK28AAnSM+iDXQgsEDKziQpFmZ9WKVrikbuDKhDVeK1vsqNRZv4t8Zy
	4vesjXP1hYfVK20M3CSlBVJIEgXrb2q5dSpgMc7yX7+GjfjdclbZBHRh6PLK7aInMoEjNQOzqx7
	OP0gIojNtsuK6R+b406E6tsajYFKFn9YX0vHe0ViTE04ot5aswfz9rajG5sqou+WUGWy14BX+9T
	3WDA4XMJoqJHPf/vfmJTnQSp72WFBEmsn4+YXus37CXE2kGoYDCb3DUe3TNoWX34+2h3rfm244N
	gGgY+MZfMR60l2e9JnyOVEjyt2ouGPDWqmFzjy8+gdHpE7b6KbBbfgZg6xIT5RNE7KO42rcp1x5
	YIiUpmHpXRyeVJTvD1xVh
X-Google-Smtp-Source: AGHT+IHAb8q347For76gqV7j8lIEycMW9TAsw2JxhvCS3NbiNhH4DBGbKJw3OQ7FwHz61bSv6avlkA==
X-Received: by 2002:a17:902:ef12:b0:248:a4e2:e6d6 with SMTP id d9443c01a7336-269ba5042eemr66295115ad.39.1758332833618;
        Fri, 19 Sep 2025 18:47:13 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:13 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
Date: Sat, 20 Sep 2025 01:46:35 +0000
Message-ID: <20250920014637.38175-4-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and haptic
PMIC, enable the fuelgauge and charger for now.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index 7bf56564dfc6..c1b0b21c0ec5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -14,6 +14,16 @@ / {
 	compatible = "samsung,r0q", "qcom,sm8450";
 	chassis-type = "handset";
 
+	battery: battery {
+		compatible = "simple-battery";
+
+		constant-charge-current-max-microamp = <2150000>;
+		charge-full-design-microamp-hours = <3700000>;
+		over-voltage-threshold-microvolt = <4500000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4350000>;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -186,6 +196,26 @@ vreg_l11c_3p0: ldo11 {
 	};
 };
 
+&i2c5 {
+	status = "okay";
+
+	max77705_charger: charger@69 {
+	    compatible = "maxim,max77705-charger";
+	    reg = <0x69>;
+	    monitored-battery = <&battery>;
+	    interrupt-parent = <&tlmm>;
+	    interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	fuel-gauge@36 {
+		reg = <0x36>;
+		compatible = "maxim,max77705-battery";
+		power-supplies = <&max77705_charger>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &pm8350_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
@@ -345,3 +375,7 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&qupv3_id_0 {
+	status = "okay";
+};
-- 
2.51.0


