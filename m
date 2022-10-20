Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89B46068E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 21:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJTTcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 15:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiJTTcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 15:32:01 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0309F1A6533
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:32:00 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h8so735211lja.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
        b=y3EJkcit7qMxi0ZUqMGyQ5B8T+E5Oc1h6eVpWTrnAV1LyDSWdoquwKXUAR/rgrcRUc
         +SSjPYqzf+zZqdE+1Vd77V39xZ2pu8OpiYK1DHGQTBH401edZFlM1v70YVBfFj7w0tjJ
         wt5Tg9/A+9YOLEJP/TVl+Ki9pyfGz+a4nRw8VGX7pLu0VGG0jWZktaUyxmty7++hjgxo
         aiH83ytM2oJmZLJZrDLma0pkktA0eFkQmLF/NJq1SBHvWRRj6oLX/MXPutaWdo/QOPj+
         pY+I50NQS6fcFZreuNPgulVTM64HgH6+L17z3bwSvo+O6LnskfDq65vo/SsXQCQXeH6F
         feBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
        b=4K6YdFCDBUi7/fNgAYYFDd6Y6QS/g6X9qwgizmNKaJh3u7oZYr+FEDKphG3s8GaSCI
         JbkIZLMQ5rneiF1bFgtI4AYjrU9Y5M/OaJmhBFWjp+tD+uD5hzuwiLzi41Bu9TuuFFdU
         7Iwbxwl8+m0aqgc6aqryCTlNXiGwi+VUgA8NeoJwKwHCu04X+ghUijnmDioQ/KVs7rWz
         8WbmDzl8FdycQ1yHUVjwFm1LeNB96jaAmaNSO6HRoAKcjQeBchotroP/66iA7BT0/wkE
         Npr+4SJcb+IgUmoUmTSJeGaeiK1y3TLu/E3e/OctaNMq3tyGOfWfpOvM1+oo2mCi7ALd
         5ufQ==
X-Gm-Message-State: ACrzQf1r/k0Oyl4INEy4Z1te6Tp9/meunWZ28+AHNwc+0D3E/zvlg5sA
        hwFk8c3DzQJsHtjRAQhE45qSwQ==
X-Google-Smtp-Source: AMsMyM6t3LA7a7zZSUSBM/G1xeBu4xoo9Q22Su/3RoL/L+68pvp6cD2qKCooKmyhCpVP9iNPsxmTEw==
X-Received: by 2002:a2e:809a:0:b0:26f:c1a0:2557 with SMTP id i26-20020a2e809a000000b0026fc1a02557mr5139227ljg.54.1666294318354;
        Thu, 20 Oct 2022 12:31:58 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 12:31:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: clean up iommu interface a bit
Date:   Thu, 20 Oct 2022 22:31:55 +0300
Message-Id: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series started as an attempt to rework the drivers usage of IOMMU
domains. While the idea ended up to be wrong, these two provide a
sensibly looking cleanup.

Dmitry Baryshkov (2):
  drm/msm: remove duplicated code from a6xx_create_address_space
  drm/msm: move domain allocation into msm_iommu_new()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  7 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 31 +++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 24 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++-------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++--------
 drivers/gpu/drm/msm/msm_iommu.c          | 25 ++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  4 ++-
 8 files changed, 63 insertions(+), 67 deletions(-)

-- 
2.35.1

