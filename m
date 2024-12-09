Return-Path: <linux-arm-msm+bounces-41059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 748709E9382
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87AE1886824
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFBE22E419;
	Mon,  9 Dec 2024 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIG7MBwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A658D22B8D4;
	Mon,  9 Dec 2024 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746199; cv=none; b=Q++PO4eFt0SvZqbRL3xci+iJjYJYNtxWQYLuV+p9+n2tN5VqAPOYKg27DaFyGbPs7/JTOdtUp7Wv/M1OSXo5mMAkis7qgIUr83fPo7SGJK+6vPWAWAsm78QvVKJ/dAhGkUipdScrvhXktPYZCy/V59qfPCTf90cwJ85kGSzUo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746199; c=relaxed/simple;
	bh=ZjJj7jdZ9xsYB3boPqxYaoqch47tPC3g35dATAfAPZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtGIWEz+9Oyey992XtQvewojYHA90qYZMJUJjG9cgwW7xsukTr0PIwguz5lR9nHEkDpDtOPPfI19peDUF1pXEmDUA8bgtl/ivw9r1hoq266ticTmLqVW4hh5t5UdX2Yd01fqXSZWvvbKOA1gJg+KQQ7pEu51kXUoAPDB9Nt5WgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIG7MBwS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434aa222d96so46551855e9.0;
        Mon, 09 Dec 2024 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746196; x=1734350996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxtIc8zpHQVSLKJgH3nmYP7x2JqOOyKitx+8aCZ1kjA=;
        b=XIG7MBwSqMfh/kRzs8gj89Di7L1xt6hViJARrJKds000m55F5mcSaYTj+sQeTkJE74
         kMnHGtxuKVB7Cyen3A3BhC4nsDRJrit7kbTd8CxgZqfV7rVUdyCW59ak7sIKUJkKgAOW
         aZPgbRwJ/j6BORTxwAnVy9Q+xz+fGVN7AXLJ8Kt6MNXASxuh2JswMwL0dk8MHWTmvt32
         WB1WPD+LH1rhgdl13QaIbxGMd2HMv5V7vGn0WcnFr4+s77GeVbHFTPVgv0PbTtkg5rYW
         S9nacG8ihAXpCc016O8+X5GP8cbqMxHAvMFY5XYXgGB33nE8KiQJbj8MAzP/aJiIkT6O
         fwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746196; x=1734350996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxtIc8zpHQVSLKJgH3nmYP7x2JqOOyKitx+8aCZ1kjA=;
        b=kyF9LkgAi1nLqve/6gThmYB5XG46U0JbUlYzSqh1v6YeL9Rf2PX+YGmdziqrqumHJq
         iw/nYbQ6edMNjczYlR++zPdf66beczizuKMfX9lHcW9uxias0IuboDA4HP994Z1wOlq2
         o3Stn9KJKvkxVlIAB40EZ+LqN9mbXkx1Nh1oDDWY+/HitIRjlfDb6G0C/rqcxOgpyJVn
         vCjk8RNsejj+R3sVsw9WoQaeQDOVBywzX9RvBMPbA0APpOb7/n8TxZzsWeIlMU1QBh7h
         VQij3m8j3gLckxAdNuRi59bQeWT9pK6R4MmfFW3vznIef83P5AYDArf7jj7oGx4dPDYF
         /ezw==
X-Forwarded-Encrypted: i=1; AJvYcCVYGhg6fv8PajdbPwAGtHF9jgQyhjQK8qNW/3oQEgkjJEOiapg0TBIaKt6OJDADwZ5QCfHLgZ1r/XJMxNAM@vger.kernel.org, AJvYcCWDY2LXvpqlv1HZ/W4TJOh5XwMS9nFLYeLc7ExO4wbGOwuzoWOl/GxZkjSW+5pzKnQjjX2XgWuGi/5zX8g=@vger.kernel.org, AJvYcCX+QdIC4Cim5Ope61ysZUFdkVoXHf+IeJBWYGDMe/AlgcEKnHxno04N9SsaXPRWiWED0ZNvri/2xTkd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqNvHlmDDWXQYpEQj91bgChY3l/qAaiwTXCDnbhPO/7j+nVcM
	TM3KyLs2B99i5yhKCVyt70p1jnK7wpu8SQ4B8K202Hf86Ih2p3HC
X-Gm-Gg: ASbGncviZGCdVMTFPIg8El/kQVeVtK49bDe+y602UnSbrz2JH5YbusHiUD3+/UOs+FS
	7xdY/sQO27KpWBL9S/Kmr5PszNqMxvBC8eGAqmYgQE1e65b5gMw9jmW/7Dv+DQr0SjImlWeq2H0
	scgsEbck25ywblGREv/RYyyl/hl4MN92WXfNLFfFPXZp3CIhr6+JXLZtKs/wyTGU1QXLxWsr2vL
	7+iQcIhanj6RrJTFxcE4RlHlb4lqSGwcEeOMORIqDBPsU9u
X-Google-Smtp-Source: AGHT+IEsIeX/C7P14AsCS9a4ebjG0rhnbGmPWRK+QJ1UfF3XV/goprpR9W9TfpYIysldiMwDJA/KxQ==
X-Received: by 2002:a05:600c:1909:b0:434:f871:1b9e with SMTP id 5b1f17b1804b1-434fff54c84mr2387835e9.19.1733746195847;
        Mon, 09 Dec 2024 04:09:55 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:55 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:18 +0300
Subject: [PATCH v8 14/14] arm64: dts: qcom: sdm845-starqltechn: add modem
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-14-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=2190;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=ZjJj7jdZ9xsYB3boPqxYaoqch47tPC3g35dATAfAPZw=;
 b=hLEXZL4A5Qguvh9tEnGlnKRyGQ8oKlJX4fhqIDSRJ7I/R2pHVyq6lROD3RWkbBAMF3Oluvbd3
 adc6Uu77HpeAvr5sMUiydxYPqO+pPEEeUllco1vSaOIbLOKNr8Nduab
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for modem and ipa(IP Accelerator).
Add spss reserved memory node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index e709b2062152..0d80599e893d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -19,6 +19,8 @@
 #include "pm8998.dtsi"
 #include "sdm845-wcd9340.dtsi"
 
+/delete-node/ &rmtfs_mem;
+/delete-node/ &spss_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &slpi_mem;
 
@@ -106,15 +108,39 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			reg = <0 0x88f00000 0 0x1c00000>;
+			no-map;
+		};
+
 		slpi_mem: slpi@96700000 {
 			reg = <0 0x96700000 0 0xf00000>;
 			no-map;
 		};
 
+		spss_mem: spss@97700000 {
+			reg = <0 0x97700000 0 0x100000>;
+			no-map;
+		};
+
 		adsp_mem: memory@97800000 {
 			reg = <0 0x97800000 0 0x2000000>;
 			no-map;
 		};
+
+		rmtfs_mem: rmtfs-mem@fde00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde00000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
 	};
 
 	i2c21 {
@@ -859,6 +885,19 @@ dai@5 {
 	};
 };
 
+&mss_pil {
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
+			"qcom/sdm845/starqltechn/modem.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.5


