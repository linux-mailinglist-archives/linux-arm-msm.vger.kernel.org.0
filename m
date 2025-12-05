Return-Path: <linux-arm-msm+bounces-84438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C49CA7276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C5313020CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1804A31A818;
	Fri,  5 Dec 2025 10:27:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526C131B11C;
	Fri,  5 Dec 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930452; cv=none; b=j037xrpNSXhrxlBXSQl9SqjouFR96ZWlEBJB9HQcNBO3MmavTzrpUCPMd5AAUj2BvFWCpyMgMNtHTqN/QllmF6+QSWpyMDgCp+BowcxV+BB1+oYU2FyDdGCsNa695PU1Rxd1kJy96tK0knez90TsLRTRnvn6XSLOqNDr+ylRwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930452; c=relaxed/simple;
	bh=BSLEaDs+9w3y6ZayfxqlLO8Z9nmk0zeJ4OJvijpuB4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWvjD1wnCY84B8cLUkDOK5nCo9lgzMFI9d2mB/ps7rKZmFtucec7BHomsUWSmFoYJ8deKYnIP8ZrejJuy4N9TvkAon2ddMfrApZW0NwMV63TMqAgzByX6KYDbgxxAB65VyBIZV6SpSq8sFOw3oqEQupzjcBu8pZ50TNfOIrVnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C0F339;
	Fri,  5 Dec 2025 02:27:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30DC73F86F;
	Fri,  5 Dec 2025 02:27:22 -0800 (PST)
Date: Fri, 5 Dec 2025 10:27:20 +0000
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
Message-ID: <20251205102720.GP724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
 <20251204104713.GL724103@e132581.arm.com>
 <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>

On Thu, Dec 04, 2025 at 03:07:10PM +0000, Mike Leach wrote:

[...]

> > > > > +             /*
> > > > > +              * QCOM CTI does not implement Claimtag functionality as
> > > > > +              * per CoreSight specification, but its CLAIMSET register
> > > > > +              * is incorrectly initialized to 0xF. This can mislead
> > > > > +              * tools or drivers into thinking the component is claimed.
> > > > > +              *
> > > > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > > > +              */
> > > > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> > > >
> > > > I am confused for this.  If QCOM CTI does not implement claim tag,
> > > > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> > > >
> > > > Should you bypass all claim tag related operations for QCOM CTI case?
> > > > (I don't see you touch anything for claim and declaim tags).
> > > >
> > >
> > > The patch I have created to handle systems without correct claim tag
> > > operation is a dependency for this patch set. Thus no need for
> > > override here as the core code will handle this correctly.
> > >
> > > The only issue is ensuring the non-CTI spec implementation will result
> > > in the correct detection of no claim tags present.
> >
> > Your patch works only when a module has implemented claim registers.
> >
> 
> Per the Coresight spec - unimplemented registers must be RAZ/WI- so
> this still works for non implemented claim registers.

QCOM CTI does not follow the spec in two aspects:

- Given the patch's comment: "QCOM CTI does not implement Claim tag
  functionality as per CoreSight specification", I am suspect the CLAIM
  registers are not implemented at all in QCOM CTI.

- It neither follows up the "unimplemented registers must be RAZ/WI" -
  the patch says its reset value is 0xF and then even can write 0 to it.

> > This leads to two issues: we end up clearing an unknown register in the
> > CTI driver, and then the coresight core layer assumes it is reading a
> > claim register even though it is not.
> 
> Again RAZ will simply read 0x0 - which is an indication that there are
> no claim bits implemented.
> 
> >
> > For QCOM CTI, combined with your patch, I would suggest directly
> > setting csdev->access.claim_tag_impl to false (perhaps using a helper).
> 
> That would be a better solution, though as Qcom appear to have
> implemented a pair of standard RW registers rather than the claim tag
> functionality, the write solution works for this particular
> implementation.

If an IP violates both the rules for implemented claim registers and
the rules for non-implemented claim registers, how can we rely on
these registers to detect the claim feature?

My feeling is we are building a house on sand - these registers are not
used for claim tags purpose at all.

Thanks,
Leo

