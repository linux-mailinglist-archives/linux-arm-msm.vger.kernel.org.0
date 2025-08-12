Return-Path: <linux-arm-msm+bounces-68673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF664B220F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 232703AEADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDBC2E54A4;
	Tue, 12 Aug 2025 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fbWEbAWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7842E425B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987240; cv=none; b=XgmYrEDbWmhUDZW5Mj8Zm1eZ3kjzsvuJDaZm1lW/uobvOIUm8YwZqxRtRx4DWsy4p6d7LMAk6gD06TX/fxGf9LBvqIDJiZCOMHBJAdrFlDGwZ9I963dC7znLXfp6hoNeFu3sIh+DpDcI+XsE5SoSSqo1PiI+z5z8d7ZVmLtlvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987240; c=relaxed/simple;
	bh=XLM+AKGhm/JPaIWRpDkOq+A/wAVorXQ6mpQytd/t0+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKVEg8SxjER/jchIczooXOkVnmtIA3Plyn0c489n3uuBDU0frPHFYaQapGcQrucYhwAUkjFqNYxGSU+yDBywJ784/APXCqBLfVbI/BsFGbmZ1e67HwNLE1sMelYC5TSy9xVXe16Hwq3LpmFFYyHJIAgXlzOdVdNoQgI1lDFcrh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fbWEbAWr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso33172165e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987235; x=1755592035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=fbWEbAWrAQ6jaTAeRietF5gFUOgaEGG8dDuej+ks9/HnFx8uo7QCU43h2JL7ovn1MO
         uSL8VDGxQ0cE4K/glLL55Al4zWhqU/4rdotvauebrX3KvbJKrxupnF9pM3s22ZrJ0mgn
         rrqOu6j164VW7182itYwlw8OVx2TQJdxexYbFADIk3cN8Bp2Im4MSXPCoeNP9mf2rzUo
         UU7hhWzBTHp+qB2GiRg55TNNdfz/fZ20j+gY6ujLiMtmFm6gm42Pt13c4ZyLpIa1jvKt
         EzQ+LygcCoU0nPdsiUcgvMeZHGbNmKktrySxutPSMULyu/+2gnBKM2EVC13/g3so4GGI
         EMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987235; x=1755592035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=raTA9vOziOX6PG8vnrZcP+krjcRC11Wa5p90p0btMBm45343n9WEylfVsuNBArYUYy
         U/pbJAMmISt0xGfhJ4OPE4azSMFw6WHSAeabASYZQpooG8fASxb1QCvzHMwuOzVBMnI2
         wgFT+bE8xkUchE4Tfc59Cj8d4y+R8Rhy34c3SJDaNXjBNjNYXXwH4DAlubXuFtmNSxE7
         4xwj3sMLhvnCeEaA6HFkEfeYCmnpDNJG0N3fhDFjtW2Re5CI2LdPk8K3v4EdVHiY/cDd
         wX5qps5ddqewQ26TyDXpRbtQ2RWz5f8wpyDtPlvCsrGVa/rn0ejPFTff2wOD+8n+T04q
         sbew==
X-Forwarded-Encrypted: i=1; AJvYcCVCAvBMZdyvcGQKLQYTZfmIZ0bGUD8PzIPa3/sjkYeHiyDerKBfRuwyID/i/qOPiueE5sHvrTkiRxOZkxR2@vger.kernel.org
X-Gm-Message-State: AOJu0YzFvooa/ii/U4Gt6x25WvFJ0qTIiaK2lIslHDOiyZk8EtxyVCrV
	/8+CDcIwo251OIg7JcvevTRdY9BsLKJsMrbiL5GdmPZN5cOUgjgK93bRYqBxpH4BIUU=
X-Gm-Gg: ASbGncvqfL0/UKRMXvAPqhjO4Qr6mlJXHEp2BpdVPUb/nvqTDUsDCvu86hLIADmdkzC
	QYeTFhaAxEn4/fGRepqKGlcYB1lvh7RBcjZURwc9V8Ys6wYPXDcmbh983yn+lINla4BBncYICm/
	mL2sWUpkd4vkt8stipCIPB73zZTHjpq7e6BQtmb0y7XblFe+dgkzuk0xL53IyzGMs9rQa1rdYOD
	AbIK0oSGXffXDq4PRw6uSWpoiphxcUwuWo64l15zTpWkelRa5ihQg18oR9VDIIp+buGzWGE657L
	pSKUHSl6Nswp+x+lPzKQB//zoeyMaZVM/nMJ9npnEkAYI7GkYdfaxdgrwGXbujADREsFGBdNlyq
	HRNZ9rXjdZP2/jLg=
X-Google-Smtp-Source: AGHT+IFdKvznDMFZVInYZwwYDHVNkoHUkpPZeGPe2WfSJ5pngAh+BKH1PEfINHP8AliGuYpxgpRk9w==
X-Received: by 2002:a05:600c:3d92:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45a10b9f437mr17532975e9.1.1754987235079;
        Tue, 12 Aug 2025 01:27:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:03 +0200
Subject: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXGC6Gq0nJRiXqaR76dk7/R12B6PvbWm35x
 aNzc3XzxtKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 cvhtEADdNx7DArN5koidQnVfF+xi0aUHcfFGOuW8vpax22Hyr2Scf/VG3fJlaP4c5NFyv03lfv2
 m5QXrrhpqBJRNJre3AS3sTt+5DFtU2x3XQe4g0YTzwVUXtZaMXzozSdl7dUdVAaS3d5bkfVQSoN
 bZqJ8Xn6GewglMBvisZh/eR7hVh7fsiDLRSGwzB0txJXy915USWDYvKaZAzaJrUNqH2DJPDkIdt
 hJvpe1DRASLLubOKWqhS6RZYdoLI1vMKaOeXRLJ+uJHwgaGX7acED/nxlYxNTFvJh1rEv+cvg96
 D09YaOGaUsK3oJcDeWsShWamJbDXg76mz6PFaFOU9pXnO0gGch+wg+Ni4hrDfSOyPHmUTYxSJ5o
 rozzU6iNpaTtSsIbtXjcLDebrclN7xi088hZzvuiBccesTXa1rV37gq6lyqvvTWtHmk3qroaTio
 GTxkp49IaL5d++Z5Cid2pYg6PSQqidLMXqc3eMw/M/lw0tU6769CLGAOIPfmZw8pIQ1aVBEjPiW
 Wh30mUS3iHzRTUZ95x6mwyTgZDpBUKbP3wvI7XwSj2P28ThwZkNHX3iwas386F1Be10JolQ3pZw
 LWKA8cisHe32kL2K0hNad7VOpO51ebJNo5q6uC+jebFgDQrWSmRdS1nalBHRZbyorG+GSy2cb8G
 M4bBijT2vNehGvA==
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


