Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27BC6695665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 03:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjBNCKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 21:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBNCKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 21:10:01 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9643E1B31C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:09:59 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id u27so16828886ljo.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
        b=D884lBTIs+xeTiJamcskBqMMshJVklBckHxzHVJxhoDR4+M994/O9OxtVHJEN+i9bR
         /9gFPB+SnSUvedKTMQH3YalhfCiY/CB01RrF120YLcEHn/HKeMmLCmfGyHQIwSh86bSv
         1icvXTgLruDkuPJ+GW6/9ZevCu+F6Ouh1tkBjaOJgnk3aNDxYJ22Zd5XluzKQJpf/1op
         HJgRqTz5lQF7H6lPsUKqVfOq1meXrYabA9JfyibStLrKCiVmG5zv4Lh7BROKOrzvfU4W
         TCtLm0Ds8wesAkHC/pkQomKL+FftX9nIHyQXVEksO3EPfW2kyoM9roeOm3SLvAEfYqU6
         C//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
        b=0CkNMyKs64daimVL4KjNfAIW4XEGY2PHVZszdFHfO62FC7RqAYFdYYzWW5ooJVCzXO
         aVzzVhJDKu5qj7UdhSJ/SO57FlOEVykTrj7xADA4UyDRA98UQiZJX6hAcliw10DAtFX2
         qZngk5GRbwMqiMKJBEYQQ0Unyb/qIbQ+eQ2J/ZLKxaleQ10MqYwVMPjcq5CTsSisQj+c
         XxmyQ0rmHbqEW0DQsr6Tw1M0lhJR9gt4q+qa0lGdxlMcumE240InhOfYtN2AlwJcnxBk
         3tKvi+crV0SLPTUQqy8ByULmJ88Mf13irYxGV1LOorlxE1FoGT82nGAz/Y5RfHSlBvaz
         7kHg==
X-Gm-Message-State: AO0yUKWyyIG0tYldT9US0mBXVHs/e7XFOy//nUEEHwbvGM6DNKB9EygS
        v9RWAcqUEvvKEmQZcvUNvF2+GZWlqXg5siY5
X-Google-Smtp-Source: AK7set/UWLb5Lkz55p0NgV+9IoDwUsfA2RFxX3Vl1on0pxk2ofkmeDEDDcfWuFkHvYwooh4eknAC1A==
X-Received: by 2002:a2e:6a08:0:b0:293:4b59:52a3 with SMTP id f8-20020a2e6a08000000b002934b5952a3mr97952ljc.2.1676340597847;
        Mon, 13 Feb 2023 18:09:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 18:09:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Jami Kettunen <jami.kettunen@protonmail.com>
Subject: [PATCH 0/4] drm/msm/a5xx: make it work with the latest Mesa
Date:   Tue, 14 Feb 2023 05:09:52 +0300
Message-Id: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mesa 22.3.x changed the priorities used for the GPU contexts, making
kernel switch between different ring buffers. This uncovered several
issues in the A5xx preemption code, which are now being resolved by this
patchset.

Dmitry Baryshkov (4):
  drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
  drm/msm/a5xx: fix highest bank bit for a530
  drm/msm/a5xx: fix the emptyness check in the preempt code
  drm/msm/a5xx: fix context faults during ring switch

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.2

