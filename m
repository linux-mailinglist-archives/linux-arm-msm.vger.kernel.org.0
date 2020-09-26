Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4CE279908
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgIZMvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZMvz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:51:55 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500D4C0613CE;
        Sat, 26 Sep 2020 05:51:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so6797016wrn.13;
        Sat, 26 Sep 2020 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/qMNYE0eTMh5KJYROOdw24uWxCTrmW6gJQZgul1FUS4=;
        b=Xzgm6wn4J/4NiC0PcNx8YtYeNMwbwXmxSLid0z2d+VUC+C06JsbAJyjzvy2PhtHPho
         0dwgsF1gedNsTidLRJYBwjVdt8WBilvjeFyfluf5FI3OY7zja0xBhJhVCXTdzVldMroA
         IqqUZk1NK5oI/tlf5F4AzkiQdnEtQ/Ol+yajZAqSQcC7FhSkLZIhzsyFcOzArkfqtL/5
         e6EySKwVJ6UAq8nR/g3gxHW/W8LB1KYNA3tjowSrZb86RcOdCpKfPa1OqUzO33eR/Lwo
         eBA3UefYyj7IivosPGHfV/koKrG2fDZuzBJLLVit2stJm7eceY9CJ1Bdk+/CaYwuyhEd
         ZYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/qMNYE0eTMh5KJYROOdw24uWxCTrmW6gJQZgul1FUS4=;
        b=iX8kxXFf6m888fA//M+vL+qJKg2lS97phIMG1zuhZqxvp/ze/hQxyCJsy2uZabNC4k
         zZAG/Em8tGHaHkOZgXjEjT3/R5wla3rklOfzqj3Fr4p63zvwZGsf89JYXhrVXaWNqim8
         ecLh9Hb2O25czxvyLtt3E0g+1Antyt76xLBw5rOL5KYld6hLYYXsN2vmiDUetghr0CcJ
         OtDaSP+v+CyGRBSHTZv5gR252ImISIz2gv2V9qVCXknE3iWsQzz5LsbSPYtcLVyXs/iJ
         l7RWJ03DHFjErHENprj06MwnFZgQhX8NrYcwUJ0nO0GYsWb/YawEkYBZWZDjRYXDmxBn
         gmKA==
X-Gm-Message-State: AOAM533NlQdJFqMFqlKzwtZf+uMGXNHw2sgK1Fx/rB4wnNKK3o8f9vek
        EzlvK8h9geZGK+TEGAlU/pc=
X-Google-Smtp-Source: ABdhPJykRj8XBuin0jimtNNCc6XvuRCYJBYE70paF0aDxhecfU/Oo4M7P/54UjKiEqXlKS+mazYOJQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr8979753wro.233.1601124713966;
        Sat, 26 Sep 2020 05:51:53 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add support for Adreno 508/509/512
Date:   Sat, 26 Sep 2020 14:51:39 +0200
Message-Id: <20200926125146.12859-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In this patch series, we are adding support for lower end Adreno 5
series GPUs, such as A508, A509 and A512 that we have found in the
Qualcomm SDM630, SDM636 and SDM660 SoCs.

On a note, adding support for these three units, also adds 99% of
the required "things" for another two GPUs, A505 and A506 but, even
if adding them requires literally two lines of code, noone of us has
got any SoC equipped with these ones hence we wouldn't be able to
test. Even though there is basically no reason for them to not work
correctly, kernel side, I chose to avoid adding the two "magic" lines.

Anyway, this patchset also addresses some issues that we've found in
the A5XX part of the Adreno driver, regarding a logic mistake in one
of the VPC protect values and a forced overwrite of the register named
A5XX_PC_DBG_ECO_CNTL, forcing the setting of vtxFifo and primFifo
thresholds that was valid only for higher end GPUs.

This patch series has been tested on the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (4):
  drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
  drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
  drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
  drm/msm/a5xx: Reset VBIF before PC only on A510 and A530

Konrad Dybcio (3):
  drm/msm/a5xx: Fix VPC protect value in gpu_write()
  drm/msm/a5xx: Disable flat shading optimization
  drm/msm/a5xx: Disable UCHE global filter

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  60 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 4 files changed, 247 insertions(+), 27 deletions(-)

-- 
2.28.0

