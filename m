Return-Path: <linux-arm-msm+bounces-84349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F5ACA34D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7125314D7DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BF233A015;
	Thu,  4 Dec 2025 10:47:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3FF3358D7;
	Thu,  4 Dec 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845238; cv=none; b=MGI4v9Bb3gtnSKgKaF4RXZ+Gc4ZnJlXyUOm1hoxIr3FxKr5AEA4ZVD+cxXfRThxIFmMhVQqQ0e4Z8ewU+7eJV/x+e8j3G5rgkG/un+KeOK3GsJRKJhxuVfepELSBPA0Vb724BtXpAC+cZvuHyTdxWiEkPvbnos1HYisnwtNEYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845238; c=relaxed/simple;
	bh=58jmIE95ugjjp8YBR3XVqR6Zou5c0Ec50bl+hoFpGc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMT9ctNJklWHeEL877H8hnUFxg8g/veO0eImjhr3n+smccU3zcYXoMh2Yr5FQYu4Y/OPsxz73OMT5c/BbwITAodRGI1uknlMriPA3xzoBWWxajurfA596TIKtrkJ+aeL1+xW0IZXj6Bk8+5+gCNUQXNs1QGdT/GDdvmbTi2lr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16071339;
	Thu,  4 Dec 2025 02:47:08 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0715E3F73B;
	Thu,  4 Dec 2025 02:47:14 -0800 (PST)
Date: Thu, 4 Dec 2025 10:47:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204104713.GL724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>

On Thu, Dec 04, 2025 at 09:15:07AM +0000, Mike Leach wrote:

[...]

> > > +             /*
> > > +              * QCOM CTI does not implement Claimtag functionality as
> > > +              * per CoreSight specification, but its CLAIMSET register
> > > +              * is incorrectly initialized to 0xF. This can mislead
> > > +              * tools or drivers into thinking the component is claimed.
> > > +              *
> > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > +              */
> > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> >
> > I am confused for this.  If QCOM CTI does not implement claim tag,
> > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> >
> > Should you bypass all claim tag related operations for QCOM CTI case?
> > (I don't see you touch anything for claim and declaim tags).
> >
> 
> The patch I have created to handle systems without correct claim tag
> operation is a dependency for this patch set. Thus no need for
> override here as the core code will handle this correctly.
> 
> The only issue is ensuring the non-CTI spec implementation will result
> in the correct detection of no claim tags present.

Your patch works only when a module has implemented claim registers.

This leads to two issues: we end up clearing an unknown register in the
CTI driver, and then the coresight core layer assumes it is reading a
claim register even though it is not.

For QCOM CTI, combined with your patch, I would suggest directly
setting csdev->access.claim_tag_impl to false (perhaps using a helper).
This would be much clearer than the "hacking" way.

Thanks,
Leo

