Return-Path: <linux-arm-msm+bounces-27359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9739406AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 07:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21712B2135E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 05:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D66C154C0D;
	Tue, 30 Jul 2024 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HbQgr+K8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92027E792;
	Tue, 30 Jul 2024 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722315636; cv=none; b=BdIIWFwy9Eo2nauoF8oML/ui4MinDWtZZzgypJMzNoaykv0/mCnSRdZafaQJP7PRoHxmcdwu9X+ivLShRzxyjHwH/sWUx52qfL4RwtWM/LKUP7gXzRsqd1o7vxLL93sDbLwUSG97WxnqE//xH8tqsD7+tCIN49LnQj4UGmYIG9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722315636; c=relaxed/simple;
	bh=/MRnOHMXITOkoV6huHsq4qMDTZ79Yk+2XE92a/hUAYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS21yUIHyZXHP41VwBTz3egIeEH8RDqHPqeeFEyESa9kLYeWzN70Cu7x8WUBulArTginNhmCK01cRSGFowgoU9cWg+BAFfi2p+P2W9xsBT1LAaU2ziaIOC/8eK22fUeOOfbbzwd+YCu6xjoQYrELaIN6dAG2PrFcFCiJzTJsTpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HbQgr+K8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBFFC32782;
	Tue, 30 Jul 2024 05:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722315635;
	bh=/MRnOHMXITOkoV6huHsq4qMDTZ79Yk+2XE92a/hUAYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbQgr+K8pB4Updpqnfb9ZxNFrg/h9P0hY9JPGv1UV6vAYMC4vMS3MF8z4Vg1RD+il
	 6jKP/MJxnR6RFV01v0jPh9jJpxjpLFwPnhcdry+5cHcr+a1wpbC9rjzRYRc52VZaZ/
	 3PlIwtwDjFecoiBNHEzBmr5PR9j1muhJzpYOUAmU=
Date: Tue, 30 Jul 2024 07:00:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Define pr_fmt
Message-ID: <2024073004-crinkly-lark-d9d1@gregkh>
References: <20240729-f_fs-pr_fmt-v1-1-8a0fc3196201@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-f_fs-pr_fmt-v1-1-8a0fc3196201@quicinc.com>

On Mon, Jul 29, 2024 at 03:53:50PM -0700, Bjorn Andersson wrote:
> The majority of log entries of f_fs are generated with no indication of
> their origin. Prefix these, using pr_fmt, to make the kernel log
> clearer.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index d8b096859337..14ee43cb27b6 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -10,6 +10,7 @@
>   * Copyright (C) 2003 Agilent Technologies
>   */
>  
> +#define pr_fmt(fmt) "f_fs: " fmt

Why not fix the driver up to use the proper dev_*() printing functions
instead?

Or, use KBUILD_MODNAME?

thanks,

greg k-h

