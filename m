Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF094744B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 15:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbhLNOWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 09:22:48 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:34840 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhLNOWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 09:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491754;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6aX5FukNEbV8lAwrXLIZfZ57AcaJYjqx6+qwBSxjjvQ=;
    b=NQFkzJoUlyV6nD41jiA17f+q4eR75amdaaW2AkCYJuWz+CXV74mEteC8gviha+CZkx
    7Q6uDT87GlkqGtLoshRpZYT+Y/OPUKyQUoUfm/yyCTnDEqI1Eeu2isjPHz3qu2A/ht3F
    175lEPp9ETRFBNqsOkfkZ126c/8prZbZvTK/MU4XHkHe3hjjspT8YZ1uLoTi1M7G7nMj
    kAbbYtVHM1S6f/sT0XhchQrHphsw9tLmnbR2WQJ7BZ33lJZBxHjwlilQu6FBL1bWZQXF
    EDOFhb7QRaRdY8yrql45Nz3b+izdDDw/UULG/TSAtPpFJvJTh4dClSz2E3ZyerbIh8Oh
    jVjw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEEMY8rW
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 15:22:34 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Paul Cercueil <paul@crapouillou.net>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] ASoC: core: Add snd_soc_of_parse_pin_switches() from simple-card-utils
Date:   Tue, 14 Dec 2021 15:20:46 +0100
Message-Id: <20211214142049.20422-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ASoC core already has several helpers to parse card properties
from the device tree. Move the parsing code for "pin-switches" from
simple-card-utils to a shared snd_soc_of_parse_pin_switches() function
so other drivers can also use it to set up pin switches configured in
the device tree.

Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/sound/soc.h                   |  1 +
 sound/soc/generic/simple-card-utils.c | 45 +-----------------------
 sound/soc/soc-core.c                  | 50 +++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8e6dd8a257c5..061570048484 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1213,6 +1213,7 @@ int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname);
 int snd_soc_of_parse_audio_simple_widgets(struct snd_soc_card *card,
 					  const char *propname);
+int snd_soc_of_parse_pin_switches(struct snd_soc_card *card, const char *prop);
 int snd_soc_of_get_slot_mask(struct device_node *np,
 			     const char *prop_name,
 			     unsigned int *mask);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 850e968677f1..a81323d1691d 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -499,57 +499,14 @@ EXPORT_SYMBOL_GPL(asoc_simple_parse_widgets);
 int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix)
 {
-	const unsigned int nb_controls_max = 16;
-	const char **strings, *control_name;
-	struct snd_kcontrol_new *controls;
-	struct device *dev = card->dev;
-	unsigned int i, nb_controls;
 	char prop[128];
-	int ret;
 
 	if (!prefix)
 		prefix = "";
 
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "pin-switches");
 
-	if (!of_property_read_bool(dev->of_node, prop))
-		return 0;
-
-	strings = devm_kcalloc(dev, nb_controls_max,
-			       sizeof(*strings), GFP_KERNEL);
-	if (!strings)
-		return -ENOMEM;
-
-	ret = of_property_read_string_array(dev->of_node, prop,
-					    strings, nb_controls_max);
-	if (ret < 0)
-		return ret;
-
-	nb_controls = (unsigned int)ret;
-
-	controls = devm_kcalloc(dev, nb_controls,
-				sizeof(*controls), GFP_KERNEL);
-	if (!controls)
-		return -ENOMEM;
-
-	for (i = 0; i < nb_controls; i++) {
-		control_name = devm_kasprintf(dev, GFP_KERNEL,
-					      "%s Switch", strings[i]);
-		if (!control_name)
-			return -ENOMEM;
-
-		controls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		controls[i].name = control_name;
-		controls[i].info = snd_soc_dapm_info_pin_switch;
-		controls[i].get = snd_soc_dapm_get_pin_switch;
-		controls[i].put = snd_soc_dapm_put_pin_switch;
-		controls[i].private_value = (unsigned long)strings[i];
-	}
-
-	card->controls = controls;
-	card->num_controls = nb_controls;
-
-	return 0;
+	return snd_soc_of_parse_pin_switches(card, prop);
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index dcf6be4c4aaa..c714b0f63fcc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2824,6 +2824,56 @@ int snd_soc_of_parse_audio_simple_widgets(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_audio_simple_widgets);
 
+int snd_soc_of_parse_pin_switches(struct snd_soc_card *card, const char *prop)
+{
+	const unsigned int nb_controls_max = 16;
+	const char **strings, *control_name;
+	struct snd_kcontrol_new *controls;
+	struct device *dev = card->dev;
+	unsigned int i, nb_controls;
+	int ret;
+
+	if (!of_property_read_bool(dev->of_node, prop))
+		return 0;
+
+	strings = devm_kcalloc(dev, nb_controls_max,
+			       sizeof(*strings), GFP_KERNEL);
+	if (!strings)
+		return -ENOMEM;
+
+	ret = of_property_read_string_array(dev->of_node, prop,
+					    strings, nb_controls_max);
+	if (ret < 0)
+		return ret;
+
+	nb_controls = (unsigned int)ret;
+
+	controls = devm_kcalloc(dev, nb_controls,
+				sizeof(*controls), GFP_KERNEL);
+	if (!controls)
+		return -ENOMEM;
+
+	for (i = 0; i < nb_controls; i++) {
+		control_name = devm_kasprintf(dev, GFP_KERNEL,
+					      "%s Switch", strings[i]);
+		if (!control_name)
+			return -ENOMEM;
+
+		controls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+		controls[i].name = control_name;
+		controls[i].info = snd_soc_dapm_info_pin_switch;
+		controls[i].get = snd_soc_dapm_get_pin_switch;
+		controls[i].put = snd_soc_dapm_put_pin_switch;
+		controls[i].private_value = (unsigned long)strings[i];
+	}
+
+	card->controls = controls;
+	card->num_controls = nb_controls;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_parse_pin_switches);
+
 int snd_soc_of_get_slot_mask(struct device_node *np,
 			     const char *prop_name,
 			     unsigned int *mask)
-- 
2.34.1

