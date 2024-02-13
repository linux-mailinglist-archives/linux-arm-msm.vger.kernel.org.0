Return-Path: <linux-arm-msm+bounces-10903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E785335F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 15:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC781C20A77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787F357875;
	Tue, 13 Feb 2024 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EXm3UUHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACADA54646
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707835332; cv=none; b=ncL8+mQsD6JqHBxQdUnE010CPsr+dgAX4u8hSOwO8QXzOkViuOcXoFxNpcj9f/v7fxkyNudYhW/NvLMRRwH1pPrmzKQtFPXw7QRLq17lM7EUbsgB95Ljcq82jcwf06TDGCuVwk9Bml0MHchJLOH6ELj5TKhtLrI0HocLZ2vSH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707835332; c=relaxed/simple;
	bh=dGCo5O1zuXivuV35bP/mp9Fz8NV3YZDD4lKLvTu/AoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNnd9kwx43qlZjDDtPgroUC6fp+qllTKgDWU6a7ogzh4ueDtVVvk/h3vR2CZNnxWVJQxpEh34IQ7NsqUcVnp8eU7DYb5NpY4GOM78R7nKGH9QEDJz9RKD5wGxRPQOfe+ld0+iyWMoamjvFhHWfoFttMD1AMyiP9+NKfLb5xGtQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EXm3UUHH; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e2e58feaefso478702a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 06:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707835329; x=1708440129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3VCFBkygL/6eJOKkXAgrZmI3b3/D/n5FCeZU3c3PKSI=;
        b=EXm3UUHHS9YEFa4unCPIwVsPQMPTs0ypmseZvXl1QwLWniYhaRxToksvT2Ez/nhmYE
         8V0JrtWDVXbZkLvJ/kRqzxdjucVxgAyz6f8x1lBpIPzaYcDDQ6kk70kW6sDzDFp7yFjr
         B2DdiMRkNsV4h5anbz8jconCdxLbbWbVIuckVeIcLVOWBmD2QH52nraZxYogpWyodmB7
         adRY8wjY6yj/uHFWXM5/djN9ryCDz2FIu6U9G+HIj6mtidvziqPB/mdjmmvGGtyJ1bXD
         UL7LNFnRqIFFlgoFw0sj/gJHuOINmL3MT9uwM2QeGjwInYkGATmAxrSW1vKP1iwi0cha
         8X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835329; x=1708440129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VCFBkygL/6eJOKkXAgrZmI3b3/D/n5FCeZU3c3PKSI=;
        b=ZhR+b9QPseoNTlncgZfWQ/pD8trXEys5dXvpNIg2zfp1vSW8na9aULZnpnJuVKSZ2e
         QRzPEFCvhQz93GfmuvUCHeAd658qeL/+1tzGY5oJgPthFkOyVbl4Dw47i7YvghzoHfZQ
         u6NOOKyonmJanxr56bm3G/XbhaB/uF6a0JBP99HnLAszaysMy3rJS1vGzazjYXpLliY3
         6wA+q+AH/m5ZpwtAByujjvX2en8m7M4yDwMzbh/yH7gjojFA+wbX2l55iysQ9Op8QBMR
         Y/N5K0sma79ekpMkTl+phFJ0JxhTCfqXNNzYdPmvCidXRIYiise4Yr8dZ7t4r5BjByrw
         5mDA==
X-Forwarded-Encrypted: i=1; AJvYcCUKUo74GX660zf1h5isjG+/6oYk5UXCQP4R91Awrr4LgENJfCPEfHo8B/xZSaFAXq6saoCnDDDHCE66+vNlfZeQz75S0+4rHIYW28JLPw==
X-Gm-Message-State: AOJu0YzGtd6pKYXRkOvR3M61hMI2mKfx/ev67sISiCbRV6vz6ywiCfmj
	6J7KIcGwiNb9KddaG4dn/AfWXbW5BeIYojjiM5QugvCaSFLg676gzdXEAcPGstI=
X-Google-Smtp-Source: AGHT+IEev1ENW2z4nIyP0krgZKDnpV0XiwBvzjiKIgCGC5osYXFrnDkIC+NoX8PX+UjSiiAxpJuTtA==
X-Received: by 2002:a9d:62c6:0:b0:6e2:e506:748d with SMTP id z6-20020a9d62c6000000b006e2e506748dmr6090754otk.12.1707835329736;
        Tue, 13 Feb 2024 06:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUew+4emMEaTUg5O6y6uIZUs/k5DUoPaOpH4gZzdbJULcYM2c2T2sHO0jE0TF3yiZUGZvbI+wYzKMipBvgt3vtPABVLp4ntzKQ6oGmaUkDEg8uq4hud5115K6VSY+lzwlTz09lhpbDiozcoKgj4VtcSuapRxf6cAGUS047fbzgnClqB0KCbKnIyUOz2HAkjZ+hDAaMdKX2hzJqg37lviWNRPlv/vYhB8eNQXDTOKLn5Cjp0RDJwDKDa9EvvW+7SNBrkmXT5TTU=
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id bf10-20020a056830354a00b006e2f7ddf4eesm136171otb.28.2024.02.13.06.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:42:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rZtz6-004WEV-5n;
	Tue, 13 Feb 2024 10:42:08 -0400
Date: Tue, 13 Feb 2024 10:42:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213144208.GL765010@ziepe.ca>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
 <20240213121934.GA28726@willie-the-truck>
 <20240213125303.GJ765010@ziepe.ca>
 <20240213125951.GB28844@willie-the-truck>
 <20240213134726.GK765010@ziepe.ca>
 <20240213140900.GE28926@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213140900.GE28926@willie-the-truck>

On Tue, Feb 13, 2024 at 02:09:00PM +0000, Will Deacon wrote:
> Hey Jason,
> 
> On Tue, Feb 13, 2024 at 09:47:26AM -0400, Jason Gunthorpe wrote:
> > On Tue, Feb 13, 2024 at 12:59:52PM +0000, Will Deacon wrote:
> > > > The typical kernel standard is to fix bugs in patches and only reach
> > > > for a wholesale revert if the community is struggling with bug
> > > > fixing. Dmitry already tested removing that hunk, Robin explained the
> > > > issue, we understand the bug fix is to remove the
> > > > arm_smmu_init_domain_context() call. Nothing justifies a full scale
> > > > revert.
> > > 
> > > I can't say I'm aware of any consensus for how to handle this, to be
> > > completely honest with you. 
> > 
> > Well, I work in a lot of subsystems and this is a surprise to me and
> > not something I've seen before. Fix the bug, move forward. Reverts are
> > a cultural admission of failure. I use threats of a revert as a hammer
> > to encourage people to pay attention to the bugs. I hardly ever
> > actually revert things. What does reverting their code say to my
> > submitters???
> 
> Huh. I guess I'm lucky never to have worked in a environment where that
> is the case. In fact, my experience is quite the opposite: revert first
> so that things get back to a working state and the developer/submitter
> has some breathing room to rework the broken code. It's actually fairly
> blameless if you get it right and when you have a half-functional CI it's
> pretty much a necessity. Anyway, I digress...

Fascinating, I am glad we had this discussion because I was pretty put
off by this talk of revert in this and the other thread. Cultural
differences!

Thanks,
Jason

