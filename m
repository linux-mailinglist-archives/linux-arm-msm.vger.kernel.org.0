Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0E76D44A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjDCMpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjDCMpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:43 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616E1658F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F1F6C1FF3D;
        Mon,  3 Apr 2023 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=hpiFlTmrji3Q9ytRoYjAuJC+JpPwu81VCde8xwkls0Q=;
        b=VwCWKEwxgqq0kM3hkVRD4H2LOOp47q3JJUh3yjKNCKB6Ls3uG0n3qZNMB/I4veMmZQtMHc
        rJr1eqL9/+mn7HKQ2wVPnvllua57+VwePV8iOJjX2xbYgKQ2i/ZciXDYfg0M3KFO6Bxsxx
        T8zr6guG6HpShafTnFwoFrVy2gzEflM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525941;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=hpiFlTmrji3Q9ytRoYjAuJC+JpPwu81VCde8xwkls0Q=;
        b=1HJJWi1SYkw16PESCnrSbLoTKAF7Af9DvHH+gEBEmUDjzh/nYleHLUXs231P8AMdWazLu+
        ED+rwzIVGmvHp1Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B62551331A;
        Mon,  3 Apr 2023 12:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sim1KnTKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:40 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
Date:   Mon,  3 Apr 2023 14:45:30 +0200
Message-Id: <20230403124538.8497-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert msm' fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in msm is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

v2:
	* handle 'fbdev' module parameter in fbdev code
	* add missing kfree()
	* minor fixes

Thomas Zimmermann (8):
  drm/msm: Include <linux/io.h>
  drm/msm: Clear aperture ownership outside of fbdev code
  drm/msm: Remove fb from struct msm_fbdev
  drm/msm: Remove struct msm_fbdev
  drm/msm: Remove fbdev from struct msm_drm_private
  drm/msm: Move module parameter 'fbdev' to fbdev code
  drm/msm: Initialize fbdev DRM client
  drm/msm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/msm/msm_debugfs.c  |   6 +-
 drivers/gpu/drm/msm/msm_drv.c      |  27 ++---
 drivers/gpu/drm/msm/msm_drv.h      |  12 +-
 drivers/gpu/drm/msm/msm_fbdev.c    | 173 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_io_utils.c |   1 +
 5 files changed, 125 insertions(+), 94 deletions(-)


base-commit: a7180debb9c631375684f4d717466cfb9f238660
-- 
2.40.0

