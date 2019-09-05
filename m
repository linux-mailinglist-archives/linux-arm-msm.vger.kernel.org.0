Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1C1AAA26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 19:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391090AbfIERjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 13:39:07 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:57708 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391042AbfIERjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 13:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=rtIzYqmrw6ZN5jUJED9NFhssAY92BE8w9JEYF5gkiiQ=; b=rFT+AfzP6j1d
        vPA3tZ9NYc5583rcj5/km5pZuvhXafzUgRgvbjt+jB181N6EYC98t0IoIHd5SGsR1QgIcCNrd/lOz
        4sKqrGeADbvr/B0jgFnF6843GCJF4S6vPPfL4EWtNZ+osndd1eQcC8QB2feAC5xGsnuiASzBKNA/u
        tUsOw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i5vih-0005HR-H1; Thu, 05 Sep 2019 17:38:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 0BF572742D07; Thu,  5 Sep 2019 18:38:55 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: qcom: common: Include link-name in error messages" to the asoc tree
In-Reply-To: <20190905040306.21399-1-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190905173855.0BF572742D07@ypsilon.sirena.org.uk>
Date:   Thu,  5 Sep 2019 18:38:55 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   ASoC: qcom: common: Include link-name in error messages

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1ab1b340f037760ec9944a9a4911e85f29fc6e2c Mon Sep 17 00:00:00 2001
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Wed, 4 Sep 2019 21:03:06 -0700
Subject: [PATCH] ASoC: qcom: common: Include link-name in error messages

Reading out the link-name earlier and including it in the various error
messages makes it much more convenient to figure out what links have
unmet dependencies.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20190905040306.21399-1-bjorn.andersson@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

