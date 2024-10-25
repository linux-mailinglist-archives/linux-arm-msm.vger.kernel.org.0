Return-Path: <linux-arm-msm+bounces-35920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2A9B08C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306D3281698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915F1165F04;
	Fri, 25 Oct 2024 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJ6hCipT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0701632F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871020; cv=none; b=mVsMvr13sw4pZ2f5BiZimFeCq2kQfC3Tup65xoxpuKUwtHjUjGqt/tblJOlmY210Swg4Xt+378Sec3EdkC51riPGI2dSuvfmXqpSVZ6t88PVNLo9T9ZXFGyCdN7IGcHy/NmKI4/cp2PGHfI+hYMPR2E8G65rqYs+dphpuwpgw0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871020; c=relaxed/simple;
	bh=kmTctavQgDHV1WQJ665/sMMhzSlzxhDHLk7W3MfKgRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS1ZvZLLUXzwrEKUul1okL4slwipmRsr+4MPnXEG5/YD2fYe+QG2ML+PxeA/fw4IS3dRQJHHFtcUJxJL2iq2utfGfZan2GFkdNiCkVB5bTmVRywNcXkMKffaWkHmDa9qqCyGl47Lc1Dm9h5lBCkIEx6lUATSKSImqyqXisFuRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJ6hCipT; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3661008e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729871016; x=1730475816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A19SWF8cZ8jpezoswd9dTv1UcUhXtoHX2w/uo6Xt0MU=;
        b=tJ6hCipTXS3UYTzEy/JPxG3mwKZYjgy/T6HSlWoDKNnrfpmg+VbIn9mNuHERxit2Fi
         1sAMVbiP9KxIP1sbKluQFMEPL/8t758hd/dFXNQWpqWh/Y4+Uv9T/XBhnKoAvTe8D+X+
         bVqIR3rpzGMhgvgDYZbU/NquLBnCIFWJKC2mQJCmZxKrdTGYlXGarAnAPthqD4Urenhv
         yCnrQIRrOF6M25/VB0xgtHR09zYt3GUuVL6NChnYd8s0GWGtcF0I01pXfG23zczUmTUd
         Jxcl/GzVlKwgDmbqJhtPnYLhbSLyixr4txDRGVwW3HvpvkdOo6bObZx0xx+aZQ7i6rBm
         HujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871016; x=1730475816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A19SWF8cZ8jpezoswd9dTv1UcUhXtoHX2w/uo6Xt0MU=;
        b=s4Ex3Bh6jlCcHy6XMMxLV2YttJZfOPXSCsQHgH23YqBRU2rutDldicCbB0mbKLzH6z
         P7boHSNs8J9SuHuGJmjtWrz3h05CiCpFPJsg96N526upqZoCO6Pka42lJARvPHgdhkAO
         CwI2R6CpR3lejm9D5YtXX0LBJghSRWq/3P467MYuDMocnVlVuB+9P5LtOGEf+3DUUqAB
         3xjlcGzrytHR/JyNy844XN0ky9R08X7aXQS8MQP71TE0Hk+LXY9AtMvJN51b4Ncjlrio
         RvZr96kTfQzllMGv34OXtKlJCXzGlr4mjxJCkDkKzfxpSePfMg46NU2qo23qIO4QseK1
         Fjog==
X-Forwarded-Encrypted: i=1; AJvYcCUbnnkgqBHKdmTHWl49ghscnmQn3RJWLZxr9sN6tdivC7i9orzBRZAnMLj9tV+sJJrRmgjb/KHeafY3Boh6@vger.kernel.org
X-Gm-Message-State: AOJu0YynEXtUfk5RgT5cuWmYjwwpEPds3RaY0gi4/rWANX2E3oTG2gAW
	A2h5MZ2hOPvm1mvic0orduOdF4/fJRqtFHRDa5uyiuwT81VXnJSqSaPUtfvXhPkEzf523AOTzSs
	EXHI=
X-Google-Smtp-Source: AGHT+IFGpuLALqSBvTN7KF7uWbZnKi/jAWWq0+CWqgqXUTcp0W/Q5TxtDHUSrdJ35giIWhVXIl26Rw==
X-Received: by 2002:a05:6000:1e4f:b0:37c:cfdc:19ba with SMTP id ffacd0b85a97d-37efcf18afbmr8143373f8f.28.1729871006327;
        Fri, 25 Oct 2024 08:43:26 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm1829092f8f.49.2024.10.25.08.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:43:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 16:43:23 +0100
Subject: [PATCH 1/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Convert mezzanine riser to dtbo
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-1-cdff2f1a5792@linaro.org>
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

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                                  | 3 +++
 ...-rb5-vision-mezzanine.dts => qrb5165-rb5-vision-mezzanine.dtso} | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ac199f809b0d4e514878518604a23b4f1ab8ef79..7145748afaf53c816e7b3efd8d5f583a2efbb82e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -116,6 +116,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
+
+qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanine.dtbo
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
similarity index 88%
rename from arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
rename to arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
index edc0e42ee01735eda96b2c5c68be247ea37cd534..0603954e24d88fa203679279f01705eea15ce6c3 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
@@ -4,8 +4,10 @@
  */
 
 /dts-v1/;
+/plugin/;
 
-#include "qrb5165-rb5.dts"
+#include <dt-bindings/clock/qcom,camcc-sm8250.h>
+#include <dt-bindings/gpio/gpio.h>
 
 &camcc {
 	status = "okay";
@@ -33,6 +35,9 @@ &cci1 {
 };
 
 &cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	camera@1a {
 		compatible = "sony,imx577";
 		reg = <0x1a>;

-- 
2.47.0


