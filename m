Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2474551E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 01:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242062AbhKRBCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbhKRBCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:02:52 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC0FC061570;
        Wed, 17 Nov 2021 16:59:53 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so4125527pjb.1;
        Wed, 17 Nov 2021 16:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4BTv//+2MDg63que21d0SOH04kYLO0+v6GBYWMab9k=;
        b=gwNtRhwFgUmqSdP/igrE0GsKWzxnQtjoGMphrPIHgteDlFwghXonsmctZ5p4Ni4vXK
         obNJyliP69uarrXKPfqCVc+RodWPMi98iJFjJyCA/6OauQHX3O/xbMy5uby2H8LgDjIU
         rnATDpCE2JxB4HyTuo2VJuVGR9bD54hWPfwildnCSC9m4oMG9YiCDK5gAocvuL/oTZCS
         Sp16hVZhe/fNLX+h2Qyzrx7/UlUHOKDS+r2n2PyQAN8iLnbXDTGm8Tjh5w12D3BoJnmn
         XDAxrLlgDKlSY1BGnecNaD/KaKErF3+19RVU/bRcZ4WViMDG5uhowg6VP7wSXNBBcR5A
         w7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4BTv//+2MDg63que21d0SOH04kYLO0+v6GBYWMab9k=;
        b=o6AoyCTjWQ4eWhxNrJsAfvyxBm5YV9enzXJ//v+fkwvx6bzS7sPGsFs/S5OFk9RqoU
         J0bjnxtehPUtXHR/pk4jSHe4haAv544+yT3PkLkbAWT5zwCGlW+mnsZ9n9Kh81+fH9XE
         41qHuxAb0DTewFmOmgwvNUFbIvYlIaMtFcHgN+JVHNHIiP2TTwQ/I0nRi6Ej0qm5RslD
         CG3vOSIRNvKI141ZqJwcDWZqomneH/FJ6oxsSLVwDsOsc9EBHfRT1tg/4kxJVOPHJBCz
         3EqwuX7SP8RRn04f0DAjL6orIA8rm6/VfDrLjJQWy4xGF7gVN6uxryscJi5yFW9czidC
         PfYA==
X-Gm-Message-State: AOAM533WaJvZF6ATbvQp23PVOMTn8Iu3SltZFLdJAHeqb8oMl5BZri6x
        DaqFXKhvucHkcQytdQvhO8k=
X-Google-Smtp-Source: ABdhPJw44Tow0AbatX/zGAE8pX5WnUDYNMbQ6+SqaKQQlklvGPlNmQeQt/l7MQKZuoIHYpXdvrFskA==
X-Received: by 2002:a17:90b:4c88:: with SMTP id my8mr5101646pjb.132.1637197193117;
        Wed, 17 Nov 2021 16:59:53 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id mg17sm744731pjb.17.2021.11.17.16.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 16:59:52 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: rt5682s: Fix crash due to out of scope stack vars
Date:   Wed, 17 Nov 2021 17:04:53 -0800
Message-Id: <20211118010453.843286-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118010453.843286-1-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com>
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

Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 sound/soc/codecs/rt5682s.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 470957fcad6b..d49a4f68566d 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2693,6 +2693,8 @@ static int rt5682s_register_dai_clks(struct snd_soc_component *component)
 
 	for (i = 0; i < RT5682S_DAI_NUM_CLKS; ++i) {
 		struct clk_init_data init = { };
+		struct clk_parent_data parent_data;
+		const struct clk_hw *parent;
 
 		dai_clk_hw = &rt5682s->dai_clks_hw[i];
 
@@ -2700,17 +2702,17 @@ static int rt5682s_register_dai_clks(struct snd_soc_component *component)
 		case RT5682S_DAI_WCLK_IDX:
 			/* Make MCLK the parent of WCLK */
 			if (rt5682s->mclk) {
-				init.parent_data = &(struct clk_parent_data){
+				parent_data = (struct clk_parent_data){
 					.fw_name = "mclk",
 				};
+				init.parent_data = &parent_data;
 				init.num_parents = 1;
 			}
 			break;
 		case RT5682S_DAI_BCLK_IDX:
 			/* Make WCLK the parent of BCLK */
-			init.parent_hws = &(const struct clk_hw *){
-				&rt5682s->dai_clks_hw[RT5682S_DAI_WCLK_IDX]
-			};
+			parent = &rt5682s->dai_clks_hw[RT5682S_DAI_WCLK_IDX];
+			init.parent_hws = &parent;
 			init.num_parents = 1;
 			break;
 		default:
-- 
2.33.1

