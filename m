Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDBC15604E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgBGU6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:58:45 -0500
Received: from mail.serbinski.com ([162.218.126.2]:46950 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgBGU6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:58:44 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 94808D00723;
        Fri,  7 Feb 2020 20:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RYQe4sNuTc_o; Fri,  7 Feb 2020 15:50:27 -0500 (EST)
Received: from anet (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca [142.112.15.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 0D866D006F9;
        Fri,  7 Feb 2020 15:50:27 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 0D866D006F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581108627;
        bh=ETimvPxlhSv3UnHdR3sMFlCASzRDsVkv5A46uX4f778=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h0NDVPuHG5BrYyomgj6lbDXKJoOpSpwmhTw4xpD+Rq8tk/kTCiTyCcHCMC7ELF7qi
         D4U+5b/XVaaghNQ/RrklZ3Kx0LspwU8Vn49AQbpxECRUC0pbo68x4xR/TBg2AKqLH5
         KYSqFZ6iC+Y6hvf+6kLg3XIcVXfd/0ujEDFt2MQE=
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
Subject: [PATCH 6/8] ASoC: qcom/common: Use snd-soc-dummy-dai when codec is not specified
Date:   Fri,  7 Feb 2020 15:50:11 -0500
Message-Id: <20200207205013.12274-7-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
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

