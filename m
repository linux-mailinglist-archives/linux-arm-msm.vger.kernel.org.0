Return-Path: <linux-arm-msm+bounces-105503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCXcLAbI9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:34:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B94AD9D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD5B130421FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320613D16F4;
	Fri,  1 May 2026 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0agkG4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1A3D093C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649581; cv=none; b=DOQ7GVmE9xPRfZvebDfV8kLBztwyErxCyxUEp+6D1fX/T1OPcFEL16Jp8OXCcWLBxirszdOD48xQvhBBGseYS2CfrNcmKEZaVRt12IEiDbntlVaYc+++sYJzjLYH2lDHSoqGzmMXW0+VZ3Mp6OlbWyuJRN1ZsNhiH5AMoO+M9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649581; c=relaxed/simple;
	bh=lSUFMq9Iap1rdJNlT3oDAV2LcIWyyogUVtvmIuYB+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/PSjBvUtvLjVolabopZJdBQ2QVoZ0sRD20HXZP1HZvlNENvm1wCXjSgCdycNZb2yJXD1UNeeWH05yAa+N5OYdngT5/5Ielee1XRuRUwLgJ/tTMCqF9Qz8zOhSg7DAaZzefH352Amb70HLz5+XuRzJY6Avcxq1bHDJod/3CFETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0agkG4a; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5102582e237so15710211cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649578; x=1778254378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=N0agkG4aoJWXLc22wgN7sojkUTwyxhc2QBkLSJA67Sx7fivlkVyvfuopX9/JtkytXM
         //ZNzumgluO39NXCNQ47AJZNhf6sst/HxXl6YlJlYCX7QdE4X/PWyOggrbCECQUn3CkS
         s579V8DsfVdI9pNaXoKIOEdZxVFTAkxxLcrC8dkGtvByz/XLrtPNe/3ZJfgPyIzbaEPw
         MVXHyxMolAQflZ6rpo7d6xIYEHR3sX9AjYRw5TQtW/6oxhmRssIoThiu8YMruWXEKnoP
         QjUVMZoOePuPpGwR75gRkRlsUZTWdtU0IAzhWeg56bOzJ9J0/IgTfcCAcbgZmvbl8FQd
         7V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649578; x=1778254378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=FYv+VIeMZgYXTco3goNrWIjE6qGWPYz0/FPt0Quy0kZBXCoLi8ydoKgO+Ebgtrcjma
         t0SsXJcqt6Wc0krrzSQ4kDcmSPSuUPaCnppteTnQqea4Aq7uKRF13S6lRhU3qaxRSC3i
         qEcgeCD6gB6BIukXvtZ2aCTJW+BskU+86wbGbXVldK//Pizxa/cqq/sKv8o/nBOp1C1z
         z+jIhEuzrkQblsD1q5GMhwYwzFziKUOrexyF4WvMqWw8rORUTAZiszE4UBx+Eln0BBhr
         IwlIEvl1tGwV48ZrFbE2ioneobfA4tdRpFXuR8+x+BTqRpDoouEYFRZ7ajzza8nNNtqb
         lRFA==
X-Forwarded-Encrypted: i=1; AFNElJ9qRTRaLi+YbZT7t4V3rj47cbiOvJ8T7nirKMbZM2ikOc7coq70uT1TDFfwNQHdqdHAVNcYfA88EcDZAG0I@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/zpgQOJTIIgY4R7mzHymZ73iAFvSNKzwrvbtRnJzHx4x34FV
	guRLulAyM+z3kFuruuVTUvzYzKRP8vT6xiQvvw+XfHF0Ckq6hYtuUg9e
X-Gm-Gg: AeBDieuO6ErloTTFNa+g1ltE+k5eJc49ri6AXWDkqu27AoJcqSCgLrQYrXbTDrhyPax
	xWde2awP3h8gaOJ5ifGWofe3jGp6B8BS8i2FA2f2SIlib99qux5puoSDrjFSM7KbVroiPwexcMY
	VCpcJ0H10NWT2cLdKI1o4mVg8j3gRBQ4EaOQTwsDl4kicFv98bNFmiH+7jO4Lr/0hFDrqtsxek1
	yod7TCNGYY+D36Bsyb8mgSVkMIyA4HvP6h2jSAPGRGM8MtiiFqAL/VLHrnG+J3F/WdUj4eXF2xM
	Ll9xx+pvmqmfwCs7L0vznqFfez8Mf9KEAEsbpHB0ZHBk0fHAt7xBykrsSEd0YhbjH1FCdvIR+pb
	CwydQVquMhJMr+OtcqizAuQ9Ks9CSFUSYSYYVqQJlqOvft2rM2UUnMUCl10zE5LnTvoPenX+/Bp
	7maBZjmCLSn2icRYbeNG0DKJoNfi2rDoAazDilVtlDbkHnpOyB2Li1/kVpoF7HDifWpRGiPyfQT
	PeRquRtmovvaWNvkLeRNstPjg==
X-Received: by 2002:a05:622a:1f0c:b0:50f:aff4:95f with SMTP id d75a77b69052e-5102ae261a6mr116396721cf.56.1777649578590;
        Fri, 01 May 2026 08:32:58 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc658sm26930626d6.27.2026.05.01.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Fri,  1 May 2026 11:31:28 -0400
Message-ID: <20260501153128.8152-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 300B94AD9D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105503-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..87f8a47cc293 100644
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
@@ -705,6 +707,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
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
@@ -954,11 +1009,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
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
2.54.0


