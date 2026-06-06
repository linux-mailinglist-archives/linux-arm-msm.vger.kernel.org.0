Return-Path: <linux-arm-msm+bounces-111529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ONzoOlJ2JGpS6wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:34:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3664E230
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:34:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=VaNVSolt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111529-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111529-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFD4030157C9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 19:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA93AD520;
	Sat,  6 Jun 2026 19:34:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com [220.197.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD82F3C19;
	Sat,  6 Jun 2026 19:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774479; cv=none; b=fBpHNcPWlz9U2khBtk2xzHEtLmGzUGWJH7hjtjFwPXrg3kSk9IKpjMuGNypEN3ffl138O68BIUjV0UihhxuTKmzRK6nWxHCuHuvzqZ/ie5B72F+SMIOsw2BksHqjnN419nPcUCpdeJIG78uncUQhCq3tGR7aFPHOsl5rDDpS2Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774479; c=relaxed/simple;
	bh=Gl51sjsifnBfgDdxUg9x0+j1Uce4+RbbPp32hAjw8m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzqD9Fkxg0rpiOY7pEglUxiLlZEwLeLDL38sXGQ7EzECl9nGfYW+3YW+BN6YDKk4eQLDNatbLyCQDmQuaET/wYUvyxQwiWSETH/kf1aQekNpXwlhYxN1NBJK/0HWJin2Txcu5EduJTFlYjoDOaa80fH+z1HWVqlv3anmToybOUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=VaNVSolt; arc=none smtp.client-ip=220.197.31.110
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a25045;
	Sun, 7 Jun 2026 02:58:48 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 02:58:20 +0800
Subject: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=16979;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=Gl51sjsifnBfgDdxUg9x0+j1Uce4+RbbPp32hAjw8m8=;
 b=jwe9iwOk5K7EQ/HQgHKcojZjdeix15hlc4GuXfwFRWNWVOyIw8GD8UPXUmHNBxslobWF0E6b6
 ngNPSN3NoL6Bwm2GGqin0QvHCpUEKr7mL4hg9GOZcovMlmzzzSHTQn5
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d526209d5kunm343af971138afd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU0dVk1LQkhDHUkaTx8fGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=VaNVSolt942U2yVhuVysl2qdscNlALzw8VQAd8HaiybfF/BNdHKmphzwbiKCjgn7lr/Ui0u+OSbGwGXc33k/mKvCiTZtk3X6NsVq7Q2J9QUwj1t5Ht5OLHdIntAfVpXre/Zkpq+qOE2XTf5DVf4rqAzeQ5TKGm/C+UEftBHsqBI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=/kiPLtZFPm41HqQl20CWTW8cpvYZ4sOBg+VZBWrNsBQ=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111529-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E3664E230

The sc8280xp machine driver currently uses the OF match data only as a
driver name, which makes it difficult to describe board-specific MI2S
codec requirements.

Convert the match data to a per-card data structure and add data for
the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
format, MCLK rate, BE hardware parameters and headset jack pins.

Add a common headset jack helper which accepts board-specific DAPM pins
for codecs that are not connected through the WCD TX codec DMA path.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/common.c   |  75 ++++++++---
 sound/soc/qcom/common.h   |   6 +-
 sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 357 insertions(+), 43 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..5e7a01418ad8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -201,26 +201,30 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 };
 
-int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-			    struct snd_soc_jack *jack, bool *jack_setup)
+static int qcom_snd_headset_jack_init(struct snd_soc_card *card,
+				      struct snd_soc_jack *jack,
+				      bool *jack_setup,
+				      struct snd_soc_jack_pin *pins,
+				      unsigned int num_pins)
 {
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	int rval, i;
+	int rval;
+
+	if (!pins) {
+		pins = qcom_headset_jack_pins;
+		num_pins = ARRAY_SIZE(qcom_headset_jack_pins);
+	}
 
 	if (!*jack_setup) {
 		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
-					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
-					     SND_JACK_MECHANICAL |
-					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
-					     jack, qcom_headset_jack_pins,
-					     ARRAY_SIZE(qcom_headset_jack_pins));
+						  SND_JACK_HEADSET | SND_JACK_LINEOUT |
+						  SND_JACK_MECHANICAL |
+						  SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						  SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+						  SND_JACK_BTN_4 | SND_JACK_BTN_5,
+						  jack, pins, num_pins);
 
 		if (rval < 0) {
-			dev_err(card->dev, "Unable to add Headphone Jack\n");
+			dev_err(card->dev, "Unable to add Headset Jack\n");
 			return rval;
 		}
 
