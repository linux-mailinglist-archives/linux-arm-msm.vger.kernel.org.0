Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E774221E33F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgGMWzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGMWzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:55:13 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43402C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:13 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id t7so6613546qvl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
        b=phQ3z4XM879Mg4TOckIPk5Dk89byIXjH5l1Ueod4hxvsspSvQrbYmrKa7jp6giCzjC
         aG0WR8fPrx31wi2pKkzaMt+biVC5PTTZ/BNVEZS86DXTtH1kfAIhUOr/DWnYf1BCxIm+
         XpOeTsFUeut8tBwi4ZyJLjOZi67wtb5RC8Kx41AENk5ZtijKl1JZQOCiOV7bdURhCSTw
         V8NVyPwGqRSChiWgc7qbgDEgMWZTq0oRPnViI9jeuNaLhxTOR0kpbFalWfjZfsLgvDb8
         mC2I2McVH3RcGEM6p+MvTn8iy4xl61VJhjF+5+h7wKlRystzel3ka5+gm+2exuDs93z1
         EJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
        b=KlXzyRI+R1nXU2Y3cnZQl0Keq4ihjnNB2rTOI2Nm3rgk6ExRBp4g/vdMavyh5+Q5Y9
         gSP2GoLh+LNiLh0taY/t4S41ytSzPRYdwT/gzJONC6/e2WexeLiKAaC8gJGLXpvuQ0hL
         qGWQincfbrYv+sXIiM+iLD64+blPLvfkipSo9ysmZNqJLrNMqUN6uEuzhCgqibe3n68d
         NOz2fCuSr7dr5AXmVJ3BzE+ic3/lltOwmxLzKJvefKsi79adaGypvbVCaG3rnYMoqKVR
         Q/iHs/xRrKsd+3zIB22ZLLshNXAWBdW5PtMgbVW5T5h0Gv+hLAr9By1+qlTV/UjyWH++
         +PnA==
X-Gm-Message-State: AOAM5317FB35rRCMlrm7v8wXbv6QjfLoh+qcPDtXjEVEgH8hFHn2B/Yd
        ttd08THn/53hm70Zh/FdZdiEvteOnjKdkQ==
X-Google-Smtp-Source: ABdhPJzT4kWTe7OAToMzZZAU4W5K1Fgae2SY+FVbLq8HcjZ7nDEsaM7430chMTRWXiz9iMYU6zS6fg==
X-Received: by 2002:ad4:48cf:: with SMTP id v15mr1725778qvx.101.1594680912255;
        Mon, 13 Jul 2020 15:55:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:55:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Fabio Estevam <festevam@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v4 0/3] drm/msm: handle for EPROBE_DEFER for of_icc_get
Date:   Mon, 13 Jul 2020 18:53:39 -0400
Message-Id: <20200713225345.20556-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Check for errors instead of silently not using icc if the msm driver
probes before the interconnect driver.

Allow ENODATA for ocmem path, as it is optional and this error
is returned when "gfx-mem" path is provided but not "ocmem".

Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
init needs to be after msm_gpu_init for the error path to work.

v2: changed to not only check for EPROBE_DEFER
v3: move icc path init after msm_gpu_init to avoid deleting a WARN_ON
v4: added two patches to fix issues with probe deferring later in v3

Jonathan Marek (3):
  drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init,cleanup}
  drm/msm: reset devfreq freq_table/max_state before devfreq_add_device
  drm/msm: handle for EPROBE_DEFER for of_icc_get

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 68 +++++++++++++++----------
 drivers/gpu/drm/msm/msm_gpu.c           |  4 ++
 2 files changed, 45 insertions(+), 27 deletions(-)

-- 
2.26.1

