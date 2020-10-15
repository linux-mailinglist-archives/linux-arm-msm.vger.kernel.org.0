Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0884B28F5E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 17:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389472AbgJOPdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 11:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389343AbgJOPdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 11:33:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914CDC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 08:33:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s9so4022404wro.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
        b=YEzGkNPjcWsWogVWz3QWffFRGWZD9E6EKg864hpltYi9b25EGfehPGSZVBj1A+HMl1
         j79R9ryf8zrnmqi0v/SQKYh1CmueM5n9KdXPS6jZ8h7VxeCUl0XNMmKQbHYbqdoAcoSQ
         sYr1eA+AINxBZHMZawO8PinHCVnFYxphvWYxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
        b=WSdZPXMmrXKBNXChKZ8M4wxxDwQqVnU54b4FKEUu7oThAj8TOYrgOIovq/dPzYGu+h
         TfTfeLBbFNpVNN+9vN7jeVGMGDqEMWAca8HcdGgLSZ/azeiQsb//V+we34BY2eUd1vmk
         Hq028hGbGwz+A5yrStUj6Jr5o7Pkcapg6Qc1ADgfCpxN+P3NUTtgC1M9Inl47PWdp5Uc
         4ArqUFl4HlP2J12ANBILHtfrHl9+1SRj+F0QMGezjzZ/p8i3dyQxmoXUlT2YP6g1qBhd
         QeSOL5fl5UfqZ/98Ij9YcPgB0r3zSgZelP942q1xGgsJ4LiJjs2T8L2CKl0S3Pem42nX
         28pQ==
X-Gm-Message-State: AOAM533A7o+4vUi468V2e8xynoZzV/Q9+VYBhqpN5RMN5nUJkkqEi9pW
        hlSdy7eDpOUbVmKIyBlnQYd9hA==
X-Google-Smtp-Source: ABdhPJxZCtmOKvSHGMFu6M0SWndoPtrJKa9skPbxfjCh46ReSVVuskA1W6sLt8/JDmwyo0CIUMDZFQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4957151wrc.420.1602776017257;
        Thu, 15 Oct 2020 08:33:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j101sm5918352wrj.9.2020.10.15.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 08:33:36 -0700 (PDT)
Date:   Thu, 15 Oct 2020 17:33:34 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201015153334.GF438822@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        iommu@lists.linux-foundation.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
References: <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015065532.GA15371@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 15, 2020 at 07:55:32AM +0100, Christoph Hellwig wrote:
> On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> > I still think this situation would be best handled with a variant of
> > dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> > automatically when attaching to an unmanaged IOMMU domain.
> 
> dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
> is triggered of two things:
> 
>  1) the dma_mask.  This is under control of the driver, and obviously
>     if it is too small for a legit reason we can't just proceed

Somewhat related, but is there a way to tell the dma-api to fail instead
of falling back to swiotlb? In many case for gpu drivers it's much better
if we fall back to dma_alloc_coherent and manage the copying ourselves
instead of abstracting this away in the dma-api. Currently that's "solved"
rather pessimistically by always allocating from dma_alloc_coherent if
swiotlb could be in the picture (at least for ttm based drivers, i915 just
falls over).
-Daniel

>  2) force_dma_unencrypted() - we'd need to do an opt-out here, either
>     by a flag or by being smart and looking for an attached iommu on
>     the device
> 
> > That way the
> > device driver can make DMA API calls in the appropriate places that do the
> > right thing either way, and only needs logic to decide whether to use the
> > returned DMA addresses directly or ignore them if it knows they're
> > overridden by its own IOMMU mapping.
> 
> I'd be happy to review patches for this.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
