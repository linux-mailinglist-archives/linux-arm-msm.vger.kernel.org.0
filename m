Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691AB3D5BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbhGZOCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbhGZOCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:02:12 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB59C061757;
        Mon, 26 Jul 2021 07:42:41 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id k4-20020a17090a5144b02901731c776526so20055495pjm.4;
        Mon, 26 Jul 2021 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmZtBUD8FI8lAdMJxftPxEHcUSTCfysVGalUwueoWH4=;
        b=p6gTRrXebriroz5lpJEedRHHLPEF5PrQW1oT4GLT9AVhBp7eORVPfvllupeNgycSmR
         p5jSMkjoNKDCl6E8RtISCfFzfgZovrOraoOzWacbDlJwLCZpkBHTMNHU8NoHJtGZFlhr
         pxD6nrJcYY2R7rgnHobaAkNU1+hYNRZD4ym8PrlPFwWJ1zGW8b+fnrVNB0fqXRbkmPJ2
         GM0Xrl30CliMAo2TJk6F4/ekpu0TuwMwBwBXszH8yB3q0ILiISxRLX8X8UItLM3+8Mg5
         xaj4nMqYKJiJOXFvwMQSSthfphnxlQeoKPbNgAbGr6h6vFvF0Q0TZIwV68sihktFjK+x
         TnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmZtBUD8FI8lAdMJxftPxEHcUSTCfysVGalUwueoWH4=;
        b=CR2CO+N1Q72rK/S9L2ruXc5C5AERUtc5TTXmQIYyfugnrYjvl67KHCxcv6PnLvjqMU
         fwIDYh3j9JqAnEJOnWV9sJmgwkG23uMmk0M5vbk24GQZ2aM/ZPgUW6mcHEq36Jz6JT2u
         XjCccHlFcoNzhEFw4adfRoQqnBLtcVfa9VIkUZuYqKusYmW35J/pORCO5GQB5HqqybHb
         suoQfv11yrjhRp0CRkTaA+hZ8ulefCPdyImUXTwRofQ9tWAQJSb8J6CvP4JvrD/i6RBo
         SsZhc/+WDwiFa/CeqEib/s1+Re83B8BnPshZ7+AxzogoSM+r7nvScd8ykArIYrURDB/w
         R5Pg==
X-Gm-Message-State: AOAM532X0BgffNPHVSXWzudEs4xz+UOQBqt3Q8bD1NuDqXlKi+DmMfTN
        O52BbwZWNwwHsNc7bei42eQ=
X-Google-Smtp-Source: ABdhPJzxc+2f2N1SAJHTHCLInNoulpVt4huSwpjsfugRuLUGMSOT3GQkEv6zxQQcCZkDBlj7z4sPfw==
X-Received: by 2002:a17:90a:5886:: with SMTP id j6mr9527059pji.34.1627310560540;
        Mon, 26 Jul 2021 07:42:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id f4sm47901401pgs.3.2021.07.26.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:42:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v2 0/3] drm/msm: Improved devfreq tuning
Date:   Mon, 26 Jul 2021 07:46:47 -0700
Message-Id: <20210726144653.2180096-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is the outcome of trying to fix some bad gpu freq behavior seen in
some use-cases, in particular mobile games that throttle themselves to
30fps.  With the existing tuning, we'd end up spending most of the time
that we should be running fast at a low freq, and most of the idle time
at a high freq.

First two patches are prep, 3/3 is the interesting bit.  See the patch
description in 3/3 for more details.

v2: struct_mutex serializes the submit path, but not the retire path,
    so add a dedicated lock to serialize active<->idle transitions.

Rob Clark (3):
  drm/msm: Split out devfreq handling
  drm/msm: Split out get_freq() helper
  drm/msm: Devfreq tuning

 drivers/gpu/drm/msm/Makefile          |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c         | 132 +++--------------
 drivers/gpu/drm/msm/msm_gpu.h         |  61 +++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 203 ++++++++++++++++++++++++++
 5 files changed, 280 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
2.31.1

