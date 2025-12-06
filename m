Return-Path: <linux-arm-msm+bounces-84549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A744ACA9FF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EBDC300DBA6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6211F23816C;
	Sat,  6 Dec 2025 03:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvr3tZmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB51E9B1A
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 03:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993299; cv=none; b=MEv0BystIJZpI/PzaMyjZ2QT8etfdQRgpI5iMezcl0pI+AUYKBSvi26jSj8sOoDwtIkQaeOED7DhbKm697KDjb7fClvH8Upp97dy5o5o1no72Sp8jKJXQKeXhoet+sDKBBj9HIT67EuhVfALI8Yzi/puxDE/7gaZKW2n5hLYI58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993299; c=relaxed/simple;
	bh=J8uprbH8ZrtQtllNe0ANd6MXhGs3gViM8cbLJX7l2CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thA/a4sIGS2TKd0UgGw3ZbOMM2qz7dffMZKf0mpv/8gmpK/kyRcQ8Ktm9IMv4n+XDCg6oIKJGnSib4xrMr1cI3sb49gKOeWOa0VgOkNX74eSrhVck2R0UQE88dCj9D83A1NcFkPCXRK2jK+LdVFccyH8v9+a1WS6jxkk+oPrKgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvr3tZmN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29ba9249e9dso38993745ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 19:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764993297; x=1765598097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ng59e0pypFuKOiBmMzueIT3kCDd4YPpY7yGIqW1d8Wo=;
        b=Fvr3tZmNcY75sCVDGmJt1MQGqjGZyverZQS+na2pljj4YMs7T+Vek+cn39H25HF8FG
         XkL6+A/yKS+r77vZLwdBT+FQ7S9FznrjJH8cAOwpxaSeR7Mv/I9i7cRXNA0u4k8IiCc2
         2NNELkAELaX3SseLC4bIoaMiiNbY6HfN1yxJwbBlkh0j4wmCKwfOa1mDiEIY9QRECOKA
         XMpyoB4Degxv8c6CuR7QcYgyWiDeTUZ3+ByyAyn7YaMHAWC7uxTnM5ELM6BjzfU5P8HR
         CK2ZtaFkHd2QjH/uFVzroHuhEQHgrG1XCalI2kRbi8EZMaM1uCF2gE7rWZOs+krKfEQN
         Ozpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993297; x=1765598097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ng59e0pypFuKOiBmMzueIT3kCDd4YPpY7yGIqW1d8Wo=;
        b=l9TlL//vLiUCl73y6EJfQ2jhjiZoHDoWpmspp1flvXtOw3VfvDePkIC89hnewR8lGz
         FF4dPpCHdNzhhujbWEz+wrNrkoeIzz6m5X1oqUfDYsSaY1DXjZuy+/fN1hqGEMlUV6GG
         cdqOfGOYtboOZtFlxmlpjrUtFWoT+mfL2JMobykAUH93CFeGj2j+xKAeiSyO1Cyhrh6K
         n0QCRKdOlLX8A5Y3oIbZggxWQT/uhMe9bzdW9Xdfn4Hdwsrmn9VZUeBWtxsFPKbMkQN0
         2c2GNBGqx5h6iwZ5Q6HDA/+iQgwWbJd/Tga3OJbzmmjD9JZt/n9PD671VYWvtU8KEDq5
         CO1A==
X-Forwarded-Encrypted: i=1; AJvYcCWfIiBw+FpCZboA6NFOD6gC7xm0wCQCpzeNJZQ0EhucwGabv+SI2bClk+DlFnEoSJ+OK2DXjKpToDn6Rlmm@vger.kernel.org
X-Gm-Message-State: AOJu0YwXKcTFQ8B55Do3Lail8uKHqRSBFnadPC7gjyq+jcgszc0czgN+
	Vi3nHoaHkw4nGFohviNZZ3j1TGIh6FCy2Stuu4wjT6gNmmLOrSoURNgP
X-Gm-Gg: ASbGncsuiO9ktJ7d/NG40+bzLMMZ5weRh4etCUSApUdOOd5FmzFVMPthbPZGcBaRj6a
	BK09JTPE8iukKHh6bXqJNiouDu38oS/CzagM+1lqTVfJAGC0A9hSsf1V5EYLTwmq3G34DJjEuzK
	SRcOUCHnsKxgC5vGl6AUT4GHEhdYG12IEyE0l8W+j6d5x7JQJdVp2voXfLAA9xgeDryUKX5CqMC
	CfKX3UdQqdqf6rJ/qkLiNFcEDfx17mpeMvIJlEj/Gp7dejoObZMNOmxO3ilrRbdXtXTWwzdZ4wv
	AVYaUq9uq9eHSquvTqw5pY2s6OEPzZN0qLnNxdQWeC9L2vieqoqi53Pm3MCmGOYhcypUfcbl9wk
	ar6RTq46rY+Y0sunEGpZFIk9AoQ/8Pg02V0PcUr0NmDLf5rokIU1aGDAtUSQf1WG6sNpApB2qLp
	skV5gZi6awvcjfaQ1dzFHR2GyHiRSjyiTqdzsBnTpabC9Z1n+dvjhl+1p3BL1wAKS7Zg==
