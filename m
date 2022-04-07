Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09934F721E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 04:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiDGCf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 22:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbiDGCf0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 22:35:26 -0400
Received: from out203-205-251-59.mail.qq.com (out203-205-251-59.mail.qq.com [203.205.251.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D951FCD25
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 19:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1649298800;
        bh=EE9E+vmbSiL+K//wojxGVNYmWUWjLLsXN8IgKVrebUk=;
        h=From:To:Cc:Subject:Date;
        b=ivRlrVJoT0v+mTOzm6s/oAswDYTw+6ltGyTev/vN479NeRYUxDCaUkQy2dd6kbZQQ
         8i2Y+CMdwoWrGDFguSlR6zamuBgxvSCDnLB4JoAye1qBO/xudMiCRG/JfUWTmVzDj+
         gsMHp2L5lK4T373oN8Su5kslSjWu7SsjSkN/znsQ=
Received: from localhost.localdomain ([43.227.138.48])
        by newxmesmtplogicsvrszb6.qq.com (NewEsmtp) with SMTP
        id 8082725D; Thu, 07 Apr 2022 10:32:08 +0800
X-QQ-mid: xmsmtpt1649298728tccwz3535
Message-ID: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
X-QQ-XMAILINFO: NSMIDlHhjvLjbXcmEjGjYtMMB+VxtOCuqM52WBMXPTZa5F9/hJEebwSU+dSyh+
         7DH+K4JCzvWDAE2eWZm4BoFyPznmN7xhHELxv+2zcDNzm5tG/NvjSbBPXMoIRXICEgy7IPe3Mkbg
         2YvBRmYADVDi2NnIBnTxVNEVk0s6jPXhUDMnnwPwS8tGvymQkEHYOyVVwabh8PHONsCr8UxennEI
         2rczCZMJhDKnn1SsowQH20yEc8UvqiCnyEPR1UvJKVeCh1B/XWoyx98Dxa8i9K3c+nkhrHFQmfiJ
         EefFHV4HCPA2Jdvgh++/jgIZRWJy9qQn/3wVevqYub1ZqJfFY7/owJzgDnQqNqIsrR4cdHzp9oA/
         VGn59ERTFRjezkhVk2qVVfky8SkvymTT18b08Ltmy+Mg/KLztiv4FVXL6f0mW6Q7LXoqJpu4pRmj
         f8JcbGA+cZGAkznfpPo7FVbfpTLXnOgj7z7VlR0ZwRuHxaeTiDPQioe5BbZK1yivn0HtM5IvSFHo
         EmlrIe9r4UAScMtBOqJjAXaKC2vtaS2K2qFf6DQizXTeOjNIk2r1mpbNK+wCPXsOy2WRT7NlHjZ1
         boNu7eNzS84EfqN/NU9Uiujal69kaQ8wS767eTRNkOqIj6JAeU0HhJAxS0gf87joAL9bCyyLncSq
         Xuutjrjh9Q+FlJ7LwIZIu0ZB29VTnnBwVcEL8I3elo1lQ/454vlId/Ht8P3pUka77/zJrWcyu34z
         d1fMesTcUmBq6Woqwe96DhUcbdUktUtUupCNLVP+rXQ5ZOCj+1wWRU+00Mqz/Yp95ezOHsrUM5ZJ
         g+A4q2PCokVhj8QtZoPOJ/B78AeGQXPY5AaL9tfYm/5BwLdyp/NYvLJUlrWNUD5lctGJSMCbVGm1
         npco49BZrkNCXZjLY9ZUJXOonZOP6rux1flXJ/f5YPvHFEGCFrBRA/PO2Y1FjfK2Q9mRMlvQUh6m
         VpUX3Nun3qh06suqvJlQ==
From:   xkernel.wang@foxmail.com
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] drm/msm/mdp5: check the return of kzalloc()
Date:   Thu,  7 Apr 2022 10:31:51 +0800
X-OQ-MSGID: <20220407023151.13663-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Besides, since mdp5_plane_reset() is void type, so we should better
set `plane-state` to NULL after releasing it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 simplify the patch and update the description.
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69af..50e8542 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -90,7 +90,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
+	plane->state = NULL;
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return;
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		mdp5_state->base.zpos = STAGE_BASE;
-- 
