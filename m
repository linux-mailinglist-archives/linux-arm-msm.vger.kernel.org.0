Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4248633587
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 18:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfFCQ4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 12:56:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfFCQ4d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 12:56:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 82DD527FDB2
From:   Helen Koike <helen.koike@collabora.com>
To:     dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com
Cc:     andrey.grodzovsky@amd.com, daniel.vetter@ffwll.ch,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        boris.brezillon@collabora.com, David Airlie <airlied@linux.ie>,
        Sean Paul <seanpaul@google.com>, kernel@collabora.com,
        harry.wentland@amd.com,
        =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@google.com>,
        Helen Koike <helen.koike@collabora.com>,
        Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, eric@anholt.net,
        Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Rob Clark <robdclark@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org,
        David Francis <David.Francis@amd.com>,
        Mario Kleiner <mario.kleiner.de@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        freedreno@lists.freedesktop.org,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 0/5] drm: Fix fb changes for async updates
Date:   Mon,  3 Jun 2019 13:56:05 -0300
Message-Id: <20190603165610.24614-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

I'm re-sending this series with the acked by in the msm patch and
updating the docs in the last patch, the rest is the same.

v3 link: https://patchwork.kernel.org/project/dri-devel/list/?series=91353

Thanks!
Helen

Changes in v4:
- add acked by tag
- update docs in atomic_async_update callback

Changes in v3:
- use swap() to swap old and new framebuffers in async_update
- get the reference to old_fb and set the worker after vop_plane_atomic_update()
- add a FIXME tag for when we have multiple fbs to be released when
vblank happens.
- update commit message
- Add Reviewed-by tags
- Add TODO in drm_atomic_helper_async_commit()

Changes in v2:
- added reviewed-by tag
- update CC stable and Fixes tag
- Added reviewed-by tag
- updated CC stable and Fixes tag
- Change the order of the patch in the series, add this as the last one.
- Add documentation
- s/ballanced/balanced

Helen Koike (5):
  drm/rockchip: fix fb references in async update
  drm/amd: fix fb references in async update
  drm/msm: fix fb references in async update
  drm/vc4: fix fb references in async update
  drm: don't block fb changes for async plane updates

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
 drivers/gpu/drm/drm_atomic_helper.c           | 22 ++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  4 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 51 ++++++++++---------
 drivers/gpu/drm/vc4/vc4_plane.c               |  2 +-
 include/drm/drm_modeset_helper_vtables.h      |  8 +++
 6 files changed, 52 insertions(+), 38 deletions(-)

-- 
2.20.1

