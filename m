Return-Path: <linux-arm-msm+bounces-83492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F1C8AFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88D03A8816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C794339B2A;
	Wed, 26 Nov 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aChyYbs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F524468C;
	Wed, 26 Nov 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174922; cv=none; b=TpuuP+cSjsu/GY9Ko98wAorHKvMFgD/sOJ0lGtTsk6SWBTX3O6XemauFmKJ9PSOnDRQwole+aZukC8e7rrukx85WuiWnCMVrswQUZee91Ixvwyrw6RHxANmpbjNBv2wFuj1vPgbCnk0Bkz0rNZGR/nec0Wn0d5lVfoEWQcjKdis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174922; c=relaxed/simple;
	bh=RZSgIuGjiuIn9ptfmZ3PxA/WvIwjacZxfbO81s3iPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpY2K0UGjB6B/JOlomJ5Brls2Yt791XdodwGNCcRsUF2ZF/7ivUdjLIbSN/Xz62GfEiM4612hm2se3kNDlCOmXtVrr3dzgu+yO2gb5fGY5EXDePjlOMIFQmMdPhwY7tz6YISgn4AqGQFv5VwUE61tzra5EEQsO15UAZJ1a0I8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aChyYbs3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94016C4CEF7;
	Wed, 26 Nov 2025 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764174921;
	bh=RZSgIuGjiuIn9ptfmZ3PxA/WvIwjacZxfbO81s3iPPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aChyYbs3wcEnDBk9ckn0RVjg2ebxF+kQ5BoaXn5mFmVNsrlX1FVLRo6a5mWdD93Ey
	 xXsonGKzRtZ0pmScAgXsEcN+yKCkaRMjlwG7kj5dCNzUspEXCZocHYn4W9yeiKmlyN
	 A2Zj/K/boSznm6uND59y2H1A9MgyY6MTGyWhiphG7Or1K+UxMK3zOx7lD7u2wCIvxc
	 hi2gF/Iot+x/USUzskRu07Gp4C+dOeBwzSImrTpmEkEBhNIjs2uYkUZLkmVni8JEeK
	 gT2HflwH3Ur4vMLCpLr6ud3rW1wkcBAWU8O7XmfvaNIzcq7cEoowc+jSrqzkfT5Fqu
	 /w337gPxlz0ag==
Date: Wed, 26 Nov 2025 10:40:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <pxddyr7c2o7dmnw4zvrakxnekcn5mssisxldd7dercd6njjkh4@2mwntnirmdse>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
 <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
 <20251124120318.oqq42ndefnxyihfb@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124120318.oqq42ndefnxyihfb@hu-mojha-hyd.qualcomm.com>

On Mon, Nov 24, 2025 at 05:33:18PM +0530, Mukesh Ojha wrote:
> On Mon, Nov 24, 2025 at 12:31:47PM +0100, Konrad Dybcio wrote:
> > On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > > handles IOMMU configuration. This includes mapping memory regions and
> > > device memory resources for remote processors by intercepting
> > > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > > during teardown. Additionally, SHM bridge setup is required to enable
> > > memory protection for both remoteproc metadata and its memory regions.
> > > When the aforementioned hypervisor is absent, the operating system must
> > > perform these configurations instead.
> > > 
> > > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > > own device tree overlay file that specifies the firmware stream ID now
> > > managed by Linux for a particular remote processor. If the iommus
> > > property is specified in the remoteproc device tree node, it indicates
> > > that IOMMU configuration must be handled by Linux. In this case, the
> > > has_iommu flag is set for the remote processor, which ensures that the
> > > resource table, carveouts, and SHM bridge are properly configured before
> > > memory is passed to TrustZone for authentication. Otherwise, the
> > > has_iommu flag remains unset, which indicates default behavior.
> > > 
> > > Enables Secure PAS support for remote processors when IOMMU configuration
> > > is managed by Linux.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > 
> > [...]
> > 
> > > +	pas->pas_ctx->has_iommu = rproc->has_iommu;
> > > +	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
> > 
> > Sorry if we've been there before, but I see that IOMMU-mapping happens
> > before ctx initialization.. can we drop this parameter and just use
> > device_iommu_mapped(ctx->dev) in qcom_scm_pas_prepare_and_auth_reset()?
> 
> You are right and I am not against it, rproc already has variable `has_iommu`
> which we use in framework and vendor driver too, but what I thought,
> since this thing we have to do even for Iris or other drivers who are
> effected, they already have device which are behind IOMMU and if wrong
> device is passed in device_iommu_mapped() instead of firmware device which
> could have returned true even when Gunyah is present.
> 
> If you feel, has_iommu is not correct name, I could rename it to fw_iommu ?
> 

While this does relate to "has_iommu" and/or "fw_iommu" when it comes to
the current PAS context, the "feature flag" is "should we use tzmem or
not".

Further, in the case of the modem, we don't have an IOMMU, but we still
need to set this flag on the ctx in order to get the metadata into TZ.

So, I think this should be detached from the "iommu". How about naming
the "has_iommu" in the context to "use_tzmem"?

Regards,
Bjorn

> -- 
> -Mukesh Ojha

