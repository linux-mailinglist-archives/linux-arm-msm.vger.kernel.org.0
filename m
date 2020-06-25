Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E7A209DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 13:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404309AbgFYL6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 07:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYL6Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 07:58:24 -0400
Received: from localhost.localdomain (unknown [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DA9E206C0;
        Thu, 25 Jun 2020 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593086303;
        bh=n+NIDwq4Yu1dlj95q6O8WbIlXFw5he30oA79V5wNIzA=;
        h=From:To:Cc:Subject:Date:From;
        b=cOk0H55IKLgHd/SEWqK2NNv39cFmXwAdcMNWWBG2/ySGVIHhes28OlKolB4P5eHiz
         Sin1L/7NSQsIdyL2Ee3bixpHKnJTCBXBHc214drM1aB6vuOM1B2B4sj63HTO5QGoJR
         L+Sr4hPd5t4mF5b8LCUPUVUkVNHNzeld3/HRPPdU=
From:   Shawn Guo <shawnguo@kernel.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
Date:   Thu, 25 Jun 2020 19:57:46 +0800
Message-Id: <20200625115746.13396-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

The msm/mdp5 driver uses drm_private_obj as its global atomic state,
which keeps the assignment of hwpipe to plane.  With drm_private_obj
missing from duplicate state call, mdp5 suspend works with no problem
only for the very first time.  Any subsequent suspend will hit the
following warning, because hwpipe assignment doesn't get duplicated for
suspend state.  Adding drm_private_obj handling for duplicate state call
fixes the problem.

$ echo mem > /sys/power/state
[   38.111144] PM: suspend entry (deep)
[   38.111185] PM: Syncing filesystems ... done.
[   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   38.115912] OOM killer disabled.
[   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[   38.122170] ------------[ cut here ]------------
[   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
[   38.122215] Modules linked in:
[   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
[   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
[   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
[   38.122230] pc : mdp5_pipe_release+0x90/0xc0
[   38.122233] lr : mdp5_pipe_release+0x90/0xc0
[   38.122235] sp : ffff00000d13b7f0
[   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
[   38.122240] x27: 0000000000000002 x26: ffff800079adce00
[   38.122243] x25: ffff800079405200 x24: 0000000000000000
[   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
[   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
[   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
[   38.122255] x17: 0000000000000000 x16: 0000000000000000
[   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
[   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
[   38.122264] x11: 0000000000000000 x10: ffff000008cda000
[   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
[   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
[   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
[   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
[   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
[   38.122281] Call trace:
[   38.122285]  mdp5_pipe_release+0x90/0xc0
[   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
[   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
[   38.122298]  drm_atomic_helper_check+0x38/0xa8
[   38.122302]  drm_atomic_check_only+0x3e8/0x630
[   38.122305]  drm_atomic_commit+0x18/0x58
[   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
[   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
[   38.122316]  msm_pm_suspend+0x4c/0x70
[   38.122320]  dpm_run_callback.isra.6+0x20/0x68
[   38.122323]  __device_suspend+0x110/0x308
[   38.122326]  dpm_suspend+0x100/0x1f0
[   38.122329]  dpm_suspend_start+0x64/0x70
[   38.122334]  suspend_devices_and_enter+0x110/0x500
[   38.122336]  pm_suspend+0x268/0x2c0
[   38.122339]  state_store+0x88/0x110
[   38.122345]  kobj_attr_store+0x14/0x28
[   38.122352]  sysfs_kf_write+0x3c/0x50
[   38.122355]  kernfs_fop_write+0x118/0x1e0
[   38.122360]  __vfs_write+0x30/0x168
[   38.122363]  vfs_write+0xa4/0x1a8
[   38.122366]  ksys_write+0x64/0xe8
[   38.122368]  __arm64_sys_write+0x18/0x20
[   38.122374]  el0_svc_common+0x6c/0x178
[   38.122377]  el0_svc_compat_handler+0x1c/0x28
[   38.122381]  el0_svc_compat+0x8/0x18
[   38.122383] ---[ end trace 24145b7d8545345b ]---
[   38.491552] Disabling non-boot CPUs ...

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 85d163f16801..024985a92156 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 	struct drm_atomic_state *state;
 	struct drm_connector *conn;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *priv_obj;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int err = 0;
@@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
+	drm_for_each_privobj(priv_obj, dev) {
+		struct drm_private_state *priv_state;
+
+		priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
+		if (IS_ERR(priv_state)) {
+			err = PTR_ERR(priv_state);
+			goto free;
+		}
+	}
+
 	/* clear the acquire context so that it isn't accidentally reused */
 	state->acquire_ctx = NULL;
 
@@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
 	struct drm_connector_state *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
+	struct drm_private_state *new_priv_state;
+	struct drm_private_obj *priv_obj;
 
 	state->acquire_ctx = ctx;
 
@@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
 	for_each_new_connector_in_state(state, connector, new_conn_state, i)
 		state->connectors[i].old_state = connector->state;
 
+	for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
+		state->private_objs[i].old_state = priv_obj->state;
+
 	ret = drm_atomic_commit(state);
 
 	state->acquire_ctx = NULL;
-- 
2.17.1

