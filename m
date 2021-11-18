Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B7B455492
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 07:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbhKRGK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 01:10:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:50924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241659AbhKRGK1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 01:10:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02EAA61B3D;
        Thu, 18 Nov 2021 06:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637215647;
        bh=5fxTQ1bWIoc5Ws6kmYvJTIHYtyZWgMDwpyFzbjys5uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oQih70Pibk7SpLxev2lK1NFOlWEiHcjZ+aKh3KD3JeCkioepG4vYUx7kLrgGSJKSR
         ZPooBzm0YfT2qyV+duTAXAeMiEiSMrSMt4dWvZvAB+rJ8+111geF1Tb1xpiDTC93x2
         B6RyU7CRSreXhQAaoJPDYoSNFrABEpylHn0ykXcps3mmzewFWwSKtBm/Sj4Iwf8Txo
         LsOPl1Uk0Mzk6tR+jeJUGnnEQWANfO+nv4laOm/EeZFgE4RgLBMkKmbERyOIOQiQBI
         WLTZ683eHK/HEJtpvUT8DOocfAn32dnTzoSftKaevd3CDNNQ+/Z7jnBYNq6TPvDGkF
         56T0KpsEwLa6w==
Date:   Thu, 18 Nov 2021 11:37:20 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_hemantk@quicinc.com, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: core: Read missing channel configuration entry
Message-ID: <20211118060720.GC6461@thinkpad>
References: <1636072273-16034-1-git-send-email-quic_bbhatt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636072273-16034-1-git-send-email-quic_bbhatt@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 04, 2021 at 05:31:13PM -0700, Bhaumik Bhatt wrote:
> The 'wake-capable' entry in channel configuration is not set when
> parsing the configuration specified by the controller driver. Add
> the missing entry to ensure channel is correctly specified as a
> 'wake-capable' channel.
> 
> Signed-off-by: Bhaumik Bhatt <quic_bbhatt@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Looks like this one is qualified as a bug fix. Please add the fixes tag and Cc
stable.

And the subject could be,
"bus: mhi: core: Fix reading wake_capable configuration"

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 5aaca6d..f1ec3441 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -788,6 +788,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  		mhi_chan->offload_ch = ch_cfg->offload_channel;
>  		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
>  		mhi_chan->pre_alloc = ch_cfg->auto_queue;
> +		mhi_chan->wake_capable = ch_cfg->wake_capable;
>  
>  		/*
>  		 * If MHI host allocates buffers, then the channel direction
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
