Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4882A72E69E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 17:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242849AbjFMPE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 11:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242944AbjFMPEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 11:04:48 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22321713
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 08:04:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8D05C224F5;
        Tue, 13 Jun 2023 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686668686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=rc2DHs6gcS/zrUpB6kT7YF9TjwucLx5JadBSE1cptGs=;
        b=EG31kEuNKwUe2QChFxose7XSWIJ+CjIOBk/fC2kUqEWGMEKzAf4jrwelio/SNTYjFM7Xq9
        IJgWC14JoJFVzo9njnw7BtPp8umEGjMB/WCfCSbgZPJktwJMZ4l3+WkxXmMgRE9dj24AYn
        nWXyzgL0s0V07QxisAcqoMC+J253INY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686668686;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=rc2DHs6gcS/zrUpB6kT7YF9TjwucLx5JadBSE1cptGs=;
        b=HTLUdM7/li5WOUexqnsf2xLO0cAT5IbigrXa7JGsI5TgdEovrdqqgeWLCRAnUsVlPTpAMa
        HbMv2nrWXvX7tDDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 593DE13483;
        Tue, 13 Jun 2023 15:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ++3PFI6FiGSGFQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 15:04:46 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm: Remove gem_prime_mmap callback
Date:   Tue, 13 Jun 2023 16:51:31 +0200
Message-ID: <20230613150441.17720-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the gem_prime_mmap callback from struct drm_driver. Rework
msm, which has its own implementation. Then remove the callback and
call drm_gem_prime_mmap() directly. This closes a long-standing item
on the TODO list.

The change removes the last GEM callback from the driver structure.
GEM memory managers should implement the callbacks in struct dma_buf_ops
and struct drm_gem_object_funcs to adapt the DRM to their needs.

Thomas Zimmermann (2):
  drm/msm: Initialize mmap offset after constructing the buffer object
  drm: Remove struct drm_driver.gem_prime_mmap

 Documentation/gpu/todo.rst                      |  9 ---------
 drivers/accel/ivpu/ivpu_drv.c                   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  1 -
 drivers/gpu/drm/drm_fbdev_dma.c                 |  6 +-----
 drivers/gpu/drm/drm_prime.c                     | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c         |  1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  1 -
 drivers/gpu/drm/lima/lima_drv.c                 |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.c                   |  1 -
 drivers/gpu/drm/msm/msm_drv.h                   |  1 -
 drivers/gpu/drm/msm/msm_gem.c                   |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c             | 15 ---------------
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  1 -
 drivers/gpu/drm/panfrost/panfrost_drv.c         |  1 -
 drivers/gpu/drm/pl111/pl111_drv.c               |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c             |  1 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  1 -
 drivers/gpu/drm/v3d/v3d_drv.c                   |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c            |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c             |  1 -
 include/drm/drm_drv.h                           | 14 --------------
 include/drm/drm_gem_dma_helper.h                |  6 ++----
 include/drm/drm_gem_shmem_helper.h              |  1 -
 include/drm/drm_gem_vram_helper.h               |  1 -
 27 files changed, 13 insertions(+), 79 deletions(-)


base-commit: 63a468ec7c7652afa80e3fa6ad203f9e64d04e83
-- 
2.41.0

