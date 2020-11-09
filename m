Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CE02AB4EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 11:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKIKcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 05:32:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:57978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727774AbgKIKcr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 05:32:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5AB98ABCC;
        Mon,  9 Nov 2020 10:32:46 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm: Build fixes for msm and mediatek
Date:   Mon,  9 Nov 2020 11:32:40 +0100
Message-Id: <20201109103242.19544-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and
convert GEM backends") changed DRM's internal GEM vmap callbacks. Msm and
mediatek were forgotten during the conversion.

Thomas Zimmermann (2):
  drm/msm: Use struct dma_buf_map in GEM vmap ops
  drm/mediatek: Use struct dma_buf_map in GEM vmap ops

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
 drivers/gpu/drm/msm/msm_drv.h          |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c    | 13 ++++++++++---
 4 files changed, 26 insertions(+), 15 deletions(-)

--
2.29.2

