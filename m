Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4628E67BBA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbjAYUEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbjAYUET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:19 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6499D38B75;
        Wed, 25 Jan 2023 12:04:18 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2176D1FEAB;
        Wed, 25 Jan 2023 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=v+JlmQ6zOfEmYINTHVQmCD4th6Md9FT33+9hsBuYtF0=;
        b=ZYXGBufK6ZysZF46pzEz6pO8QsVPqQxiPg0dI4p58wnguxY20j00SqYdb5T8v0wEyeNhDU
        KuHfhSkvsoTbyvsQpVfYqQZhtSrdNRLQr0VMO0glCEO8pnev9yKZg6kzX5FTh1qAgRQTJF
        z1j/fzW3MmUkH4j+DiIj+LKdJJfAOSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677057;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=v+JlmQ6zOfEmYINTHVQmCD4th6Md9FT33+9hsBuYtF0=;
        b=Ps1LBq6ihdGq0l9dLNZQOj0dx+OAD1f6QwcR9DesgnfXMDZau86WlxrDGHkgZR7JPGoNt5
        rItaN1arPvlWbHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF1141339E;
        Wed, 25 Jan 2023 20:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +UmVMUCL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:16 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/10] drm/fb-helper: Various cleanups
Date:   Wed, 25 Jan 2023 21:04:05 +0100
Message-Id: <20230125200415.14123-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add various cleanups and changes to DRM's fbdev helpers and the
generic fbdev emulation. There's no clear theme here, just lots
of small things that need to be updated.
 
In the end, the code will better reflect which parts are in the 
DRM client, which is fbdev emulation, and which are shared fbdev
helpers.

v3:
	* various minor fixes (Javier))
	* build with CONFIG_DRM_FBDEV_EMULATION unset (kernel test robot)
v2:
	* cleanups in drm_fbdev_fb_destroy() (Sam)
	* fix declaration of drm_fb_helper_unprepare()

Thomas Zimmermann (10):
  drm/client: Test for connectors before sending hotplug event
  drm/client: Add hotplug_failed flag
  drm/fb-helper: Introduce drm_fb_helper_unprepare()
  drm/fbdev-generic: Initialize fb-helper structure in generic setup
  drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
  drm/fb-helper: Initialize fb-helper's preferred BPP in prepare
    function
  drm/fbdev-generic: Minimize hotplug error handling
  drm/fbdev-generic: Minimize client unregistering
  drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy()
  drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'

 drivers/gpu/drm/armada/armada_fbdev.c      |   4 +-
 drivers/gpu/drm/drm_client.c               |  10 ++
 drivers/gpu/drm/drm_fb_helper.c            |  58 ++++++---
 drivers/gpu/drm/drm_fbdev_generic.c        | 131 ++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  11 +-
 drivers/gpu/drm/msm/msm_fbdev.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |   4 +-
 drivers/gpu/drm/radeon/radeon_fb.c         |   4 +-
 drivers/gpu/drm/tegra/fb.c                 |   7 +-
 include/drm/drm_client.h                   |   8 ++
 include/drm/drm_fb_helper.h                |  16 ++-
 13 files changed, 138 insertions(+), 127 deletions(-)


base-commit: 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
-- 
2.39.0

