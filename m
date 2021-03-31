Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607A53501D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 16:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235758AbhCaOCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 10:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbhCaOC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 10:02:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3546DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 07:02:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u9so23949299ljd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MuZeoVHEvpr+twaPQswyeU0R2hfnHxepbRcYA7KH75o=;
        b=l2L1151wnl4+sV7aqaC0RpYZ079X1QdGAxyQCBF1iuFD7wABWyAUSHIto1S6x+Wo2f
         jhdUJCof/A4cyK5X1JqLk2kJRYHYt9cWaasAfERA2gpRvfvxL0yo/d8mamjt7+WVUEi6
         XLstzAle4OxKEzzYhB+4xIpBQhT620M7p6lO9aILLRyMqZIuBC9KVR4P7R7hAqXlVkCd
         GwkSNnDzCUMJRaP0YPlh78rEjATEpy4b8ykGhenOQGgvzQ1FFrRBA5idJNbTEkl2sIZ8
         xO4nEIK7CWmmi1iX/DzFy0qHrpHOGAgKHPVqUFFGn3lg4BkEaEePuvZCnTbHe6Lrd57k
         o8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MuZeoVHEvpr+twaPQswyeU0R2hfnHxepbRcYA7KH75o=;
        b=N7CRn30ZjCN3crDpbvPB22rE7DkUIY7gIexUhXfKNf4s8v4gpNuA/9/22EQwUK8Fti
         tjD2nS9zclg6TaQ3xiBP9mTsINkFYgH6MY96/BRAD7UqEoYQKyK2UFMltUv6zMJb5e3T
         WOjWRQJ7hxCyIU9a8Plu8tgd8AvgiWLsWMh0kO8Qoc+PNqfuvDZFxxIXoGqlpbhnXlIm
         gLMsARqvU5agAMCoYW/Q/MbUKpQ8FYyEt+3w1/nfwLtTfAYfiyQGf5CLnSgShzObuUZI
         K54+2IlhjvABRYt1cwNHFsAZhEIk7O9RKt48t9VbhO0AE4BYpx0XlFpF7jVOYvpqOYzw
         RLxg==
X-Gm-Message-State: AOAM532rWBD54nQRuQV6VHCEeuGLnUlDOB15JgMSzB7fO5qs34FT+N6k
        mj31oSy/wKENiIwZlxDQ7N/Vl99OS5u1Ig==
X-Google-Smtp-Source: ABdhPJy8Mbo2B65joihqEln2ts8luLCR7ANP31lGLObFfH8jrCzNlaIxSnlSSk2VBmLQqc2BJBl2lA==
X-Received: by 2002:a2e:320c:: with SMTP id y12mr2250115ljy.360.1617199344558;
        Wed, 31 Mar 2021 07:02:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r123sm245033lff.27.2021.03.31.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 07:02:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE microcode
Date:   Wed, 31 Mar 2021 17:02:23 +0300
Message-Id: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I suppose the microcode version check for a650 is incorrect. It checks
for the version 1.95, while the firmware released have major version of 0:
0.91 (vulnerable), 0.99 (fixing the issue).

Lower version requirements to accept firmware 0.99.

Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
Cc: Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cb2df8736ca8..896b47dc9c85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	}  else {
 		/*
 		 * a650 tier targets don't need whereami but still need to be
-		 * equal to or newer than 1.95 for other security fixes
+		 * equal to or newer than 0.95 for other security fixes
 		 */
 		if (adreno_is_a650(adreno_gpu)) {
-			if ((buf[0] & 0xfff) >= 0x195) {
+			if ((buf[0] & 0xfff) >= 0x095) {
 				ret = true;
 				goto out;
 			}
 
 			DRM_DEV_ERROR(&gpu->pdev->dev,
 				"a650 SQE ucode is too old. Have version %x need at least %x\n",
-				buf[0] & 0xfff, 0x195);
+				buf[0] & 0xfff, 0x095);
 		}
 
 		/*
-- 
2.30.2

