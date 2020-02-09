Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FF2156B29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 16:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgBIPsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 10:48:36 -0500
Received: from mail.serbinski.com ([162.218.126.2]:32952 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727881AbgBIPsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 10:48:36 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 86E81D00716;
        Sun,  9 Feb 2020 15:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j742tjVpCIOM; Sun,  9 Feb 2020 10:48:24 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 5C22CD00717;
        Sun,  9 Feb 2020 10:48:10 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 5C22CD00717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581263290;
        bh=ETimvPxlhSv3UnHdR3sMFlCASzRDsVkv5A46uX4f778=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vkG/caFnE8m1E/W1a+a64GnTSi1zoYv2sl9AH9dQs5+ng5URuKdFHmgUDCD0d1eag
         xHralk0esT8FSs+YMIbay8uNkINY4y64fmmc7AxfHY/feKQiohFOdgBVv+DzpzMV/j
         dJD+IefZGnBM/T3l8QcNfT6vOJJd5KaGrhOy7XNU=
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
Subject: [PATCH v2 6/8] ASoC: qcom/common: Use snd-soc-dummy-dai when codec is not specified
Date:   Sun,  9 Feb 2020 10:47:46 -0500
Message-Id: <20200209154748.3015-7-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When not specifying a codec, use snd-soc-dummy-dai. This supports
the case where a fixed configuration codec is attached, such as
bluetooth hfp.

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
 sound/soc/qcom/common.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 6c20bdd850f3..aa2f2238aca0 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -84,7 +84,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
-		if (codec && platform) {
+		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
 					0);
@@ -94,10 +94,22 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 				goto err;
 			}
 
-			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
-			if (ret < 0) {
-				dev_err(card->dev, "%s: codec dai not found\n", link->name);
-				goto err;
+			if (codec) {
+				ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+				if (ret < 0) {
+					dev_err(card->dev, "%s: codec dai not found\n", link->name);
+					goto err;
+				}
+			} else {
+				dlc = devm_kzalloc(dev,
+						   sizeof(*dlc), GFP_KERNEL);
+				if (!dlc)
+					return -ENOMEM;
+
+				link->codecs = dlc;
+				link->num_codecs = 1;
+				link->codecs->dai_name = "snd-soc-dummy-dai";
+				link->codecs->name = "snd-soc-dummy";
 			}
 			link->no_pcm = 1;
 			link->ignore_pmdown_time = 1;
-- 
2.21.1

