Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66588679961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbjAXNkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 08:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbjAXNkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:14 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA6F302A5;
        Tue, 24 Jan 2023 05:40:13 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EEB011FDBF;
        Tue, 24 Jan 2023 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bkFQqvsdRxbFh+T/xgjgYaZo/8sz/0LHQ7jzsk0ZmNc=;
        b=ZM9perR3zfHsbqddSsBIqCNYfegdPwzpG5QiOfR5H6SGs/rzEyIxETO2dWv95am94wnLXs
        tY8wy1o6wAgZP4BtE+qXyiYJjI+Ywn7X5gE/m030vLjoMjYPI+MGNG4WbehltB6BlGrpci
        0qYeolhSrNCglLsvcJu774/ZuJlTidg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567611;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bkFQqvsdRxbFh+T/xgjgYaZo/8sz/0LHQ7jzsk0ZmNc=;
        b=vHhgPBAuqrG4dLoI1MubNO5r3KDCDwlxIjcCqBi2c+bZo8b2bRA2COsoC9e+WV57p9N/rQ
        2EI5OVQohJCOWECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A856B13487;
        Tue, 24 Jan 2023 13:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +B4MKLvfz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:11 +0000
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
Subject: [PATCH v2 01/10] drm/client: Test for connectors before sending hotplug event
Date:   Tue, 24 Jan 2023 14:40:01 +0100
Message-Id: <20230124134010.30263-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
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

Test for connectors in the client code and remove a similar test
from the generic fbdev emulation. Do nothing if the test fails.
Not having connectors indicates a driver bug.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c        | 5 +++++
 drivers/gpu/drm/drm_fbdev_generic.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 262ec64d4397..09ac191c202d 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -198,6 +198,11 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
 
+	if (!dev->mode_config.num_connector) {
+		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
+		return;
+	}
+
 	mutex_lock(&dev->clientlist_mutex);
 	list_for_each_entry(client, &dev->clientlist, list) {
 		if (!client->funcs || !client->funcs->hotplug)
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 0a4c160e0e58..3d455a2e3fb5 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -389,11 +389,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (dev->fb_helper)
 		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
-	if (!dev->mode_config.num_connector) {
-		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
-		return 0;
-	}
-
 	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
-- 
2.39.0

