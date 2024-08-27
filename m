Return-Path: <linux-arm-msm+bounces-29634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62238960AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FB41283D89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71461BA87C;
	Tue, 27 Aug 2024 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVkBjnY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9319EED8;
	Tue, 27 Aug 2024 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762841; cv=none; b=K2azyzuLdb9rrbWO5gp/E3g1sh9D7Sm9KE9lix5rXa3j71gmC78l3OoQYstB/Y/BSxoPU1dUHBv8RnyJIkM6LC92MpM9wNe6pHvg/Ow/w23G6VBWjMMzxvUjyX/M85LJpd557lBqg76ngYHRzsfej9X2S5oprSpcCRl98gqKYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762841; c=relaxed/simple;
	bh=0sd4Bxi4i+Qdbg9yXamzmuyf7Qb4bpTqEafzYbKvJsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmjNKAXMx7Cv/vv+7rAnYiWvdkpzBI9umNboqM1oHhLfU2w+oKNMrINSagRZRurR0MDoOz7U0rbWADTLn4eYWJAbH32FrDLV5VQErSfLQ2+/DFEBabeopbEuUiALz6V3QxKQ2eeiXGq0ZI/gzsAy//C4ji1ulFS7c7oWcOWlDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVkBjnY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D95C4FF6C;
	Tue, 27 Aug 2024 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724762841;
	bh=0sd4Bxi4i+Qdbg9yXamzmuyf7Qb4bpTqEafzYbKvJsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVkBjnY/oeu8AgEk02EVcnU5S8GN0oumlt+4m7TRZhdmSV8uPefA8DTHJlfh2hnII
	 emruP8nvobs6vGPIlnumQlUxv5jeHtilssMFg/FcYpK3L34OdHb3GuNc6d8zMCiR1x
	 ztHzMM6AZ2mU4DbkuyF+2ptpwhTamm1k5bgrPEIPppCoSmKdLkvn6BHEoRa7t1at3j
	 JPa92QFnBlRTtlVcIE1l6C4xiCswLG2aGwC03TxyQjifuCaK79U1ECxrYE3BYPbpfR
	 mxgCAm2jqAJ/V13Hprh6eH+M9CHP5BE5CWFeWoev1a6DW/mDftHvplqC5xPi46hQm7
	 EyDKFB1KAiI4Q==
Date: Tue, 27 Aug 2024 13:47:15 +0100
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
Message-ID: <20240827124714.GB4772@willie-the-truck>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
 <20240823155918.GD525@willie-the-truck>
 <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Aug 26, 2024 at 04:33:24PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 8/23/2024 9:29 PM, Will Deacon wrote:
> > On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
> > > Add ACTLR data table for SC7280 along with support for
> > > same including SC7280 specific implementation operations.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 +++++++++++++++++++++-
> > >   1 file changed, 57 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index dc143b250704..a776c7906c76 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -31,6 +31,55 @@
> > >   #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
> > >   #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
> > > 
> > > +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
> > > +	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
> > > +	{ 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
> > > +	{ 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +	{ 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> > > +};
> > > +
> > > +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
> > > +	{ 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
> > > +};
> > 
> > It's Will "stuck record" Deacon here again to say that I don't think
> > this data belongs in the driver.
> > 
> 
> Hi Will,
> 
> It will be difficult to reach a consensus here, with Robin and the DT folks
> okay to keep it in the driver, while you believe it doesn't belong there.
> 
> Robin, Rob, could you please share your thoughts on concluding the placement
> of this prefetch data?
> 
> As discussed earlier [1], the prefetch value for each client doesn’t define
> the hardware topology and is implementation-defined register writes used by
> the software driver.

It does reflect the hardware topology though, doesn't it? Those magic hex
masks above refer to stream ids, so the table is hard-coding the prefetch
values for particular matches. If I run on a different SoC configuration
with the same table, then the prefetch settings will be applied to the
wrong devices. How is that not hardware topology?

WIll

