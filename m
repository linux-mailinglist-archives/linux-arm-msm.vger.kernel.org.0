Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14EB30BFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfEaJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:31 -0400
Received: from onstation.org ([52.200.56.107]:51312 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfEaJqb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:31 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id CC0903E80A;
        Fri, 31 May 2019 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295990;
        bh=49G1eU+yZvHTYQpvw1OvAZKYIN/9I7PCg4V7MtIDuUM=;
        h=From:To:Subject:Date:From;
        b=JjgJkYvyX+wyle7H5K28przJBTDMqMIgNsBfeQZMW9a3y0UQkixhNt+tPfbNTRMnW
         deqCVPa9vPZZG247IE4oQ3kHzKA7ZK7jTqMoyP8E4Svvw3e7OecfYhxS95ZFuuUZCg
         C4z6RV0NPyh653u7214LdpwuaHQaRA7+P9amzKMM=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 0/6] ARM: qcom: working Nexus 5 display support
Date:   Fri, 31 May 2019 05:46:13 -0400
Message-Id: <20190531094619.31704-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds working display support to the LG Nexus 5
(hammerhead) phone.

Changes since v2:
- Dropped two drm/msm bug fix patches that have been merged separately.
- New patch: 'add support for per-CRTC max_vblank_count on mdp5'.
  Special thanks to Jeffrey Hugo for helping to track down this issue.
- Add panel_pin to msm8974-hammerhead device tree. Dropped Linus
  Walleij's reviewed-by on this patch due to this change.

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

My status page at https://masneyb.github.io/nexus-5-upstream/
describes what is working so far with the upstream kernel on the Nexus
5.

Brian Masney (6):
  drm/msm: add dirty framebuffer helper
  drm/msm: add support for per-CRTC max_vblank_count on mdp5
  ARM: qcom_defconfig: add display-related options
  ARM: dts: qcom: msm8974-hammerhead: add support for backlight
  ARM: dts: msm8974: add display support
  ARM: dts: qcom: msm8974-hammerhead: add support for display

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  92 ++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 132 ++++++++++++++++++
 arch/arm/configs/qcom_defconfig               |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  16 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   3 +
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +
 9 files changed, 256 insertions(+), 2 deletions(-)

-- 
2.20.1

