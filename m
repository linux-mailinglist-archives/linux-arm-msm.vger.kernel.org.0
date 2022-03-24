Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C874E608B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 09:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239632AbiCXIpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 04:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbiCXIpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 04:45:51 -0400
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC5D9BBAD
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1648111455;
        bh=PdI9M8lLoPowcX452EcX6k9LkvHzZyFe5xCg2aOT5z4=;
        h=From:To:Cc:Subject:Date;
        b=vg4xWK4NIb8sElDz95wg3zwA1oddwX8lr3X0UWir/6LLomtj6fRMMlTvgO074Fe5o
         H5hESXV1gGv9LcFF+mK8g/WJ+UL50wuoiLyqqeRXsGn70hocaUrL6xA2FA5UkytCqX
         64GgzcCUbNIwTLnoKOYV9PIySj7TwyfywMOTffi8=
Received: from localhost.localdomain ([218.197.153.188])
        by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
        id 9378DC37; Thu, 24 Mar 2022 16:36:55 +0800
X-QQ-mid: xmsmtpt1648111015tha0g0i7j
Message-ID: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieiszZ2O+QJKzXzwRb+Wv/lEVxDjwkYxMewJHYJdFQoHsoWu9iam
         ajhSQ1Eh+e59SwWAJQNIolA9hH/lQO4f1IuiJrqh01QGQQ8ynx0vMZGFAxTrWV/nL4TZ50nEHhCA
         PfT6P9/3oSVTf0oUQNZhJhUqNJubqPtVBrsJxit3KUIEdtGymqR2GqkLJrTUzGoAP64J8TY8yV9p
         9T0ViPj0BviZ2jvNNEeO4NHAnnxVRGooB5Smg4EQfAXjHZ+U7NXD9DeDsulbB2O3WsjEMUwmbUX/
         ADBjSHLTH7MBY41RUYPX9dQAZ2Nf+IQGfr4sqwcHe+VpytsaAIb0l8FZdedLnu7owihH7/bB0v9w
         v3e1RXil9eAuCmyr3rNX5QpjaiLmjhYRpbRUNFtpKlT2xwQQxsCDC/myDcvfbciwVlDxBk0aXiIQ
         6QghgDCatQm7ZwMb0INN9vCio1kfph/qKCCfq+BUMpXVtNXVwrPK680hWRBfVJCqkw7acP3mMia3
         Bz+5wCSRUSHuDffpafV3/gPepA0ROFJef9Gsx7s+nxaKpeyIQFRfV0LFUVVYToudcy+3otN+loGR
         TV2OGBWjWfMWM+f8XV5kH6wAGlVxKwqe1uFxN+gqf1S6P+yl890qVRqvI7FjqqQVN/fbXiMgnYpA
         dL+SUIo8JEJqMcDJYmMpiSylhXfa94+qdeFiHGHkpsTgSA1PD9TvU5C9e+4MnNBOolUOFy1IgNT6
         qToKziTVG5vtvfM+IMUbXgPDclAYlMtEC9omhpL+vIOMcjZpQnTE2X8QzS/JTU4yt4gJSPLOaaIG
         zfCgezFDJ2hrNk3bmb9cBHRKhm+JXn48gMqMCAUX9W7Ns4xzoJFz+KnndZsd0gAL886EkEk6H95v
         L5nGvh0HYjfeqSczSXqrYSc2ynJYrR+aWjFCZIHMGI4x4PVR9+kQHOwcZuktExV5xkpTnsxCMYqi
         hfz6C6jwuNs/O3Y468qg==
From:   xkernel.wang@foxmail.com
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] drm/msm/mdp5: check the return of kzalloc()
Date:   Thu, 24 Mar 2022 16:36:44 +0800
X-OQ-MSGID: <20220324083644.2666-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69af..5f914cc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -90,15 +90,18 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
-	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	plane->state = NULL;
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-		mdp5_state->base.zpos = STAGE_BASE;
-	else
-		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
-	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (mdp5_state) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			mdp5_state->base.zpos = STAGE_BASE;
+		else
+			mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
+		mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
 
-	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
+		__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
+	}
 }
 
 static struct drm_plane_state *
-- 
