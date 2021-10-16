Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E384300DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 09:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243749AbhJPHhE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:37:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243657AbhJPHhE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:37:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AAEF61213;
        Sat, 16 Oct 2021 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634369696;
        bh=tJzyq0ubQgn9beUPVMlG3SgK6h/U2i5aqmO+zWpAUMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TEXky2+bzxVl2laP8boqmsKA1qNh1ddd1ZPR7xRp2WAoD4Kyzmf5Han/pa7jTdsL4
         M4fpccfmGLcKj8IYlXZmSudv4mCmLmGqGIsAA8Wj8iVVJBjTDxkPYRYHA8iEsy48Gq
         vCN7wbRW/S7SeMhbg2dFP6PA798CWfIneoFj81mQ=
Date:   Sat, 16 Oct 2021 09:34:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Message-ID: <YWqAm2NZOS6zqs/I@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 12:27:32PM +0530, Manivannan Sadhasivam wrote:
> Since Hemant is not carrying out any maintainership duties let's make
> him as a dedicated reviewer. Also add the new mailing lists dedicated
> for MHI in subspace mailing list server.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..8ae357d746c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12191,7 +12191,8 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>  
>  MHI BUS
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -M:	Hemant Kumar <hemantk@codeaurora.org>
> +R:	Hemant Kumar <hemantk@codeaurora.org>
> +L:	mhi@lists.linux.dev

Can I get an acked-by from Hemant about this change please?

thanks,

greg k-h
