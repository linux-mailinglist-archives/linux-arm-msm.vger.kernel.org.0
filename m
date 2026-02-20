Return-Path: <linux-arm-msm+bounces-93469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAQwIRsnmGlqBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:19:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F310916618B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 923A0302C77E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EB1315D32;
	Fri, 20 Feb 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j/gZjPgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B531B810
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579155; cv=none; b=XGbkBuw5NqjKuRWi+6NO9jujRxR8CBDEmiDI6U51CzJB5hZFk+XXHdOWEHLa+1oY4+cTp59ZF8Kr2rA0ZFrorYurMP7GHFQLZ84NUOsZZ7Bekt+NbFgXJ2bFbLrkoeFTHOja8I0t2Ikm3sxsBeisK970izjowii94UIM6IFk3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579155; c=relaxed/simple;
	bh=Pa8v8Yv22/bRxGvwx9RtUWdjQtXpeSx595DQVqT0p/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODhlP/iHjMsGCujcpwFftITyTrru9YVdcbwjw1FzB+YR3ScRKOkrZSzvcLoFE9tYuwXrolWuf/2apaWbFsJYGR51P4EXSg9pMvgHuNlP7BER53dQCy/YMuS+NhiJGTAHWHpz8e4BPQK0u9JrRO5YdeLPkqXMlUCJ+qGbVtn8QT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=j/gZjPgA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so305838966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579152; x=1772183952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3S6MbSTO4MkMrBu9nf7AbP35XblYDK2xH6bZHiUcC4=;
        b=j/gZjPgAXIEfqCa3x5ZZMGaAdM+s9QAgSqGdu4G6P3MgKIrYP9g0jJ+senPJQ4mXiC
         hmkOBVYGlvu/wgYnkBD15Octv/CHxo5MRVrogrmvjc4a6jkMp3USYt2C/enUkcu33BU5
         e+Fy45KJwhQuf9MWNpvW0sfWtE4A6N4sp5v2mBiLFgRzJUB+6sTmqzgPZeimwfqLrJir
         hIVcXQvctj8xyg1TGh1QvoMqWIjlMe6V7NLcyeirD0R0afHa0owLgtz5ydcp4JDG+h8x
         0v0sAI593ToH//x8hPM4MLe+iHlrl/+39ubgKcLjD7HvAijsP96m30W8gvKDHFOdp/JP
         vwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579152; x=1772183952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3S6MbSTO4MkMrBu9nf7AbP35XblYDK2xH6bZHiUcC4=;
        b=Rly43dZgY81rQHOMjZV4S/MGJsfi3F9cfIRNujNRAxjCV8ZsshtLi+w8zAG8AddWeJ
         H8cRg4cOE27Wuq3fXMVrN08JKWRCHL2yt/B5L1t9ruHFFuIDyaovmOBdWtXlBNjCk+FG
         dxvivpN42xd3jMFrAoFgCGuGajuJ7HBggxFol5oWJ/O82jy+KYlLZUFQNmVRFI8Hvptf
         7zO8esjqvRVNCulkJYs+rmIKGex1n/x7xTZQm8yrbdTJyyyy/AcrpXnbagNlWJmnQHjT
         aFk2NNWyJYpqS9K+5hJqjgDzX2HkGcYTlfxFZ6A5rBXF1VeU8rzyLeq+uOlYkgaRnakm
         8NQw==
X-Forwarded-Encrypted: i=1; AJvYcCUup+PAWpS1REK1PD1FV94ThDLAu4sFffQXWnCvN0c1jE2v3WBeJa65sqSiyEWXSEdpi/gHVPg/SPgyqFlx@vger.kernel.org
X-Gm-Message-State: AOJu0YwqgAv3f6ZyKSjeIf6B4JCyy1F/zajyxY+SXDMS+lofmT3rIhI9
	N0y60CNUyMwwfxzmVSzz8P39BUIe9nRdEKh/QWPZ0U2J+yqrhFKVlr316dyrDaJEKwE=
X-Gm-Gg: AZuq6aJZjC6BUCiP016nMT376mfYifHwI0OQIZLgM11joxfPIIemioTCWnWpgRgJC0J
	oezioaQWKPvfGvFSkseJhDAPfjQN90A4ft0nyekrHRIgMOBytCxx/HSO22yaMGBwOtZFB8DJmqP
	Roza7ZKExdS1g+WcTLKZqvQNiaHtxPftsoJTBJwqr/bljR2bfvUBQrtU3t0EuYMjCReOuSDB12X
	gCEjXHh1gxCtj0/AHrfrCbmzxUnr6Dtx77tkCKmhx7PpynQivQ7P16b8LFBinVDt+vtOqowQEgD
	51g8Ra0l5OUgxPgGfn5r0XNrketWx7hqIBH4E80r2Tg7KhY2/QbUJTe2hdiPHiVU0jDNzSjIep8
	JzzmgaTmgCfC4pjY6wItf6lrlj745yvsNhgGJyGYPOQwvS+YADRqsYExOO77QmIYGHqrEy1nY0O
	BR/NwA6Higkwen3XTzG9h4rahNVSTG2+Ihkaz0PnlEtfKcNgLzrGm9muBhctNcY2KptqSNhNH1U
	feLJXmmXPVLMcmh
