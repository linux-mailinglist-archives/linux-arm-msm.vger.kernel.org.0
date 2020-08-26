Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AF0252AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 11:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgHZJwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 05:52:25 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:18383 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgHZJwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 05:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598435538;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=O63GLG7sddoCYObzLYc9FbVF3AO3J5EaI5KdyvqBGk8=;
        b=UcllnfKq1yVNS7T32C7+t0P7KJpcoMypmucocKm2PgWg9wPTUTQ0R0vN1pbvl8NWyg
        vgh3gzv84fGeCjLxluYRJsUkvbAZAcku9UYa8dbGuXZruOI1o2O2//u8rp0PncLmIfI6
        WxLDv7Ho8Md99afp4MGARbYgVt40T1C6bQckTGJwtav3EWRuD4INtHM0+YkI2TSVZ60Z
        lEY1UcxFmBz42xEVJmjDY4nxip+WysZYLKX+yTujBG3NCNSVeySKFZDTx+1uh2MqNxxK
        oGIZm/X1gCN+9j58IJ+gAJNUsSBkyoQxWqpZszwesIFjpOeu/NWHBPLOJSmAPBbQwr40
        +3Wg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6NYn8D"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7Q9qIl6W
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Aug 2020 11:52:18 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 2/2] ASoC: qcom: common: Parse auxiliary devices from device tree
Date:   Wed, 26 Aug 2020 11:51:41 +0200
Message-Id: <20200826095141.94017-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826095141.94017-1-stephan@gerhold.net>
References: <20200826095141.94017-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases we need to probe additional audio components that do
not appear as part of the DAI links specified in the device tree.
Examples for this are auxiliary devices such as analog amplifiers
or codecs.

The ASoC core provides a way to probe these components by adding
them to snd_soc_card->aux_dev. We can use the snd_soc_of_parse_aux_devs()
function to parse them from the device tree.

As an example for this, some MSM8916 smartphones have an analog
speaker amplifier connected to the HPHR output. With the new property
this can be modelled as follows:

	speaker-amp: audio-amplifier {
		compatible = "simple-audio-amplifier";
		enable-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
		sound-name-prefix = "Speaker Amp";
	};

	&sound {
		aux-devs = <&speaker_amp>;
		audio-routing = "Speaker Amp IN", "HPHR";
	};

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5194d90ddb96..fe6e778c31c0 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -39,6 +39,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			return ret;
 	}
 
+	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
+	if (ret)
+		return ret;
+
 	/* Populate links */
 	num_links = of_get_child_count(dev->of_node);
 
-- 
2.28.0

