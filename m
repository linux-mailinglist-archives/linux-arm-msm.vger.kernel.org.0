Return-Path: <linux-arm-msm+bounces-25161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6D926109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 15:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074861F23507
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA3317A599;
	Wed,  3 Jul 2024 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXJon6l6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CAC142649;
	Wed,  3 Jul 2024 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011736; cv=none; b=RcflIjgO1kNSd2UtTLpAjeH7YV+YAPr1JIhHDjj99dV1plHO/XIFcFvlhY8evvpMt4YQNz/d5v1xhmZJA9Ix2vZz9VYLSYE5pagRxUr80PmtowcMIXI9151vyEcl2iAUQs+aJw1XgK2D8UDhwCaUjkdouD/R//YZyA7dQqnYmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011736; c=relaxed/simple;
	bh=RmFrPvIZPGCspcDcWKrZAiJYo6HnrUaXiJpp47Mrxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8dnrwkjKD8lwn1THKqNz2Ltg9/wF20ctR6Nuy3VF/qzMdCFWamxquvFZTFSbq0feG0D2UNsLYd2BBNSqS1INEUzaXUy15MlfMgw19kLUwCPedC3Ix0MidIJVRQWwhZnE2My323PaiCLQ/jjPhfrd8kqrvRH9CVWMYFdjhJxww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXJon6l6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6208C4AF0B;
	Wed,  3 Jul 2024 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720011736;
	bh=RmFrPvIZPGCspcDcWKrZAiJYo6HnrUaXiJpp47Mrxl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXJon6l69U6RjRQz46pZmCrfd+qp2EZ6KI6qZrhHIicv/xon1GYx1RhZWBEkbs7Zf
	 38e+on76S/0BcyKrMCHMysTb2Ws2NQkv4t6QnboRkvODhvUCoOzfUYhaKXAcEcZ0SK
	 zneAl7LGGtMMd3F2kCcwnI1XXNKtWUkC1Sf55m5HyX+InHswiNDPH2ZV+e5PWd9mjV
	 mtPkrI8RQL+HRo01x95byFkgBAWQja9qsi0ZYMyDNWlewWAGQf5ef/BC+M9YmdaOaS
	 mwA9poHdt09SsLiZ++IlA8Eiz4SOOar8sjb0iispsh9z2ARLWQxizmOxfc2eJCmx1G
	 /CcBdk9KL3L9w==
Date: Wed, 3 Jul 2024 14:02:10 +0100
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	konrad.dybcio@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/6] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Message-ID: <20240703130209.GA5750@willie-the-truck>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-5-quic_bibekkum@quicinc.com>
 <ueuhu5xfzp2rnuxzeqqd6cho476adidztgx7oq2tbiufauv6h4@obblpxvqwnno>
 <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jul 03, 2024 at 05:45:23PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/2/2024 12:04 AM, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 07:34:33PM GMT, Bibek Kumar Patro wrote:
> > > Add ACTLR data table for SM8550 along with support for
> > > same including SM8550 specific implementation operations.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 89 ++++++++++++++++++++++
> > >   1 file changed, 89 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 77c9abffe07d..b4521471ffe9 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -23,6 +23,85 @@
> > > 
> > >   #define CPRE			(1 << 1)
> > >   #define CMTLB			(1 << 0)
> > > +#define PREFETCH_SHIFT		8
> > > +#define PREFETCH_DEFAULT	0
> > > +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
> > > +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
> > > +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
> > > +
> > > +static const struct actlr_config sm8550_apps_actlr_cfg[] = {
> > > +	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> > 
> > - Please keep the list sorted
> 
> Sure Dmitry, will sort this list in reverse-christmas-tree order
> in next iteration. Thanks for this input.
> 
> > - Please comment, which devices use these settings.
> 
> As discussed in earlier versions of this patch, these table entries
> are kind of just blind values for SMMU device, where SMMU do not have
> idea on which SID belong to which client. During probe time when the
> clients' Stream-ID has corresponding ACTLR entry then the driver would
> set value in register.

I'm still firmly of the opinion that this stuff needs a higher-level
description in the device-tree and should not be hard-coded in the driver
like this. It's not just a list of opaque values; it describes
SoC-specific topological information that should not be this rigid.

Will

