Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66AD4744BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 15:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhLNOWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 09:22:50 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:32297 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbhLNOWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 09:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491756;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=nK1WI/n5WJTnKoFcfera4gLZkWVqZW1oe5BBzB4Dcuo=;
    b=e2jcaIpBwW/gjK+Wrev+TvSAp2KUSBzwJMDosivaYYohMOPejnp+EI3O3GOb4bNnRr
    bVGriNq7ub/7G9ZdGvKTvdjMsg7UOX2f11il6jzKLEYVdp+qgR3w3l/mO8vWJT+Ekdce
    N5wC18lSqySEgNC8wsCNsniqOq3Gsvc/qX0PUaxVcLgq9nmcbZoLwygE5Kok6TF1kgNg
    Si6U5EJIVJU+pqn2Ivcfn9m9UtECynpaJEY50RaP9aUuf8C+BXerKr7rK4vE1NtqdMae
    Vj7i0+RYZiWGsBWb6bvyT8KTmm152DiSPeb7CpDCaOsWX136tkN9r6ngsf4UNkWBLhKA
    83Hw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEEMZ8rY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 15:22:35 +0100 (CET)
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
Subject: [PATCH 3/4] ASoC: qcom: common: Parse "pin-switches" and "widgets" from DT
Date:   Tue, 14 Dec 2021 15:20:48 +0100
Message-Id: <20211214142049.20422-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the DT helpers in the ASoC core to parse the "pin-switches" and
"widgets" properties from the device tree. This allows adding extra
mixers to disable e.g. an extra speaker amplifier that would be
normally powered on automatically because it is connected to a shared
output pin.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 2e1c618f7529..eff134785051 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -26,6 +26,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		return ret;
 	}
 
+	if (of_property_read_bool(dev->of_node, "widgets")) {
+		ret = snd_soc_of_parse_audio_simple_widgets(card, "widgets");
+		if (ret)
+			return ret;
+	}
+
 	/* DAPM routes */
 	if (of_property_read_bool(dev->of_node, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
@@ -39,6 +45,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			return ret;
 	}
 
+	ret = snd_soc_of_parse_pin_switches(card, "pin-switches");
+	if (ret)
+		return ret;
+
 	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
 	if (ret)
 		return ret;
-- 
2.34.1

