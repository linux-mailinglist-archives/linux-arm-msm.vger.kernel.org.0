Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDF8305DAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 14:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbhA0N5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 08:57:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbhA0N5K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 08:57:10 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91EAC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 05:56:29 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id t29so1222313pfg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 05:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzFHnjdjolgtpWkflpOnmhYdtFmZsj/BB+DFeZwIjKs=;
        b=n/IjJ3Tyhzz3Pe7z0TqbnPyg888eGH2O5Q4nUOCKwr/L9kPwvan+2slLx3ylTggwZx
         pTs8T3niZCEFucfg+VeHaOq4lbDsDTKQoxbU8wwF/CUodOCJ6oUo5DnBOEvLMzW1/xJP
         PxNtXTZ48tBW578t3BMt/HeH7AeD8Z8SS+L08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzFHnjdjolgtpWkflpOnmhYdtFmZsj/BB+DFeZwIjKs=;
        b=DE+2+eorgMgm1eyVYpbONkJMswcQ13EsrtYMao6aJa4FCLc17NfAxQnqzorHM5FzmT
         FqLy4iv7+0WezjYeGpZIhaq4SBGOurKgMvi4mu+jWRmQ751ZPbeZgeIIMBezyFnPoIRT
         DehBa0YPheLYmcwJMLMVwOw/oy9FZCHYgm2d8bSMEOhtaW5g4zpEvR4sfu7fRAweGGhW
         Tokr65oNdKBpg4nQOOtevt3wxiqsGdA+ic5gDNjhrfE/x6HMxN9DyAH+X6WMYr2fG5yu
         88FBkqDuCVJk/iXMMfrwKwxoe2XZaxi85w74aS5jlNZgH8SNBP7sFo3g6mOZDWKTFewd
         DOBQ==
X-Gm-Message-State: AOAM531c1kxpJdbNI8byjGJR+mM7TyV0mHIIbB5DsIFvP4EMn2pzYL1x
        NNUNZDunOH5CE3EdTCBeBrjBAQ==
X-Google-Smtp-Source: ABdhPJzxB/U4/4l/L5pINvHz4pnROnfoFxfXjZQ2EpnUVb2HeZ2kp+WJWLBkDtjx7IHNO18m3RWb0w==
X-Received: by 2002:a63:fc48:: with SMTP id r8mr11151181pgk.300.1611755789182;
        Wed, 27 Jan 2021 05:56:29 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:a53b:f71a:ed56:92d8])
        by smtp.gmail.com with ESMTPSA id p187sm2526288pfp.60.2021.01.27.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:56:28 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@google.com>
Subject: [PATCH v2] ASoC: max98373: Fixes a typo in max98373_feedback_get
Date:   Wed, 27 Jan 2021 21:56:20 +0800
Message-Id: <20210127135620.1143942-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Judy Hsiao <judyhsiao@google.com>

The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
to snd_soc_get_volsw.

Fixes: 349dd23931d1 ("ASoC: max98373: don't access volatile registers in bias level off")
Signed-off-by: Judy Hsiao <judyhsiao@google.com>
---
 sound/soc/codecs/max98373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 31d571d4fac1c..746c829312b87 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -190,7 +190,7 @@ static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
 		}
 	}
 
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static const struct snd_kcontrol_new max98373_snd_controls[] = {
-- 
2.29.2