X-Google-Smtp-Source: AGHT+IFG/hzUjar5fFu8j9ERHWWpR9Pv5VwyPV0sXgp2FH3uasyw4TvbU/VvQYbRn3w2rYfGGhYing==
X-Received: by 2002:a05:7022:a93:b0:119:e569:f277 with SMTP id a92af1059eb24-11e032b330emr1036342c88.32.1764993296945;
        Fri, 05 Dec 2025 19:54:56 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm24165193c88.6.2025.12.05.19.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 19:54:56 -0800 (PST)
Message-ID: <7c54fd46-d17a-4ee8-ad9f-e98546958dd5@gmail.com>
Date: Fri, 5 Dec 2025 19:54:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <arocrbzcwvyb2te3gcujeo7jaiaisgh3wuketqkif7xvkvmbct@r26gqpw6gb43>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <arocrbzcwvyb2te3gcujeo7jaiaisgh3wuketqkif7xvkvmbct@r26gqpw6gb43>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> +		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> I don't have docs at hand, but it looks like these pins belong to
> GSBI10. Have you tried using it directly?

This is the log when I use GSBI10:

samsung-expressatt:~$ dmesg | grep tm2
[   79.555802] input: tm2-touchkey as 
/devices/platform/soc/1a200000.gsbi/1a280000.i2c/i2c-4/4-0020/input/input3
[  110.242881] leds tm2-touchkey: Setting an LED's brightness failed (-110)
[  167.074920] tm2-touchkey 4-0020: failed to read i2c data: -110
[  182.435009] tm2-touchkey 4-0020: failed to read i2c data: -110

I could be doing something wrong, so here are the changes I made on top 
of this diff

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts 
b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index c4b98af6955d..fde5f739a314 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -60,33 +60,6 @@ touchkey_enable: touchkey-enable {
          enable-active-high;
          regulator-boot-on;
      };
-
-    i2c-gpio-touchkey {
-        compatible = "i2c-gpio";
-        #address-cells = <1>;
-        #size-cells = <0>;
-        sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-        scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&touchkey_i2c_pins>;
-        status = "okay";
-        i2c-gpio,delay-us = <2>;
-
-        touchkey@20 {
-            compatible = "coreriver,tc360-touchkey";
-            reg = <0x20>;
-
-            interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
-            pinctrl-names = "default";
-            pinctrl-0 = <&touchkey_irq_pin>;
-
-            vddio-supply = <&touchkey_enable>;
-            vdd-supply = <&pm8921_l29>;
-            vcc-supply = <&pm8921_l29>;
-
-            linux,keycodes = <KEY_MENU KEY_BACK>;
-        };
-    };
  };

  &gsbi2 {
@@ -572,3 +545,28 @@ magnetometer@2e {
          /* TODO: Figure out Mount Matrix */
      };
  };
+
+&gsbi10 {
+    qcom,mode = <GSBI_PROT_I2C>;
+
+    status = "okay";
+};
+
+&gsbi10_i2c {
+    status = "okay";
+
+    touchkey@20 {
+        compatible = "coreriver,tc360-touchkey";
+        reg = <0x20>;
+
+        interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&touchkey_irq_pin>;
+
+        vddio-supply = <&touchkey_enable>;
+        vdd-supply = <&pm8921_l29>;
+        vcc-supply = <&pm8921_l29>;
+
+        linux,keycodes = <KEY_MENU KEY_BACK>;
+    };
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi 
b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..c598fb324e7d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -223,7 +223,7 @@ i2c8-pins {

              i2c10_default_state: i2c10-default-state {
                  i2c10-pins {
-                    pins = "gpio73", "gpio74";
+                    pins = "gpio71", "gpio72";
                      function = "gsbi10";
                      drive-strength = <8>;
                      bias-disable;
@@ -232,7 +232,7 @@ i2c10-pins {

              i2c10_sleep_state: i2c10-sleep-state {
                  i2c10-pins {
-                    pins = "gpio73", "gpio74";
+                    pins = "gpio71", "gpio72";
                      function = "gpio";
                      drive-strength = <2>;
                      bias-bus-hold;
diff --git a/arch/arm/configs/qcom_defconfig 
b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..49baa91937ca 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -321,3 +321,4 @@ CONFIG_MAGIC_SYSRQ=y
  CONFIG_DEBUG_FS=y
  # CONFIG_SLUB_DEBUG is not set
  # CONFIG_SCHED_DEBUG is not set
+CONFIG_KEYBOARD_TM2_TOUCHKEY=m
\ No newline at end of file


