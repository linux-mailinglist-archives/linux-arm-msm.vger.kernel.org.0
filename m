Return-Path: <linux-arm-msm+bounces-36736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E02949B90F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD9B1C20D56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0218D19D080;
	Fri,  1 Nov 2024 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBbWahXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAD19CC32;
	Fri,  1 Nov 2024 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463032; cv=none; b=pcidPYYh+ORpx3d/jKg4asWwocjYa1o9DFyh1/aLD0uuNuAgQPvl4iRhenaBLzlNi8J1Gi977ClkMKzJy0Je4IxWX2WBGaB4/3JaOvPT4EFGeQFEWcbdtb6JPP0regZSM7c3nRO96RKGTqKr5fUMtl+islCZt17dVlW+IES+FQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463032; c=relaxed/simple;
	bh=ySUK7o6teyrYbnl0BIFkuIKX0AiOQDli2AQwIAKrHfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt+jIvsSA+DzVOBWDNjlHs3EHwf5sWYElqfYJSm1Sj5+KtjMhEUQVFdC9qlsGq7X9ZB02LdQ8zEyUXd8ctorBUERAs405ImeyQK6D+z24cjkgGTA7X8ZB3PxPQydKd2SmFGGOs3ERXHH2/JjXa9HT/uXYGK1o0XXSh235DF7iuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBbWahXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC898C4CECD;
	Fri,  1 Nov 2024 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730463032;
	bh=ySUK7o6teyrYbnl0BIFkuIKX0AiOQDli2AQwIAKrHfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBbWahXKaEhqbxmFmpER4pQdWKXJ27x6/HOTTa58y/NPcim3IMqLlZgMsSiqbDa08
	 RIgswhOwZr7BmOjGB/5uZbyOTEjLAskpsHmhSIl6GovL/g2dpYf6u7VPCVWNYvAcOU
	 7FRQmwsg4p7jEKkpOlOdd8oxqfgPCeacOIp1VZwV3iyP4PzFuVDmhbb3ItU1eNFRa9
	 jwZE2dPH51oAz5qR8ukw4E8kY5XFKoihnxHUAbCPcySlVG+ejMDG8UFG6G8T6MwVht
	 Wo5caq/vDRMqLWrQ2T2M50cOaUmqQLYiKA5u2xsVQyFm/ilWtmpRTiRhg8eb9en3x6
	 PzyePC+0xvo7A==
Date: Fri, 1 Nov 2024 12:10:25 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <20241101121024.GC8518@willie-the-truck>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
 <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 30, 2024 at 05:00:13PM +0530, Bibek Kumar Patro wrote:
> On 10/29/2024 6:17 PM, Will Deacon wrote:
> > On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > If you want to gate the errata workarounds on policy, then please follow
> > what we do for the CPU: add a Kconfig option (e.g.
> > ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> > the relevant errata aren't all "rare") and update silicon-errata.rst
> > accordingly.
> > 
> > Then you can choose to disable them in your .config if you're happy to
> > pick up the pieces.
> 
> This seems to be a good idea to me . I am thinking of this approach based on
> your suggestion,
> i.e. we can bind the original workaround in
> arm_mmu500_reset implementation within ARM_SMMU_WORKAROUND_BROKEN_CPRE
> config (defualts to on, CPRE would be disabled) and in QCOM SoCs default it
> to off
> (when ARM_SMMU_QCOM=Y -> switch ARM_SMMU_WORKAROUND_BROKEN_CPRE=N).

ARM_SMMU_QCOM is enabled by default, so please don't do that. People who
want to disable errata workarounds based on a hunch can do that themselves.
There's no need to try to do that automatically in Kconfig.

> In silicon-errata.rst would updating ARM_SMMU_WORKAROUND_BROKEN_CPRE be okay
> , as the config names are based on erratum number.

In this case, the Kconfig option covers a variety of errata so how about
we go with:

	ARM_SMMU_MMU_500_CPRE_ERRATA

and then you can list all of the numbers in the "Erratum ID" column?

Will

