Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DEF217978
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 22:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgGGUgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 16:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgGGUgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 16:36:20 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2602EC061755;
        Tue,  7 Jul 2020 13:36:20 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k27so4462229pgm.2;
        Tue, 07 Jul 2020 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kYdONvMdJAADML4BPPbRbs7311WOl+MmOi58FDooBKo=;
        b=Ztuh0++A/C/3gGj6shzPsBd5YTUcajDUvpDLzheQE94FqM4Zgij8EkBSXVR0pKZhG4
         mCIeJ/M7KrkHlql0bZnwslTWYz+snttwyYDTz7qzEY3mkIVWo8QXQ0m3uP5Gsif6vQ4u
         dGAVa71d0kwaDr8KSO5+xztFesKkc5lisTTycGm3smRn/uhtk2LeTJBdHiEXtVPUBrpC
         J9yYxforKh3D7XuCL6XQKtsVZWP/GmxXgyD95FnOE9cIpUJHmNPcdVDFvAGmQfDgrv0s
         hDuSQCgycc5wloMRljI6NHVGBZHa7mASXTooTZ0/JLhupWZzTTO6vqxrg2QDl+vV1Nss
         4Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kYdONvMdJAADML4BPPbRbs7311WOl+MmOi58FDooBKo=;
        b=p7SeQrUKP6WpINKicE9yC+JecqByi+qyXKNT3Yqb9Zn/oMvl2BmV/ntvzUoxsrOZeA
         wA0RT4NpZo3EHN/kYmMZPdvnNhGFnt1Dj9RvE8nFUQD2wXFWjclT0jnxhqJhrZ6hbPjD
         zD12v/TX05qAmwSLX35yUb/u1fZkPRhJQqG/Bt1QmCtrCqKCgyjaA5euftkQAPDl5nZf
         p+aaSIh0jda+KTczhOAT7b9ErK9MIuPQbr6rsvE5kN80EwTfEXCL+aFkF4neVDfT+s5u
         l75bYyefTXxj8OomxizGDeZTd6rk1KMicgoSzLsB7qmLHiqn8COBxMlpucZ3TSSVPrRu
         bPww==
X-Gm-Message-State: AOAM530CggLXtEx6yexu1QMuYGi/ZS+4N8h9PsJSmhzWSqtTZmZUf9da
        uZzOlAtK1R5ZKsrItn8lKY4=
X-Google-Smtp-Source: ABdhPJzhV3qXUyNVtweFO4xS/ZbBj105176Kpc6BoO2oGQwnKkqdFkpWsOYX28d8ssKhm3VlR559aQ==
X-Received: by 2002:a63:a558:: with SMTP id r24mr47731179pgu.70.1594154179555;
        Tue, 07 Jul 2020 13:36:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id q7sm23942952pfn.23.2020.07.07.13.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:36:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Harigovindan P <harigovi@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Sam Ravnborg <sam@ravnborg.org>,
        Sean Paul <seanpaul@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>
Subject: [PATCH 0/2] drm/msm/adreno: cleanup some packet building
Date:   Tue,  7 Jul 2020 13:34:58 -0700
Message-Id: <20200707203529.2098979-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Resync generated headers, which we haven't done in a while, and cleanup
some open coded packet building.

Rob Clark (2):
  drm/msm: sync generated headers
  drm/msm/adreno: un-open-code some packets

 drivers/gpu/drm/msm/adreno/a2xx.xml.h         | 1102 +++++++-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h         |   85 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h         |   87 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  156 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 2305 ++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |   28 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   11 +-
 .../gpu/drm/msm/adreno/adreno_common.xml.h    |   29 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  932 ++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |    2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  208 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h         |    2 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h            |    2 +-
 drivers/gpu/drm/msm/edp/edp.xml.h             |    2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h           |    2 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h         |    2 +-
 20 files changed, 4328 insertions(+), 650 deletions(-)

-- 
2.26.2

