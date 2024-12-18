Return-Path: <linux-arm-msm+bounces-42696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455F9F6DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 20:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B83188E17A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 19:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38231FAC4B;
	Wed, 18 Dec 2024 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hoDGxgS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16931F8EEE;
	Wed, 18 Dec 2024 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548514; cv=none; b=J9lFBr9EoWEv3tgTjJACfc7ZjjBEe2AenQC6J1712D7vYzrgnabIVnCqy/vhcaCoQBUaOJ+yUxvINykZKLjuNUg2Tr7CUIGswu1IFLnYcd6IfpvrAlc17VF0cZ9AIjTPhZVaqp3AWetTDsgF2Y8tHSYW8tWwYQLP0V09RQIcqb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548514; c=relaxed/simple;
	bh=eqfeASFhUpfV6LJCNVe88Y/qOaT1wJ0PwLzqjeC+g8o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=PWGeNtpdY5LLHnQ6hFzBs9rl6WcCn9pKTho/5ZKSN1nWJ+ZkaeQzrSq8ZN/s8B7AzpSl9e2YioQrrbGPyHcVCva9st80VVNAzQFb+F2E0Lk6/idaH2Xm6HlWXvhE4LcG8XmEqH3E7VpjNshi4ZymIKAtPeBMC3kuMxAY8hYaUZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hoDGxgS6; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YD3235JV2z9shx;
	Wed, 18 Dec 2024 20:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1734548507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LTcNGk1w2WB5Azcc27MUrKhFphxPF4G81cc1U6zKsKw=;
	b=hoDGxgS6A8VX0d4lKUmJyXihbjoEbWvIBtG/ZhQjBbl7ja5krhg44mlHRXWlA3ZohXH0Oo
	t/4XZBqMDttQfhi0NtdhjusPjoLSGNT7TqxeSjwJjRyJGkEt6kHeAxQfyggRNDfpKwZvit
	3zAY/ccQF9cP12rYdxUi4pSX3fUJb7iweuob6NyvOAUn9qt5yFchdnDr8L6JZlxFJmLbCQ
	MfOjR+WrP+dZU72hGCZNtfM8y/UqH0iGdLhJoFt5ENuoqrRRNkXPXpNk9g0lg6yIoxDwWr
	hp1VZqqCM51p8PZiPj9m8e5KCT9R5nCvBL0lLRCmyfxAF2IWfv5bfj9GCqZ+9g==
Message-ID: <cae52ea6-e86a-4b86-af06-01a8a93d2ca0@mailbox.org>
Date: Wed, 18 Dec 2024 20:01:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
From: Anthony Ruhier <aruhier@mailbox.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2b2e86f23680d91bc8f
X-MBO-RS-META: 7n3biwnb9upnrmscq5ggy9mukeppphba

Add the lid switch for the Lenovo Yoga Slim 7x.

Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
Slim 7x this pin seems to be bridged with the pin 71. By default, the
pin 71 is set as output-high, which blocks any event on pin 92.

This patch sets the pin 71 as output-disable and sets the LID switch on
pin 92. This is aligned with how they're configured on Windows:
     GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA | 
ctl=0x000001c3 io=0x00000003
     GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA | 
ctl=0x00000000 io=0x00000001

Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---
  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 +++++++++++++++++++
  1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ca5a808f2c7d..311202aa9015 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -6,6 +6,7 @@
  /dts-v1/;

  #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

  #include "x1e80100.dtsi"
@@ -19,6 +20,21 @@ aliases {
  		serial0 = &uart21;
  	};

+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
  	chosen {
  		stdout-path = "serial0:115200n8";
  	};
@@ -811,6 +827,28 @@ edp_reg_en: edp-reg-en-state {
  		bias-disable;
  	};

+	hall_int_n_default: hall-int-n-state {
+		lid-n-pins {
+			pins = "gpio92";
+			function = "gpio";
+			bias-disable;
+		};
+
+		/*
+		 * Pins 71 and 92 seem to be bridged together (pin 71 and 92 show the 
same
+		 * events). By default, pin 71 is set as output-high, which blocks any
+		 * event on pin 92. Output-disable on pin 71 is necessary to get 
events on
+		 * pin 92.
+		 * The purpose of pin 71 is not yet known; lid-pull is a supposition.
+		 */
+		lid-pull-n-pins {
+			pins = "gpio71";
+			function = "gpio";
+			bias-pull-up;
+			output-disable;
+		};
+	};
+
  	kybd_default: kybd-default-state {
  		pins = "gpio67";
  		function = "gpio";
--
2.47.1

