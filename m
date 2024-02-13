Return-Path: <linux-arm-msm+bounces-10943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F8853B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 20:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB4B28233A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7A71CAA9;
	Tue, 13 Feb 2024 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sf+s4a71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB260889
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707853769; cv=none; b=CgTeJGMTlypqALGWdnFd9bYI6bLcDw8vALORzBdbXChbdTKNqX2fBsNHJMKtxHli+oMhmNKMILHDYL6756piZ47P2sgzkQPxt7wKBdUWJXtVId4acR43E/8azaA3Simv4Jwzovua1GvnG6xP7DEjQ47z7TKKuJs971NoSSqOJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707853769; c=relaxed/simple;
	bh=ffe9gO7KVRYtww3F4xBFEwBZh1a+Hx77aSa0ag65tzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYGadrf99YWHneo4xE/498g5Uqc1J1x6cxWilL+zt2KlElWC/u0yUdymKh5PWVBHHQmUaCux3a+q5X6Rdpe2AL0lH4qxBk+4OoxVvQZecY7/JqGZtH6mjfng9AO3i2/+zvp0XAMrosKaofpMCBf0nykn2Nx9x3ZhsnSr5ah13C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sf+s4a71; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso1031082276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707853767; x=1708458567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2r+d4SYUIyHT5gjIoPbw+SmalguQNzVZTPSSC+Kv4LI=;
        b=sf+s4a71CJRmxsXX3quhk+GmzS6/i174begNDcclXKUFdwBvzwFh4hX/Sjwx6a8K0r
         xgnKa2SaVbN+zy3gJ/vZrW5LGce4l26iuo7GsxSNa92O4aASsWk88rmOix93GAVnvvnO
         32rf+C+Usl8eBkX78oebkun82uuIGY/jNxbC9sa+xw8MeIYrBRWYDgAWdq4pndtR2LJl
         mby0BOXMdxALNJ5pye3hRUYl+zBmHs6YIqOp0hG7/qsJBCPevynbB1PAR4lHC8fbfPr9
         jlpVEWB2CdcBHfOtxhBaS/zqeiKh+KttwKEvOTNn2EZYhDAazLDgXOQiQs4aPUHV4r8g
         QtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707853767; x=1708458567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2r+d4SYUIyHT5gjIoPbw+SmalguQNzVZTPSSC+Kv4LI=;
        b=E6tgdzR8FBFhrBkOJhBzPeJ4bgTZ/jPi9Ozv2VQ1C1Z1rHwlwcUjJmRGVB1cEjwzDA
         DTaCxcTUuiOzHflcLZd3jtURy16ZoZiUmRH920xyRCTwtdrZ3CSxfvEfRXcdL22nodUQ
         wDy599LgrMcXidWUsOB+cwp+3kwWUYk8o1rJZKN3ImaaYjq+niW3vNbPwvmdT3TF/SJB
         I2I36oHAjuFwOPbn7Z9KPzuT/kOYTMlJAJdu5Rb53AygxLPzdS1qzifzPOL4nkdWMhTJ
         ovX6/Xi51A+LoPoxflBHsKL4xU0dKZ2qBTXmeByGJ1W7kpHMEzzayVr9ZtHOkQj8TPsb
         hUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgrWTk3/ulUGi+pyasLvzJbZS17VqJLma/+jmWTqbRPer5/V/QovMYK2SFloqnOBcIcjgC6xvPLK/c8gKBDW4QQ8rjmOaQenJrZZCn9Q==
X-Gm-Message-State: AOJu0YwVYPXDdR7bhZF/p8pr17D2etXJuZCvNeKikxq2TwEuCS1JsI00
	ry37B68RbEdNbrDHaaNrrAggF1BQHopS828o70dbZ/j/XHSfzHRBoznwHN/FHtNZpGp8W+WL29x
	g12rxxgGf7X9DXitNHnBfd9d5rGhKTV9VZ3IqOJuzsOBs8GyB
X-Google-Smtp-Source: AGHT+IHuIaFQMbrirEhKz395nV1OIhvnXj/ek6dLuUYdk+Akp/if7FLIKl+E3i3xejAUx3dzSeFO9Q7CHQjo/bLGoJQ=
X-Received: by 2002:a05:6902:2608:b0:dc2:1f56:11e4 with SMTP id
 dw8-20020a056902260800b00dc21f5611e4mr403120ybb.24.1707853766831; Tue, 13 Feb
 2024 11:49:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca> <20240213121934.GA28726@willie-the-truck>
 <20240213125303.GJ765010@ziepe.ca> <20240213125951.GB28844@willie-the-truck>
In-Reply-To: <20240213125951.GB28844@willie-the-truck>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 21:49:15 +0200
Message-ID: <CAA8EJppWpLgX_kfk6O11k0uwyiq507pp_d+QtDogSgJqgiGviw@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
To: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 14:59, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 13, 2024 at 08:53:03AM -0400, Jason Gunthorpe wrote:
> > On Tue, Feb 13, 2024 at 12:19:34PM +0000, Will Deacon wrote:
> > > > > @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> > > > >         mutex_init(&smmu_domain->init_mutex);
> > > > >         spin_lock_init(&smmu_domain->cb_lock);
> > > > >
> > > > > -       if (dev) {
> > > > > -               struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> > > > > -
> > > > > -               if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> > > > > -                       kfree(smmu_domain);
> > > > > -                       return NULL;
> > > > > -               }
> > > > > -       }
> > > > > -
> > > > >         return &smmu_domain->domain;
> > > > >  }
> > > >
> > > > Everything else is fine, you already tested with that arrangement.
> > >
> > > Partial reverts are a recipe for confusion, so I'll take this and if you'd
> > > like to bring back some of the hunks, please can you send a patch on top
> > > that does that?
> >
> > The typical kernel standard is to fix bugs in patches and only reach
> > for a wholesale revert if the community is struggling with bug
> > fixing. Dmitry already tested removing that hunk, Robin explained the
> > issue, we understand the bug fix is to remove the
> > arm_smmu_init_domain_context() call. Nothing justifies a full scale
> > revert.
>
> I can't say I'm aware of any consensus for how to handle this, to be
> completely honest with you. I just personally see a lot of benefit in
> reverting to a known-good state, especially when the revert has been
> posted by the bug reporter. Then we can add stuff on top of that known
> good state without having to worry about any other problems that we're
> yet to uncover. Doesn't really sound controversial...

Well, I'm open to any patch set that ends up fixing the issue. I won't
insist on landing the revert first, it's up to Will and Robin, I'd
say.

If there are any patches for this matter, please Cc me and
linux-arm-msm@, so that we can reply with the Tested-by trailer.

> > I'll send another patch if you want, but it seems like a waste of all
> > our time.
>
> It's a bug fix, of course it's a waste of time! We're talking minutes
> though, right?
>
> Will
-- 
With best wishes
Dmitry

