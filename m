Return-Path: <linux-arm-msm+bounces-112254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bx7+CqtIKGpcBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F5662C61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rXPcZaUp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112254-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112254-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF4C431C35EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563833EFFA4;
	Tue,  9 Jun 2026 16:23:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02542B72D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022203; cv=none; b=kV3chdeJPEQw9kUwFd9ieCx2g3LJ73ABx4ipZsJ/29UeJ9FI53lzz3V41D2ZcAZMlxqbKHf3v1bljCzGY6C3pks/Yar7FtZJVesazdQOrYuye5a4MROmvSaR3EEVWSlsO/TQplCHtOrG+W9q0vVmFFCPL6S0IzV/hi4USpQDE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022203; c=relaxed/simple;
	bh=uNst4wFXLs+ypVn4MIocWwRHY+8OwRVsZ3rpweDmCq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZTDCVrlACdvVJecN/cfZxcmIoeDVLcPoqiosdIyuJLuzBzv9nokiWniA4XJPgP3UxQTThkZWeKi9mCwq9VSY4eFjketyWZKpzO1p7i/jEeIjYo/hNBuWFkmpgVEgIkLu/SfZamcr4CemOrM65c0g3w6tFjfUjOW/zGqgqh5oU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXPcZaUp; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9157b895c57so526469185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022201; x=1781627001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=rXPcZaUpkHQedBYwhSkI8mAueunvxxkFdx/gZW2EuWeaIP+STWQ6mq6vFPS9r0A3ch
         7pv/nbakY0mTCxGH6OrkFSYfCwVUmhuM1pgj1iWY+vCwKe+NsnTiTW45ahYM1j43W9/R
         hNMbP5BwNA+n3AfzHRU/82em9j8jLazsqFQuoDoUaNYohxcpzJWFNCHoTRMg8imnXqdz
         vSeUKSmaryUs1lyYaWi8ESDqbBJumOAGWHIm/Sl5ke7O/tFQq8CgIaPAa7zOrVp5rnkj
         avLWRMWRmpeXC5ZEn8DjBVGILteD0z/q77Vg8k7ozEZ3huTcVvexlQS8NMRo1l7GOTTR
         LnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022201; x=1781627001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=aJKZqKUV7c4hzdE/Y3bkdJp8sOcO6hxCOn+r87Goii8yPWkD5UhrHtAUcP1xHIsT90
         9/S4/omJ+67cgAr7mhFi+0NjISdzJpko7oexIbBYj6Thprpa1HHAy+p0iFpuTdN2+g5G
         3uw0eZgD1VB359QVKNNc/amTS10Be1yLYX6jnCz1lOPKTgdiSmltLqCyQPkILXl5QmDc
         tlpRCmQtjlwXkQhSO14yfGmfNaiCYTiwoZQrBWMV9b9Mywh7R4SrcjE8myb+7CxTB9M7
         v5zMH3sXQp2LgB3BiQoKjuoqx44uUETFKeEEZn39AYaB4TjXSIHRtPkQ62jVNMaJmFr9
         kqLw==
X-Forwarded-Encrypted: i=1; AFNElJ8nvSeVl+pYxMtKCucDZ12hUZvz3SHP9l+bNJwOAlakwvY93kUJAEgyjbha5Pk6/cM0PKiw0W/DeSUZIXwd@vger.kernel.org
X-Gm-Message-State: AOJu0YykboK2gkQMZqEPxVGHQ/0BvcsqnheOzVw2ajzt7TaORtGBzICM
	k8RJTZuY4jIravomlDr35BjmO88JwK2LDK1r5AjgacDT13NX4nYggrIv
X-Gm-Gg: Acq92OEvIW/zPmYuaZOHPV+IDrc4KCK8r1cpnFS7vNyngkxGAE2IMvzUr0NwooxXzVw
	zmxEYkqzM9EC8L4TxOfZMOAlpDho2ztOjyZIbYDzVLTSJdvijMfL+ze7P/IV2IINDviS3oCtFwK
	mLEIKMk1b63kw9xytAJS3Uef+2uaMML1a62PS1EWIvfZ0QZ4h1xXE7zQC56NHcVuGIVafIi81S+
	9A0jJNcpl3WBIdHk4kvc9DbalvD7WSF9LdiccaFOp3TLOYnrC1uNl5Fp8kO12O2wcbXeQFT6U86
	cDM9I0XGx2yup89Hua044wn4hl/p8NM18Gnql7gF7aU0twR1+icwpty1blfQfmeOR8c/DWv98eu
	3Mbt+3/UX7Drk/p0dab8l3nZfak7BCfwvkjxWyLNbySahdoKrmPOfyNzOEiHGh+M77N6ASxs4WK
	c9ZkURM7ndATGMCszTsQXBxsZWPjQexHBnKXvHQUSpihryHVn7
X-Received: by 2002:a05:620a:1b8d:b0:915:8502:f7f6 with SMTP id af79cd13be357-915a9d7e7demr3356211685a.35.1781022200907;
        Tue, 09 Jun 2026 09:23:20 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d250dsm2157148685a.38.2026.06.09.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:20 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Tue,  9 Jun 2026 12:22:54 -0400
Message-ID: <20260609162255.31074-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112254-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A3F5662C61

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 
-- 
2.54.0


