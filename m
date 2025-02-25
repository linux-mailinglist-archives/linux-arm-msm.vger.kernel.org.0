Return-Path: <linux-arm-msm+bounces-49336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB170A446E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C248660E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B424207E1F;
	Tue, 25 Feb 2025 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3pmvKzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7F197A7F;
	Tue, 25 Feb 2025 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501580; cv=none; b=T2JOjzQhtMdb2C1+/ICxFJQ9f+WUT1hmxlpw4ZTcJGVPX7OCWQcYYcnjV3GNIDPehTOCo6i09CmV68ghApgTU1+QURXlhZTbx+c4lZtbr7tOccP8JANGMtpnuDkt2+v7FveQTUGvAQ6LwEMxeFbbcrzjqdGe3kO/QE3XjNpwElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501580; c=relaxed/simple;
	bh=xrAEb0z/qkdG9ztjXy+2zCpd7gB4vIYTjNV/wiNhyGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPn2klMh8xcuCKKGKb04YERhRU8RiHh6Ioxq9/qwzaaWsahogjg99yP9r9t/L9/tbGDvX6Soe53f/OuKkUfaz9cDjcjmoK8bnJr7TMfm8eTx94YkLqha1QOpxOfuKWCk1WO05REfbXGuGhQDukQGwwAfdWqDt5w4LJYQ23Vl5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3pmvKzw; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so10375755a12.3;
        Tue, 25 Feb 2025 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501576; x=1741106376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01JPrlnBcJ3WUwQ0/094vAUTVLT4EA/0K17pj4zgOio=;
        b=D3pmvKzwbEM9Ij/Kmk0WQWMjo42PmMDa1qiEowww6tLIDrEUEuCnX8ImIZBwk5QXuE
         1vGlj0YOSpxY7k86Hq9Jg1bOig3v5pCWtLrqOVVVeq5g1098ayA91R+wBSkggxTgdoBK
         B0Vq+VYo2DhrKyhEGVxV57s8i5HAAtBS5UNHqVASjQizeneJ04hadBLqDszUiCy5+cOT
         yi9GpgTjb3MRLbkfKqstn7S9Ge2onFdrxlocZ7mUWQcgDhOXc8ixTMAjVw5owQiXU+RZ
         JztjLTUIvIjXUZWH2u/GR24YuTQWR72+g+Pa8mee2d9ix/+w75FtaF3ocmJ6gzTp63TW
         b7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501576; x=1741106376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01JPrlnBcJ3WUwQ0/094vAUTVLT4EA/0K17pj4zgOio=;
        b=ts7WyiTP43Eg6nCQXhGPW6PqrlkoBdAjf+18T0IPz8IXGEbFIoaF8cqqQapVFcp1RS
         ykU2sD5Ie96WNEhJCktecJzJNPCpJ9M8npsSFSUjOmJ01pb99j6YIXAf4qlkb67tdzI+
         n7FOcYAp2zQWT1DTslM4sr0GdvsN4LyI+PNml+hUo5m3uClJcyPGoo4sbhJQnzM96c2F
         8pGKUSLyh9j1LaUUlr+p4+nyfctpo+GsN/kINYzm7XoSYLXcuqfXx7b3/7ODdDk7vHGF
         9enlQGiaUrYLVGNzBs5i2uoie6wrb1nVEmXCa/MENgPXQUNwdl57vGDMW6wI02NyLl5e
         QtKg==
X-Forwarded-Encrypted: i=1; AJvYcCUrSZrjlpwzQtJOHtndCz9l9VIQqXtzwYiD6LbMW25lRaJD9QZSyKiOpt9MBjoUnymxDONBVSkeemIwYCqM@vger.kernel.org, AJvYcCVOexy2E4LORimdAibfpcyE83KNL4062PepQ0iLCf1wep1hLZ65Qk509TJ2PvDHZVQIQkhF9vxzwsb7@vger.kernel.org, AJvYcCXBJxyatPzol4wLgXJt1lO4EC7E5l0G0sAHFq2puyvnSOMKgseioWQIhj6bhdImqpZIxZWWMQDqAJs/tqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOcZc8z4P3iFaoAtgdNBWrZQsiETxaCIgvpUy6wkRnBHyJTsm
	Mv8lVNgmpkycOnUkOcWlrAks+UXPXFEVZBrkegaPgxkzeFW79zbS
X-Gm-Gg: ASbGncvp15Pw1Diz/FafPLu9BEX6W1lJYVFHdR9GbM41LuttbUppBWugNsku3i1nFPj
	OcfZqdpW/rh+d5Bb7T5sXnKcDr3DQ7o4h244fkCWdPYYGIsFU3B7mrJDo/81ANKm6kuFUoOtmUF
	QtPvz821Zt59xTTgTosd1qLdzJX+YZBgHvIYXBq+DQtKeq/2H1+gd/kL/DLoJRHmjY/UqxqoL1g
	hUvB3xa1Fiv83LdM5z2XK7PsXe7pMcwLo6G0kb8nCzsL3UbU3LsUWU/HXgDrp01AKKw1mNpsxPi
	wp7Bj65EHvVWQq5XL+9JYy7w
X-Google-Smtp-Source: AGHT+IEusbU057iuTbWxdivOFCMG6+GVgf1b7ZRR5oRsq2SXAPdgQohkbfS8uhzsTk+ne4Z5SeUClA==
X-Received: by 2002:a17:907:72d2:b0:a9e:b2da:b4a3 with SMTP id a640c23a62f3a-abc09d36101mr1814672766b.42.1740501576404;
        Tue, 25 Feb 2025 08:39:36 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:36 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:39:03 +0300
Subject: [PATCH v9 12/12] arm64: dts: qcom: sdm845-starqltechn: add modem
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-12-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=2227;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=xrAEb0z/qkdG9ztjXy+2zCpd7gB4vIYTjNV/wiNhyGU=;
 b=qKlsxcJRnwbudjxUFoWxzgXqpaOWnDTnYAIrHEZ1lJJLtpStwIBuj6nZHhKWnMVPfmpBwpjjH
 IEHW2bmC/JPB3qwgnXcCwAlSp0HnmCW9PSa9/ZvQBoqXQuT6DYQLZCy
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
index 1202d8fc6b9d..d686531bf4ea 100644
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
@@ -864,6 +890,19 @@ &wcd9340 {
 	qcom,micbias4-microvolt = <1800000>;
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


