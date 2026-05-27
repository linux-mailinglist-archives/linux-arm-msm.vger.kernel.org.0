Return-Path: <linux-arm-msm+bounces-109988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MmCA7PMFmprsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:51:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 942555E2F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C21FA3065DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E923F39F2;
	Wed, 27 May 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c1tAOAi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33173F210B
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878892; cv=none; b=eniOH5EVdOPXzbZJPJ79uuRaWyURdiTXrHl5u3AG+tQlmIoD641rgP+oQfVPW68y81Icab8x2WIs83YRIwRD1wyyniUZBHEpY85a+PuSuEc/ggPWOstZl4fsX0pHi1cwdwIyrJzfnBnGJvkdrbk6dyYxFjAJ5p+pa65rUo8N8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878892; c=relaxed/simple;
	bh=7DqkJbY4i6aJTN+FctTn+7O5Txxjpa/eNUwHqPhTnZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7sArIAze3eDZ+e51oHz0Vp448pW/ZCCFPfjuFNTGUVBkVHPrYxROalmsnFj/Wex+Zs6ONNnEvCEQltGJGNOAYYzQFeQxAVCv9wORc2uNB9lEQzqEnNVLaEi9Dq1u/rTXuwDzMX8aeqhs9s5eheXshzYaUmDu2jS0ENf4jmovgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c1tAOAi2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a74032ff8so8585712f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878887; x=1780483687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+jteav4D9x2DTms4TQD/M+YamV282bUUh/ZNE5/JHw=;
        b=c1tAOAi2CiaVvUi+G6ySZWPnUCuLxIL3Glsk5krPdAhuBMR1xuP3n3ql1sQMkyEErg
         M6ix8Zh24XOsb2Isv5toGFls7eMMJxzECkSmOEpdXxx0v7h+t3yTZZ3K8vp65I2GmtqD
         2jhOY0qaY2lkaioL0GX0NXs3USgrvJFZxwFkgi4zV5U2KLmvPQ7Iz8uXbgsGJjBGWoCA
         WB4YW6P6pFIV6fSfzLdG9cIHumOuvi7cBpyeMHIynpYx9G1+IqgECjTv91CjsX8FDn3M
         NGHsSbKsDvg7SnBT6hI0NoIXOtIQjX2YsTaSlLyuafAj82VUiC/afcuBBV29n5Y0Nf5D
         28+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878887; x=1780483687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+jteav4D9x2DTms4TQD/M+YamV282bUUh/ZNE5/JHw=;
        b=PCQ/NDJyojrFJ89bY3ySl9nTMdhOPVpEoP9G1PSqJ8tqw3uONBB0f7Rbqxo5hLDtnJ
         +bVrWd4rZRjLjms26JNvejjpOUx1czB+p61v2eutiEEp76kk3z3hCUyLTPW8Iz5VTbsQ
         BuYy/9Owy6uxeHlW4Ev0KkD3EdR0RWEIpNQdSNDWPTZDN+wyLRXalpZn7N52gBnortMI
         Yn0tyWQb4h9ADgpwjqNcfHfekYcJu9qxmS6Rs0Vk2sC9R+UGOrh81tlx+lnaRjos/sUf
         5XM5dSkS+28uWpAP5rI/pevLWDxaKo6CW0daOXNwaeqBSDRVGVfEgaMC18uxa1YhHLQO
         0WPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AHnF43GzLvac481+7mdbZ8KnVvmsl7k1i/QqKyljnthjPtqaAkMEdIPu+U9hH6DGW8l4CYy+g3R7v7Xsj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LJO+ikfZem8gBioPMPp0sFyZQiyk2mSZ/NgD2VWggVRQu9C6
	m6Jicamr9DGLfFPIpliLK8oZX63K9bX4sPLz5WMTqOGTj5WpubgW4CkGlk4SObSTtjI=
X-Gm-Gg: Acq92OFxX2KZvcJtJXhkuHZCbpaSYE8oApcH1Qs90pWmK0jiZDeEH3QaVKTQGxKt5dv
	OirSRmIiFgQsTY9xZmKv4BLqm9svi/QhDb5QBO3UVS1higzhyx/M3nAO3FnhXe9VX3QdTEMEDkN
	UQZaM6iUe4NsY/sbEqKp9U+ux2WkD0qk4KyiU64eP/IzOl1ZBPUWga+S9W6qo873RWTj64A1BYE
	IIl3iC3X75NWp77UtgwOI+XMJvgKvaDvSKGZHHMwkp+19VXilNMYOgyzAO6acgRaCBs0lWZ+eSG
	kTX3rP6WSzJOqglL7ffozaWnvLONbAXCtacFVq9xX4LF8WtZTNBA5qANaX54WhWx4NtTG1+//mO
	OkmEYXcfz7y+SGgMEW9s+eo7CtIIf65W2pRZBO7LtxzYFPp81GkIBGI4vQ4aTg3Ru5bdhEth3bw
	VYjnA00lvumEKPfo4+yE7++vIwn19CjJyjMUK+++yG3gcVZwNT5lwn/TfOv0LWV6dTb42D7B3BU
	CU9vRYqpE9GcIuH6rUVbHE6gw==
