Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C434918377
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 04:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfEICEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 22:04:09 -0400
Received: from onstation.org ([52.200.56.107]:56736 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfEICEJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 22:04:09 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 326613E93E;
        Thu,  9 May 2019 02:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557367447;
        bh=Kod5cFvQdGvUj1Lnt7VCuJqda/vsktWbnD0AqfqQtBM=;
        h=From:To:Subject:Date:From;
        b=avoHY4QOKE7h8iwJZLUDGJ03o7HT/mmKbQfWKFvZRstKgm1jYHzOLHkAeOniPvqZm
         Q/aCMx8JdyrMGst5x5gzXNH7ERfSlIvee1ChfoJ0tIvs4fe0bGLnYvdMc0O1LOvEY4
         Jql6i9yJY3qsAxnFURoWRNTb4+FkH6AOWOUPQ1z0=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org
Subject: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Date:   Wed,  8 May 2019 22:03:46 -0400
Message-Id: <20190509020352.14282-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here is a patch series that adds initial display support for the LG
Nexus 5 (hammerhead) phone. It's not fully working so that's why some
of these patches are RFC until we can get it fully working.

The phones boots into terminal mode, however there is a several second
(or more) delay when writing to tty1 compared to when the changes are
actually shown on the screen. The following errors are in dmesg:

    [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:49:crtc-0] flip_done timed out
    [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:32:plane-0] flip_done timed out

    WARNING: CPU: 0 PID: 5 at drivers/gpu/drm/drm_atomic_helper.c:1430 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
    [CRTC:49:crtc-0] vblank wait timed out
    Modules linked in:
    CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.1.0-rc6-next-20190426-00006-g35c0d32a96e1-dirty #191
    Hardware name: Generic DT based system
    Workqueue: events deferred_probe_work_func
    [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
    [<c030d5ac>] (show_stack) from [<c0ac134c>] (dump_stack+0x78/0x8c)
    [<c0ac134c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
    [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
    [<c03216e0>] (warn_slowpath_fmt) from [<c0761a0c>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
    [<c0761a0c>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0a98>] (mdp5_complete_commit+0x14/0x40)
    [<c07b0a98>] (mdp5_complete_commit) from [<c07ddb80>] (msm_atomic_commit_tail+0xa8/0x140)
    [<c07ddb80>] (msm_atomic_commit_tail) from [<c0763304>] (commit_tail+0x40/0x6c)
    [<c07633f4>] (drm_atomic_helper_commit) from [<c07667f0>] (restore_fbdev_mode_atomic+0x168/0x1d4)
    ....

I can get the text console to work with a 4.17 kernel with this patch
https://patchwork.kernel.org/patch/10321845/ plus about a dozen or more
other patches that have been mainlined since that release.

I'm new to the DRM subsystem and continuing to dig into the issue,
however I'd appreciate any suggestions. I suspect the issue lies
somewhere in the second patch in this series.

Changes since v1:
- Shortened problem description above. I'll reply to this email and send
  a full dmesg with the boot log with debugging turned on.
- Dropped patch 'fix null pointer dereference in
  msm_atomic_prepare_fb()'
- New patch: Remove resv fields from msm_gem_object struct that was
  incorrectly being referenced by the prepare_fb callbacks.
- Add drm_plane_enable_fb_damage_clips() to plane init for mdp4, mdp5,
  and dpu1.
- Add Linus Walleij's reviewed-by to patches 3-6

Brian Masney (6):
  drm: msm: remove resv fields from msm_gem_object struct
  drm: msm: add dirty framebuffer helper
  ARM: qcom_defconfig: add display-related options
  ARM: dts: msm8974: add display support
  ARM: dts: qcom: msm8974-hammerhead: add support for backlight
  ARM: dts: qcom: msm8974-hammerhead: add support for display

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  79 +++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 132 ++++++++++++++++++
 arch/arm/configs/qcom_defconfig               |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   3 +
 drivers/gpu/drm/msm/msm_atomic.c              |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +
 drivers/gpu/drm/msm/msm_gem.c                 |   3 -
 drivers/gpu/drm/msm/msm_gem.h                 |   4 -
 10 files changed, 229 insertions(+), 13 deletions(-)

-- 
2.20.1

