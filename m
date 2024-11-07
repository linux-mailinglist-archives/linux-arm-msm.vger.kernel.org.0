Return-Path: <linux-arm-msm+bounces-37191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB589BFD8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF6F61C217E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 05:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091CD187FE0;
	Thu,  7 Nov 2024 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BZ3+yTzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF417F9;
	Thu,  7 Nov 2024 05:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730956657; cv=none; b=BQg+6EXaKwsV1x+vUzVLSRoq7UGDrwPF3JE59E5yBKvOnyrEFEKEvbYTekTtOurJlgUN/7v6ofCBhFEIoza0crtrMu0NefrS4oi7lCHsCq0jPtWSbqYPjrt9Gp12vYkPQI6MFaN9dbSaxd6/p+dnC3GtQYvlTyqGBZa4arpKb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730956657; c=relaxed/simple;
	bh=XcVD/4hYuoKcxwEhkpZLMvMe3FDNpdXjhpEc//TswzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHu5spqHtvUmzHlmgklEFseHZMEJev9NVjBsrgrQy50vVxvAR7PH4UrGhH7Yg2oO+5IIDu6nbV+FeYC2wjFO7AOYVfxl+d8swBYeI7RfRC4XUhcWwgZT1Qp2dbfZy9b5CBB9KSaODDp+tXsceXz0w1etqLGjisFPMi6XQ7XVcWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BZ3+yTzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC58FC4CECC;
	Thu,  7 Nov 2024 05:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956657;
	bh=XcVD/4hYuoKcxwEhkpZLMvMe3FDNpdXjhpEc//TswzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZ3+yTzCkadEW0KZ97xxQz3gg/cpODq38CBXMxON16tuoiEPC775iyAtwEJYQZL/C
	 byYqbR/q606wRKeqEZT+dnuDBnRTPk3R9kQ66f7eZDDiAb536vPN/dfNz9lCMcug5p
	 cdLqSEetklntNyNSpjjupoMgvr9Grvv7O3UzF3D0=
Date: Thu, 7 Nov 2024 06:17:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: glink: fix off-by-one in
 connector_status
Message-ID: <2024110708-spud-clapping-4ae6@gregkh>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>

On Wed, Nov 06, 2024 at 05:45:54PM +0200, Dmitry Baryshkov wrote:
> UCSI connector's indices start from 1 up to 3, PMIC_GLINK_MAX_PORTS.
> Correct the condition in the pmic_glink_ucsi_connector_status()
> callback, fixing Type-C orientation reporting for the third USB-C
> connector.
> 
> Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

