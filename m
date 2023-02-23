Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176E36A057D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 10:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbjBWJ6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 04:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbjBWJ5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 04:57:41 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA993515F3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:57:14 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t14so7559655ljd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXrfXOXzXAnGhXOYy5k/pL1OHE2nAUYxHQGENjE+KGk=;
        b=ohJ0ReUmz5mUYgneH7l3mxg8pMkbyJtTEvBbJCdPMLJ3QiihYV9uXkwJ8ebnfyfcC7
         bivyvVa3n1ZvbWliVMkUyu4/BCOemex76Lp8FLJb/Zsvi/SMUe2aPqT8kdHduQotpH4V
         lbTS+QqSp1eM96oHKRvv0gbfh7abNLZYoTQGzhJD9icpz7RlMPQJt1IvgY0cmveiRYFY
         +iuwztkwjazMUQ4U+G9dKtmP99KYdG1EkHwV98grjgaCJztawJeEvVYpXDnwo19bUwPT
         49kGh0NHGMJPhp3JDBuGG2vjruyR4FS86UxZtvDjbyltg41z0GecpA7wsDZsjA/fr3FW
         BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXrfXOXzXAnGhXOYy5k/pL1OHE2nAUYxHQGENjE+KGk=;
        b=6Yr4ikaW0QyPMK7xPpocOsyTUfuiFXVEdn1Uq8xH+ST3cntiaZVXotHPY3iIFcOM7S
         RmYE8bfOP9z4mh1noitZ3E/ikWecIV/2x0QutqVlIM6WEe0g7a1abqWgKJMKMWMDTV5u
         bzcWy1HDMO9rHVnv6N+E4vXt1L9wDvh7LMaj54zgkKvkKBdJa54ixcIo6KGpnDs6V2eI
         Y23JpF2/xKMhEXtiw/VbJ1gMNEo3ClNDKpIUFdja1n5Pg/4llULFyo36o8SP1r5mIy1G
         PTEvWD7pq/JooZG56wnT4Hb5MrtWjFIW45JO8O7CSfwv6KnoPM/WeSWXoLnpfemW+bb6
         JE1A==
X-Gm-Message-State: AO0yUKVl/HpJVdFw0NufWL3DKxU5eYuVupoIx3SIXyqYF29VZBO7swm1
        BsFSV69dZmD4Q9WPxUL+QCs3VpNctWNueTqy
X-Google-Smtp-Source: AK7set/u7ABMRAHGthgTexmgRYtv8dZVgMlfPuUOuCF93sPp/oGCN5yFbmZ42f7om+exFdsnm4d2PA==
X-Received: by 2002:a2e:bc0d:0:b0:294:669b:8f97 with SMTP id b13-20020a2ebc0d000000b00294669b8f97mr6159337ljf.46.1677146229148;
        Thu, 23 Feb 2023 01:57:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a18-20020a2eb552000000b002935899fe3fsm602765ljn.116.2023.02.23.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 01:57:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH] drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
Date:   Thu, 23 Feb 2023 12:57:08 +0300
Message-Id: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
when setting the SSPP_NONE pipe. However it was unnoticed until the
kernel was tested under AOSP (with some kind of stack protection/check).

This fixes the following backtrace:

Unexpected kernel BRK exception at EL1
Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
Hardware name: Thundercomm Dragonboard 845c (DT)
pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
sp : ffffffc00bdcb720
x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
Call trace:
 dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
 _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
 dpu_crtc_atomic_begin+0xd8/0x22c [msm]
 drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
 msm_atomic_commit_tail+0x134/0x6f0 [msm]
 commit_tail+0xa4/0x1a4 [drm_kms_helper]
 drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
 drm_atomic_commit+0xac/0xe8
 drm_mode_atomic_ioctl+0xbf0/0xdac
 drm_ioctl_kernel+0xc4/0x178
 drm_ioctl+0x2c8/0x608
 __arm64_sys_ioctl+0xa8/0xec
 invoke_syscall+0x44/0x104
 el0_svc_common.constprop.0+0x44/0xec
 do_el0_svc+0x38/0x98
 el0_svc+0x2c/0xb4
 el0t_64_sync_handler+0xb8/0xbc
 el0t_64_sync+0x1a0/0x1a4
Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)

Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index b88a2f3724e6..6c53ea560ffa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
 			 * all EXT registers has 4-bit fields.
 			 */
-			if (cfg->idx == 0) {
+			if (cfg->idx == -1) {
+				continue;
+			} else if (cfg->idx == 0) {
 				mixercfg[0] |= mix << cfg->shift;
 				mixercfg[1] |= ext << cfg->ext_shift;
 			} else {
-- 
2.30.2