X-Received: by 2002:a17:906:ef0c:b0:b8e:7208:ffe0 with SMTP id a640c23a62f3a-b903dd028c7mr585851766b.58.1771579151978;
        Fri, 20 Feb 2026 01:19:11 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:11 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Feb 2026 10:19:05 +0100
Subject: [PATCH v2 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-bat-temp-adc-v2-1-fe34ed4ea851@fairphone.com>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
In-Reply-To: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=4306;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Pa8v8Yv22/bRxGvwx9RtUWdjQtXpeSx595DQVqT0p/4=;
 b=bI5SYVmFRauGR8YDVWfVU+87qHPMpEth/dQ/iA9E/N8ZOyC5gGBcOJDpqvzwHD9JvAKCcXzkN
 ow+00MWJnqPAwq5M5XrtNEKDKuV4iVKMSto5MZq9pp2/uJF5AdqGX4v
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93469-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F310916618B
X-Rspamd-Action: no action

Add the BAT_THERM channels with millivolt as output, which can then be
used along with information regarding the NTC in the battery, to get the
actual battery temperature.

A static lookup table in the ADC driver won't work since different
devices have different Ohm and Beta values in their battery NTCs, for
example a NTC can be 10kOhm & B=3435K.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/iio/adc/qcom-spmi-adc5.c         |  6 ++++++
 drivers/iio/adc/qcom-vadc-common.c       | 16 ++++++++++++++++
 include/linux/iio/adc/qcom-vadc-common.h |  3 +++
 3 files changed, 25 insertions(+)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index af3c2f659f5e..6ad75368d3a3 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -543,6 +543,12 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
 					SCALE_HW_CALIB_XOTHERM)
+	[ADC5_BAT_THERM_30K_PU]	= ADC5_CHAN_VOLT("bat_therm_30k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
+	[ADC5_BAT_THERM_100K_PU] = ADC5_CHAN_VOLT("bat_therm_100k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
+	[ADC5_BAT_THERM_400K_PU] = ADC5_CHAN_VOLT("bat_therm_400k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
 	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index b03cf584b165..09a13e2b0ef4 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -309,6 +309,10 @@ static int qcom_vadc_scale_hw_calib_therm(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
 				u16 adc_code, int *result_mdec);
+static int qcom_vadc_scale_hw_calib_therm_volt(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_mdec);
 static int qcom_vadc7_scale_hw_calib_therm(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
@@ -333,6 +337,7 @@ static int qcom_vadc7_scale_hw_calib_die_temp(
 static const struct qcom_adc5_scale_type scale_adc5_fn[] = {
 	[SCALE_HW_CALIB_DEFAULT] = {qcom_vadc_scale_hw_calib_volt},
 	[SCALE_HW_CALIB_THERM_100K_PULLUP] = {qcom_vadc_scale_hw_calib_therm},
+	[SCALE_HW_CALIB_THERM_VOLT] = {qcom_vadc_scale_hw_calib_therm_volt},
 	[SCALE_HW_CALIB_XOTHERM] = {qcom_vadc_scale_hw_calib_therm},
 	[SCALE_HW_CALIB_THERM_100K_PU_PM7] = {
 					qcom_vadc7_scale_hw_calib_therm},
@@ -583,6 +588,17 @@ static int qcom_vadc_scale_hw_calib_therm(
 				 voltage, result_mdec);
 }
 
+static int qcom_vadc_scale_hw_calib_therm_volt(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_uv)
+{
+	*result_uv = qcom_vadc_scale_code_voltage_factor(adc_code,
+				prescale, data, 1000);
+
+	return 0;
+}
+
 static int qcom_vadc_scale_hw_calib_die_temp(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/iio/adc/qcom-vadc-common.h
index 3bf4c49726a7..ce037994b019 100644
--- a/include/linux/iio/adc/qcom-vadc-common.h
+++ b/include/linux/iio/adc/qcom-vadc-common.h
@@ -93,6 +93,8 @@ struct vadc_linear_graph {
  *	voltage (uV) with hardware applied offset/slope values to adc code.
  * @SCALE_HW_CALIB_THERM_100K_PULLUP: Returns temperature in millidegC using
  *	lookup table. The hardware applies offset/slope to adc code.
+ * @SCALE_HW_CALIB_THERM_VOLT: Returns voltage in uV of a temperature channel.
+ *	The hardware applies offset/slope to adc code.
  * @SCALE_HW_CALIB_XOTHERM: Returns XO thermistor voltage in millidegC using
  *	100k pullup. The hardware applies offset/slope to adc code.
  * @SCALE_HW_CALIB_THERM_100K_PU_PM7: Returns temperature in millidegC using
@@ -114,6 +116,7 @@ enum vadc_scale_fn_type {
 	SCALE_PMI_CHG_TEMP,
 	SCALE_HW_CALIB_DEFAULT,
 	SCALE_HW_CALIB_THERM_100K_PULLUP,
+	SCALE_HW_CALIB_THERM_VOLT,
 	SCALE_HW_CALIB_XOTHERM,
 	SCALE_HW_CALIB_THERM_100K_PU_PM7,
 	SCALE_HW_CALIB_PMIC_THERM,

-- 
2.53.0


