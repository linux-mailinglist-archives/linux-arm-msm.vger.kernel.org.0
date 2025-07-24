Return-Path: <linux-arm-msm+bounces-66452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392DDB105D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91E3DAC73C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C50286887;
	Thu, 24 Jul 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AQW0oxah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C9283FCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349090; cv=none; b=CB5QwMBjE3o3T9rcUndYNfUSF7acnv/X9QN84nJQcAj0Nf/NfJPSi9HKIrtVFBs0Wz7EX680JjywmUui+wP5gNAu7t3viUMXcG1U0Kx9Xx8HuH3w8fu8dDbM1NsIs2hUMyGDR5BHr+F+mzsglnOIDboWmh7uFVoOf49sgIyphqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349090; c=relaxed/simple;
	bh=XLM+AKGhm/JPaIWRpDkOq+A/wAVorXQ6mpQytd/t0+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpGYJBHpZ/vc864fwp7oP637WS/WDYF0ZXXRKcWbi8SWrprAyVCmKmUNDmOym7SKoAAzZ+sSmjyyc78TyGcEotMLJJzlCiPHjP2LlWnLS6GPBAeeER99t/yumW1dlEvUqSVkWQNupRoshkj3QDlL8+IRdiB8W07kmq0SVjJzClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AQW0oxah; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso4956845e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349086; x=1753953886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=AQW0oxah/gLZtFQbqJJo+6Las0oKJadNOKhSVYkPbUrSuzGTYnKoiJpSEHKKh9cX4I
         gLX32QHErI9hFB9qMdHgItaus2PAELfrANghFogh5ReecsMXVuEjwiYjAv8Fl++5VD19
         muNzxJvrCQ/yBhRGiU5A41bjwG4pUyF9KAKf8JUOL0z3Apihea4hD5mKemba9OBfDd4+
         Gwf0f96xD7ia0C2hKIrsYAD0fV2oUI2u9yaXF1P7JGdev9xwklEA7eVuG6v8+IoCWEC1
         TMEZlDc30nGr2li0iVxGYE1u1bbI0dbXCJCKJ2vmbUwcZXw4VDo4phmpf2OgmsPLdp5I
         Wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349086; x=1753953886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=JRcaZNzhAf2A4M5EmKCCptNcpuNBS1kzFfAwbyIPo7nyeywuRgLz4HrsHS2a0Ma8NQ
         gP+iEhyF1+LETI3Qj5sAVBM1pxveIo3Yrw39OhkNUKb80tDwYt5Pa8JCleEWYCSWmFVq
         4jWMF9h+F9htejrhmSklBb9ufCfBSEF/ArM46jDR6RjEXawvBDgmEiZMDZkGFkAJ38Jq
         Gs1A2QJT5zRtRK5023cYXc2lnckHWLo/D/uFsW8FGRdCBhdYCh9A5qfTFqPw5tQ1ydHG
         6xpY8V90mrqKHyVnH6Igv1ABH2daHI/Q/bXG0CHlHSA+atW2MNHjEl87IacVEg8UUznk
         tShQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXvVis8KgY2svvgrcTgclKD6NqWQ4uEjXbTjG9n1ZDqSs6HMdUbR8tEbeeNTiHJuU+kehwnj6PrP1eIlr+@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmHsgP60RAXV28oiSvKi5bW/YhN77gmazyIdGrd0bcCmzjCu/
	2dlFCAOLDif2rjF3fGR5G/8Hh9Nyr6FZZVZNEfDDiuxDO6c3rSTzPlML2wf+IhE3E4Y=
X-Gm-Gg: ASbGnctr2BGZOfuRY3gWDQUpuuT7PZCsEsX6jy8O4I7POiemO1aLIusuvu3eBJH8GmO
	Tq3xx7wzfO3jiyoaqms85x1fX1TwFw2NkpnJUabFTvwyhP3l0dhslfzpYoQWEijzUdeCL8IdZD8
	P5S9VUQiwaHBvu4opthjjDrZZMaeRkstsaxB97k/SxQSEpQ7Ze/8Xh7aplgi6iw7AOvsuM+11Fw
	pE2IouJDtJ5qUeOiDnyWG2YRoZ7NWrVfgFrY9mMeu74U/93HG+SypCXKjBJ5thP4YWyZBMFK44t
	jypEAz/Phjlla80hcrvGVOgOJPa4JBoNytYyLpIBS9jM75wH2LF9wtlxs4niLvToq7/ytAf5TSo
	cHtfWgdtZ/3Lt65bTghepVIIlAM8=
X-Google-Smtp-Source: AGHT+IFOeuH5zAlzFgvpD4Uz1Y06PKqXYxEckZmMDNMfNM7DLyHZBB1RdoHcgvW8waqnzfrmwOQl3w==
X-Received: by 2002:a05:600c:524b:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-45868d69f9bmr48489405e9.28.1753349085686;
        Thu, 24 Jul 2025 02:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:32 +0200
Subject: [PATCH v3 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-4-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nunH5KiVSLA9eNaj6eipx8y2OBwu+tjBhQLeBJL1rQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSq96zx0eWj6bB9Wtc62trZyDHOOqVEGsjt
 IdJru9X576JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 ciU7D/9ufNSr0xAVjM3jLOYmhiZYTdSmu9d5m+WcEwts4F/wCHyNf8esGOZyhn5wUjORYdUjIo7
 eZFKz74xSLCU+omhJ1JyntwjO/u19pUr3cA16S53VWhQ8i8DyudgfzMCynaEO+AnlG8W6VDdloD
 sjo/e3GaNpK6UIS4gfqVhDkQhxARxrFqHhSAQfpQcImogDC4D25D6WNHBCJ/Oo6cCCRTR/4axFR
 5fcvSZA2dU9/5y5djCi2V6yQjYVC5XxZag/q8vTGMaAcJjUmVLBnVtBFhjIotVORY0DFi89nEJL
 y29d2wQbwZAOrDZPY9B07IB7CI52j77LdHf2SL2NvSselkHKMJKP02SNXEVQK7F/y3mXIHsbkK0
 6WgTHe/owJNiV3POTwFKWsLJOysiyDATr9qIvSJlM3/3ime6HlRo+lNLFtzONrpRFlkPeSRhiu0
 iJL3dlJh7FlYdAqI3NxP0sv5V/OFNyZqhCCNgEQwxbCWnuXPUftsK8TO0Pgrg/d32RYhOzUXKTp
 jt4cHWwTDpHenhDSF+VIkqTzNlyQ4S9TZbS5MACS9G87yVokvxr0o4q6us3KHaO5AVE1oqlDCdX
 ooIVrJFsCF7yvuldW8SymXwAJYAFkarNAtra2A7hv7HoAO0kE1XOl/gDenndsNED8XaEQSmOW1C
 uxnZKJm9mzswndw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


