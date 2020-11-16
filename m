Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062F32B4CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732812AbgKPR1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:27:13 -0500
Received: from z5.mailgun.us ([104.130.96.5]:21991 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732811AbgKPR1N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:27:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605547633; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7BOlt1PZL/4mw5Z2iPqeU6H+H03xeCC/0uJqO3xhXL4=; b=BUg1x43ra/PCUFZbJahEAgYcBwqDNzAvO/bnb8r8KC285gQYVPFdsMAyDCYOmaA4n0CMmcyG
 R6AULaTrqcLo5/Z0dBwd1M7WtN89siQmAfve55JpQ2Y9HBpZjoShPSge3f9k4u4uqZfsDMf+
 BkT32lggxbfqyL0OI3oV9kbVIho=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fb2b66c3825e013b5c19d79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 17:27:08
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27B1DC433C6; Mon, 16 Nov 2020 17:27:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FF4DC43460;
        Mon, 16 Nov 2020 17:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FF4DC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Nov 2020 10:27:04 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [Freedreno] [RESEND PATCH v2 4/5] drm/msm: add
 DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
Message-ID: <20201116172703.GD16856@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, Christoph Hellwig <hch@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 11:39:45AM -0800, Rob Clark wrote:
> On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
> >
> > On 11/14/20 1:46 PM, Rob Clark wrote:
> > > On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
> > >>
> > >> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> > >>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> > >>> +             size_t range_start, size_t range_end)
> > >>> +{
> > >>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > >>> +     struct device *dev = msm_obj->base.dev->dev;
> > >>> +
> > >>> +     /* exit early if get_pages() hasn't been called yet */
> > >>> +     if (!msm_obj->pages)
> > >>> +             return;
> > >>> +
> > >>> +     /* TODO: sync only the specified range */
> > >>> +
> > >>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> > >>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> > >>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> > >>> +     }
> > >>> +
> > >>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> > >>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> > >>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> > >>> +     }
> > >>
> > >> Splitting this helper from the only caller is rather strange, epecially
> > >> with the two unused arguments.  And I think the way this is specified
> > >> to take a range, but ignoring it is actively dangerous.  User space will
> > >> rely on it syncing everything sooner or later and then you are stuck.
> > >> So just define a sync all primitive for now, and if you really need a
> > >> range sync and have actually implemented it add a new ioctl for that.
> > >
> > > We do already have a split of ioctl "layer" which enforces valid ioctl
> > > params, etc, and gem (or other) module code which is called by the
> > > ioctl func.  So I think it is fine to keep this split here.  (Also, I
> > > think at some point there will be a uring type of ioctl alternative
> > > which would re-use the same gem func.)
> > >
> > > But I do agree that the range should be respected or added later..
> > > drm_ioctl() dispatch is well prepared for extending ioctls.
> > >
> > > And I assume there should be some validation that the range is aligned
> > > to cache-line?  Or can we flush a partial cache line?
> > >
> >
> > The range is intended to be "sync at least this range", so that
> > userspace doesn't have to worry about details like that.
> >
> 
> I don't think userspace can *not* worry about details like that.
> Consider a case where the cpu and gpu are simultaneously accessing
> different parts of a buffer (for ex, sub-allocation).  There needs to
> be cache-line separation between the two.

There is at least one compute conformance test that I can think of that does
exactly this.

Jordan

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
