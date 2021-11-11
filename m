Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086A344DDFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhKKW7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhKKW7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:59:35 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11378C061766;
        Thu, 11 Nov 2021 14:56:46 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so5576443pju.3;
        Thu, 11 Nov 2021 14:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us4tGKVuy84GQN/3zBQwXhskHA7JZIC6EUBgOL1w6LM=;
        b=efuXP0kyqAYesmA+FSLFpubdX/c6qq23Hf/aM+tpQqgSbfL2LWu3oA3620a6/Rg3ki
         WS54KTtFwQNDIkkghAWVKXrI5t3WxV6Op1bamA57H3Qs8toELsakj+F6yFh6ofKgNrTR
         mRp5dQOF8h6b2+Zt72msBfW/43H+6WR1ZaVew4Elq6DTuvtuG/KWTvgz3u8kjG4HgjOE
         UGx51XrMP5mV/yzkQcxWGQJA+HqFguzlYauCcl5fi2Yy37uppUGSfkfFtVmtC9K0ap2n
         P8geBzbGT/teHyVtFYpfyv6ZdsycGViqVkcxc74VI9oPbyZ968Wf92ch6HiuIW11EVMS
         gfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us4tGKVuy84GQN/3zBQwXhskHA7JZIC6EUBgOL1w6LM=;
        b=MNhjt8/43zgJqzGHKCwJGds8fyOqBPq7J13pc8MveyIuxq7pPgUGjO4kUMrnBkMzm1
         VqQYj0tX1zsLpCWDux5Esqu/KrbMBZGl5WP+FaloCXpb3MwqymOisgWFY0OxE3wrn+Cg
         tTeZ4z5MQCBZSr0RbKWGjj3c63130IWCrJg7naBvVUwgs6xFENqn10jHTa4a3B62H55Q
         0dnG7kfxpjz6gxyw5S2XEi96ctxtLgQtW1Ab9caclg1QutZoYVgC637kKBgdgOmnhSXa
         4h25/6MhyowzY0Woup+gCxWqXn+cNI530cM/aKTUZNHhvT1nq+TPl7CEAV+w32o1jnzb
         vafQ==
X-Gm-Message-State: AOAM531PpncBS0Ok+KBSb+eJCiyBMOZQBYxriI6Dn/ks8TanBKSajNJ4
        eunR/VKr5zDW2lfROc/tZFnjXesw/mU=
X-Google-Smtp-Source: ABdhPJxzLoUDpGbeEKgMeFQIidYBUmjLSz1CcxOTtPlDb8kswpEAqycoskD1Agwh8sdTasjwF0AJDg==
X-Received: by 2002:a17:902:9888:b0:142:8731:4b55 with SMTP id s8-20020a170902988800b0014287314b55mr2988189plp.51.1636671405481;
        Thu, 11 Nov 2021 14:56:45 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 4sm3047418pgj.63.2021.11.11.14.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:56:44 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        kernel test robot <lkp@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Make a6xx_gpu_set_freq() static
Date:   Thu, 11 Nov 2021 15:01:49 -0800
Message-Id: <20211111230151.765228-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8a2af3a27e33..dcde5eff931d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1641,7 +1641,7 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
-void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
+static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-- 
2.31.1

