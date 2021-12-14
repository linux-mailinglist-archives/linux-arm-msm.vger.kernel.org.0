Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0E1473B96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 04:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhLNDh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 22:37:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:56386 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229979AbhLNDh0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 22:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639453046; x=1670989046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zvW0rVDOsw3A1J3iTHRC/yuQ7RJV1sqF+QY7pKkw/jo=;
  b=NL+FGO5wvCayZ6Aw0ljgMnQv23VZJ3yPrQ2yyNQxXtft5hvgcfpfLQXY
   kUnTuuzHNwlipZi9uS6OW1gQZP5wNrQdLLZt2iT8R1MTz9CrpXN4Hydaz
   OsMqoZg7B9FGXjg9SIqPm7UieAapP3bXecE1yOKlDIE2qGDRmhhzFxshY
   LE0A61M2BQS0N5lKTCfz4yI4DfkNHgsbe5zwT8UEGsBMGt7Kl0yr4V+6w
   jUtK6SASVy3XVAGobAKAnxPUDPvDlCvf8zXqTYsFSHF+wiEnLaff3O98O
   IFXtWoXYKQFB5x3zGfLmw9xSzr8+zfVwdBxTd+xds2JP5EtODFeGu918k
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299668591"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="299668591"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 19:37:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="505190229"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 19:37:26 -0800
Date:   Mon, 13 Dec 2021 19:37:25 -0800
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/amdgpu: Ensure kunmap is called on error
Message-ID: <20211214033725.GR3538886@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-7-ira.weiny@intel.com>
 <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 13, 2021 at 09:37:32PM +0100, Christian K�nig wrote:
> Am 11.12.21 um 00:24 schrieb ira.weiny@intel.com:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The default case leaves the buffer object mapped in error.
> > 
> > Add amdgpu_bo_kunmap() to that case to ensure the mapping is cleaned up.
> 
> Mhm, good catch. But why do you want to do this in the first place?

I'm not sure I understand the question.

Any mapping of memory should be paired with an unmapping when no longer needed.
And this is supported by the call to amdgpu_bo_kunmap() in the other
non-default cases.

Do you believe the mapping is not needed?

Ira

> 
> Christian.
> 
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > ---
> > NOTE: It seems like this function could use a fair bit of refactoring
> > but this is the easiest way to fix the actual bug.
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> >   1 file changed, 1 insertion(+)
> > nice
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > index 6f8de11a17f1..b3ffd0f6b35f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > @@ -889,6 +889,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
> >   		return 0;
> >   	default:
> > +		amdgpu_bo_kunmap(bo);
> >   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> >   	}
> 
