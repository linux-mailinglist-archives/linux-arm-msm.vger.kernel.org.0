Return-Path: <linux-arm-msm+bounces-37050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD79BCBF3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64055282256
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41791D4326;
	Tue,  5 Nov 2024 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY7407j1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8B1CC893;
	Tue,  5 Nov 2024 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730806651; cv=none; b=EHEgJXaZDHLkRCpvPLKzbzdmQvSNOTo2dZK4KHk8iBzQIJzUySSMR4fbdkpyO7ji+4wKl52eH5flNwqR9ZRuyuT/p+aIIz4Av1Z2F+AwK1po4kK5gSEpbbriTuRLsIpefKaGQGUlGMzj++EGX4sQ5MJEE3pEDj6RuWtomjUV2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730806651; c=relaxed/simple;
	bh=C2eoHqLMgXl3OLemzSCLahR5X6G6WSWO5QNpUC3yNFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPWO6cLTkDc+Ik9Wu9b65NS04RXIHMKy0LvyviQNafghHih5VJ+x8GJy4eeOW60j7+IzTk+sDlMsKaef8uiQ/zvPOjOQxC7xC74yleeAuq+3hDjIOjMXMTa2AsbWmLFWHJUIneUJ/nAlSLAs5IOCDoeR1JfeR7C3TbfF4r7g6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY7407j1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464F6C4CECF;
	Tue,  5 Nov 2024 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730806650;
	bh=C2eoHqLMgXl3OLemzSCLahR5X6G6WSWO5QNpUC3yNFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY7407j14pV53S6TwrTyDQRphP1jj3E1Exn7IZMG49gWH5p6O4VSqqrBcwjnP541n
	 bhhgOCrap0cUEKx0gwbIxG67ltJzeuRceG5MwjrfBQWR+3m4eSI+r2ql5emA7GV7HX
	 bolJqeWdSE9azgDScgDVBOlvzk2WPzTuVpc19/fuEsZ1B82WKGofvt0/z7TEdLQr8J
	 6qN6MAlveMAtPNDWWTQcWnXj/k0nx4KuwXmglHbjmbUbf/z47gbcv7gUX4xYO/7qOh
	 AQDV7pOz7k/r5qDjmQvghyA6VOFbuA0df78Kr8x/d1SbVnURCxGxiVMrAD9DHZpZQE
	 YQyYgcBctfFPQ==
Date: Tue, 5 Nov 2024 11:37:24 +0000
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <20241105113723.GA12600@willie-the-truck>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
 <ygd6bryp73jgsm5zggy2jz4uc42dehht2e6ht5f6yowf74c6ns@u6dul4rnybt6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ygd6bryp73jgsm5zggy2jz4uc42dehht2e6ht5f6yowf74c6ns@u6dul4rnybt6>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 04, 2024 at 01:10:12PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 29, 2024 at 12:47:09PM +0000, Will Deacon wrote:
> > On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > > > > Default MMU-500 reset operation disables context caching in
> > > > > prefetch buffer. It is however expected for context banks using
> > > > > the ACTLR register to retain their prefetch value during reset
> > > > > and runtime suspend.
> > > > > 
> > > > > Replace default MMU-500 reset operation with Qualcomm specific reset
> > > > > operation which envelope the default reset operation and re-enables
> > > > > context caching in prefetch buffer for Qualcomm SoCs.
> > > > > 
> > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > > > ---
> > > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
> > > > >   1 file changed, 42 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > index 087fb4f6f4d3..0cb10b354802 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > @@ -16,6 +16,16 @@
> > > > > 
> > > > >   #define QCOM_DUMMY_VAL	-1
> > > > > 
> > > > > +/*
> > > > > + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> > > > > + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> > > > > + * buffer). The remaining bits are implementation defined and vary across
> > > > > + * SoCs.
> > > > > + */
> > > > > +
> > > > > +#define CPRE			(1 << 1)
> > > > > +#define CMTLB			(1 << 0)
> > > > > +
> > > > >   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> > > > >   {
> > > > >   	return container_of(smmu, struct qcom_smmu, smmu);
> > > > > @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> > > > >   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
> > > > >   }
> > > > > 
> > > > > +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> > > > > +{
> > > > > +	int ret;
> > > > > +	u32 val;
> > > > > +	int i;
> > > > > +
> > > > > +	ret = arm_mmu500_reset(smmu);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	/*
> > > > > +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
> > > > > +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
> > > > > +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
> > > > > +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
> > > > > +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
> > > > > +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
> > > > > +	 * during reset and runtime suspend operations.
> > > > > +	 */
> > > > > +
> > > > > +	for (i = 0; i < smmu->num_context_banks; ++i) {
> > > > > +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> > > > > +		val |= CPRE;
> > > > > +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> > > > > +	}
> > > > 
> > > > If CPRE only needs to be disabled prior to r2p2, then please teach the
> > > > MMU-500 code about that instead of adding qualcomm-specific logic here.
> > > > 
> > > 
> > > Doing this on MMU-500 code would make it generic and reflect for SoC of all
> > > the vendors on this platform.
> > > We can make sure that it won't cause any problems in Qualcomm SoCs as we
> > > have been enabling this since for some years now and could not
> > > observe/reproduce any issues around these errata.
> > 
> > Unless you can explain definitively hy that's the case, I still don't
> > think we should be second-guessing the core SMMU driver code in the
> > Qualcomm backend.
> > 
> > > But we won't be able to guarantee the same behavior in SoC for other vendors
> > > where these errata might still be applicable as per [1] and [2].
> > > So as per my understanding it's safe to include in Qualcomm specific
> > > implementation and not changing the default behavior in all other vendors'
> > > SoC even if they are not prior to r2p2 revision [3].
> > 
> > If you want to gate the errata workarounds on policy, then please follow
> > what we do for the CPU: add a Kconfig option (e.g.
> > ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> > the relevant errata aren't all "rare") and update silicon-errata.rst
> > accordingly.
> > 
> > Then you can choose to disable them in your .config if you're happy to
> > pick up the pieces.
> 
> Is it actually going to work? For most of the CPU errata we can detect
> and limit the workarounds to some class of CPUs. For SMMU, if I'm not
> misunderstanding something, the errata will be enabled by default for
> all SMMU-500 implementation, so only very few kernels, targeting only
> the Qualcomm hardware, can get that disabled.

We can add checks based on rXpY per the erratum documentation, but Robin
was saying elsewhere in the thread that some of them are still open (i.e.
unfixed).

So ultimately, the decision to disable workarounds for known errata on
broken hardware is going to be a niche sport, yes.

Will

