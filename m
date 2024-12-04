Return-Path: <linux-arm-msm+bounces-40389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D109E46E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746CE16155A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A6E207E05;
	Wed,  4 Dec 2024 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLYbAuyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88C20767C;
	Wed,  4 Dec 2024 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348128; cv=none; b=XRE3N5zDuuLSCr91xRy7+1MeuMhGjufES7gzF7KZ5fy+rEdYqqybms/jFy7wqJ/We9GllHHC8qoJjYGOmGVtpByIVFKx6aimFK+8dxXK+pGOPklDbUQhaSc36FGa27lctBLh3hbsHPngF4OFF2L7rymfBQlN5YbkZsC5bEA6F8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348128; c=relaxed/simple;
	bh=2tHzmSguC9B88sWflOmx2hAs+IwmerQrL2ci2kCVlbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAphVaTBQpppsvm2B7sTbh6RHsPtu76ErdhxVc5ztLeGog74FYn5KQyKwic+XcLI7Hkxw4XF8S+3p3CwXPKwiTbFZBNkgbhcyZHIpQsObf4FY+sboA4RClx3pnfp17/aXcZ+Azn3B07HpANp5xvlfE2jHx3fgBOHXQ649YnzOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLYbAuyo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so28659466b.1;
        Wed, 04 Dec 2024 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348124; x=1733952924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxgQfg2BOAQCHKqqupwnI8lgxyjM2FrMmQmc5aOhDZM=;
        b=JLYbAuyow1f7o3FHUSQOGFpNEf6OSSVmfHiSylJf6d5mQd+5SnDa4e8q6+cUP8xTrj
         9d9crOgTRG6r9JIXtPwiIL67HVQoQxaW2u235MAQqQiJAMuh1qZUIMyiFNW3NFZv4gB6
         tRVmYaaA1ta+N/Vf0rIAVf9DwsQRJuEJ3T7qg9clkldiBbkncB1ljVXYRMvlo/u2FLCZ
         LIbEd37STlFzx9t/+Nr5w2D3BLvHAc30gOayRtVTrm8YiYcu1duhuTVFMbiJA3qNy8y9
         VgqIUDXgtHV77H+IcC6h5B9QJI+eIJgMNB74SMblLEF03XnH4QeEYqqORWBcYZ1PQYG7
         MDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348124; x=1733952924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxgQfg2BOAQCHKqqupwnI8lgxyjM2FrMmQmc5aOhDZM=;
        b=UpeoDDKfOGW+d5oNRz7YQcftNkuMasV1cMDIIWbgXaiiXutKn/8hfldpLEwCs0gWWv
         4DEqwgOfUKcUFOJa6ciJswK3MsGDXR9l3DvtXfWqL9ATj5POmSxOuzzsRRz6E0sFgowv
         JMh0pawQmhN7RlPa+DjQ4nUyDoNSebWscx0nZmRFiEcqdmAHSCD/PaXxD9ENjdcqtFY1
         OSZd+PQYMiJHxNb+24RrsMLmrM8AWHD0NfDA79/prmXh9+5Suz/9fcLW30l9xbpAkcwf
         B/7I/JM2vKoSglLo0wJvxHxUNtwNekHXbDYhBtEA3L9LvH/r0ONjPyot2Irh3oAG4Cuy
         Nohw==
X-Forwarded-Encrypted: i=1; AJvYcCUOaYLIJcFHnUygNbKmeFGZkVy0YARH9C5Fe1/hywZpyKgPcip25U8snCyfDmd2wnWMG4TJCgY/Tf9VqfXl@vger.kernel.org, AJvYcCUR0MLJdQgJqB30jTX3w2adncajcb0WBXADfJKOkd0vzvLl03vhZe9y4egVrOSDAUKpiMwvP9M5UF2B@vger.kernel.org, AJvYcCUxa7gONAdkeKJyT835LEPoP0i/qVzUP0uS32/NQMv5tCwmPt2Ks3lr5Puc9IE6fLEM/h/CmmoLo/IXnLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZwDPfL+xTsU8CVmG7c7j5i8jEhqksatQ/eFH/2ctXIMgI4/l
	te4EJnYIJrds/ZXSrEa4ApXIkoCgmiegINzWEc/0Si9l2uiWZYoLL+sfsA==
X-Gm-Gg: ASbGnctEWsXn5H9CT3e1t1uC99iab/bXW3meVnIeogAN+JmGbUVXpjug/eDJfsU9/mb
	eRx/4D6Fd/o5jV/85vqNSJrUhviwBTR/Zku9g+pKIKp6ZaEbwwQ254jDBjag4IBT3quatIS0YfW
	wpraYjjgVlMJLE4IxlArrmEPnpGEBA48WyOmYmQBgrlrHAj9PjsInUngVrezBTi6GpIfFSPXqLZ
	kAfQntc/nKcdef8l1hVqnTtdJRN6yrmKi1ay36eGRmcEKXg
X-Google-Smtp-Source: AGHT+IH6mG9xi/70k6iJ4wp2PEjv/SLud4unNTG9xLbEgrvPdO0recQ1Sim7i3L2L47S1NWkk+2mYw==
X-Received: by 2002:a05:6402:26d6:b0:5d0:8225:aa19 with SMTP id 4fb4d7f45d1cf-5d10cb4e6f4mr11331230a12.2.1733348124368;
        Wed, 04 Dec 2024 13:35:24 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:24 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:35:01 +0300
Subject: [PATCH v7 14/14] arm64: dts: qcom: sdm845-starqltechn: add modem
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-14-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=2190;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=2tHzmSguC9B88sWflOmx2hAs+IwmerQrL2ci2kCVlbc=;
 b=q2wZX3JTiwbyE2T0qQQbPRWF/TcfHXn33BTKtXaRAQF62LHBipGA48X+qNaNrBIeJ/jHS0Utt
 JYDZG1Osu9ICk+CPnxhmmQFdDhvlUfkLXkvSretPAZ+oI4OpwXXU+Pj
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
index 15997cb88576..4583d071409d 100644
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
@@ -860,6 +886,19 @@ dai@5 {
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


