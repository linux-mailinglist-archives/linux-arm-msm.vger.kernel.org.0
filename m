Return-Path: <linux-arm-msm+bounces-81941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6CC60515
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 439053A922A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9037A299A90;
	Sat, 15 Nov 2025 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bToiOi1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6692BCF75
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763209631; cv=none; b=sJ3YrM1xS/znMeTtawkWQMdBrbTlNKHOpdl3WQodmWQ0+cCWbxU7ctb6x15LP09Z7+vq4uFvomBUVrSlX7iiXzrpYfXi1CaAoQ5LNRl6pEm0xNBmFFv/H9aMSzVEKkjgM7JAhyOCz3tQL+vt5bKVcOZTniKfsEDpihsTXPMJ8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763209631; c=relaxed/simple;
	bh=hMxhQgfaXcjxbygFGVQ0UQRlniXEiIqQUMTF9Y5i0W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwvsXofwAXn5/Yxv7xjtQgatUr7zI8tJbHshC+xWZ70idEQE/WrIQVN5u1ZjXzTzzhoUo4eob07ZY6WZjY9Us8dwf5H1T76kS34dCJcuBBDDHOzwhZgBV7bFJK/8g+mr0ng1q/Ma7WHYqdsnLB/b0k7EtIK4Rx5GV5VAUlC0t38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bToiOi1m; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so5170522a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 04:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763209627; x=1763814427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKab9SNvJsCXNznHlhOt6I7to9eB9V57yTnbxT4ngYQ=;
        b=bToiOi1mzbLzaQ591Ik8VPd0geTcBZefygtNBbOcouJeMyT7aOWkDt+uk1DX7ODsnV
         el4IViU8rjth/Q3/L/ZD72tBec0IAXY/KbA6gem1uiIBjj2S/9xv7V0zoaeO5lkeYnb5
         n766w9W4pR9xuAnp0+3Y5menJQuUpCItN98h4BQNHnG2PDUokw6nV1aZQ0yJjqpqRkrC
         NfKOI9FIsZ9S47q0FIm1vQo/EZQmHaXc6lwZ9mSPJbdfbpuveLXVM4nf/tCae2eHLlL3
         jO/xu1phMkqTeG0L9bNPtpFB/F72CUexbBa81pZtTG8DMdUM+b8tBYIzC0AzBEKRO8zW
         LWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763209627; x=1763814427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yKab9SNvJsCXNznHlhOt6I7to9eB9V57yTnbxT4ngYQ=;
        b=o/ZY12KqVKrcWlcHGJNduvGW4DcMaaDmoxkWxN+JB7QbejSmGveb7fwGSRekZqb/3X
         h7KUVND+JkKqFRpdCw+RS651aCgX8cpTM74QXhwoK6OiazZ9G6NJDOwJb/MJU4aHpAfB
         EM3Q0SLaAZ/LpiBE+33/qyTsnLME8H3S7slrJ1aKk1H61DzRNV19l0kzz3nTWZCDClBF
         cPIFh8U2WWp8/CWMdKlFCj+AsnwQzQ9IMvxgiPwx5oH2LXXFFOftEEQxm2fUbNrcMMF5
         o8YBsOpevg2J499SD7DAJEnUZ1fcDnHzn27cFm8OrnQQ64rIyXGmpv2LXagPEFhD8q5Y
         RTdQ==
X-Gm-Message-State: AOJu0YwUHuagE5UQs+USAWZDOPyjKVuadzANnvbaKGcS0+EdeCS/utbu
	DWS6/gjcXwX8Vngcuk3+Sj92TmidkJVyIcyEvBttUjzorO0fi2WL68XU
X-Gm-Gg: ASbGncvS1jvekL7swRvymfjAGOcy4iZnrSqXa05vXmyiM8DBncfilNymV6bPzIxSyvt
	iBgNZny6hUq8/o8C6K2tqY6vAw9FuVsDPGLPxXAw9fkNy9ZAJQqiS827lWbUTeiwevuMadImdpn
	ErHFVw2I4Ml7n+LX21XPFnhbNFIG9oP+656/c9iSlqeMSbFCnhkdJENojI6BeUiCcW5ko6MeRG9
	h01qg2c5E1w6jCbyjNusu1OBK8et1fTmuReECFoZAoyMOzj9sbfwtrMDHaeXz7N7VqDTeKHnOGb
	jSIckZ90Jb4mOq2P1Qs2Cd0crsFSxBy0PUYKa94ONl+NXaeTGEjAAbycP1abZV/EbkNwK9RXmuj
	ahj4dD3HgbYiDHWHjJRoyfjMdC5+vcw5aTppuQPNRAPbcXVzkIfSTUTvQcUP6aUD14neJO6NKPr
	w2Oc2A
X-Google-Smtp-Source: AGHT+IF2JwrT6FT2lVffcIHfGBSD7PWBcT95KtlFq0fWWx6rIvLpDEfQFdBcc0J++dKsEsB4yS6iyg==
X-Received: by 2002:a05:6402:5193:b0:641:8137:e1c8 with SMTP id 4fb4d7f45d1cf-64350eb8cd8mr6145912a12.34.1763209626880;
        Sat, 15 Nov 2025 04:27:06 -0800 (PST)
Received: from [192.168.0.188] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm5627042a12.29.2025.11.15.04.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:27:06 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 15 Nov 2025 14:26:44 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-battery-hall-v1-2-1586283d17c7@gmail.com>
References: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
In-Reply-To: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
sensor for which a generic "gpio-keys" device tree node configuration
suffices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index b58f0a04abfd..60a714a62a2c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -62,6 +62,15 @@ button-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <15>;
 		};
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			debounce-interval = <150>;
+		};
 	};
 
 	reg_sd_vmmc: regulator-sdcard-vmmc {
@@ -259,7 +268,7 @@ sd_vmmc_en_default: sd-vmmc-en-default-state {
 	};
 
 	gpio_keys_default: gpio-keys-default-state {
-		pins = "gpio107", "gpio117";
+		pins = "gpio107", "gpio108", "gpio117";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;

-- 
2.51.2


