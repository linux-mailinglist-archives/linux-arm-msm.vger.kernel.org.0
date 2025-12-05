Return-Path: <linux-arm-msm+bounces-84522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F027CA97C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C488322EB59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536B72BE64F;
	Fri,  5 Dec 2025 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMH97vsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580E2D3A75;
	Fri,  5 Dec 2025 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972698; cv=none; b=Pb07Xc0ptCKLWwf6B/uvoi8bHF5sccb+yZRLQ8jC19qqbqSyBl8SgRmtFFiaZkk2NnmFy+1oHkz8uBUEmXwEPUHytJR/6XbjAuE+Fa7a+ECNnDwupzEqzMihdjRyNt4l9GiXJFyQkAfPuTDac/hBrQdze4H8ZRqId5lm/jaRdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972698; c=relaxed/simple;
	bh=lHyqbDdgdcNYjY6N4964Cgh5lPOaTiSxWYqRzyPiSWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWpgocycTCmgaqfqS2cfoKQCKVD+F++6BvIFmDrD0QPiK0voqGZdPZVuIYzAKYfHZrepGR8/3aefzz3lqnTnjPkvI4L02DwR2G5AlDK5l8ihufTB1YhZ4UEaxztsfYD7Ts6GKv93JZ8WNRFhBPEmT8NqDBlKNlOnPNvbwZETb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMH97vsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11FEC4CEF1;
	Fri,  5 Dec 2025 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764972697;
	bh=lHyqbDdgdcNYjY6N4964Cgh5lPOaTiSxWYqRzyPiSWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMH97vsgdDkWsquQuik3Rb98UOubOHcaWCC1/9ysVMt7kU7dKbWifVt4diOgYIxhI
	 jEPmm4HahM0lbmXFzB2+PUCWZzu17T34yOkk6gwbhG/O9Di0/g8Fn3uHcLNYQb//qv
	 BHkw1mIGu6v5H45+ktrigfDbjzuXATl3n5MP70D8dt+wPSKTtBplawAVX+cJcBRwuE
	 mKpX4+qYL9CFdLjNqXGGBY1Cv5QUSQAWn3XX0GC+Sx/wXJmumrsCEMWgAGdE8GJh55
	 HSfyJPTwEOGrXXqGsPbBbNzt05pK4We2DWPFS2V3u1vrPZvrjRUbtM/9E60GcZz1Tr
	 P3hidVSPV19eg==
Date: Fri, 5 Dec 2025 16:17:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
 <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
 <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>

On Fri, Dec 05, 2025 at 02:15:00PM +0100, Konrad Dybcio wrote:
> On 12/4/25 1:28 PM, Mukesh Ojha wrote:
> > On Wed, Dec 03, 2025 at 01:36:32PM +0100, Konrad Dybcio wrote:
> >> On 11/24/25 4:25 PM, Mukesh Ojha wrote:
> >>> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> >>>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> >>>>> Qualcomm remote processor may rely on Static and Dynamic resources for
> >>>>> it to be functional. Static resources are fixed like for example,
> >>>>> memory-mapped addresses required by the subsystem and dynamic
> >>>>> resources, such as shared memory in DDR etc., are determined at
> >>>>> runtime during the boot process.
> >>>>>
> >>>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> >>>>> hypervisor, all the resources whether it is static or dynamic, is
> >>>>> managed by the hypervisor. Dynamic resources if it is present for a
> >>>>> remote processor will always be coming from secure world via SMC call
> >>>>> while static resources may be present in remote processor firmware
> >>>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> >>>>> with dynamic resources.
> 
> [...]
> 
> > Just to avoid iteration, are you suggesting that we can keep this
> > guesswork as part of __qcom_scm_pas_get_rsc_table() and start with
> > something smaller than SZ_16K?
> > 
> > I kind of agree with the first part, but SZ_16K was the recommended size
> > from the firmware for Lemans to start with, in order to pass the SMC
> > successfully on the first try. However, the same size was failing for
> > Glymur, and it required a second attempt with the correct size.
> 
> It depends on the payload, which you're probably much more familiar with.
> If 95% of them will be closer to e.g. 1K in size, it perhaps makes sense
> to use up the additional few dozen cycles on our amazingly fast CPUs and
> retry as necessary, instead of blindly reserving a whole bunch of memory.
> 

Those "few dozen cycles", is tasked with sending messages to RPMh for
voting and unvoting the buses, then tzmem will hopefully hit the
genpool, twice, and then radix updates, and then more genpool updated
and more radix tree work. And then of course there's the one context
switch to secure world.

If we don't have space in the genpool, we're going to grow
dma_alloc_coherent, extend the genpool, call secure world to register
the new tzmem. And then for all those cases where the allocation wasn't
enough, the retry (with updated size) will not fit in the
PAGE_ALIGN(size) genpool that was created, so we'll do this twice.

Fortunately the tzmem growing should only happen on first remoteproc
boot, but I think it's a bit optimistic to say "a few dozen"...


The drawback with making it 16KB is that we're not going to test that
error path very often. But the more idiomatic form of first calling with
a size of 0, then allocate and pass the proper size, seems a bit
wasteful to me as well - in particular if we do it anew each subsystem
boot.

PS. 16KB is 0.03% of the ADSP carveout (or 3% of the ADSP DeviceTree
carveout...).

Regards,
Bjorn

> Konrad

