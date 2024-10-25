Return-Path: <linux-arm-msm+bounces-35915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6D9B08BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 185B4B266B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BFC158A2E;
	Fri, 25 Oct 2024 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgToPfiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487815B10E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871011; cv=none; b=ZwIEYZKJqOiOwFSFD0wl6lt0mkAN6ASYJkcUYYbQsm8Ih1rHiWOgSjzQnPa6QCywSBIWe+DFa/TtMzDy5LzZv/RXjqlUzw+ZfBjVkgeH1Oa++w9g01Yh8yd0Ig6np7oJ+JEUL3P18+dePZq4/V6vZjRz3Zhmsa2c8QOjbNcOvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871011; c=relaxed/simple;
	bh=CjgCGF8KDBEgjUprVnwaPw0NVN/4TSImNIlCw64dsCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rw2ssh6EuzHfAfSrm+AQrOJUeuuA69dGThtE8cSZeLApx3TZllJBYAYlfVFuj93gkhqvFqaW4h6XInjT1lJs+VAOQuC4IUIkppB54pngYzwFouGkkFWgKVYAQheoM9nX5fldutLpQPOn9vine6EoOI2VE7D9v/12gMfeaDaHTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgToPfiD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so20150285e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729871007; x=1730475807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGqv0lAx0Oo2mFI1vmKjI6WnegojsRi6EofkIgma6Oo=;
        b=dgToPfiDTN2IvBx2TyK6RqszgmLtG/3yta3t73yMComKLDwJnZFj3NqgU5sYvcZSeG
         oviypjYBE0yUqW415DIaINj0seO6pjZ76xK5Rh+NQTnx6H5FXunDCkatwJzr5vHl81LS
         48TP7iqZnfXPKB6T2OB5PaiMcZRSvQi2PFRsqQ5cDPfvjddDSioukeyh+6hYXbRAeHgl
         DLdUTYXmqxElMt/Vn2mXuwHXk7lPHnWwAAv7QxqcY5hb8pcccumiXacjApBXF9DOJxbC
         bcB2oxt19W6ly2iWwHDtnZJ/2YoTXQOrEreVgrQUDdpkwAm+iSIuM+ljJvYDWCLBMua8
         52Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871007; x=1730475807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGqv0lAx0Oo2mFI1vmKjI6WnegojsRi6EofkIgma6Oo=;
        b=A/6Cq5P7A6jp8Ifib1jwwo+uRc8bcyMdi0p8UocTolJP/hiuV4jWij8ub2Ieg0znGo
         U6AkisG1mR+iuntnP6f61DZXA2mLZUI0E/EKD66ke7u2rXDaARuW/nEpN6cecwk9U0vB
         3yGWMBGiNvbhV5plgzXPlL0aQ7WJfvR922AtHZc143P+CjWWdudsv93xCEZsbzIYNhSw
         tbfaxoNUgwtI/uMMXna2QhQreEZEa2dOYVTWWeIJNqF+TArZLvX6tS3NbeNtNApZ9j/Q
         3PDHtHgLCqwz2FUL6os1bEtU/Dj26Ybbxs9Ao7s1mqqNImkm+8uPIBsXfjRC4xqcI/na
         s/cw==
X-Forwarded-Encrypted: i=1; AJvYcCV9vN3Iu6+8mWkYC5R0h59upkr6JHpLASXuuDRFlVEex++gcKwE3yFJrLjv674jMCr0vGDAmXA4E4S8S/Vz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzimi2LPLZ+sJwUPK0iNP6NGGpEsxKJ7hnxmoThefJ90Mk+pyCt
	Sfq8bHILL9O6Ji/1EzNo2pQTyTcdRswzmsjRJ7apyCrpwUiAPTzjG397ncJVeNs=
X-Google-Smtp-Source: AGHT+IFHECj8EUQyf8YhHo3IpCwoRjMToLWTTJ77dLtZvc1gyMZs9S343YFJmQHzzLlYGaKwZuE0MQ==
X-Received: by 2002:a05:600c:46d4:b0:431:60ac:9b0c with SMTP id 5b1f17b1804b1-4318415c989mr73914985e9.20.1729871007272;
        Fri, 25 Oct 2024 08:43:27 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm1829092f8f.49.2024.10.25.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:43:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 16:43:24 +0100
Subject: [PATCH 2/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Convert mezzanine riser to dtso
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-2-cdff2f1a5792@linaro.org>
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Convert the navigation / camera mezzanine from its own dts to a dtso. A
small amount of additional includes / address / cell size change needs to
be applied to convert.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb3
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                                  | 3 +++
 ...ation-mezzanine.dts => sdm845-db845c-navigation-mezzanine.dtso} | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7145748afaf53c816e7b3efd8d5f583a2efbb82e..1660c8a95f677847c405bcee42cc5e26d8a98d51 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -211,6 +211,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+
+sdm845-db845c-navigation-mezzanine.dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
similarity index 93%
rename from arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
rename to arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index a21caa6f3fa2594df2f08e48adeeaefd7a33396e..d62a20f018e7a7e1c7e77f0c927c2d9fe7ae8509 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -4,8 +4,10 @@
  */
 
 /dts-v1/;
+/plugin/;
 
-#include "sdm845-db845c.dts"
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
+#include <dt-bindings/gpio/gpio.h>
 
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
@@ -28,6 +30,9 @@ &cci {
 };
 
 &cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	camera@10 {
 		compatible = "ovti,ov8856";
 		reg = <0x10>;

-- 
2.47.0


