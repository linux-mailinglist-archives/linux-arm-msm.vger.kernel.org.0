Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDD34744BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 15:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbhLNOWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 09:22:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:10561 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbhLNOWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 09:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491757;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rqTxYtVdT2CQO9CQ1pRwiHxb/3QwziCt4kGrC57s9rI=;
    b=m/GhDGZF8OjyKObcEpPiOrD7Plmcd3e7SzWPRO+vjYs2T5vzaMMntXf0oTYCLPl0gY
    K+9rt2uDVTRZ7oPa4m0gASCrzKpKXJtEWF+jpzHGyUueVRBF10nSpvXwbDJJCiD87Ho8
    YUYLMBK5nimqTSaJFh325GP+7GVGuFS1CK5ilb7oUgJ0Ve0oELADnXaElBqQA3IvlaDi
    cIsM7IK6Z83wFT9YB+STwLjXOrh+3xTNNawIgVkW7fzLANEcTHhzovJV1ePZ5c0+39TL
    WuJqaySB/XsWSIYNh0MyVcBG/1KKZg8W1PxIRCosMtCa5Yol52wOb/l+AMk5SmUSbUCl
    NT2A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEEMa8rZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 15:22:36 +0100 (CET)
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
Subject: [PATCH 4/4] ASoC: msm8916-wcd-analog: Use separate outputs for HPH_L/HPH_R
Date:   Tue, 14 Dec 2021 15:20:49 +0100
Message-Id: <20211214142049.20422-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The analog codec has separate output paths for the left headphone channel
(HPH_L) and the right headphone channel (HPH_R). While they are usually
used together for actual headphones output, some devices also have an
analog speaker amplifier connected to one of the headphone channels.

To allow modelling that properly (and to avoid powering on the unneeded
output path), HPH_L and HPH_R should be represented by separate outputs
rather than a shared HEADPHONE output that always activates both paths.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 3ddd822240e3..485cda46dbb9 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -822,8 +822,8 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"EAR PA", NULL, "EAR CP"},
 
 	/* Headset (RX MIX1 and RX MIX2) */
-	{"HEADPHONE", NULL, "HPHL PA"},
-	{"HEADPHONE", NULL, "HPHR PA"},
+	{"HPH_L", NULL, "HPHL PA"},
+	{"HPH_R", NULL, "HPHR PA"},
 
 	{"HPHL DAC", NULL, "EAR_HPHL_CLK"},
 	{"HPHR DAC", NULL, "EAR_HPHR_CLK"},
@@ -870,7 +870,8 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("AMIC3"),
 	SND_SOC_DAPM_INPUT("AMIC2"),
 	SND_SOC_DAPM_OUTPUT("EAR"),
-	SND_SOC_DAPM_OUTPUT("HEADPHONE"),
+	SND_SOC_DAPM_OUTPUT("HPH_L"),
+	SND_SOC_DAPM_OUTPUT("HPH_R"),
 
 	/* RX stuff */
 	SND_SOC_DAPM_SUPPLY("INT_LDO_H", SND_SOC_NOPM, 1, 0, NULL, 0),
-- 
2.34.1

