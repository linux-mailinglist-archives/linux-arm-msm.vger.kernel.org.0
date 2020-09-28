Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC0127B68C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgI1UrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgI1UrN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:13 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00662C061755;
        Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so2427583wmd.5;
        Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb9J0IHiYZyiiI0yNoQU8kntPHSf2s+jSr0KCIhtaEk=;
        b=nY5cddHKnN1vrtLRd+xPWeQFOAhMkKwC1OMapCOhg225IIFY/tTqfcwiU4lY9Yd5sJ
         vTV7RZmDN8mGB8523uI9NVE+BQIeebJNEtk9t1+kZmqwqSVMDY0abaQFwUBaDXb4jLh5
         EtF+8OnAZMbvCXPPnebXaAPG3oZllQc29vmiIZrnmb0wMbFThR/42N+spfTWPJcZafhv
         iFyIGHA+zNFE1d3ADms6kfFLlT9lv/Qc1DL0pA+SD3ELdysfM6o76we2gZ+KQfqd8NuB
         kYhFxwasSDQX0XZYFq8rTSyM7mTVRI8cgyhcELpe+7CW/w2MO+wK0pNYrdZi335EfvOW
         ucVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb9J0IHiYZyiiI0yNoQU8kntPHSf2s+jSr0KCIhtaEk=;
        b=Tp4qzNBMeea5AnOnVZajsTe13GZMbnOYNBOR1Cum4H59OTWbZR/luCzG5mzVpM18Hl
         hWCB5q2THApCn1fzFkcXbx2MijRLG+mgdTi+4XxR+FdX1dZ3dCxMxptePS/95YVjpy41
         RHsokZnN18ayaMuicgFBmU5GlqJdhCwI0gvj4DPNVXPuScjdmU+ir3IX8MuqOiQlqvhI
         p1MbaTxuF0V+fNi1s2w0K5jW1wp898RTtkREHwKIHiDr4hwYxrkejequf2WpvU1pVlFW
         OCtCJ1nJv6QS8D1Q1l1WxCtSnJd+0jjItDTHIfczrQn3Bx4wIgjBDJDIe/332miIwpLu
         e/Bg==
X-Gm-Message-State: AOAM532PbpYeGiRmTmugLoOaBa0ik2L4f0VsTe7XmotEUjoFtf4po060
        CAOVvwtFNH0GhjhaXAx5PGc=
X-Google-Smtp-Source: ABdhPJxZGUUQLn23xBCKNF6y5ZS2rKRzE/3ozQLK02zrD2dYVMAoHtRujiS6Qsc/HjpHQLZejmN13w==
X-Received: by 2002:a05:600c:22d2:: with SMTP id 18mr882422wmg.145.1601326031552;
        Mon, 28 Sep 2020 13:47:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Add support for Adreno 508/509/512
Date:   Mon, 28 Sep 2020 22:47:02 +0200
Message-Id: <20200928204709.45746-1-kholk11@gmail.com>
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

Changes in v2:
 - Define REG_A5XX_UCHE_MODE_CNTL and fix open-coded
   REG_A5XX_VPC_DBG_ECO_CNTL in the all flat shading optimization
   disablement commit, as requested by Rob Clark.

AngeloGioacchino Del Regno (4):
  drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
  drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
  drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
  drm/msm/a5xx: Reset VBIF before PC only on A510 and A530

Konrad Dybcio (3):
  drm/msm/a5xx: Fix VPC protect value in gpu_write()
  drm/msm/a5xx: Disable flat shading optimization
  drm/msm/a5xx: Disable UCHE global filter

 drivers/gpu/drm/msm/adreno/a5xx.xml.h      |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  60 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 5 files changed, 249 insertions(+), 27 deletions(-)

-- 
2.28.0