@@ -231,6 +235,48 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 		*jack_setup = true;
 	}
 
+	return 0;
+}
+
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack,
+				bool *jack_setup,
+				struct snd_soc_jack_pin *pins,
+				unsigned int num_pins)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup,
+					  pins, num_pins);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_headset_jack_setup);
+
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup, NULL, 0);
+	if (rval)
+		return rval;
+
 	switch (cpu_dai->id) {
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
@@ -250,7 +296,6 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 		break;
 	}
 
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..6d023f76f27e 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -10,10 +10,14 @@
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack,
+				bool *jack_setup,
+				struct snd_soc_jack_pin *pins,
+				unsigned int num_pins);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
 
-
 #endif
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..1ccd7437cc52 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -15,26 +15,127 @@
 #include "common.h"
 #include "sdw.h"
 
+struct sc8280xp_mi2s_codec_config {
+	unsigned int cpu_dai_id;
+	unsigned int dai_fmt;
+	unsigned int sysclk_rate;
+};
+
+struct sc8280xp_be_hw_params {
+	unsigned int rate;
+	snd_pcm_format_t format;
+	unsigned int channels_min;
+	unsigned int channels_max;
+};
+
+struct sc8280xp_be_hw_params_config {
+	unsigned int cpu_dai_id;
+	struct sc8280xp_be_hw_params hw_params;
+};
+
+struct sc8280xp_sndcard_data {
+	const char *driver_name;
+	struct sc8280xp_be_hw_params default_be_hw_params;
+	const struct sc8280xp_mi2s_codec_config *mi2s_codec_configs;
+	int num_mi2s_codec_configs;
+	const struct sc8280xp_be_hw_params_config *be_hw_params_configs;
+	int num_be_hw_params_configs;
+	const unsigned int *headset_jack_dais;
+	int num_headset_jack_dais;
+	struct snd_soc_jack_pin *headset_jack_pins;
+	unsigned int num_headset_jack_pins;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	const struct sc8280xp_sndcard_data *card_data;
 	bool jack_setup;
 };
 
+static const struct sc8280xp_mi2s_codec_config *
+sc8280xp_snd_get_mi2s_codec_config(const struct sc8280xp_sndcard_data *card_data,
+				   unsigned int cpu_dai_id)
+{
+	int i;
+
+	for (i = 0; i < card_data->num_mi2s_codec_configs; i++) {
+		if (card_data->mi2s_codec_configs[i].cpu_dai_id == cpu_dai_id)
+			return &card_data->mi2s_codec_configs[i];
+	}
+
+	return NULL;
+}
+
+static const struct sc8280xp_be_hw_params *
+sc8280xp_snd_get_be_hw_params(const struct sc8280xp_sndcard_data *card_data,
+			      unsigned int cpu_dai_id)
+{
+	int i;
+
+	for (i = 0; i < card_data->num_be_hw_params_configs; i++) {
+		if (card_data->be_hw_params_configs[i].cpu_dai_id == cpu_dai_id)
+			return &card_data->be_hw_params_configs[i].hw_params;
+	}
+
+	return NULL;
+}
+
+static bool sc8280xp_snd_is_headset_jack_dai(const struct sc8280xp_sndcard_data *card_data,
+					     unsigned int cpu_dai_id)
+{
+	int i;
+
+	for (i = 0; i < card_data->num_headset_jack_dais; i++) {
+		if (card_data->headset_jack_dais[i] == cpu_dai_id)
+			return true;
+	}
+
+	return false;
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	const struct sc8280xp_sndcard_data *card_data = data->card_data;
+	const struct sc8280xp_mi2s_codec_config *mi2s_config;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
+	int i, ret;
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
 		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+
+		mi2s_config = sc8280xp_snd_get_mi2s_codec_config(card_data,
+								 cpu_dai->id);
+		if (mi2s_config) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				if (mi2s_config->dai_fmt) {
+					ret = snd_soc_dai_set_fmt(codec_dai,
+								  mi2s_config->dai_fmt);
+					if (ret && ret != -ENOTSUPP)
+						return ret;
+				}
+
+				if (mi2s_config->sysclk_rate) {
+					ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+								     mi2s_config->sysclk_rate,
+								     SND_SOC_CLOCK_IN);
+					if (ret && ret != -ENOTSUPP)
+						return dev_err_probe(card->dev, ret,
+								     "%s: failed to set sysclk for %s\n",
+								     rtd->dai_link->name,
+								     codec_dai->name);
+				}
+			}
+		}
 		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
