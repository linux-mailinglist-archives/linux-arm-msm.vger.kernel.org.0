Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FEB2B4D19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732966AbgKPRdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:33:52 -0500
Received: from verein.lst.de ([213.95.11.211]:55440 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730530AbgKPRdw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:33:52 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8E38668BEB; Mon, 16 Nov 2020 18:33:48 +0100 (CET)
Date:   Mon, 16 Nov 2020 18:33:46 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Rob Clark <robdclark@gmail.com>, Christoph Hellwig <hch@lst.de>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
Message-ID: <20201116173346.GA24173@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de> <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com> <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca> <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com> <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like 
> dma_sync_single_for_cpu() does deal in some way with the partial cache line 
> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.

No, it doesn't.  You need to ensure ownership is managed at
dma_get_cache_alignment() granularity.
