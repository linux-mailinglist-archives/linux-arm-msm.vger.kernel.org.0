Return-Path: <linux-arm-msm+bounces-6451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5D824238
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 14:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAE828785F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9430A22EE3;
	Thu,  4 Jan 2024 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e1s7/3EE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1F2230A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jan 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-336c5b5c163so256512f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jan 2024 05:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704373324; x=1704978124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQIEpNJctaz16RzA/leTZqNcUN7vsgkXc8Xvi93qAho=;
        b=e1s7/3EE+MeuNW95g+yb4nI2EfzKykj8shaTLoibDu7D3m/ffNrI6tEAU6DA6QSoTA
         mbnGXGkLbXqOvSFgn1mDXvBUqyIV91SKIGuKK7zJPhRjRXPwh4eMBYE9UOX9lndUWwPw
         fCfoSjPUPU4PGZn2Q3DO5UfmCX8Ql7GfM1BtQ4AfGNg9CxcR40b4tn5XkYVhadTUsCpJ
         TFaJULVT6u5l6SYVa9Z9hqAzB6+liviUn725RIMw31MnRlyZFwUpIjUIKQN6BF2+NDnZ
         O4CwH+t/AGZoWaEy/u3AAn2Ug/tiCKBUj4FeAjcxA/5pwS+ZB9sYFG1Zkht3aWPNu4Gl
         lncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704373324; x=1704978124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQIEpNJctaz16RzA/leTZqNcUN7vsgkXc8Xvi93qAho=;
        b=HJRQDH0ZacwmqdL3094vy0fsPAE9AomPSXRFrYnX9HI6tF2wkHQYScZcITmLV9LOpr
         XHw+aUn8A3U1/RwRwSORfqqSDMcYt26frkKutzHjk8dSBTsiQuiW3EPaxwZRNMixWIkS
         gI3MInlhSuMFrn0LgcipIY7o5Cn48sX3TWvHMtlpFxP5sIPbKrvMfiUq/NnE2V6gOo7r
         LOfwhMZElAnBkYQx9avqNYnhtCF/h52rm2N2brCTpt1zDxZUmCS11RNSFCWa8U8X1MRK
         K7uo7GwbxGAo5Z1jUWx77KCAwunyy+C9Wewd7bEFcvgXsUYpJHykKhd8WQ/Od+IDEOLC
         DOXw==
X-Gm-Message-State: AOJu0Yxv6Un08gjwr8Ae8ByTQvMqfVDkmPUdP17l26txnUDrO8zdyhTY
	hGKfkwNN2AHH4GEqVnoMJGXPlQPexcwFuw==
X-Google-Smtp-Source: AGHT+IEYrrjaOaf5/IBZBDz2VUcMEHweLF977kWhWHW+xRF7Tv9rMBKm8dg3stU9d6EnW3pR2nQiEQ==
X-Received: by 2002:a5d:4576:0:b0:337:4f04:933c with SMTP id a22-20020a5d4576000000b003374f04933cmr318898wrc.54.1704373323681;
        Thu, 04 Jan 2024 05:02:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5b69:3768:8459:8fee])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0033660f75d08sm32887387wrv.116.2024.01.04.05.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:02:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Robert Richter <rrichter@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC 1/9] arm64: dts: qcom: sm8250: describe the PCIe port
Date: Thu,  4 Jan 2024 14:01:15 +0100
Message-Id: <20240104130123.37115-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240104130123.37115-1-brgl@bgdev.pl>
References: <20240104130123.37115-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Improve the description of the PCIe topology by defining the port node
at the SoC level.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..fef9c314ce55 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2197,6 +2197,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
-- 
2.40.1


