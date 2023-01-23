Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1F8677837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 11:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjAWKGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 05:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjAWKGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 05:06:08 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ECCD506;
        Mon, 23 Jan 2023 02:06:04 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 08ED334211;
        Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674468363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zvbfFxmPA6MckGsa12w4Fd8iWOMpJ3cRPXUsw4iIFlE=;
        b=hnx13NtxzNm1St8ipbiG73i6D7suAB2xOt8zRS7nVB69ksjHiMHL25Q0pxRnnbNqOza/V1
        oXY/KmiKYhbwQHSeDvZ+uJ5z/ZCBPW1SXEFs64XCNW1mxEnRWgSwAMDQ6uAAWyotEizlA0
        hyAeowqfZwQqI4LT+znkkDhO8Z6+fl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674468363;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zvbfFxmPA6MckGsa12w4Fd8iWOMpJ3cRPXUsw4iIFlE=;
        b=zzKj3UI4WR5ICeAArZmfACKc11DAuP7TD0zJfbZGYG5byVInNlwnlYmH/cP98v1w34uLiQ
        3n6CZISuR2ebLNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9860134F5;
        Mon, 23 Jan 2023 10:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id o3VQLApczmO+DwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:02 +0000
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
Subject: [PATCH 00/10] drm/fb-helper: Various cleanups
Date:   Mon, 23 Jan 2023 11:05:49 +0100
Message-Id: <20230123100559.12351-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/drm_fbdev_generic.c        | 129 ++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  11 +-
 drivers/gpu/drm/msm/msm_fbdev.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |   4 +-
 drivers/gpu/drm/radeon/radeon_fb.c         |   4 +-
 drivers/gpu/drm/tegra/fb.c                 |   7 +-
 include/drm/drm_client.h                   |   8 ++
 include/drm/drm_fb_helper.h                |   7 +-
 13 files changed, 133 insertions(+), 121 deletions(-)


base-commit: 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.39.0

