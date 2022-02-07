Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB934AC689
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Feb 2022 17:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354096AbiBGQzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 11:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391395AbiBGQq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 11:46:27 -0500
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F54C03FEC2
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 08:46:12 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id DC7942B00104;
        Mon,  7 Feb 2022 11:35:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=KkWATsWD3yxx4KnUgpTvJTkg+itLze
        ChvgKpxGcaR3U=; b=FdKZbNacRrKJxZkJ//+nVJpMR+O52n2YC6TbQalo02S65i
        6iqAZwMUZX6EERRWeamp0qNENw0bP8tOvvEvtnGJnbZfDlMUFoPJs2gLamNgiHOt
        42ZJMjQv2QPfRAYfOJKZ5lTbDkWeUAM2FdPyekXMFyNGJaryIaETJ4qwEp4bl2pN
        OCQPxMb0zw1sNkVhWn5gVUc9UvhMmeOARmUlgokKAa69zGV+vuw38yU1SuKDmqOH
        nT91NhRl7Ky1fBI4Yko354vj9kawrWHWTwBP8BIhky88OpKx69d/WKYB3jJ66deX
        M5MOKMvSAsLTAOH3JDZ9OTFgvb52HomlTWGK0/8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KkWATs
        WD3yxx4KnUgpTvJTkg+itLzeChvgKpxGcaR3U=; b=I7NyxhFonpeRLYTU5bM2TG
        ApiYJZ07jz9EocpBNCUFMyMXmrlz8Bl3egfNrpXuVCVKHDfyAatleoC4k7axfiSu
        NdD77bg90IONRzJErZuFoSzVG8nD+VTD/ZgCWVUmP3IRi94OdnA5wWx+UDF5ucst
        8LHuMuSnKa5zVb28ERSAMriR1MxtEANZSo5aB1IAqTRrPjVsHxtKnOco0dWBsI/6
        L3zMt6yX11fVmjQYFbF5EzBlw+w4rGI+4OqI654B8Gx+8VnTZNGkgu/wtCofqYlM
        +UOvkNnsEJZIfgBhiCDIL0WrrQL4pH1wcvZHgK8oKvwyNT4e9+A+6SBto71LP7lw
        ==
X-ME-Sender: <xms:UUoBYqgXoWv66i2f6BPEn-p8t1P1gmY459ACKcAjMrEvuehvEGIYxQ>
    <xme:UUoBYrAerlWE5DIO7_MGlnD8V231wxGTaGDkqifqqPYXl_Nb3bL-mAC5IMv2-SdYE
    l77sGPly8RcPBEyTYk>
X-ME-Received: <xmr:UUoBYiGJVczYMxInWQ4UEioAMwTAsM64lQ_neUHe-UUfA7HL-jt5MnX1bOSovKMP_j2tLzefHn2g26_c9_Qoo7MZ4yLcp9grTnAP96Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UUoBYjR17iaNZo-NGzhRxybKIghD1sE8Y2rv1Aw0fA3k_u6jn_Oc-w>
    <xmx:UUoBYnxjCDGGyJ3iGOvcRskbFkWnBxfxR_s3trNuI2G6ePCXckOO1g>
    <xmx:UUoBYh5gKimqdLrR0oJdFzBzyBjkOXOypD2mqYqjHWyodIJo534PSQ>
    <xmx:UUoBYvhY66xcqrRrJ1ZwBFgTHaRRrTc7-6PhRBBCZPPf8TpeSdoHQg_YNDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:28 -0500 (EST)
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
Subject: [PATCH 04/23] drm/msm/mdp5: Fix zpos initial value mismatch
Date:   Mon,  7 Feb 2022 17:34:56 +0100
Message-Id: <20220207163515.1038648-5-maxime@cerno.tech>
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

While the mdp5_plane_install_properties() function calls
drm_plane_create_zpos_property() with an initial value of 1,
mdp5_plane_reset() will force it to another value depending on the plane
type.

Fix the discrepancy by setting the initial zpos value to the same value
in the drm_plane_create_zpos_property() call.

Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69afcbac8..d60982f4bd11 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -48,6 +48,8 @@ static void mdp5_plane_destroy(struct drm_plane *plane)
 static void mdp5_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
 {
+	unsigned int zpos;
+
 	drm_plane_create_rotation_property(plane,
 					   DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
@@ -59,7 +61,12 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
 			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 			BIT(DRM_MODE_BLEND_PREMULTI) |
 			BIT(DRM_MODE_BLEND_COVERAGE));
-	drm_plane_create_zpos_property(plane, 1, 1, 255);
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		zpos = STAGE_BASE;
+	else
+		zpos = STAGE0 + drm_plane_index(plane);
+	drm_plane_create_zpos_property(plane, zpos, 1, 255);
 }
 
 static void
-- 
2.34.1

