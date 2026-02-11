Return-Path: <linux-arm-msm+bounces-92552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JsIDYfji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F188120A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 910C0305A48C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562592F3636;
	Wed, 11 Feb 2026 02:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVf2KCa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98792F0C62
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775429; cv=none; b=X0R0ETevtp7yLOINZHaPnTOFDGaMgfWpiRP0vbTkk2RbN8GjRkd5gu0sVxMqE6vU0JC9KQCBqNkoDsxxr1xz+Nbs3zrPLcA+h1kuwkqjqKUxIglVvRWvuMBWJJFH6EA6gaU5Ri14c29hfgPl9LMTArJtRqkjxJa0/ZhA2p+ikG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775429; c=relaxed/simple;
	bh=8/f4hdOSdwYHmvZUxaFmVQurWRhk7GDQgpmiggd0Y9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA9U5qRv0e//aPLZ8EzTvstKp1ilY4bE/dn8celtK2PAOLdA6JIfCUqYeADj9WswXGWF1AuWREAojGExl2OytD157MB2sqmcdHexbMxA9py9gxhu8XlqBukCmXxSyiNQR+8zTtn5KZS16TasIcqyrBT8msfxLhl539RM7v8l4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVf2KCa2; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c5386f1c9fso652038285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775427; x=1771380227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=AVf2KCa2tSmsDui1ZEcFqUcfjOcfdd6onU07nHgyYepPfC+2uTUAmeJwvpucgM1cNv
         C0wKZ1jJY6g6SFW/vxtFUlNiI6k/CFKBwp//PeZBjJFXeifgKl/B31FRK/TdD4DfMUhb
         CuNZjI0BjqaIISxIJxgVVyeAAzMm6Jz/DMb0FY8+YldCGgkEYHthK2Q1vbRC01dLBoF6
         uEXzac5WpBivfgwq0ZGTyag4D3ycCpk77RspHZUMDL78GhMQY89ApRWApmIJcoAOJ8Qt
         wPBXQoNhe6/6BZHz9qb7eH0Z0FsP82WTjq3tCT/M7F7ZFSmOXzeb/oYz0qM2Dg56Zz0d
         G+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775427; x=1771380227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=HC8YEXCjh0++AgrQP4Ry195r2K7lFPD2oLN+m+gB+uhJOqjEp5YUzFT7e6gk1fUNIt
         wBRXcYjS2Xmdm7Smq6L8uMs/pqDjRFiaDq00dIH4/WBVKDawNyfXmnovD2UgYJ4zL7Sd
         5Nw2BheCJUlPshIFmpbmWUP0yNprTEbZgmFnygrS7tWFKQi/buRd99qzcUEsW/OpJfun
         Tu+Ty6VRjVp2+FW54tqmCpcYazreP0Jf0YiiBj6J4Er83l1KLKy3qihW3HHJawy0nJvP
         eKlmOgEFyq3lrRG4jXo7bGSWjAP2inP38yIWbRk4or6uI7d4eDKhNRGCsdG89atlpulE
         Lx0A==
X-Forwarded-Encrypted: i=1; AJvYcCUO8gMQLn7qS3E6+XS5NCBKCfQvrSZFYkDJeCMeOB9IR/ThM08j0+JP/JQO+F+abRm0qiFnDUnC6b3PYPS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/P8WL41sU3k4eEy7hQe43umpZK4jvx1ZDYYOHavnbWyzFnRD
	CaUMW68ZpHfaJBjItYtTjmF+oRz/PAL6VYdvgDuGL8V8PGdbu+5q7n8L
X-Gm-Gg: AZuq6aJhZYPap/BLhNAP2zwXhdHD0kuoRKVQ3gfFIY/d5Z89sDIhZeh4ObwgB+dKEpd
	UAzd2IG8WqG+dHG8SBLDCPvoFmdiDDPc+K3b9e6FvfYn4rkAUWKe5BKwcAtez1yLSJXXeHx2XBn
	3yZkVzErm+RbyWgPGu7M+QlhxqVcPHiZY6arMAvr8byU576qfTyeGzwJ6iKx1QHXuHe9mdqTlUU
	P51+jtra65G8BAKFjXRAShGMaEkDljDa0Cnenw3qLhQI0+om05/onUaHQqNI27TP4VfxS5bS/Xv
	NxSHWN5e0fkMq1UkFFR11i3bGeLoND5EhPfc93F5XsNxVbo84U+MoxLmJg/DyqUm6jkLdiBj/rt
	TRW7cwRHVF0aUTj8Mfx5EDEn4qf6S5Fmp0vlBNvBh6Lhvp9FTgRxXSllDx5ypohdZDK9dUbLv+f
	iyf884Y21PX+KZVxYWGkGivjwUq6G5fpcr74XIx1lgXJif+gsOxmaQ/ItMN58hZ5DX9hJS6WB/j
	AsZ+4HDVVEG+bk=
X-Received: by 2002:a05:620a:408c:b0:8c6:a539:55d4 with SMTP id af79cd13be357-8cb28041932mr174538085a.48.1770775426955;
        Tue, 10 Feb 2026 18:03:46 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b20f5desm9522785a.41.2026.02.10.18.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 10/10] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Tue, 10 Feb 2026 21:03:02 -0500
Message-ID: <20260211020302.2674-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92552-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F188120A43
X-Rspamd-Action: no action

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..6fe111e6d686 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -217,9 +217,11 @@
 #define CDC_A_RX_HPH_BIAS_LDO_OCP	(0xf195)
 #define CDC_A_RX_HPH_BIAS_CNP		(0xf196)
 #define CDC_A_RX_HPH_CNP_EN		(0xf197)
+#define CDC_A_RX_HPH_L_TEST		(0xf19A)
 #define CDC_A_RX_HPH_L_PA_DAC_CTL	(0xf19B)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_MASK	BIT(1)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_RESET	BIT(1)
+#define CDC_A_RX_HPH_R_TEST		(0xf19C)
 #define CDC_A_RX_HPH_R_PA_DAC_CTL	(0xf19D)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET	BIT(1)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET_MASK BIT(1)
@@ -696,6 +698,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* wait 20 ms after the digital codec has powered down */
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int pm8916_wcd_analog_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_RX_COM_OCP_CTL, 0xD1},
 	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
@@ -883,11 +938,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
 	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
 
-	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphl_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
 	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-	SND_SOC_DAPM_PGA("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphr_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHR", SND_SOC_NOPM, 0, 0, &hphr_mux),
 	SND_SOC_DAPM_MIXER("HPHR DAC", CDC_A_RX_HPH_R_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-- 
2.53.0


