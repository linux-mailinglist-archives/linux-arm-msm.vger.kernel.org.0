Return-Path: <linux-arm-msm+bounces-56137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90596AA0E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E086317F56A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A3B2857CF;
	Tue, 29 Apr 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hQ4waozv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287721A457
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935508; cv=none; b=uzhP3CE3UzwW1Z1S5pGrNxGpY9NnH+aR3vTCCdFIWbLRZApUrN725iLKJgW3mOOmskJZR6iH4Fct+zB4zjwkvXxdaCR7DTURR+GP+9WOAqsoelFrGbCWwGn4S5c47ErDu9M0iu4qGDBlomKhOCVDgDCljsd3omsws9hreUAuvLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935508; c=relaxed/simple;
	bh=JUMj7m/qxM07+AHCqs/esGILKaVryMIC6qrAPwaDYSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qtkz/yAYzl4XD9zarHCL/NFSyn5rZUyhsdkPW3g7BK3zt6/cQf+/PR9JWKTsCUQZobHHhRwklCC/EDmzLHC+JYHd3IusYNP4I5LHTOHe7k5ZXaG9a6rE4lfVo0z8Z0yQitA9wagb0n8Gf1t39ijDdkw2p+jurka4pg6ffYNiu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hQ4waozv; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so84491436d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745935506; x=1746540306; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
        b=hQ4waozv0nBkLhrV2L8/4Xs9m24lmqmbcUsDMJPdsou4OzSJbB8gKpkOXGlYDI7Sf3
         /7CvPI6yXjYREltstgFepu7rhij7czww6B1jatoXW7CcuxlPA/b+vgzkcj1ZpPiMfW2i
         gEPGMWRCugDvgjo/XMQso3TMJrwH+MDI3IY4SVoIoxr0/p6qrdet9cQ9ynMY/Y31DmKM
         1OE0Oac6wjtQD7OZSjFT/dR30baWLjmDbmILr3e1BfyCOnswr9FtaQD9Zgq0qzmDHvZW
         BW+3yUxhJA7JILJb7EmOKzQAq5uwya8+1RtSa2IADiXW3SR1z91oj3lEVZb+iXPKUaV1
         /Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935506; x=1746540306;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
        b=gIoM14fmsV0Qq5+X676ctbwitEtq/tIQe1XGY7SVbVDKKEOLG4rPYVVlUs67iRlpU3
         0+adrWPew9Hq2eZ0MeRvlJJSS3nUpRgDp2bwP5WRuIO4c2Bo9hn6xqZ7FOa1LwHfFCnZ
         HJROyAz//RWlXpBJuGVptmdpjk14f1afvo0lgrWrfBnQaKEf6zPFCgeJrTo4Mq7vuCQn
         iYW9QXtLPG6shQirx1ngfL/5bb0tk81E6STJ6N1xEtXT/V3AueASuJXBg7uy93D8Vgew
         ikDJvkmC6EOZqoV07iv4LVcECz5bGBcTMZNakg98KBOw1wo2cZXQorCqIR5UsfS0csVV
         qQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVvFa1DxhcepvEmD2B0NpyaMfAD0B+j0GJSPXKN0nzxTFLfL2I58kVTKJNkn9A707Hs2r1Wy225Uv0sSZT8@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNNss1sk7Sn6xD1U0rKXcm1vDmsC9vabnMx/Nb1gXP50wmNYZ
	LLTO49MK4G0ekGcXBSqa3u2SCOH0jfc4/n0SqndAnYrORf6e7me6qtnjZmEF6uw=
X-Gm-Gg: ASbGnctwpToIv2b88ejAThVO3gedtcdSsWRNmH2Ex0JnfN2zjw7p7p2iMGCPje4yNgx
	nfAYooN9zTKu7h7MgSwcFMrS0g9QpmIsL46bcIj0buq7qckZSh28TC8VJgSeUMTOpNf3NdwJEBF
	KvvgcPPUShrc3XQmHR/QGFxx0MZn0VITZ0Q89HBsnilAPcfK9Qg8dzTpXAk1/sSYZJR21bT7mOu
	me+h3g6dbV7dWz3h5GeJjeK+s4wK5uW7kHHcncXPriDywW7/+MyYMoC26MR5QQ9rOBSmBJNP5je
	TwZzGirHmTQtkio2A950XODi2/MJ72Xc4UOf6BKBZZ80oGDSR8EwVq0Qfzcu+sv6qGyXJKb/1Zz
	G8ZdsTqwhBM6dIuB7NM0=
X-Google-Smtp-Source: AGHT+IEGHHMBFCeWwt68ed4umDEC8R1Cxg2x3qg5I1VMmEylqtVgAx6JEUyqfbECn9olvSAU7wat3w==
X-Received: by 2002:a05:6214:5005:b0:6f4:c939:a3f5 with SMTP id 6a1803df08f44-6f4f1bcfe99mr47285726d6.17.1745935505592;
        Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4e0d8495asm30959186d6.18.2025.04.29.07.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u9la4-0000000AAyC-2M6z;
	Tue, 29 Apr 2025 11:05:04 -0300
Date: Tue, 29 Apr 2025 11:05:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429140504.GD2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
 <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>

On Tue, Apr 29, 2025 at 06:58:32AM -0700, Rob Clark wrote:
> On Tue, Apr 29, 2025 at 5:28 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In situations where mapping/unmapping squence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> >
> > I think if you want to do something like that using the iommu API the
> > expectation is for the caller to do a iova_to_phys to check what is
> > mapped first? That seems kind of lame..
> >
> > Maybe page table driver should not not be doing these WARNs at all. If
> > we want to check for that the core iommu code should have the WARN_ON?
> >
> > eg iommufd already has a WARN_ON around iommu_unmap failures so having
> > one in the ARM page table is a double WARN.
> >
> > Don't really like using a quirk to change the API contract.
> 
> I'd also be ok to have the WARN_ON instead in the iommu code.  In the
> case where this quirk is needed, I'm using the io_pgtable helpers
> directly, not going via the iommu layer.

Yes, that was my thought

Then all the iommu_map/unmap() calls behave consistently here..

Jason

