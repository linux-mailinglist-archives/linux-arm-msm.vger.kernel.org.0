Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EBC1CA3BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgEHGWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgEHGWO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:22:14 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.45.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBF9920708;
        Fri,  8 May 2020 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588918933;
        bh=H8zuyDp1NSPLZp+cpCXhgJA2Fnax9JHQV+55OBnqXrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YbNGxWKGoAbQlIBxjjbQ50GfZ5hQXSuBQeJB2fDkA7O/rA2genrPzVovrSS7IudZe
         ub6DD1eN+ceb8S/EJYH7iKtYHXcqDxgb/dNCzRI5r2u4sBgkOB6hd6cAaT2aqYlifX
         04QIuWVoj3dJbvot5OqYaoq5R/pubhxCPiVk5i9w=
Date:   Fri, 8 May 2020 11:52:04 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v6 8/8] bus: mhi: core: Ensure non-zero session or
 sequence ID values are used
Message-ID: <20200508062204.GC2696@Mani-XPS-13-9360>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
 <1588718832-4891-9-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588718832-4891-9-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 05, 2020 at 03:47:12PM -0700, Bhaumik Bhatt wrote:
> While writing any sequence or session identifiers, it is possible that
> the host could write a zero value, whereas only non-zero values should
> be supported writes to those registers. Ensure that the host does not
> write a non-zero value for them and also log them in debug messages.
> 

Seems like you are reworking the existing checks also. So please mention
that in commit message. Something like:

'A macro is introduced to simplify this check and the existing checks are
also converted to use this macro.'

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/boot.c     | 15 +++++++--------
>  drivers/bus/mhi/core/internal.h |  1 +
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index e5fcde1..7b9b561 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -43,10 +43,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>  		      lower_32_bits(mhi_buf->dma_addr));
>  
>  	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
> -	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
> -
> -	if (unlikely(!sequence_id))
> -		sequence_id = 1;
> +	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_RXVECSTATUS_SEQNUM_BMSK);
>  

This is what I referred.

Thanks,
Mani

>  	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
>  			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
> @@ -189,7 +186,9 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  		return -EIO;
>  	}
>  
> -	dev_dbg(dev, "Starting AMSS download via BHIe\n");
> +	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_TXVECSTATUS_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting AMSS download via BHIe. Sequence ID:%u\n",
> +		sequence_id);
>  	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
>  		      upper_32_bits(mhi_buf->dma_addr));
>  
> @@ -198,7 +197,6 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  
>  	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
>  
> -	sequence_id = prandom_u32() & BHIE_TXVECSTATUS_SEQNUM_BMSK;
>  	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
>  			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
>  			    sequence_id);
> @@ -246,14 +244,15 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
>  		goto invalid_pm_state;
>  	}
>  
> -	dev_dbg(dev, "Starting SBL download via BHI\n");
> +	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting SBL download via BHI. Session ID:%u\n",
> +		session_id);
>  	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
>  		      upper_32_bits(dma_addr));
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
>  		      lower_32_bits(dma_addr));
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
> -	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>  	read_unlock_bh(pm_lock);
>  
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 0965ca3..80b32c2 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -452,6 +452,7 @@ enum mhi_pm_state {
>  #define PRIMARY_CMD_RING		0
>  #define MHI_DEV_WAKE_DB			127
>  #define MHI_MAX_MTU			0xffff
> +#define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
>  
>  enum mhi_er_type {
>  	MHI_ER_TYPE_INVALID = 0x0,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
