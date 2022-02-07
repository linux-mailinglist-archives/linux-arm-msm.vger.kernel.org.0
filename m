Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E154AC68E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Feb 2022 17:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236871AbiBGQ4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 11:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382242AbiBGQlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 11:41:12 -0500
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 08:41:12 PST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8177EC0401D1
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 08:41:12 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 717792B00148;
        Mon,  7 Feb 2022 11:35:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 07 Feb 2022 11:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=h2ceKRgcNJg3I9h78SEL5uVotb13Hm
        XB1sRGJfgewsU=; b=RRqfvT62jhE7IARUqT9OOKlyjPnYIx2UzzE5ozH3WAJd7V
        6UHX4CfG/mzMKcuQ8CYsC4IDKsw9VBY1ZnqwoAQ2eO7eKmmCiWpusP7jzObiY26C
        z5t5Iug5VrnH2crVXsF2N+fQ1zpO5UB66cxNImYEzVqKu1ZE/wH8tH+Apz45dQZg
        fIQenvm24i3DW9SQPHHDr9nM6sBE3mtvHu6kbd+dggUIJW7SGUhjEb98dmu0SABI
        qbtLmUDHnV7wLAFDMPmtV2aTk4aBmyu0OWY5+ZrZ5266DRPXVZ4sitnOS40Y0Bqc
        bk9D09JVNGSuX+xIxe9IXtdHsmLHpYFT4lmhbwDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h2ceKR
        gcNJg3I9h78SEL5uVotb13HmXB1sRGJfgewsU=; b=GWdP74ITXaareVs/S1JaSx
        jakNh1O9IyTkhXzox4tG9R1AHCXUVSpoVrwaXSWUbjyJOKq8FqIwqXfJK4Z1oCGt
        Bjvb1xqavWQ6/R6YUmVlr5xJmEDAKOfXv+kGqCnIZs76u/RBzYkt/ghnepdUPCBw
        PpkMx8huyzJr0A50Lqjc9vB5vISz0D4egcrLGEBmijfjPKuVlW96GyWeOxo9A+I2
        Xu69Tc+Fe/SjDioN5H+SGY0JxQ4L5QhivW/qIrEDK5yUKFwQ2gtIFFF4WISkmdq8
        FsPZdOMLRJTzwjeZck4/3wq7TjbLnCvJWd7Kxw92uH23DrNAQAP4rw1g2q0ydJ+Q
        ==
X-ME-Sender: <xms:aEoBYqKx1Y7f7eidIBkhQxmdFtqQBTUOi4Q46TFWYRMuD9RvP6NGOw>
    <xme:aEoBYiJK4lMTsQbQ1WTtbMJGYLELMRDzhzcdIw-nbQlBCfn8FzZMtf_RHXccXAn2k
    y8nRHMCYcbgq7zwMZc>
X-ME-Received: <xmr:aEoBYqt0rNAxj8RRr1jamuNpW7Cu9YyYKo5Cshmyj-ZOOZdMe_chyhI9-78rg0H-hIXzdR8DO270CGT9eOVXjyQgQFhPlUzB6_bUTlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aEoBYva6xubdnECgCGruVDrIlyLx_dqhdQivfh-06uJtebHFdF8Htg>
    <xmx:aEoBYhZjorl-B2dMIlk-vt0ParmsnkJhyH0oRpvtW4K4wP3MAz9w2g>
    <xmx:aEoBYrCQWNxpiX0OC-vNJ4sPr9kWzlS3mK4LejDP1tjyBW8WloeHgg>
    <xmx:aUoBYlq1Et9_ixKmDxobmRqSR78oGqbKWl2jxgEqASWIvZk3xeRAxwQABn4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:52 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 12/23] drm/msm/mdp5: Remove redundant zpos initialisation
Date:   Mon,  7 Feb 2022 17:35:04 +0100
Message-Id: <20220207163515.1038648-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mdp KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in mdp5_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index d60982f4bd11..5d8ac84c510b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -98,13 +98,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
-
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-		mdp5_state->base.zpos = STAGE_BASE;
-	else
-		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
-	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
-
 	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
 
-- 
2.34.1