@@ -64,34 +165,56 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
+	if (sc8280xp_snd_is_headset_jack_dai(card_data, cpu_dai->id))
+		return qcom_snd_headset_jack_setup(rtd, &data->jack,
+						   &data->jack_setup,
+						   card_data->headset_jack_pins,
+						   card_data->num_headset_jack_pins);
+
+	if (card_data->headset_jack_dais)
+		return 0;
+
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				     struct snd_pcm_hw_params *params)
+				       struct snd_pcm_hw_params *params)
 {
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	const struct sc8280xp_sndcard_data *card_data = data->card_data;
+	const struct sc8280xp_be_hw_params *be_hw_params;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_interval *rate = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	bool use_default = false;
 
-	rate->min = rate->max = 48000;
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
-	channels->min = 2;
-	channels->max = 2;
-	switch (cpu_dai->id) {
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		channels->min = 1;
-		break;
-	default:
-		break;
+	be_hw_params = sc8280xp_snd_get_be_hw_params(card_data, cpu_dai->id);
+	if (!be_hw_params) {
+		be_hw_params = &card_data->default_be_hw_params;
+		use_default = true;
 	}
 
+	rate->min = be_hw_params->rate;
+	rate->max = be_hw_params->rate;
+	snd_mask_set_format(fmt, be_hw_params->format);
+	channels->min = be_hw_params->channels_min;
+	channels->max = be_hw_params->channels_max;
+
+	if (use_default) {
+		switch (cpu_dai->id) {
+		case TX_CODEC_DMA_TX_0:
+		case TX_CODEC_DMA_TX_1:
+		case TX_CODEC_DMA_TX_2:
+		case TX_CODEC_DMA_TX_3:
+			channels->min = 1;
+			break;
+		default:
+			break;
+		}
+	}
 
 	return 0;
 }
@@ -146,36 +269,178 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->card_data = of_device_get_match_data(dev);
+	if (!data->card_data)
+		return -EINVAL;
 
 	card->dev = dev;
+	card->driver_name = data->card_data->driver_name;
+
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+#define SC8280XP_SND_DATA(_driver_name)				\
+	.driver_name = _driver_name,				\
+	.default_be_hw_params = {				\
+		.rate = 48000,					\
+		.format = SNDRV_PCM_FORMAT_S16_LE,		\
+		.channels_min = 2,				\
+		.channels_max = 2,				\
+	}
+
+static const struct sc8280xp_sndcard_data kaanapali_data = {
+	SC8280XP_SND_DATA("kaanapali"),
+};
+
+static const struct sc8280xp_sndcard_data qcm6490_data = {
+	SC8280XP_SND_DATA("qcm6490"),
+};
+
+static const struct sc8280xp_sndcard_data qcs615_data = {
+	SC8280XP_SND_DATA("qcs615"),
+};
+
+static const struct sc8280xp_sndcard_data qcs6490_data = {
+	SC8280XP_SND_DATA("qcs6490"),
+};
+
+static const struct sc8280xp_sndcard_data qcs8300_data = {
+	SC8280XP_SND_DATA("qcs8300"),
+};
+
+static const struct sc8280xp_mi2s_codec_config qcs6490_rubikpi3_mi2s_codec_configs[] = {
+	{
+		.cpu_dai_id = PRIMARY_MI2S_RX,
+		.dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			   SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_I2S,
+		.sysclk_rate = 19200000,
+	},
+	{
+		.cpu_dai_id = PRIMARY_MI2S_TX,
+		.dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			   SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_I2S,
+		.sysclk_rate = 19200000,
+	},
+};
+
+static const unsigned int qcs6490_rubikpi3_headset_jack_dais[] = {
+	PRIMARY_MI2S_RX,
+};
+
+static struct snd_soc_jack_pin qcs6490_rubikpi3_headset_jack_pins[] = {
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+};
+
+static const struct sc8280xp_be_hw_params_config qcs6490_rubikpi3_be_hw_params_configs[] = {
+	{
+		.cpu_dai_id = PRIMARY_MI2S_TX,
+		.hw_params = {
+			.rate = 48000,
+			.format = SNDRV_PCM_FORMAT_S16_LE,
+			.channels_min = 2,
+			.channels_max = 2,
+		},
+	},
+	{
+		.cpu_dai_id = QUATERNARY_MI2S_RX,
+		.hw_params = {
+			.rate = 48000,
+			.format = SNDRV_PCM_FORMAT_S16_LE,
+			.channels_min = 2,
+			.channels_max = 2,
+		},
+	},
+	{
+		.cpu_dai_id = TERTIARY_MI2S_RX,
+		.hw_params = {
+			.rate = 48000,
+			.format = SNDRV_PCM_FORMAT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 2,
+		},
+	},
+	{
+		.cpu_dai_id = TERTIARY_MI2S_TX,
+		.hw_params = {
+			.rate = 48000,
+			.format = SNDRV_PCM_FORMAT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+	},
+};
+
+static const struct sc8280xp_sndcard_data qcs6490_rubikpi3_data = {
+	SC8280XP_SND_DATA("qcs6490"),
+	.mi2s_codec_configs = qcs6490_rubikpi3_mi2s_codec_configs,
+	.num_mi2s_codec_configs = ARRAY_SIZE(qcs6490_rubikpi3_mi2s_codec_configs),
+	.be_hw_params_configs = qcs6490_rubikpi3_be_hw_params_configs,
+	.num_be_hw_params_configs = ARRAY_SIZE(qcs6490_rubikpi3_be_hw_params_configs),
+	.headset_jack_dais = qcs6490_rubikpi3_headset_jack_dais,
+	.num_headset_jack_dais = ARRAY_SIZE(qcs6490_rubikpi3_headset_jack_dais),
+	.headset_jack_pins = qcs6490_rubikpi3_headset_jack_pins,
+	.num_headset_jack_pins = ARRAY_SIZE(qcs6490_rubikpi3_headset_jack_pins),
+};
+
+static const struct sc8280xp_sndcard_data sa8775p_data = {
+	SC8280XP_SND_DATA("sa8775p"),
+};
+
+static const struct sc8280xp_sndcard_data sc8280xp_data = {
+	SC8280XP_SND_DATA("sc8280xp"),
+};
+
+static const struct sc8280xp_sndcard_data sm8450_data = {
+	SC8280XP_SND_DATA("sm8450"),
+};
+
+static const struct sc8280xp_sndcard_data sm8550_data = {
+	SC8280XP_SND_DATA("sm8550"),
+};
+
+static const struct sc8280xp_sndcard_data sm8650_data = {
+	SC8280XP_SND_DATA("sm8650"),
+};
+
+static const struct sc8280xp_sndcard_data sm8750_data = {
+	SC8280XP_SND_DATA("sm8750"),
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &qcs6490_rubikpi3_data },
+	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_data },
+	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_data },
+	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_data },
+	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_data },
+	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8300_data },
+	{ .compatible = "qcom,qcs9075-sndcard", .data = &sa8775p_data },
+	{ .compatible = "qcom,qcs9100-sndcard", .data = &sa8775p_data },
+	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_data },
+	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_data },
+	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_data },
+	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_data },
+	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_data },
 	{}
 };
 

-- 
2.43.0


