Return-Path: <linux-arm-msm+bounces-10897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF5853239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE401F2766D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA9756472;
	Tue, 13 Feb 2024 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Usdohnw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AA56469
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707832050; cv=none; b=HHd3cmBCTR9G3nrqgfwrN1vM5DF88F/jwaiF3pasY3HrtNvXEbUF/Y4wdb7VzkQ/Tc2TlYaIsi5nXpEgzmUv0dNj+AR7xLsEZ87UmGY/9nI7ipWZUwiWGLXNfZHVUNNA+J/eu0/tLqquniaHqI1eti3m9y70iJojKmuSOJ478O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707832050; c=relaxed/simple;
	bh=WZAm0t+l5x/CtC3im0ZzQ1YkVFgfbrbMDCq6UoMlaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEkZS+F0iWj9efOVGdIpUbh7CjH+fJ0kOQ7AvwtW2Ffxby7Kqm4d7SphLtsvLyhXTaMj7craH6envdw0CN9KAVyS2LxaVpu1K+xb2o51fLOXWR1qqrEdZJ0sViVsc4J/8UhRnOMr7N33sDrLgH7Gq7N8PlhJ6zRCcpN4BgaNATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Usdohnw2; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e2db19761fso491680a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707832048; x=1708436848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12rcGrCZKiffCJuBgUEtrH8DbE5eqElSBcxt/QbnhWA=;
        b=Usdohnw2xpy+bbb0IPKmKo2Aqb3kkubuAyxwI4Lcl2+dq9h1dcxbRn/TZV9JokiWRV
         vlHs3rEGg7JOeGCxvNDXM34po3lgNppuHZ5vTx/8HUhjwm+4/4bgHZDDBla44+g5KatA
         5raslZVSuduwK8ZrffIYAW/4BRXGjpBaXB5xWT49pTDDOnwj61hs+4xV+acFn5Y1HEG3
         BTldm1QhqXDoADtpTond7pYaOYF65a4WsU4OCS3LQGfYbhb+kQi/S9LVIa9iIkdkMWh6
         x9hRdwUxsc4L9FWNHcLpm45C+JPin9zp/JH2wl9ulB8P5gnwwzWKlnax3NTqQJbNGPw5
         8xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707832048; x=1708436848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12rcGrCZKiffCJuBgUEtrH8DbE5eqElSBcxt/QbnhWA=;
        b=w657sWZusFkftOhI2HYPqIUusctbzWAfrrxska/3hVJcCVo4AGsUM5G3OJPVF90AoS
         3j8Ci3N1SJ0ehOvRXjarCMjz6ZD3p3PXdAx3Om98dFTNyFsxorL2+wbDcneXc8i1MzwC
         kyXo4e8Imigt5c0uckFMNzzDlG0tbj3AonJITq8YyJK5NwuMq/1kA9jK9DvfpfjioEir
         oYo+dC6R/5LOOeIchMGVgdIG0ZFVA3E8ADh6Grejo7E+UOveKR9PSqsOhhHyumVXfb1X
         O46drk8MVKQwGSWJAIFwcOSUMaN2/u91h34cScOa5kgTPJapZaClBlSAP3U6TTOM66MD
         Ltvg==
X-Forwarded-Encrypted: i=1; AJvYcCWbArRVkp4auE4m5pQYQcIL+hh5xJ4XN13clfqujNfI7tWhCZ6AuZgJpb51B7WDnqKKe72yfyIjT3tZIJpGzfxRY0RbKFeQIZSXLi6dEA==
X-Gm-Message-State: AOJu0YxuuEwKMtKstbh1B54nmbRZpDY4LTQXrCH41qEP1U57SOgVGekQ
	cVlBH7+E0/XTfvEIdHUfwszQfZnlOQFEjm8HiTQRnuV7cqPBltxt7TkgXidk9Tw=
X-Google-Smtp-Source: AGHT+IFvg5cW1hAYD2fit+MBOsK+fbyPkOPdwPyl19kjN0h6FWbFyMCJ6H9puYqy0AwiB6+GaaKy6Q==
X-Received: by 2002:a05:6830:1e2d:b0:6e2:df5b:7c3a with SMTP id t13-20020a0568301e2d00b006e2df5b7c3amr7370397otr.3.1707832048055;
        Tue, 13 Feb 2024 05:47:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1ryWTKnykh0DhZNHZjwH5Nv5duNpFbCcafjlYw+ackYlPTdbGzqeFFGs5NPVldxYgEp5fT+Icc+0L8oAgOd2iDXxdS1d0IzDJ9616JN0Ls4v+mT0UbcAc4414p5ofZ08329toXznjNa2A03UX7ntiUrjgXHGsjoWGu3aj4a1La5hF+rn/DogUkhWfK0qqcX3Q7LP8rbzHTheaew9EvPT8klBSClHU+ovU35M9Sme2eLwhwLaoMfJ1jhKufD81slA+lTQ4vVA=
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id dx10-20020a056830486a00b006e2dfee49a6sm459641otb.59.2024.02.13.05.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:47:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rZt8A-004KWC-HE;
	Tue, 13 Feb 2024 09:47:26 -0400
Date: Tue, 13 Feb 2024 09:47:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213134726.GK765010@ziepe.ca>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
 <20240213121934.GA28726@willie-the-truck>
 <20240213125303.GJ765010@ziepe.ca>
 <20240213125951.GB28844@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213125951.GB28844@willie-the-truck>

On Tue, Feb 13, 2024 at 12:59:52PM +0000, Will Deacon wrote:
> > The typical kernel standard is to fix bugs in patches and only reach
> > for a wholesale revert if the community is struggling with bug
> > fixing. Dmitry already tested removing that hunk, Robin explained the
> > issue, we understand the bug fix is to remove the
> > arm_smmu_init_domain_context() call. Nothing justifies a full scale
> > revert.
> 
> I can't say I'm aware of any consensus for how to handle this, to be
> completely honest with you. 

Well, I work in a lot of subsystems and this is a surprise to me and
not something I've seen before. Fix the bug, move forward. Reverts are
a cultural admission of failure. I use threats of a revert as a hammer
to encourage people to pay attention to the bugs. I hardly ever
actually revert things. What does reverting their code say to my
submitters???

> > I'll send another patch if you want, but it seems like a waste of all
> > our time.
> 
> It's a bug fix, of course it's a waste of time! We're talking minutes
> though, right?

It becomes hard for maintainers to juggle the tress since you have to
send the revert to -rc and the fix on top of the rc to next. Again, I
will send the patch, just discussing.

Jason

