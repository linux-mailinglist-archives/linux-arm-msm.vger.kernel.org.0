Return-Path: <linux-arm-msm+bounces-25735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C492C385
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 20:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2761F2327E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 18:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F3417B045;
	Tue,  9 Jul 2024 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwM9AEfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3C80BEC;
	Tue,  9 Jul 2024 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720551254; cv=none; b=u6Bapj+yQADreTs13JpzY0L21I5TIMx/Y5EWbC4NpzC7z08EGzAKyBDh6O86NBXtsPJGU36UYVYcYcWNalR+Oe4MVOPhlG7aXZ/HjYoskzPMHEf+etVeYtjlernfFMRKj7CEi4wBYbUfzOAs8T40/3oTSd47Vn5xrVpzsBiA9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720551254; c=relaxed/simple;
	bh=zU+xsUl1UVFtkSW2uled6b4uFbPZZ9vJ+DA0uP6xOCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4VLn7zFLtTdXCvgn6v68DqkuvkIcJUbKZdhBfDA8IY12PaOm/sQHXNl6iLlaPNRtxuRoZxGnXdpuGBTj3/kl0NwqEmWsOyZvzJla4mqkAbCPIxH2SeJvWMyfEqmL+TMDf/kFDFtjdzq4d03YWnQYW3aqAVWYU8a2GLtLb66/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwM9AEfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA10C3277B;
	Tue,  9 Jul 2024 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720551253;
	bh=zU+xsUl1UVFtkSW2uled6b4uFbPZZ9vJ+DA0uP6xOCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwM9AEfpO5XEeQhOCklbMmT6XTFAnaKLSY09IA9ClKZKULDLYX8FN1e3yiaFTGM8v
	 rP6jg4cl4GIIaqjUdgjpHFMqtLZcEA0d1HhWa37RmzyUjehM8U+qxzag/NECxat39a
	 hgqsyXQBkEYX8oSe/Lt4lL8DDrZ0zSgx6ng2+W5YFl0e2/2+LtDss5zpqvyhZLutpL
	 JUXT8NvXU18lifBkmZ0/J3uMI8GIvlNWqwIsidQsK2EMyERtPC3/jKYaBkIicEd96G
	 O5PBuIfi2V32zu1+F63tWXlq1Y9seml27I5he2c/ygFRl19LWxhrwn/aFcfQQ3dSt3
	 RSiVUEco2qXsg==
Date: Tue, 9 Jul 2024 13:54:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
Message-ID: <qputoki6kfvowm35ops5wytiezdixsgel3klaq2vj4ylpv44qy@r2khmqemg6jo>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
 <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
 <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>
 <jcvu2irnung4u6v6ticafrqze73kqenpqpy6le6du2q6ag734u@jeqxv5y7pumm>
 <ZnmK7Nc50gM3HbVI@hu-mojha-hyd.qualcomm.com>
 <b645a400-a932-f7e0-de03-e88833541538@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b645a400-a932-f7e0-de03-e88833541538@quicinc.com>

On Mon, Jul 08, 2024 at 03:33:57PM GMT, Prakash Gupta wrote:
> 
> 
> On 6/24/2024 8:34 PM, Mukesh Ojha wrote:
> > On Sun, Jun 23, 2024 at 07:25:23PM -0500, Bjorn Andersson wrote:
> >> On Wed, May 29, 2024 at 05:24:29PM GMT, Mukesh Ojha wrote:
> >>>
> >>>
> >>> On 5/27/2024 2:16 AM, Bjorn Andersson wrote:
> >>>> On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
> >>>>> For SCM protection, memory allocation should be physically contiguous,
> >>>>> 4K aligned, and non-cacheable to avoid XPU violations. This granularity
> >>>>> of protection applies from the secure world. Additionally, it's possible
> >>>>> that a 32-bit secure peripheral will access memory in SoCs like
> >>>>> sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
> >>>>> needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
> >>>>> pool can be used with dma_alloc APIs.
> >>>>>
> >>>>> However, dma_alloc APIs will fall back to the buddy pool if the requested
> >>>>> size is less than or equal to PAGE_SIZE. It's also possible that the remote
> >>>>> processor's metadata blob size is less than a PAGE_SIZE. Even though the
> >>>>> DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
> >>>>> back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
> >>>>> is disabled.
> >>>>
> >>>> Does "fail" here mean that the buddy heap returns a failure - in some
> >>>> case where dma_alloc would have succeeded, or that it does give you
> >>>> a PAGE_SIZE allocation which doesn't meeting your requirements?
> >>>
> >>> Yes, buddy will also try to allocate memory and may not get PAGE_SIZE memory
> >>> in lower 4GB(for 32bit capable device) if CONFIG_ZONE_{DMA|DMA32} is
> >>> disabled.
> >>
> >> Is that -ENOMEM or does "not get" mean that the buddy fallback will
> >> provide an allocation above 4GB?
> > 
> > dma_alloc_coherent() returns NULL in that situation.
> > 
> > https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/direct.c#L142
> > 
> > -Mukesh
> > 
> 
> scm device is using DMA mask as 32b. With size <= PAGE_SIZE, call to 
> dma_alloc_contiguous() at [1] will return NULL.
> 
> With DMA mask as 32b and CONFIG_ZONE_{DMA|DMA32} disabled, the allocation 
> can't be guaranteed within 32b with buddy. Hence will return page as NULL.
> 
> Adding a padded page should allow allocation from CMA region.
> 

Thanks for the explanation, Prakash and Mukesh. It sounds wrong to me
that one has to trick the DMA API this way.

I assume this comes from the check [a], could we perhaps propose
modifying this? If nothing else it will give us the DMA maintainers'
input regarding this being the appropriate workaround.

[a] https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/contiguous.c#L362

Regards,
Bjorn

> Thanks,
> Prakash
> 
> [1] https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/direct.c#L131
> >>
> >> Regards,
> >> Bjorn
> >>
> >>> However, DMA memory would have successful such case if
> >>> padding is added to size to cross > PAGE_SIZE.
> >>>
> >>>>
> >>>>  From this I do find the behavior of dma_alloc unintuitive, do we know if
> >>>> there's a reason for the "equal to PAGE_SIZE" case you describe here?
> >>>
> >>> I am not a memory expert but the reason i can think of could be, <=
> >>> PAGE_SIZE can anyway possible to be requested outside DMA coherent api's
> >>> with kmalloc and friends api and that could be the reason it is falling
> >>> back to buddy pool in DMA api.
> >>>
> >>> -Mukesh
> > 
> 
> > 

