Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC3749992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbfFRG5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 02:57:39 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33223 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbfFRG5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 02:57:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id q186so8322809oia.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SqAd1fx2aqjUroAge2OaNB4tSLlvMkP+JhWERXOSN8Y=;
        b=VuEodqM3GEhgspN5BcSZBejRWyu1yfMzsvbt/tZcCt5AtPf01DDmMcr/YxPt5la51Y
         eAazo1sgyFm7hHAzmylz7IJwsHgTOpM5k1si7TJ3FbDsRl6PPeJHejJL0OEIt4gS1GKH
         jR0XlMVF4O6H8x0vXenyxoUWmPaZQPyQb/Q46CfiDuoDd4AejRu2OH2TcvcoLt1KVvXz
         hUTwDSqW+gWtikzfUEbdnp2rkDshNdXzeKLjxt1jXI6h6gfIJ88g9KwpGLNLUDwgO1Hu
         R3Dd1X0fhutxGN+CDAGj/KHsrlAQKUqMMf725VQBhO+S4DbDoMz4CoqO6L9Amo24rp2K
         RHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SqAd1fx2aqjUroAge2OaNB4tSLlvMkP+JhWERXOSN8Y=;
        b=FAVpjmcBWIt9fViancezkuOhm6pJtswm0rX2wvcDxtaeKKM57YQTECu0XtgrQ38EnJ
         xYA/dULOkcETrvc5UFcgx9EBnip7Wyt7IUrQvwf7/DyKzk+68BycKD1Wg7qnvnyXQEqe
         fEyWXK/PhkZRq05DSPTHC5Qz15WmrfloOpqvPMPyfqpufNvGPg+axNxdb3yPl9abaTz+
         iptTRlu/Wy3woU+LbMLzPBfknQ4XyFQKVHLu10YdNtgJfshraEEStyMSh3QrpgQB/5aZ
         q+a+iTlWLiHgkFye4GHQiqhCxCURjn4x+coAhFGDEW9GsED7hqXwnLhnHZ/o0kNVu6C6
         +gJA==
X-Gm-Message-State: APjAAAW3xof+x/B3+8MvHK/WcVTndPRY7bxuW4zfS5VYysSU7TXK+Iia
        Aprbu+P6Z361H+exP1eL4v4rO2S5bUY=
X-Google-Smtp-Source: APXvYqz4ODTWIjG3AqGUUeq6vsPQMClqM7BcnsAUOQ3cPzIUXZ5ipOaid/o/JhY/P+BpjDaxGb6eZQ==
X-Received: by 2002:a63:4a1f:: with SMTP id x31mr972877pga.150.1560835696219;
        Mon, 17 Jun 2019 22:28:16 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 188sm13934085pfg.11.2019.06.17.22.28.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 22:28:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: qcom: common: Fix NULL pointer in of parser
Date:   Mon, 17 Jun 2019 22:28:13 -0700
Message-Id: <20190618052813.32523-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A snd_soc_dai_link_component is allocated and associated with the first
link, so when the code tries to assign the of_node of the second link's
"cpu" member it dereferences a NULL pointer.

Fix this by moving the allocation and assignement of
snd_soc_dai_link_components into the loop, giving us one pair per link.

Fixes: 1e36ea360ab9 ("ASoC: qcom: common: use modern dai_link style")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c7a878507220..97488b5cc515 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -42,17 +42,17 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
-	if (!dlc)
-		return -ENOMEM;
+	for_each_child_of_node(dev->of_node, np) {
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc)
+			return -ENOMEM;
 
-	link->cpus	= &dlc[0];
-	link->platforms	= &dlc[1];
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
 
-	link->num_cpus		= 1;
-	link->num_platforms	= 1;
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
 
-	for_each_child_of_node(dev->of_node, np) {
 		cpu = of_get_child_by_name(np, "cpu");
 		platform = of_get_child_by_name(np, "platform");
 		codec = of_get_child_by_name(np, "codec");
-- 
2.18.0

