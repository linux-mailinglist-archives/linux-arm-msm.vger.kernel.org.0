Return-Path: <linux-arm-msm+bounces-38940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F59D6BBD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 23:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C60161A3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 22:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA7813D890;
	Sat, 23 Nov 2024 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaXXMMAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD018139D1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732400240; cv=none; b=r4LMT0Pt/u1c4B3NMWsgqttOERNPEGT4jxs9DvOPAL+BFMvWCOyVjnIn4YSUuqtiXb3XRYey88YxwbOTzhtlCzniIkzbb0kojwSn91T0ndly1f5x3mzoXhDRTifxiolIEHsQHIGcoyZ6RqMUGM8ZOTi+tbCmKGf+AMCtUXP+aHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732400240; c=relaxed/simple;
	bh=EOhBBTv2bGi8GWL7TZdAAuY87OKt8WIKXaVrQFXnfPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzuAwCQVLloZDQEDb95kAGY92xEyV03lOLj1z8NX3HXR43zIUVV0cqNK7UD2IYsYPpdYcYZPWCihLtc6MNrmQDPBeZmgZEyav8PJ6l8qU2snl5YiHt6WbcpulVljnNyUnz1WawVHJsAbgpk5FirMuPxA4aGVIQaIZ6H8kY/SwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaXXMMAZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso29980895e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 14:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732400235; x=1733005035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUM5ai4qkzG21WAywzYdq6QZCDAO72307yXlG4t6sAU=;
        b=CaXXMMAZfM2cKy5vubCpyEyfh5vW5B2fDvkg1WOKeW7tdhE1OEDkkr2t0hEWXuCxzp
         GlOUWLYhcPCXcVQCYVtjwgW6NWlidQ4wdPcdmUCCswhHdOarstLKJGvkyKkFGsqafeb1
         DGCA64p35rlQrtUHXiNBMXrpHMAFSstdTLDumprVDvGi9Y5ZHXz39f6h1eFAOkd5VQ6m
         UwZBSl+uB0+qIIGrPdjsfei/tt9EsqM6pMA3xamy8PvxKKNLv1MX8kVtPgZWFfjqR3ZK
         xU52ynkNRCBPlrrTJt73KV/BdzjjBaJ0+r4z34avLi4RKnSb8bl+4GzwIwfT5JUE6RaT
         RlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732400235; x=1733005035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUM5ai4qkzG21WAywzYdq6QZCDAO72307yXlG4t6sAU=;
        b=N+2QMGNDrcE9wFo2Z3a+ntxnvsNLl2duk8s1lBkYWd5cyVCJWxiWHSR++JxNhTmPnU
         tyYk4ieHrTkHi9dKmbKtTx92ANc8guEbJd4c1njmC1Swd6dg+8sSizDdqcYrONwRzkyN
         RHcnTXwZJ8q2R22W1YQyynCKEIbA+q6cOv8TAuo3OSaAiUNBujH4GC1TrIANTTmFqfYv
         2ShcO+zti8kUrfWfVn7f7SZLnbURXgdo7a+qNRov006AmB6H54k4JRO+teJV6Rlxm0Tm
         pO7SnAfYTub3K05NsaC6QOnhowLdrNGRX/L83LaGYsRNrBqNvL1fWTcdaS8tH1CCjC0X
         Kd7Q==
X-Gm-Message-State: AOJu0Yx0a+zKD2H5VkD5+1jADVBvi7TMPsJmBFjlNausEx/cZ5fYaZ8d
	POCjFJkb7Wx+/rM9EC8D9qzMxU05iFs/nj6njAwMzUwd+mp7lxOQmRMfVQ==
X-Gm-Gg: ASbGncvYj4/jD6qr8ILH+kU3lRmDPncy5sZJDd8ASyoQLzkgwSGaN9vAJ/6puVLEwDy
	nY8mz1x3A6tFFpUk9frC1D9rRrESjW0re55bZWHfKx0O1Mv4AiGb9/oQo/5LElWrSQ6xegxlioT
	F5DExjdmDIlSo6hNaO4lz3zWPVNvL91dBacNtEVl7yz6rAgjjuXq1+J0xCOWk05ckBYx1BA62nx
	RSfsioqQiC20bL0k2hVrytnes+xmArtyh0SjhDsclzGLmc6L5GZ7ThgIjfJ1eLZhHq/yttU7T+M
X-Google-Smtp-Source: AGHT+IFIFlKDpPq7QI+moGbVB94otjWQ35ZX0jV0MLhm617xhWFWg2JeBzYsIXOvZbc21nFOKZBwiA==
X-Received: by 2002:a05:600c:a44:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-433ce41100emr57103855e9.1.1732400234840;
        Sat, 23 Nov 2024 14:17:14 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c8c8sm72460605e9.34.2024.11.23.14.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 14:17:13 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 1/1] arm64: dts: qcom: msm8994-angler: Enable power key, volume up/down
Date: Sat, 23 Nov 2024 23:17:08 +0100
Message-ID: <20241123221708.862901-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
# evtest /dev/input/event0 # KEY_POWER
/ # Input driver version is 1.0.1
Input device ID: bus 0x0 vendor 0x0 product 0x0 version 0x0
Input device name: "pm8941_pwrkey"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 116 (KEY_POWER)
Properties:
Testing ... (interrupt to exit)
Event: time 31.770919, type 1 (EV_KEY), code 116 (KEY_POWER), value 1
Event: time 31.770919, -------------- SYN_REPORT ------------
Event: time 32.077229, type 1 (EV_KEY), code 116 (KEY_POWER), value 0
Event: time 32.077229, -------------- SYN_REPORT ------------

# evtest /dev/input/event1 # KEY_VOLUMEDOWN
Input driver version is 1.0.1
/ # Input device ID: bus 0x0 vendor 0x0 product 0x0 version 0x0
Input device name: "pm8941_resin"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 114 (KEY_VOLUMEDOWN)
Properties:
Testing ... (interrupt to exit)
Event: time 44.979203, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 1
Event: time 44.979203, -------------- SYN_REPORT ------------
Event: time 45.222189, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 0
Event: time 45.222189, -------------- SYN_REPORT ------------

# evtest /dev/input/event2 # KEY_VOLUMEUP
Input driver version is 1.0.1
/ # Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x100
Input device name: "gpio-keys"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 115 (KEY_VOLUMEUP)
Key repeat handling:
  Repeat type 20 (EV_REP)
    Repeat code 0 (REP_DELAY)
      Value    250
    Repeat code 1 (REP_PERIOD)
      Value     33
Properties:
Testing ... (interrupt to exit)
Event: time 54.630877, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 1
Event: time 54.630877, -------------- SYN_REPORT ------------
Event: time 54.912013, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 2
Event: time 54.912013, -------------- SYN_REPORT ------------
Event: time 54.931493, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 0
Event: time 54.931493, -------------- SYN_REPORT ------------

# evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	pm8941_pwrkey
/ # /dev/input/event1:	pm8941_resin
/dev/input/event2:	gpio-keys
Select the device event number [0-2]: USAGE:
...

 .../qcom/msm8994-huawei-angler-rev-101.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 29e79ae0849d8..1aca11daf83c0 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -2,12 +2,13 @@
 /*
  * Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2024, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
 
 #include "msm8994.dtsi"
+#include "pm8994.dtsi"
 
 / {
 	model = "Huawei Nexus 6P";
@@ -46,6 +47,24 @@ reserved@6300000 {
 			no-map;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		button-vol-up {
+			label = "volume up";
+			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&pm8994_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
 };
 
 &blsp1_uart2 {
-- 
2.47.0


