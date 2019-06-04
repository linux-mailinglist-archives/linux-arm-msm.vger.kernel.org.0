Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A76341DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 10:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfFDIcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 04:32:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40654 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfFDIcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 04:32:19 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C467260E1F;
        Tue,  4 Jun 2019 09:32:15 +0100 (BST)
Date:   Tue, 4 Jun 2019 10:32:11 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
        andrey.grodzovsky@amd.com, daniel.vetter@ffwll.ch,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sean Paul <seanpaul@google.com>, kernel@collabora.com,
        harry.wentland@amd.com,
        =?UTF-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@google.com>,
        Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, eric@anholt.net,
        Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org,
        David Francis <David.Francis@amd.com>,
        Mario Kleiner <mario.kleiner.de@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        freedreno@lists.freedesktop.org,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 0/5] drm: Fix fb changes for async updates
Message-ID: <20190604103211.7a42be9b@collabora.com>
In-Reply-To: <20190603165610.24614-1-helen.koike@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  3 Jun 2019 13:56:05 -0300
Helen Koike <helen.koike@collabora.com> wrote:

> Hello,
> 
> I'm re-sending this series with the acked by in the msm patch and
> updating the docs in the last patch, the rest is the same.
> 
> v3 link: https://patchwork.kernel.org/project/dri-devel/list/?series=91353

Series queued to drm-misc-fixes.

> 
> Thanks!
> Helen
> 
> Changes in v4:
> - add acked by tag
> - update docs in atomic_async_update callback
> 
> Changes in v3:
> - use swap() to swap old and new framebuffers in async_update
> - get the reference to old_fb and set the worker after vop_plane_atomic_update()
> - add a FIXME tag for when we have multiple fbs to be released when
> vblank happens.
> - update commit message
> - Add Reviewed-by tags
> - Add TODO in drm_atomic_helper_async_commit()
> 
> Changes in v2:
> - added reviewed-by tag
> - update CC stable and Fixes tag
> - Added reviewed-by tag
> - updated CC stable and Fixes tag
> - Change the order of the patch in the series, add this as the last one.
> - Add documentation
> - s/ballanced/balanced
> 
> Helen Koike (5):
>   drm/rockchip: fix fb references in async update
>   drm/amd: fix fb references in async update
>   drm/msm: fix fb references in async update
>   drm/vc4: fix fb references in async update
>   drm: don't block fb changes for async plane updates
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
>  drivers/gpu/drm/drm_atomic_helper.c           | 22 ++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  4 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 51 ++++++++++---------
>  drivers/gpu/drm/vc4/vc4_plane.c               |  2 +-
>  include/drm/drm_modeset_helper_vtables.h      |  8 +++
>  6 files changed, 52 insertions(+), 38 deletions(-)
> 

