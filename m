Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6625A9928
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 06:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfIEEDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 00:03:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40458 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIEEDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 00:03:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so620454pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gzTkO0Rbhbc6qGDT4uIsvz+/20vaG5J88mBFRCtZ1I0=;
        b=UlWHaWw3ysvzZNAgX+b35OI9+m0ei8mMYZmwfZkhVK967RNE5uj2MIBkIHRATZ5esw
         qb2hPWTAVy6dFfKt9um30IWo4TxlIZ53AIWY/28YO0JO4StEDkqmHg80vf+RH6jcQLEz
         ZWb0ozANSR8EuLNR2PzNS6phOTLdfV9S/Q/P/YNrtoXg45wfaFcNPw+0BI/TIMwWp3WN
         kbyD3hUtDym4qEsogP3jw/HeyECxPiimveggDTcLyrotnFzwHZ7I9jVvypxJyOSQsYAS
         vX2rANBi1fBc+TFWVqqG5PhXk53W73VDFlESbnWLTqIV3+vpAm33Y01DXzE4l1o+yOkh
         G2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gzTkO0Rbhbc6qGDT4uIsvz+/20vaG5J88mBFRCtZ1I0=;
        b=rs+oyKfIDUKPYC8pPyjVNecGdvOsAE553fJmRszPcaBEowmw3TlI/LxaFudf7gA+Dw
         oVIW+owtxlAQ3EVFxNpcBZMYjY+d0PBFIj/+qlUsMV1vMtyENsUpBV57E2R+v9ZruSpc
         lhg78wi84MsFjv1BxJuhy9P+7kktEb54Tc0CqL6luSFhv+n5R1Zwi5aPIps+EPmWXZVk
         Myle2ouIs4kzNo8oWfz7ys7uwFyLZkLPWqEepE9JCW3wgx3wYxCLzs48zvKWHvGzaGgy
         EsrIgi1BsG/eFVPXYoD2UPSrmS90IjqD4KSAWnXqEnXhbT0BeEyk0I2K+jcUL5roySYP
         8rUg==
X-Gm-Message-State: APjAAAX3PQCC8jGPzQg0mXwjesNXPJJQgHknpAe1CKppgpIYzB8PMh6/
        QpG3KIZZoVIJXmeOh5R5bXKT7NynfFo=
X-Google-Smtp-Source: APXvYqyzIkvz0yA2lrEI0RaVsZGYFyE3s0khoYRmNK/psHtkaYkobCO80VWq1O/SIMOTnPn49zIaiQ==
X-Received: by 2002:aa7:8a13:: with SMTP id m19mr1324958pfa.228.1567656190065;
        Wed, 04 Sep 2019 21:03:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u9sm498058pjb.4.2019.09.04.21.03.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 21:03:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: qcom: common: Include link-name in error messages
Date:   Wed,  4 Sep 2019 21:03:06 -0700
Message-Id: <20190905040306.21399-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reading out the link-name earlier and including it in the various error
messages makes it much more convenient to figure out what links have
unmet dependencies.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/common.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 2c7348ddbbb3..6c20bdd850f3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -53,12 +53,18 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		link->num_cpus		= 1;
 		link->num_platforms	= 1;
 
+		ret = of_property_read_string(np, "link-name", &link->name);
+		if (ret) {
+			dev_err(card->dev, "error getting codec dai_link name\n");
+			goto err;
+		}
+
 		cpu = of_get_child_by_name(np, "cpu");
 		platform = of_get_child_by_name(np, "platform");
 		codec = of_get_child_by_name(np, "codec");
 
 		if (!cpu) {
-			dev_err(dev, "Can't find cpu DT node\n");
+			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
 			ret = -EINVAL;
 			goto err;
 		}
@@ -66,7 +72,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		ret = of_parse_phandle_with_args(cpu, "sound-dai",
 					"#sound-dai-cells", 0, &args);
 		if (ret) {
-			dev_err(card->dev, "error getting cpu phandle\n");
+			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
 			goto err;
 		}
 		link->cpus->of_node = args.np;
@@ -74,7 +80,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
-			dev_err(card->dev, "error getting cpu dai name\n");
+			dev_err(card->dev, "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
@@ -83,14 +89,14 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 					"sound-dai",
 					0);
 			if (!link->platforms->of_node) {
-				dev_err(card->dev, "platform dai not found\n");
+				dev_err(card->dev, "%s: platform dai not found\n", link->name);
 				ret = -EINVAL;
 				goto err;
 			}
 
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
-				dev_err(card->dev, "codec dai not found\n");
+				dev_err(card->dev, "%s: codec dai not found\n", link->name);
 				goto err;
 			}
 			link->no_pcm = 1;
@@ -110,12 +116,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		}
 
 		link->ignore_suspend = 1;
-		ret = of_property_read_string(np, "link-name", &link->name);
-		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err;
-		}
-
 		link->nonatomic = 1;
 		link->dpcm_playback = 1;
 		link->dpcm_capture = 1;
-- 
2.18.0

