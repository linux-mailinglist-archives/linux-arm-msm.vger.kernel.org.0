Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C882E700296
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240178AbjELIl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjELIl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:41:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C777B3A96;
        Fri, 12 May 2023 01:41:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 85EC92277E;
        Fri, 12 May 2023 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pWQ1m120kigJP8UI6CyQFrBjDqO1iQT2O49PACRC7NY=;
        b=mnFQs8mVfueIa/exRdcpKrEU2GTwDYtt4Ut4AUoRyeO2HeCTyXk/NuBpUJdhfuNQ+07Blv
        iIroG2RhLFmydYDquWy8pwc6KQ5zHj+k8DJG5sOHJufzKhV80f6BcHMxq+YNCYdTPYyT3B
        QhFfLGHeK/18steKR301Y0RMtv9V/EY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880914;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pWQ1m120kigJP8UI6CyQFrBjDqO1iQT2O49PACRC7NY=;
        b=lcj89k5WVh2hez+Bd24Oq73UKlKEc85Ivu/B6pfMwNsSbV2OIrZMU8oIFW4VJnpHVuYQFa
        6E5Ifjx2JsjJbODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CFD213466;
        Fri, 12 May 2023 08:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3DnrCdL7XWQZKQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:54 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/11] drm/fbdev: Remove DRM's helpers for fbdev I/O
Date:   Fri, 12 May 2023 10:41:41 +0200
Message-Id: <20230512084152.31233-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DRM provides a number of wrappers around fbdev cfb_() sys_(), fb_io_()
and fb_sys_() helpers. The DRM functions don't provide any additional
functionality for most DRM drivers. So remove them and call the fbdev
I/O helpers directly.

The DRM fbdev I/O wrappers were originally added because <linux/fb.h>
does not protect its content with CONFIG_FB. DRM fbdev emulation did
not build if the the config option had been disabled. This has been
fixed. For fbdev-generic and i915, the wrappers added support for damage
handling. But this is better handled within the two callers, as each
is special in its damage handling.

Patches 1 to 8 replace the DRM wrappers in a number of fbdev emulations.
Patch 9 exports two helpers for damage handling. Patches 10 and 11
update fbdev-generic and i915 with the help of the exported functions.
The patches also remove DRM's fbdev I/O helpers, which are now unused.

DRM's fbdev helpers had to select fbdev I/O helpers for I/O and for
system memory. Each fbdev emulation now selects the correct helpers
for itself. Depending on the selected DRM drivers, kernel builds will
now only contain the necessary fbdev I/O helpers and might be slightly
smaller in size.

Thomas Zimmermann (11):
  drm/armada: Use regular fbdev I/O helpers
  drm/exynos: Use regular fbdev I/O helpers
  drm/gma500: Use regular fbdev I/O helpers
  drm/radeon: Use regular fbdev I/O helpers
  drm/fbdev-dma: Use regular fbdev I/O helpers
  drm/msm: Use regular fbdev I/O helpers
  drm/omapdrm: Use regular fbdev I/O helpers
  drm/tegra: Use regular fbdev I/O helpers
  drm/fb-helper: Export helpers for marking damage areas
  drm/fbdev-generic: Implement dedicated fbdev I/O helpers
  drm/i915: Implement dedicated fbdev I/O helpers

 drivers/gpu/drm/Kconfig                       |  27 +-
 drivers/gpu/drm/Makefile                      |   7 +-
 drivers/gpu/drm/armada/Kconfig                |   8 +
 drivers/gpu/drm/armada/Makefile               |   2 +-
 drivers/gpu/drm/armada/armada_drm.h           |   2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |   9 +-
 drivers/gpu/drm/drm_fb_helper.c               | 233 ++----------------
 drivers/gpu/drm/drm_fbdev_dma.c               |  12 +-
 drivers/gpu/drm/drm_fbdev_generic.c           |  47 +++-
 drivers/gpu/drm/exynos/Kconfig                |   8 +
 drivers/gpu/drm/exynos/Makefile               |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  10 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h     |   2 +-
 drivers/gpu/drm/gma500/Kconfig                |   8 +
 drivers/gpu/drm/gma500/Makefile               |   2 +-
 drivers/gpu/drm/gma500/fbdev.c                |   9 +-
 drivers/gpu/drm/gma500/psb_drv.h              |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   8 +
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  51 +++-
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   2 +-
 drivers/gpu/drm/msm/Kconfig                   |   9 +
 drivers/gpu/drm/msm/Makefile                  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  12 +-
 drivers/gpu/drm/omapdrm/Kconfig               |   9 +
 drivers/gpu/drm/omapdrm/Makefile              |   2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  12 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.h          |   2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |   4 +-
 drivers/gpu/drm/radeon/Kconfig                |   8 +
 drivers/gpu/drm/radeon/Makefile               |   2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |   9 +-
 drivers/gpu/drm/radeon/radeon_mode.h          |   2 +-
 drivers/gpu/drm/tegra/Kconfig                 |   9 +
 drivers/gpu/drm/tegra/Makefile                |   2 +-
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/fbdev.c                 |  11 +-
 include/drm/drm_fb_helper.h                   |  84 +------
 include/drm/drm_fbdev_dma.h                   |   2 +-
 include/drm/drm_fbdev_generic.h               |   2 +-
 43 files changed, 264 insertions(+), 382 deletions(-)


base-commit: 451e49cfbaa90720149e63f4fa9c7824013c783d
-- 
2.40.1

