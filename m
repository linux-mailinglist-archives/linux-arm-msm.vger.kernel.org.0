Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91833F1EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 19:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHSRKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 13:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230522AbhHSRKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 13:10:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE2E8601FE;
        Thu, 19 Aug 2021 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629392969;
        bh=Jr1nOqa7yt+S7TpNNwNbEtoGkDgfCBeqYXed4DK6P2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cMsoItbPtzHaiWO8Smgg6MwDLQnEZ+IpOK8QINnQ9Zuq/lqXPODHlf6tnULuwie43
         XAjqVGZAMLD+cPrUAR/bG1jYsXAf05JuNKO9xFYeETgJKKfpEnD0QJV0++Y4aFI2O/
         Nn9xk02Fd3OReeigHdIa5L18oDoQDq5PBi3XNCsHpD7Z631BQ9LXgd/qGvCpq9L+qO
         vs0p+DCNIEl0JU3U1chJv58Hy6ZoG76+xvyGbgBQmfmmhZCwjPqlusRvFzpsrtcxDc
         8A4wzEFgD9M2xjBiTTK9Vx7n9lp+Fx/QNBWmJXcJ/I2FzBKk5h8Z6sofi39tk2UN62
         olqav2XqqtGcA==
Date:   Thu, 19 Aug 2021 22:39:21 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci-generic: Add MAINTAINER entry
Message-ID: <20210819170921.GA207729@thinkpad>
References: <1628067256-22813-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628067256-22813-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 10:54:16AM +0200, Loic Poulain wrote:
> Add myself as driver maintainer for pci_generic
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4c32a9c..9759ddd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12098,6 +12098,13 @@ F:	Documentation/mhi/
>  F:	drivers/bus/mhi/
>  F:	include/linux/mhi.h
>  
> +MHI PCI GENERIC DRIVER

Eventhough the term MHI refers to host implementation in kernel, we are now
heading towards Endpoint as well. So it makes sense to explicitly say "MHI HOST"
from here on.

Thanks,
Mani

> +M:	Loic Poulain <loic.poulain@linaro.org>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> +F:	drivers/bus/mhi/pci_generic.c
> +
>  MICROBLAZE ARCHITECTURE
>  M:	Michal Simek <monstr@monstr.eu>
>  S:	Supported
> -- 
> 2.7.4
> 
