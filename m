Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26A2815604D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgBGU6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:58:45 -0500
Received: from mail.serbinski.com ([162.218.126.2]:46960 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgBGU6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:58:44 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 53BA1D00725;
        Fri,  7 Feb 2020 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Wy_gu-ayd8MR; Fri,  7 Feb 2020 15:50:34 -0500 (EST)
Received: from anet (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca [142.112.15.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 135DFD00716;
        Fri,  7 Feb 2020 15:50:28 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 135DFD00716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581108628;
        bh=K2MdRRtZpB4Txo2PfziKzlrlKIrsC2ebzByAwXpZmVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2smk52nQv3+OTl3zpA97hLFp9Fba8Ay/u/4sP4/D3VrcWlKlOZ+tnUOAMETCd3m2V
         Pd12mwqhEn1Ri/o1P2FuW64VysYKAXnq4yFuQ2w8TQ3gdZJYpqoZd5BxTmhD2+bXFM
         /9+l6xqTRyCZusnujvfxQg5JA7UZ6l45YxWqNLwQ=
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Adam Serbinski <adam@serbinski.com>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] ASoC: qcom: apq8096: add kcontrols to set PCM rate
Date:   Fri,  7 Feb 2020 15:50:13 -0500
Message-Id: <20200207205013.12274-9-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes it possible for the backend sample rate to be
set to 8000 or 16000 Hz, depending on the needs of the HFP
call being set up.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 sound/soc/qcom/apq8096.c | 92 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 1edcaa15234f..882f2c456321 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -16,6 +16,9 @@
 #define MI2S_BCLK_RATE			1536000
 #define PCM_BCLK_RATE			1024000
 
+static int pri_pcm_sample_rate = 16000;
+static int quat_pcm_sample_rate = 16000;
+
 static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -33,10 +36,15 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 	switch (cpu_dai->id) {
 	case PRIMARY_PCM_RX:
 	case PRIMARY_PCM_TX:
+		rate->min = pri_pcm_sample_rate;
+		rate->max = pri_pcm_sample_rate;
+		channels->min = 1;
+		channels->max = 1;
+		break;
 	case QUATERNARY_PCM_RX:
 	case QUATERNARY_PCM_TX:
-		rate->min = 16000;
-		rate->max = 16000;
+		rate->min = quat_pcm_sample_rate;
+		rate->max = quat_pcm_sample_rate;
 		channels->min = 1;
 		channels->max = 1;
 		break;
@@ -121,6 +129,83 @@ static struct snd_soc_ops apq8096_ops = {
 	.startup = msm_snd_startup,
 };
 
+static char const *pcm_sample_rate_text[] = {"8 kHz", "16 kHz"};
+static const struct soc_enum pcm_snd_enum =
+		SOC_ENUM_SINGLE_EXT(2, pcm_sample_rate_text);
+
+static int get_sample_rate_idx(int sample_rate)
+{
+	int sample_rate_idx = 0;
+
+	switch (sample_rate) {
+	case 8000:
+		sample_rate_idx = 0;
+		break;
+	case 16000:
+	default:
+		sample_rate_idx = 1;
+		break;
+	}
+
+	return sample_rate_idx;
+}
+
+static int pri_pcm_sample_rate_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] =
+		get_sample_rate_idx(pri_pcm_sample_rate);
+	return 0;
+}
+
+static int quat_pcm_sample_rate_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] =
+		get_sample_rate_idx(quat_pcm_sample_rate);
+	return 0;
+}
+
+static int get_sample_rate(int idx)
+{
+	int sample_rate_val = 0;
+
+	switch (idx) {
+	case 0:
+		sample_rate_val = 8000;
+		break;
+	case 1:
+	default:
+		sample_rate_val = 16000;
+		break;
+	}
+
+	return sample_rate_val;
+}
+
+static int pri_pcm_sample_rate_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	pri_pcm_sample_rate =
+		get_sample_rate(ucontrol->value.integer.value[0]);
+	return 0;
+}
+
+static int quat_pcm_sample_rate_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	quat_pcm_sample_rate =
+		get_sample_rate(ucontrol->value.integer.value[0]);
+	return 0;
+}
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_ENUM_EXT("PRI_PCM SampleRate", pcm_snd_enum,
+		     pri_pcm_sample_rate_get, pri_pcm_sample_rate_put),
+	SOC_ENUM_EXT("QUAT_PCM SampleRate", pcm_snd_enum,
+		     quat_pcm_sample_rate_get, quat_pcm_sample_rate_put),
+};
+
 static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
@@ -182,6 +267,9 @@ static int apq8096_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_card_register;
 
+	snd_soc_add_card_controls(card, card_controls,
+				  ARRAY_SIZE(card_controls));
+
 	return 0;
 
 err_card_register:
-- 
2.21.1

