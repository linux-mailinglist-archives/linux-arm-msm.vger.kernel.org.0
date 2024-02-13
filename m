Return-Path: <linux-arm-msm+bounces-10885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 469268530F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BCE1F2875D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0A342074;
	Tue, 13 Feb 2024 12:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Lnr2LDiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14C41C76
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828788; cv=none; b=ihHuDXGQ7cDA+2A7z/yKzFmzrJ+tAAN73iecZDWMGcRIoyBErC6RghCPr7ar3ZUPihFvn9Zfk0cYN6q+fbzTXALDGBqJ0i56Gva1Pxts1n2oQAwFtvpFhv6vWDovsPjHXDc1x1OyD0dLKbJSzVDj9qgFdoAi5PRq8I67j4FeIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828788; c=relaxed/simple;
	bh=4QiDVmG8Pu10No36/bjRL+lJTGWGAeI7JyqY2zIafd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd3UUwGvBE6h4483bpGYGmAw+8rd6rT3rS5S/peuTwhOkYwrF4B7Tm5lbPIK1DA8DK8Uh4HdOIuZuh4nrtaHvm3g4QWsgiPkhUauvAcoHbfXMwBsDnzJKuYAvyL2zqiu90kXhhsWdMAT1fKx/xxPpqShsqIMkbyBvpsfgD5EAPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Lnr2LDiD; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-20536d5c5c7so3207686fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 04:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707828786; x=1708433586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYlY4epw8eo23hBH5onki0iwHafDPOFpum80B41NzZM=;
        b=Lnr2LDiDaggQS+O13W4XCCtMu6yfqVHhiFEjMyxSmZABUqSJ7ccWeK7RX92iC15iqZ
         U2gIaUNl2oxWvh29HyOhMDxbE2RO1OVodo3C6bXdxojqIEcLLhg37OFmGVUhUYWm8miL
         A9eIbKLtlPxSyu2/HB2tkH7qOxps0XhWoPt+6/GF4+66GlZjhdTOFQUws1eRcgd8JVOP
         /6Exx94AG5VVuCnkxd8aS1dZ2LTKolbYPwiVoV2T5wQVgZqezwg1AbUua6cydPdzLVFr
         SYxkUW43J2FdlbT9YaIqWxnFQVAcvY7T6TqQtCtnI0nrQbPgxff8zZKq7ABHmbLDZ/cl
         zNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828786; x=1708433586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYlY4epw8eo23hBH5onki0iwHafDPOFpum80B41NzZM=;
        b=XqCWpY36DsgVqzpipqHU1E6AUuXFFVC5t1zKaJnyzWU3CxD+IpPniNVq7h8hJco/WC
         pxy1FkJVpxq00qObqK1D51oFsgcNfcA0GCkNg6YuQgHfCO3xIIuzfuLXitm6O92ynl4z
         kUbSSzdoV135wh4VwwbGKv92nMBtDU+a2lsQLPW+A05n+nseCMewwNsp2f7fupq/sLcx
         VNHkf+jKkv8tGcwLwdWOF9MCCkpQYJCUkjFjy/iJGENr+i8/EYHzZ2jd2L7Xa3v1RByy
         H9dKAMHiTIB1LCuTO3l3bw1qccwdVy2+IbfwFnGuKbSQvMaSB638FeODn4qSS+pv31El
         2ijQ==
X-Gm-Message-State: AOJu0YyOSc/u/bKozzYeLYBWa+t3vwMaPmO0lOpCL+bXwxHXBtycKDcf
	TqB+vwvTy6+47I8GTJjfdcHhmEvSO9IxX6hSrJfTvXyBFG4c7EzUZVDslx/5g40=
X-Google-Smtp-Source: AGHT+IGXkMm8BsVHGtdwe6ZYkH1WocH0C7Za2EnH5WwIcROjlfnVZ2BR2bYIkyqLIlksNy6/7ZFRdg==
X-Received: by 2002:a05:6870:5246:b0:218:f129:8a98 with SMTP id o6-20020a056870524600b00218f1298a98mr9525379oai.42.1707828784969;
        Tue, 13 Feb 2024 04:53:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXH/vangM+zSm7yay+2+1sIJ4NTSgXE8HgI1nWybWorcFukbgqOIOm6VMAJ5kCF1To1NOYQ9+ty/g2/Dt1TQ2VjkwVQfPQIEDIabvSg9RseMpSokfeENM0DTL+kDfGOYbyWuj6LKI9N2Bd86AClZZAil1QlHaLfl7pTiydNo9Bp2oX1Kgz6R2b42UApdFW2J9x6KzZA6VpJfIW4MBwlflRudb2eNoXbaT7hbaw79qLz5lj0omrABNtOVLwJ9QELiQqDkWM7tIE=
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id hz10-20020a05687153ca00b0021a714d556asm683907oac.41.2024.02.13.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 04:53:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rZsHX-0048lN-Hc;
	Tue, 13 Feb 2024 08:53:03 -0400
Date: Tue, 13 Feb 2024 08:53:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213125303.GJ765010@ziepe.ca>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
 <20240213121934.GA28726@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213121934.GA28726@willie-the-truck>

On Tue, Feb 13, 2024 at 12:19:34PM +0000, Will Deacon wrote:
> > > @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> > >  	mutex_init(&smmu_domain->init_mutex);
> > >  	spin_lock_init(&smmu_domain->cb_lock);
> > >  
> > > -	if (dev) {
> > > -		struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> > > -
> > > -		if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> > > -			kfree(smmu_domain);
> > > -			return NULL;
> > > -		}
> > > -	}
> > > -
> > >  	return &smmu_domain->domain;
> > >  }
> > 
> > Everything else is fine, you already tested with that arrangement.
> 
> Partial reverts are a recipe for confusion, so I'll take this and if you'd
> like to bring back some of the hunks, please can you send a patch on top
> that does that?

The typical kernel standard is to fix bugs in patches and only reach
for a wholesale revert if the community is struggling with bug
fixing. Dmitry already tested removing that hunk, Robin explained the
issue, we understand the bug fix is to remove the
arm_smmu_init_domain_context() call. Nothing justifies a full scale
revert.

I'll send another patch if you want, but it seems like a waste of all
our time.

Jason

