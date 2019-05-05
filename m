Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B97A813F83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfEENE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 May 2019 09:04:28 -0400
Received: from onstation.org ([52.200.56.107]:46250 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfEENE1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 May 2019 09:04:27 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C69583E941;
        Sun,  5 May 2019 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557061466;
        bh=jlI/KO0MuJlqWNcU9HF6z6jRtqk4FERbkSEJJS9Mxwc=;
        h=From:To:Subject:Date:From;
        b=poPkPYT0eWfFH9GeZSybgwTRVfLU1L/JjOsp4kx9oiInYD9ER/EqElwWnm5KFGHVS
         k36LsGyD1iQcuhO/sOy9yBMdMsAKGlgDU+oEdvHij+DgEXT3lbksn+m6pbovC5pQXy
         VvnCbMlX0EZtVuypEWVuwQ3axGOkS48K2jLDFF0o=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH RFC 0/6] ARM: qcom: initial Nexus 5 display support
Date:   Sun,  5 May 2019 09:04:07 -0400
Message-Id: <20190505130413.32253-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here is a patch series that adds initial display support for the LG
Nexus 5 (hammerhead) phone. The board boots into terminal mode, however
there is a several second (or more) delay when writing to tty1 compared
to when the changes are actually shown on the screen. The following
errors are in dmesg:

    msm fd900000.mdss: pp done time out, lm=0
    [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:49:crtc-0] flip_done timed out
    [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:32:plane-0] flip_done timed out

mdp5_get_scanoutpos() and mdp5_get_vblank_counter() both return 0, which
is causing this stack trace to be dumped into the system log several
times:

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

In mdp5_irq(), I see that a few vblank IRQ statuses (0x1000) come
through when the board boots, drm_handle_vblank() is called, and the
screen updates, however mdp5_get_scanoutpos() continues to return 0
after these operations complete.

I don't see any ping-pong done IRQ statuses (0x100) come through in
mdp5_irq().

I can get the text console to work with a 4.17 kernel with this patch
https://patchwork.kernel.org/patch/10321845/ plus about a dozen or more
other patches that have been mainlined since that release. The pp done
and vblank messages still happen, however tty1 is updated when I write
to it and Wayland works.

The lg,acx467akm-7 panel listed below is currently handled by the simple
panel driver since it is sufficient for 4.17 kernel, but that may need
to change in the future for the power on commands. To be sure, I followed
the instructions at
https://github.com/freedreno/freedreno/wiki/DSI-Panel-Driver-Porting
for porting the almost 400 panel on commands from the downstream kernel
sources at
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-hammerhead/msm8974-hammerhead-panel.dtsi#L645.
The screen turns all white when the panel display is turned on and the
panel exits sleep mode. Unfortunately, there are a lot of power on
commands listed in the downstream device tree that aren't listed in
mipi_display.h.

Thanks in advance for any advice that you can provide.

Brian Masney (6):
  drm/msm: fix null pointer dereference in msm_atomic_prepare_fb()
  drm/msm: add dirty framebuffer helper
  ARM: qcom_defconfig: add display-related options
  ARM: dts: msm8974: add display support
  ARM: dts: qcom: msm8974-hammerhead: add support for backlight
  ARM: dts: qcom: msm8974-hammerhead: add support for display

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  79 +++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 132 ++++++++++++++++++
 arch/arm/configs/qcom_defconfig               |   5 +
 drivers/gpu/drm/msm/msm_atomic.c              |   8 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +
 5 files changed, 223 insertions(+), 3 deletions(-)

-- 
2.20.1

