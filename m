Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D85634865E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 02:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhCYBVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 21:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbhCYBVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 21:21:13 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C761C06174A;
        Wed, 24 Mar 2021 18:20:40 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id m7so163925pgj.8;
        Wed, 24 Mar 2021 18:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiLJdMhcciEZgBLfoz2ge4p0MXfhpuLjibL+Tk2uVwM=;
        b=OGjLQcKreAioM5wf1smvNoJ82BsvMpFZ+ORVLIPjAod0bP8FJpiA8pcj0RXaTxR6RN
         nXU6jwLTdn1PPpwsdytGy/7piy2pJ+xuCLDlblMyDwhqeRclMLRVoADBUSR+i65FxqpI
         7nvyG2IO3ErxEI9WYIhnEpTyIgU/Uq+SbkqU4Chn8dNeB94Q4yM4vnKT0E1DFFmglEpF
         cxAEYBqmA4La+JKLkG/D9O4s5H6Jj0ZhxgL2hQwA2x+yZTUWfBAJZrShwOmRhIVIdMOC
         ebuFLuC3Ldr2pLXkriYZx14UNAnwWvh+Cpil4nhEEkMJ8Izk0lXRh9Wu16oWlCr/mvwq
         E/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiLJdMhcciEZgBLfoz2ge4p0MXfhpuLjibL+Tk2uVwM=;
        b=ZFCDkv7SqRibhRlFKj2wS+UW4Cgd/GDQzPiHPVWgEBUyBbzjRiYg560jR3zd55o7Gg
         /4xjpeNkc/BeXt01Boej0pdViwhodnmUJDA6/csefTRdvxWCu0WCc3f92lRC07S/JNZH
         yNzt8DvTShhtNh1JbjoFtbA3gt1wtygEvTIfBWQ8JwlzZ3xX/tLIkHPF9+YMJmRMS2Lp
         8UN3uMG42iEiKvsnQs1Ca8gsSmyPy8cNMGhLZuSREGUYqKIZLfumqNvyONom57A9dFt3
         qKjKRtLogE4exPkkRxbXusODjpOOMEIIXi9dotdTAe6Na/tfkgFj8kkFi7MP0MMDmDY3
         CJLA==
X-Gm-Message-State: AOAM5323qes8GeyWUT/+dsMZYaRyD/8kmrJWeVhewlwyGBRt6E2NDI9P
        HJAfO/yGGaY/nOGYIHwyU+E=
X-Google-Smtp-Source: ABdhPJz13qOoTUuf5M3bIR5HvIbImmbvAh5xl7ISbW5k+N9dGYB8MAuXYM/ugR5dLmSdYMeM8Fye2Q==
X-Received: by 2002:aa7:9246:0:b029:1ed:cfa4:f1a8 with SMTP id 6-20020aa792460000b02901edcfa4f1a8mr5643278pfp.73.1616635240134;
        Wed, 24 Mar 2021 18:20:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id e7sm3606796pfc.88.2021.03.24.18.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 18:20:38 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@redhat.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/2] drm/msm: Fixes/updates for perfetto profiling
Date:   Wed, 24 Mar 2021 18:23:51 -0700
Message-Id: <20210325012358.1759770-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

A couple kernel side things I realized I needed in the process of
implementing performance-counter and render-stage support for perfetto,
the first patch fixes the MSM_PARAM_TIMESTAMP query which was just
wrong on a5xx/a6xx (ALWAYS_COUNT vs ALWAYS_ON).  The second adds a
way for userspace to determine whether the device has suspended since
the last sampling period (which means counters have lost their state
and configuration).

I am a bit tempted to add a way that a CAP_SYS_ADMIN user could ask
the GPU to not suspend (until the drm_file is closed), but so far
I've managed to avoid needing this.

Rob Clark (2):
  drm/msm: Fix a5xx/a6xx timestamps
  drm/msm: Add param for userspace to query suspend count

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c           | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 2 ++
 include/uapi/drm/msm_drm.h              | 1 +
 7 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.29.2

