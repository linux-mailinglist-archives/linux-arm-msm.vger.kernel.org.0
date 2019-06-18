Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A94749A22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 09:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfFRHOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 03:14:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44560 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFRHOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 03:14:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so7094125pfe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Lj4Or491uCz2tJJXb3WzbO2VXWNk3Hk7nTOtYQN43sI=;
        b=mPvW2e6mcV/CIqhidFpo+Yurn5TdvkXOW1QdaK3u5WTFGziti+wTCsJW/eOOr02fqG
         J9JT0PVET8S1CLVBiYeXo2sKcEPICn18rwWbomdjPf2FiLN4VjQzlUsjJufdGHsHnIl/
         yucipCljbwALWRVvWM6KF4m8FqUC2+lBTG3jYhsyOODebLlB5k6xtqgnNbW6rZWsrHBN
         +ls1KOFsQeRhllGKvOrw9dfca9T45nBQEH7T4VCNFlpTSgvYvAJ3jh+83VBphd3ftRIL
         nZl+2bwQZIS7GAI/obVHxanKvqbfkrHlqkWTaG4cJGi3M4vUQGG4EWgtvcuI2qzN5EqR
         RdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Lj4Or491uCz2tJJXb3WzbO2VXWNk3Hk7nTOtYQN43sI=;
        b=qlBY6Wt31zfFD6jDIcg+991muEyyzJrhYHzHNmMA3chB/Lw95cialp/CeqKcvweF42
         XEz9d9m26pAWaWFTJJLsjDYEUc6nAcX5UhrhO95PY5AyNBdctN3QwIRfB4nPtzN3+GOH
         qAyuFNZz09FSpfFIg0Kcw64r+fTpeAw+kt5FN7aSqnCAfPPbJ06ERIxxb5m6uibChc4x
         HQ0cRUWcA+UzTi/UGZG2e0jWhXTxtQ8rx4tJX2IWcK2e9vQ7tNC26EjrOTFfExxeFsXj
         CFdUKFdDpY8G/baPk1g/9VQfOz0ELYgL9D3NqUju+J+PUq85vVzdzqTs2cSSuVeOGZQ+
         VfMg==
X-Gm-Message-State: APjAAAXRKuR1rrTwscYPEzOWIF6fFeTM4ZSY5h1+ggzz3g+bKMnHt8uZ
        uku+BkPUYvW6aSBQmaOxs8dAqlgUJX8=
X-Google-Smtp-Source: APXvYqzVQmDQx7MS4P1iKQ8RlVJhSS2xJyaB9wF2eydxpDgmsaFQMWNabJZt0GUQO5Ds3AbcW/Ei9Q==
X-Received: by 2002:a17:90a:a385:: with SMTP id x5mr3088727pjp.76.1560835753055;
        Mon, 17 Jun 2019 22:29:13 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b6sm13477601pgd.5.2019.06.17.22.29.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 22:29:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: qcom: common: Mark links as nonatomic
Date:   Mon, 17 Jun 2019 22:29:09 -0700
Message-Id: <20190618052909.32586-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interface used to communicate with the DSP can sleep, so mark the
links as nonatomic. This prevents various sleep while atomic errors when
bringing up the audio interface.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 97488b5cc515..2c7348ddbbb3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -116,6 +116,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
+		link->nonatomic = 1;
 		link->dpcm_playback = 1;
 		link->dpcm_capture = 1;
 		link->stream_name = link->name;
-- 
2.18.0

