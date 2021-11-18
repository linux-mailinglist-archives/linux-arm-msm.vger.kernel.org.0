Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EB84551E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 01:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242054AbhKRBCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbhKRBCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:02:50 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793C2C061570;
        Wed, 17 Nov 2021 16:59:51 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 8so4276537pfo.4;
        Wed, 17 Nov 2021 16:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBUD0K4C7qmyhl0TujcIGbUVohvoG/xB+6guxlHi264=;
        b=d8k4sJ4D2Wk6p8hoVWw9wlbT7GzsM99y2DsIRuvra6Ey05UD39Cq8KD7UwZjf7EUZG
         Ln3EKMmLOmbPfQ+rJWHSSCMQCwPYcdmE9EXiZIe9AA2GWhNQGi4eZotpxXeU8g7bwrYw
         5PtSwGddDLuiFwinC6IsAMOLcMrzTfWNyvBoTqlyt9JvfzqWsQrGhZaW5xc2YMVYcggU
         PQ1AMn+qA4/bBEoqP8H5oYtUqvJnv/gKikJ4LDZZn5SzDqKHStyoEbNnu9IrOiKB1TEC
         SgJ8mP8NNLFIpo60iFgPUMLjk4Me4towoKzYajbwjFQAHxjmPzzpNPrXleIzCQFtSLAo
         NY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBUD0K4C7qmyhl0TujcIGbUVohvoG/xB+6guxlHi264=;
        b=ZAwhEGCmbrerhS3cmyyq8E3m9qQ3hMjQjIxYqoIjrfyJL+PHbxCj78eJN2Vh3kEIVS
         edz7FEyote6pHh2VaOg0PsI+uG8SUbFVi1MlAJlshw8eE8JEHn6ENAgMZcLePSKECTQt
         goYVNz6oVcdkbTxIAPv1uDFi0Es/z+7Ovk23pJNnKnc28strEmYdXQ8ndv0omzNDo1yJ
         jZRGEUyoGm1anX/+jhgwpgdsMm7WyJjjhi5O8P6YSF2ey1iWTZ3NLPUyzzM3oPE9M+TU
         TZlC/2rGvbkqjzER1jtZ+27uQ+J+rKVRE0lFSgaHfrhYzb/nt0eOD/MQHkCjM7dh3jhM
         +EkQ==
X-Gm-Message-State: AOAM533wld/9Q0odApwnbJcjcNmyLDQpdVNpCMnCTNgs6GuQRXevWJj9
        wLIsM3cOHVuew8Sxfk6cOKo=
X-Google-Smtp-Source: ABdhPJyLSdbkyb7Clc5rm7pg8GIdMXdMD9+JTg4K4Es9Tn4wkHLotm6C7otslIASDrJVAHPsMkBK7A==
X-Received: by 2002:a62:f249:0:b0:49f:b0af:b9dc with SMTP id y9-20020a62f249000000b0049fb0afb9dcmr11299322pfl.22.1637197190745;
        Wed, 17 Nov 2021 16:59:50 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id a8sm835044pfv.176.2021.11.17.16.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 16:59:49 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     alsa-devel@alsa-project.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Derek Fang <derek.fang@realtek.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
Date:   Wed, 17 Nov 2021 17:04:52 -0800
Message-Id: <20211118010453.843286-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Move the declaration of temporary arrays to somewhere that won't go out
of scope before the devm_clk_hw_register() call, lest we be at the whim
of the compiler for whether those stack variables get overwritten.

Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)

Fixes: edbd24ea1e5c ("ASoC: rt5682: Drop usage of __clk_get_name()")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 sound/soc/codecs/rt5682.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 78b4cb5fb6c8..0d59ec2a5460 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2844,6 +2844,8 @@ int rt5682_register_dai_clks(struct rt5682_priv *rt5682)
 
 	for (i = 0; i < RT5682_DAI_NUM_CLKS; ++i) {
 		struct clk_init_data init = { };
+		struct clk_parent_data parent_data;
+		const struct clk_hw *parent;
 
 		dai_clk_hw = &rt5682->dai_clks_hw[i];
 
@@ -2851,17 +2853,17 @@ int rt5682_register_dai_clks(struct rt5682_priv *rt5682)
 		case RT5682_DAI_WCLK_IDX:
 			/* Make MCLK the parent of WCLK */
 			if (rt5682->mclk) {
-				init.parent_data = &(struct clk_parent_data){
+				parent_data = (struct clk_parent_data){
 					.fw_name = "mclk",
 				};
+				init.parent_data = &parent_data;
 				init.num_parents = 1;
 			}
 			break;
 		case RT5682_DAI_BCLK_IDX:
 			/* Make WCLK the parent of BCLK */
-			init.parent_hws = &(const struct clk_hw *){
-				&rt5682->dai_clks_hw[RT5682_DAI_WCLK_IDX]
-			};
+			parent = &rt5682->dai_clks_hw[RT5682_DAI_WCLK_IDX];
+			init.parent_hws = &parent;
 			init.num_parents = 1;
 			break;
 		default:
-- 
2.33.1