X-Received: by 2002:a5d:64c2:0:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45eb3670591mr35823238f8f.9.1779878887204;
        Wed, 27 May 2026 03:48:07 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5a2a7esm5127229f8f.20.2026.05.27.03.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 2/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:45 +0200
Message-ID:  <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17156; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7DqkJbY4i6aJTN+FctTn+7O5Txxjpa/eNUwHqPhTnZM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvY9VSNlPmyuU2BUhmWIf/tQhQJT3KgtA/6z vyHUdR3F0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL2AAKCRCPgPtYfRL+ TqiUB/4mxAjGpMQxNdUFWcdXldTmS8VPJEdH+Jn6TvpBFRb/T1S3m7k6pNzfNektk5KGTPSFk3L jv5N+0mqu81KEzY/D87V71RKMLENUgB2XMeIZB9tWqBi3HEDqPfgdXo3nWhZ3S3LP4Dwh4VPGPU +aAlBy1jCZa8gF1SaDtERkA/i878+sVQcYmQBmJq5kuCIEy9QFHCLEjtKTaaFNtQIEdrVvmKNly Kx47VGcPiGW4MuqbhvII2JmHPs70dlwzfOv2D4D33PkNt0Wu/vezGPSTIRqPr4vtxGNGfXc7WFf zZDGJ3ceqZyWlrs7DGqmxx7J0fYSeB4ulT/lsodx0FJb2nTs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109988-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[matfyz.cz,gmail.com,samsung.com,kernel.org,collabora.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 942555E2F93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 24 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
index a38bd4f312b7..7328cd1cf265 100644
--- a/drivers/regulator/88pm886-regulator.c
+++ b/drivers/regulator/88pm886-regulator.c
@@ -373,7 +373,7 @@ static int pm886_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pm886_regulator_id_table[] = {
-	{ "88pm886-regulator", },
+	{ .name = "88pm886-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);
diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 668714f35464..4c2b20d1b284 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -607,8 +607,8 @@ static int bd7181x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd7181x_pmic_id[] = {
-	{ "bd71815-pmic", ROHM_CHIP_TYPE_BD71815 },
-	{ },
+	{ .name = "bd71815-pmic", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd7181x_pmic_id);
 
diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index 473beb4399d9..bd61caa8284a 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -1691,9 +1691,9 @@ static int bd71828_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd71828_pmic_id[] = {
-	{ "bd71828-pmic", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd72720-pmic", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71828-pmic", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd72720-pmic", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd71828_pmic_id);
 
diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 1b5997c8482e..9cc29b9409d0 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -1816,9 +1816,9 @@ static int bd718xx_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd718x7_pmic_id[] = {
-	{ "bd71837-pmic", ROHM_CHIP_TYPE_BD71837 },
-	{ "bd71847-pmic", ROHM_CHIP_TYPE_BD71847 },
-	{ },
+	{ .name = "bd71837-pmic", .driver_data = ROHM_CHIP_TYPE_BD71837 },
+	{ .name = "bd71847-pmic", .driver_data = ROHM_CHIP_TYPE_BD71847 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_pmic_id);
 
diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index f4de24a281b1..5bf02dc0d20e 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -344,8 +344,8 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd9571mwv_regulator_id_table[] = {
-	{ "bd9571mwv-regulator", ROHM_CHIP_TYPE_BD9571 },
-	{ "bd9574mwf-regulator", ROHM_CHIP_TYPE_BD9574 },
+	{ .name = "bd9571mwv-regulator", .driver_data = ROHM_CHIP_TYPE_BD9571 },
+	{ .name = "bd9574mwf-regulator", .driver_data = ROHM_CHIP_TYPE_BD9574 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, bd9571mwv_regulator_id_table);
diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index bf5f9c3f2c97..fcdaaa56e356 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1117,9 +1117,9 @@ static int bd957x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd957x_pmic_id[] = {
-	{ "bd9573-regulator", ROHM_CHIP_TYPE_BD9573 },
-	{ "bd9576-regulator", ROHM_CHIP_TYPE_BD9576 },
-	{ },
+	{ .name = "bd9573-regulator", .driver_data = ROHM_CHIP_TYPE_BD9573 },
+	{ .name = "bd9576-regulator", .driver_data = ROHM_CHIP_TYPE_BD9576 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
 
diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 129b20c33bad..308279b31fd3 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1329,11 +1329,11 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ "bd96801-regulator", (kernel_ulong_t)&bd96801_data },
-	{ "bd96802-regulator", (kernel_ulong_t)&bd96802_data },
-	{ "bd96805-regulator", (kernel_ulong_t)&bd96805_data },
-	{ "bd96806-regulator", (kernel_ulong_t)&bd96806_data },
-	{ },
+	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
 
diff --git a/drivers/regulator/lp873x-regulator.c b/drivers/regulator/lp873x-regulator.c
index 84a134cfcd9c..7e837ddfa236 100644
--- a/drivers/regulator/lp873x-regulator.c
+++ b/drivers/regulator/lp873x-regulator.c
@@ -180,7 +180,7 @@ static int lp873x_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp873x_regulator_id_table[] = {
-	{ "lp873x-regulator", },
+	{ .name = "lp873x-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp873x_regulator_id_table);
diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 1259b5d20153..34e7a5d323d7 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -229,8 +229,8 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp87565_regulator_id_table[] = {
-	{ "lp87565-regulator", },
-	{ "lp87565-q1-regulator", },
+	{ .name = "lp87565-regulator" },
+	{ .name = "lp87565-q1-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp87565_regulator_id_table);
diff --git a/drivers/regulator/max14577-regulator.c b/drivers/regulator/max14577-regulator.c
index 41fd15adfd1f..c9d8d5e31cbd 100644
--- a/drivers/regulator/max14577-regulator.c
+++ b/drivers/regulator/max14577-regulator.c
@@ -235,8 +235,8 @@ static int max14577_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max14577_regulator_id[] = {
-	{ "max14577-regulator", MAXIM_DEVICE_TYPE_MAX14577, },
-	{ "max77836-regulator", MAXIM_DEVICE_TYPE_MAX77836, },
+	{ .name = "max14577-regulator", .driver_data = MAXIM_DEVICE_TYPE_MAX14577 },
+	{ .name = "max77836-regulator", .driver_data = MAXIM_DEVICE_TYPE_MAX77836 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max14577_regulator_id);
diff --git a/drivers/regulator/max77541-regulator.c b/drivers/regulator/max77541-regulator.c
index e6b3d9147c37..f2365930e9a9 100644
--- a/drivers/regulator/max77541-regulator.c
+++ b/drivers/regulator/max77541-regulator.c
@@ -133,8 +133,8 @@ static int max77541_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77541_regulator_platform_id[] = {
-	{ "max77540-regulator" },
-	{ "max77541-regulator" },
+	{ .name = "max77540-regulator" },
+	{ .name = "max77541-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77541_regulator_platform_id);
diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
index 72a67d0c5f1e..a8b3a2058d34 100644
--- a/drivers/regulator/max77693-regulator.c
+++ b/drivers/regulator/max77693-regulator.c
@@ -271,9 +271,9 @@ static int max77693_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77693_pmic_id[] = {
-	{ "max77693-pmic", TYPE_MAX77693 },
-	{ "max77843-regulator", TYPE_MAX77843 },
-	{},
+	{ .name = "max77693-pmic", .driver_data = TYPE_MAX77693 },
+	{ .name = "max77843-regulator", .driver_data = TYPE_MAX77843 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(platform, max77693_pmic_id);
diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.c
index 254a77887f66..cc85fbe8b77c 100644
--- a/drivers/regulator/max8998.c
+++ b/drivers/regulator/max8998.c
@@ -752,8 +752,8 @@ static int max8998_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8998_pmic_id[] = {
-	{ "max8998-pmic", TYPE_MAX8998 },
-	{ "lp3974-pmic", TYPE_LP3974 },
+	{ .name = "max8998-pmic", .driver_data = TYPE_MAX8998 },
+	{ .name = "lp3974-pmic", .driver_data = TYPE_LP3974 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8998_pmic_id);
diff --git a/drivers/regulator/mt6357-regulator.c b/drivers/regulator/mt6357-regulator.c
index 09feb454ab6b..815ef7d3e5be 100644
--- a/drivers/regulator/mt6357-regulator.c
+++ b/drivers/regulator/mt6357-regulator.c
@@ -431,8 +431,8 @@ static int mt6357_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{ "mt6357-regulator" },
-	{ /* sentinel */ },
+	{ .name = "mt6357-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 1d1726528460..610eac9bb9cb 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -409,7 +409,7 @@ static int pf1550_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pf1550_regulator_id[] = {
-	{ "pf1550-regulator", },
+	{ .name = "pf1550-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, pf1550_regulator_id);
diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 90c78ee1c37b..9c9b8be2e15a 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -180,7 +180,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ "pm8008-regulator" },
+	{ .name = "pm8008-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);
diff --git a/drivers/regulator/rt5033-regulator.c b/drivers/regulator/rt5033-regulator.c
index 2ba74f205543..3aeab9a57871 100644
--- a/drivers/regulator/rt5033-regulator.c
+++ b/drivers/regulator/rt5033-regulator.c
@@ -116,7 +116,7 @@ static int rt5033_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5033_regulator_id[] = {
-	{ "rt5033-regulator", },
+	{ .name = "rt5033-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5033_regulator_id);
diff --git a/drivers/regulator/s2dos05-regulator.c b/drivers/regulator/s2dos05-regulator.c
index a1c394ddbaff..6e25f663496a 100644
--- a/drivers/regulator/s2dos05-regulator.c
+++ b/drivers/regulator/s2dos05-regulator.c
@@ -146,8 +146,8 @@ static int s2dos05_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2dos05_pmic_id[] = {
-	{ "s2dos05-regulator" },
-	{ },
+	{ .name = "s2dos05-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2dos05_pmic_id);
 
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 81cfd60460f8..0fb54617b8a7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -2266,15 +2266,15 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
-	{ "s2mpg10-regulator", S2MPG10},
-	{ "s2mpg11-regulator", S2MPG11},
-	{ "s2mps11-regulator", S2MPS11X},
-	{ "s2mps13-regulator", S2MPS13X},
-	{ "s2mps14-regulator", S2MPS14X},
-	{ "s2mps15-regulator", S2MPS15X},
-	{ "s2mpu02-regulator", S2MPU02},
-	{ "s2mpu05-regulator", S2MPU05},
-	{ },
+	{ .name = "s2mpg10-regulator", .driver_data = S2MPG10 },
+	{ .name = "s2mpg11-regulator", .driver_data = S2MPG11 },
+	{ .name = "s2mps11-regulator", .driver_data = S2MPS11X },
+	{ .name = "s2mps13-regulator", .driver_data = S2MPS13X },
+	{ .name = "s2mps14-regulator", .driver_data = S2MPS14X },
+	{ .name = "s2mps15-regulator", .driver_data = S2MPS15X },
+	{ .name = "s2mpu02-regulator", .driver_data = S2MPU02 },
+	{ .name = "s2mpu05-regulator", .driver_data = S2MPU05 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);
 
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 551647bc1052..c44c445ea139 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -147,7 +147,7 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sy7636a_regulator_id_table[] = {
-	{ "sy7636a-regulator", },
+	{ .name = "sy7636a-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sy7636a_regulator_id_table);
diff --git a/drivers/regulator/tps65086-regulator.c b/drivers/regulator/tps65086-regulator.c
index 2d284c64eeb7..94bf96856d10 100644
--- a/drivers/regulator/tps65086-regulator.c
+++ b/drivers/regulator/tps65086-regulator.c
@@ -399,7 +399,7 @@ static int tps65086_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65086_regulator_id_table[] = {
-	{ "tps65086-regulator", },
+	{ .name = "tps65086-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65086_regulator_id_table);
diff --git a/drivers/regulator/tps65218-regulator.c b/drivers/regulator/tps65218-regulator.c
index f44b5767099c..8df81ceeb845 100644
--- a/drivers/regulator/tps65218-regulator.c
+++ b/drivers/regulator/tps65218-regulator.c
@@ -341,7 +341,7 @@ static int tps65218_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65218_regulator_id_table[] = {
-	{ "tps65218-regulator", },
+	{ .name = "tps65218-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65218_regulator_id_table);
diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 324c3a33af8a..a667c3f44bb7 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -541,9 +541,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65219_regulator_id_table[] = {
-	{ "tps65214-regulator", TPS65214 },
-	{ "tps65215-regulator", TPS65215 },
-	{ "tps65219-regulator", TPS65219 },
+	{ .name = "tps65214-regulator", .driver_data = TPS65214 },
+	{ .name = "tps65215-regulator", .driver_data = TPS65215 },
+	{ .name = "tps65219-regulator", .driver_data = TPS65219 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
index 7ff7877a2e09..4317ec62f18f 100644
--- a/drivers/regulator/tps65912-regulator.c
+++ b/drivers/regulator/tps65912-regulator.c
@@ -142,7 +142,7 @@ static int tps65912_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65912_regulator_id_table[] = {
-	{ "tps65912-regulator", },
+	{ .name = "tps65912-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65912_regulator_id_table);
-- 
2.47.3


