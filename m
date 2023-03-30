Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8075A6CFD0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjC3Hly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjC3Hlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:41:53 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F94449A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:41:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6B2C71FE8F;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680162111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=dUTY1XNd64qKFlaH/zT5Lxf5pTkHksszo20OFmvgBcI=;
        b=NwjC+FO+10fbeuaalpvsmy6CLT4plJuvRIgSz2OQaCk51gCWWGx6feGBP4w5ZcIZKZ9sRW
        wPltBzR3CdTfsdHAr9E7UJ+oHYcqcJo0XZyiucG4BsvhHcIJEXsHswxMY2w6MGJIrhmY0s
        l7G86TYJpjhnFCsByQHCvePjNQFFKGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680162111;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=dUTY1XNd64qKFlaH/zT5Lxf5pTkHksszo20OFmvgBcI=;
        b=qDUUfNfVFspDXFZekkgYc1aNZOxwUUET5/jpDh8KcWK+Bty5Fke9bGttKRO4BHmi+kd2nb
        YvzjHRTERhlt4lCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 768D61348E;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id v4zgGz89JWSZfQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:51 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] drm/msm: Convert fbdev to DRM client
Date:   Thu, 30 Mar 2023 09:41:43 +0200
Message-Id: <20230330074150.7637-1-tzimmermann@suse.de>
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

Thomas Zimmermann (6):
  drm/msm: Clear aperture ownership outside of fbdev code
  drm/msm: Remove fb from struct msm_fbdev
  drm/msm: Remove struct msm_fbdev
  drm/msm: Remove fbdev from struct msm_drm_private
  drm/msm: Initialize fbdev DRM client
  drm/msm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/msm/msm_debugfs.c |   6 +-
 drivers/gpu/drm/msm/msm_drv.c     |  21 ++--
 drivers/gpu/drm/msm/msm_drv.h     |  12 ++-
 drivers/gpu/drm/msm/msm_fbdev.c   | 168 ++++++++++++++++++------------
 4 files changed, 118 insertions(+), 89 deletions(-)

-- 
2.40.0

