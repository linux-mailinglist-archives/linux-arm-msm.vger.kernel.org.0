Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6903345549D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 07:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243265AbhKRGPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 01:15:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:51626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242905AbhKRGP2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 01:15:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B8AB61B51;
        Thu, 18 Nov 2021 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637215949;
        bh=IS/+ZFzUMaT6WnHfrvP61djs6+uOU3Thi6+OOrX6y9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gxt02u/kIRDa0F7Zzp+KBlAS96O6V096JcQysg0Nh2+wZDVIykGJ7adGlP1Lncx5s
         M+/rQjinRtAFxfYWblj9bp2pKfwJesbIMp2Vsp0u9nyf/UMHVqSTWf3PpzfpY/xF1d
         wyF7BTDelwm1S62O2iiXU8gh89sOXErMMlColafY2TIC+Ddq9M/PITlCCAgUmt9LWv
         rpGLMFQRzZtr84PhdbvundlqIj89NBWL9HjKHv0dnWR1vKmXdI4KB4/eRVeOn2H7hB
         JsmsPrxZmv3/JM02UtcGsWXDlwYs93fgxatsLQPuMEq7Ww+dyTWJOi/bpovFrFbCu5
         rxS9nofyQCqiw==
Date:   Thu, 18 Nov 2021 11:42:23 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix device recovery failed issue
Message-ID: <20211118061223.GD6461@thinkpad>
References: <20211108113127.3938-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108113127.3938-1-slark_xiao@163.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 07:31:27PM +0800, Slark Xiao wrote:
>   For Foxconn T99W175 device(sdx55 platform) in some host
> platform, it would be unavailable once the host execute
>  the err handler.
>  After checking, it's caused by the delay time too short to
> get a successful reset.
> 
>   Please see my test evidence as bewlow(BTW, I add some
> extra test logs in function mhi_pci_reset_prepare and
> mhi_pci_reset_done):
>   When MHI_POST_RESET_DELAY_MS equals to 500ms:
>    Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222477] mhi mhi0: Device MHI is not in valid state
>    Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222628] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
>    Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222631] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
>    Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222632] mhi mhi0:  mhi_soc_reset write soc to reset
>    Nov  4 14:30:05 jbd-ThinkEdge kernel: [  147.839993] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
>    Nov  4 14:30:05 jbd-ThinkEdge kernel: [  147.902063] mhi-pci-generic 0000:2d:00.0: reset failed
> 
>   When MHI_POST_RESET_DELAY_MS equals to 1000ms or 1500ms:
>    Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.067857] mhi mhi0: Device MHI is not in valid state
>    Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068029] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
>    Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068032] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
>    Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068034] mhi mhi0:  mhi_soc_reset write soc to reset
>    Nov  4 19:07:29 jbd-ThinkEdge kernel: [  159.607006] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
>    Nov  4 19:07:29 jbd-ThinkEdge kernel: [  159.607152] mhi mhi0: Requested to power ON
>    Nov  4 19:07:51 jbd-ThinkEdge kernel: [  181.302872] mhi mhi0: Failed to reset MHI due to syserr state
>    Nov  4 19:07:51 jbd-ThinkEdge kernel: [  181.303011] mhi-pci-generic 0000:2d:00.0: failed to power up MHI controller
> 
>   When MHI_POST_RESET_DELAY_MS equals to 2000ms:
>    Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180527] mhi mhi0: Failed to transition from PM state: Linkdown or Error Fatal Detect to: SYS ERROR Process
>    Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180535] mhi mhi0: Device MHI is not in valid state
>    Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180722] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
>    Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180725] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
>    Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180727] mhi mhi0:  mhi_soc_reset write soc to reset
>    Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.230787] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
>    Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.230928] mhi mhi0: Requested to power ON
>    Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.231173] mhi mhi0: Power on setup success
>    Nov  4 17:51:14 jbd-ThinkEdge kernel: [  153.254747] mhi mhi0: Wait for device to enter SBL or Mission mode
> 
>   I also tried big data like 3000, and it worked as well.
>   500ms may not be enough for all support mhi device. We shall
> increase it to 2000ms at least.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..4c577a731709 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -20,7 +20,7 @@
>  
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
>  
> -#define MHI_POST_RESET_DELAY_MS 500
> +#define MHI_POST_RESET_DELAY_MS 2000
>  
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>  
> -- 
> 2.25.1
> 
