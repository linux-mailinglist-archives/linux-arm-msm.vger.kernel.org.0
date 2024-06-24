Return-Path: <linux-arm-msm+bounces-23830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2573913F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 02:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA0D1C212EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 00:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75FB10E9;
	Mon, 24 Jun 2024 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mti3JftW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3A7804;
	Mon, 24 Jun 2024 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188726; cv=none; b=bwjK7Hfj1GX4rQtXuSOgDRBr8egLTqBqJlL/xcF9EjbYT1t+cMKr3GERKS9Da6sf1Unw6U4hMZRTY3D0zjtUIycUWorNQo1khnDj+PTc+Ki3Ck+8bFQ48e0Qkw/PgFAKilk2aFVpJuSIZ0QS8e/SSjSbbei3T5h886GaT5QYTWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188726; c=relaxed/simple;
	bh=HG3NPzAhcZM/uRXI3JXKb+2sxcEzaOy/qx4Q/ZBuHEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkVC+CKwxLzLMItl0WDl6z5DoXdKt6nUDg59nbJ8CtDXaICWXr0Y1UxIwdD5Qx9RuZYQq5DUn1GQ3bdsxLjoqgCXOE2COnSL02XhdXP6rH7EMuk24llLzuRWFtgufAvLutbFBFvSxIaiq6Dt+2efC6RqZArN/hUVyOGHCn+De9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mti3JftW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C54C2BD10;
	Mon, 24 Jun 2024 00:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719188726;
	bh=HG3NPzAhcZM/uRXI3JXKb+2sxcEzaOy/qx4Q/ZBuHEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mti3JftWP9EjEWaqQC8GC66kLmepD1OA/+t5tKJIjrUA4K2Q2D65Pp8rmW6IDL/iw
	 C+hv9fOfH1TLTzscpHOCE8GIiOwYhfLvOnbkLmiue2tJzOzs7ESWLtl9OIGZ0i8bJC
	 HzR1Fxpa9gcHFiFae0BYYUtgX+iCs51iugtRPzZH6/Asp9u9OCLmAy8Q9J/tTpt5Ey
	 3HHhL3LJbK65YQ1NGi+i8eofrweBdCdjtsXUJv6voOOoljztzJXegwhHQ7MR48+WQg
	 0buCmC4yxUSwy1H5oENivgucwinSmrBFSZjXS/lNYzaRn5ivPYPP/6fF3ddNPmwigh
	 EFHFda2Jb0E/A==
Date: Sun, 23 Jun 2024 19:25:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
Message-ID: <jcvu2irnung4u6v6ticafrqze73kqenpqpy6le6du2q6ag734u@jeqxv5y7pumm>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
 <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
 <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>

On Wed, May 29, 2024 at 05:24:29PM GMT, Mukesh Ojha wrote:
> 
> 
> On 5/27/2024 2:16 AM, Bjorn Andersson wrote:
> > On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
> > > For SCM protection, memory allocation should be physically contiguous,
> > > 4K aligned, and non-cacheable to avoid XPU violations. This granularity
> > > of protection applies from the secure world. Additionally, it's possible
> > > that a 32-bit secure peripheral will access memory in SoCs like
> > > sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
> > > needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
> > > pool can be used with dma_alloc APIs.
> > > 
> > > However, dma_alloc APIs will fall back to the buddy pool if the requested
> > > size is less than or equal to PAGE_SIZE. It's also possible that the remote
> > > processor's metadata blob size is less than a PAGE_SIZE. Even though the
> > > DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
> > > back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
> > > is disabled.
> > 
> > Does "fail" here mean that the buddy heap returns a failure - in some
> > case where dma_alloc would have succeeded, or that it does give you
> > a PAGE_SIZE allocation which doesn't meeting your requirements?
> 
> Yes, buddy will also try to allocate memory and may not get PAGE_SIZE memory
> in lower 4GB(for 32bit capable device) if CONFIG_ZONE_{DMA|DMA32} is
> disabled.

Is that -ENOMEM or does "not get" mean that the buddy fallback will
provide an allocation above 4GB?

Regards,
Bjorn

> However, DMA memory would have successful such case if
> padding is added to size to cross > PAGE_SIZE.
> 
> > 
> >  From this I do find the behavior of dma_alloc unintuitive, do we know if
> > there's a reason for the "equal to PAGE_SIZE" case you describe here?
> 
> I am not a memory expert but the reason i can think of could be, <=
> PAGE_SIZE can anyway possible to be requested outside DMA coherent api's
> with kmalloc and friends api and that could be the reason it is falling
> back to buddy pool in DMA api.
> 
> -Mukesh

