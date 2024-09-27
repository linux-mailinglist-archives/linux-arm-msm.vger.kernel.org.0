Return-Path: <linux-arm-msm+bounces-32691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240E988A88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 20:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE86B207C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8906C1C462B;
	Fri, 27 Sep 2024 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHPHv3HK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDF1C4609;
	Fri, 27 Sep 2024 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463254; cv=none; b=f7eHG8XinBe+Bz2PqrMRpj87D4JJGKDNkbDDitLrcAOqJ566HmqEwUZ7t8hlsc+2dhbDnvg7XLP6JEP2DD8/jVreIC/Qgm4PgdCN6WXtSZTnv7Yo+vtLxrlEoTFtMbjO2IMjg+W8QEAD6HJyYTmQRuoKDXP0fCCWvhuXjL8A6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463254; c=relaxed/simple;
	bh=6Gc297kbohd1KXyHYcOXcYvV+7M6wU2fvd38r1y/JHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4qjUS478Le6Rzgp0oQJmoZsIUmKgfI4ayoqJwGbH2p0UnUFB45ejtHilaWLVVg4xWuNgpYLcWYGYXAKGrwgk/yltczbS7/SpCO0+VveRLHPoAji/2dQXoxOaa/kM7Gi/YmPykKuGa7CdDw9cIbviaPm64deBoQUBXJFWkn2Y20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHPHv3HK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so3150301e87.0;
        Fri, 27 Sep 2024 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727463251; x=1728068051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snynujVqPkbeH/0vNGxwh5Z8PvbFt+V17/BQvx0Ptb4=;
        b=nHPHv3HKLPfbbhV0f5pRV22/3qAxOwwHTLF3gdFUroxeWQPu/PhMLiCrAcj8qUVA2+
         ip2R2AixCwQKQQxY9nP6mxScaXgto9uXD4z0t8ry7PI26Hk35oLdCn9rOwuk8TPA55SF
         MgpKrpzzcKtK0zQ8NrjdeoBLuO0IPZ0MzsCFqlfAaxjeDhwq9a7oemcpEESShPSZ0wv4
         EvJxxRAIhPdOirq54p7zn0Xqg7X8RsHEIy7/yIOMtg4i5j6JIgTScE577krs5D8+0jIK
         Z0RSYnUHX6sOKa7pgF/EICVIKGzobl5YvupiRBECv5/x377B3Bs0lc9orMEIb4ZG2OuM
         lCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727463251; x=1728068051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snynujVqPkbeH/0vNGxwh5Z8PvbFt+V17/BQvx0Ptb4=;
        b=dQY0d3VnVIfNbjuadoJaHWPmC2vPBpv6VXugADkP/ObEI/bX7N8g/a06b9ArJs47Pt
         Cn28yPk2oLzHgI93/lyASfvrvr7z6ngpk/SkDrNsI3sEbU47WDmrWk08searFzuFVk47
         X/2PgIRVr05EHb+Xdsing/8m2+Nfliz6Hc2ZSU6Lt24yl/zh2hV3spj/MCE+y2cT2Ty2
         gCaTISA4Ubq9yq8lmRSM7uZdsw41Yqo7/O+DcYkLpw+/tG5WPHDBzgUZF0SK+TMx4ap8
         31jSdK2/0M9R9BkijjFgUbl6ByTtrK7j4KGcpEQS+O/4PC3yfhjeQCM8+CEuW1MXDZkj
         0bgw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqxZA8vcqzIgVb05P4hLwgbSFLiHU9NL2JGFkZzlm52o2OSEZzTjhoQjuf0K4A6hqyOZhgxfCpgRP@vger.kernel.org, AJvYcCWU+h4PWYfnmryth7mgH5QjZZXq1hbLTj0BZ3lF2AGK7/ahBqbrJ7fh+50zPsFIlnQPLtpDdsqd4E+LQYjC@vger.kernel.org, AJvYcCXmSKr/Pu2GLPGIg3VQeSVOTly+/CPY5J3SItMtgi/7kLlZzIfo9h8CrsEzpHHHhqU0MKQBG7SrAf0AgCsWUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmI2oYWVQs5ZQ/fIOFOTW1039Rj8avIIaFJDMKxDHdj8mOOfX
	HjVOmUS/hKlcmufjUHjUBqeG4r+1PlRmQBgA0NhbBTofzIAJhv6pq1OqM93u
X-Google-Smtp-Source: AGHT+IFYQl6lXrEizrf/3BI7raR0KcP8q4zRY8Z5grxJJrQD8/Hc//8cRFABj5z6aQEDWztSxSeRfw==
X-Received: by 2002:a05:6512:12d6:b0:52e:9dee:a6f5 with SMTP id 2adb3069b0e04-5389fc70e87mr2919353e87.46.1727463250460;
        Fri, 27 Sep 2024 11:54:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405d39sm1434704a12.18.2024.09.27.11.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 11:54:09 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: Add EC to Lenovo Yoga Slim 7x
Date: Fri, 27 Sep 2024 20:53:42 +0200
Message-ID: <20240927185345.3680-3-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927185345.3680-1-maccraft123mc@gmail.com>
References: <20240927185345.3680-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device has an EC on i2c5 bus at address 0x76, driver for the EC was
added in a previous patch.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 3c13331a9ef4..63b627f60ec7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -536,6 +536,22 @@ keyboard@3a {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "lenovo,yoga-slim7x-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -794,6 +810,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.45.2


