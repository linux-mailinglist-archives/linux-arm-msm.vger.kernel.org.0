Return-Path: <linux-arm-msm+bounces-60414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D7ACF800
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 21:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13783B0838
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA80227CCDB;
	Thu,  5 Jun 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0By54sI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9827CCCD;
	Thu,  5 Jun 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151796; cv=none; b=Rnyt8cEIfE3jAMwEX2n91wIcwUzAixYfLUEWqCh1xy8EU+/18blJD2ptStaa+nY9Xq9NvDM5jcIbKGcbOAeeB71Otx+3l5qL/zJGQGr5JNKm6vXl1SvUDAlnFVRQ/mkqjDx7vXyQWz54+JOja/2/WRjPr8zz6waQwpfHqMgbW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151796; c=relaxed/simple;
	bh=KXHyUh+OtRsl2pelaAJoE/6mIIAsOHMnaVL2nVOHDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe4s8u5CutbTK2MJecWdISAW6P8yNoZWEf9aL4041GlErlR7nNMiP6M/1D95eWBXgoH35dPiShcHIJnmoCnF8i7jlq8AnPq6GVZflhi0gq4wEUwKy8NQrxT1VrOHIUoe7mq4pgUDcEUu5CGlr2hbSr5SvDxgQANW7pvGoRlkHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0By54sI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBDCC4CEE7;
	Thu,  5 Jun 2025 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749151796;
	bh=KXHyUh+OtRsl2pelaAJoE/6mIIAsOHMnaVL2nVOHDwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0By54sIwEk2LjzqgjimW1UX3NrTsZhnPrhqgr01hNZDIuTeq0Aon61FK9FBZyUE6
	 fgfi5zwRkms+MsvEtKLTJ80poWuOCg6kHKvBnu0EVIYx9MzQZIT73ir5gI/MNKoda8
	 s0ZeYqNN2l3oQQnHd9yv3GyeN/FL0XBrEDcxX8jM0im2DyDKardPTXHuQQDE4XjWIw
	 blmDxRLmFy0dVZMnF5j4o0tCMURfHhVgWTxOdySfYdRaLOqOkNgce8qQ0UrePD7sVn
	 WGscio8Yn10xwdVY4nNggx/jW65L5qJayHK5BPNfocWIThynJrhpuUXH9qydFxSi+g
	 0po1MX+htDcIg==
Date: Thu, 5 Jun 2025 14:29:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Ensure we don't read past the
 ELF header
Message-ID: <4ruhapzeti5hiufdkws27w2q3h4psfcpmcfsqrhsnyr2u4sktp@5itmiqxydwrj>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-1-29e22e7a82f4@oss.qualcomm.com>
 <bsnn6xpkubifuwxz4kccvves3ifq4ocp53qmbobv6ilmnfuh7x@eejawp7thorm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bsnn6xpkubifuwxz4kccvves3ifq4ocp53qmbobv6ilmnfuh7x@eejawp7thorm>

On Thu, Jun 05, 2025 at 06:57:41PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 05, 2025 at 08:43:00AM -0500, Bjorn Andersson wrote:
> > When the MDT loader is used in remoteproc, the ELF header is sanitized
> > beforehand, but that's not necessary the case for other clients.
> > 
> > Validate the size of the firmware buffer to ensure that we don't read
> > past the end as we iterate over the header.
> > 
> > Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
> > Cc: <stable@vger.kernel.org>
> > Reported-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/mdt_loader.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..1da22b23d19d28678ec78cccdf8c328b50d3ffda 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -18,6 +18,31 @@
> >  #include <linux/slab.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> >  
> > +static bool mdt_header_valid(const struct firmware *fw)
> > +{
> > +	const struct elf32_hdr *ehdr;
> > +	size_t phend;
> > +	size_t shend;
> > +
> > +	if (fw->size < sizeof(*ehdr))
> > +		return false;
> > +
> > +	ehdr = (struct elf32_hdr *)fw->data;
> > +
> > +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
> > +		return false;
> > +
> > +	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
> 
> Nit, this should be a max(sizeof() and ehdr->e_phentsize.
> 

Hmm, I forgot about e_phentsize.

But the fact is that the check matches what we do below and validates
that we won't reach outside the provided buffer.
If e_phentsize != sizeof(struct elf32_phdr) we're not going to be able
to parse the header.

Not sure if it's worth it, but that would make sense to change
separately. In which case ehdr->e_phentsize * ehdr->e_phnum would be the
correct thing to check (no max()). Or perhaps just a check to ensure
that e_phentsize == sizeof(struct elf32_phdr)?

Regards,
Bjorn

