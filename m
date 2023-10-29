Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946817DAD4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Oct 2023 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjJ2Q6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Oct 2023 12:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjJ2Q6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Oct 2023 12:58:02 -0400
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F558C6
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Oct 2023 09:57:56 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id AAEF91C2593;
        Sun, 29 Oct 2023 17:57:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-088-078-198-137.088.078.pools.vodafone-ip.de [88.78.198.137])
        by srv01.abscue.de (Postfix) with ESMTPSA id 5E8641C2590;
        Sun, 29 Oct 2023 17:57:54 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 4/4] ASoC: qcom: q6afe: remove "port already open" error
Date:   Sun, 29 Oct 2023 17:57:16 +0100
Message-Id: <20231029165716.69878-5-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029165716.69878-1-otto.pflueger@abscue.de>
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock fallback for older firmware versions now represents a use case
for having multiple references to a port. Stop logging an error when a
port is requested more than once because this does not indicate a problem
anymore and causes unnecessary spam in dmesg.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index f14d3b366aa4..56b1407c30bb 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1592,10 +1592,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 
 	/* if port is multiple times bind/unbind before callback finishes */
 	port = q6afe_find_port(afe, id);
-	if (port) {
-		dev_err(dev, "AFE Port already open\n");
+	if (port)
 		return port;
-	}
 
 	port_id = port_maps[id].port_id;
 
-- 
2.39.2
