Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9C01CBDF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 07:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgEIFvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 01:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgEIFvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 01:51:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F43CC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 22:51:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b8so1667044plm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v7J14h8CQ4Hdlv2EGA4N6V5LG3UgDFLVGj7NWGLwpvk=;
        b=Dnfj+2/60PmyIQt2csjXMt8i2o54WXeGTO8eZ6Ex0lG9CHbGA9EDmaWkQFPezQhPjp
         4ZVQDy+hOdxtUjq7sbZkgDr0h/H7CuuQ5DgLK2HPcVPI4z6kk5cwIExS/g0Ko/rRRKVF
         aF4DQfx2jx3+LPuropTSa5zr2KMisz/iBmEHWcDlt82oO+eZL1Kby7gniFfE9lUclWZB
         XXor8Cxli6endELvYO13zk6sEcZoONuF2RxBamijTUZVKvLvhUv/4+wZfkIdvNhuqECE
         7s4yAIIksGbOmTGmNK0y20tLaXXfmtt6rU9yn8qecGr2vgW5DXrWNwmqwL6Bdxd6jARj
         7aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v7J14h8CQ4Hdlv2EGA4N6V5LG3UgDFLVGj7NWGLwpvk=;
        b=Yg/7PZNsKU/3XD1siY2YIxjnOXTJUtxL+lH7Pf24sDBFkP1DjTNt3ZoiiDTs5yq12a
         ZO3NSd+0HaT4z98Z36BBlTuEVuNt2QwG9YReJKRzKfrIZbTIluDJSNktTjwbt9XKQYhz
         JXQeIcyHtRVA7X2zdlik0z7ENS72nh5EM+dXRLXMlQzR7DcaXZOkqIhgqpgdMAGbS3vE
         trOIbCjns8MgNjcH8rgN5x7qTFuekbC2V7vsUA+lG/wpVlWFFJ/1XBqL0+FG/2/70fug
         +o8VyK96Z2PmHp+kjyMb7tY/S4bthkUhtw+4jJXSjU8Hg4TJuEqTvLSX6++ouVmQcNA2
         Rg5w==
X-Gm-Message-State: AGi0PubNEZ+INgOE9GfT0W5/FUaSpJpshEhR4pEmmiGjLykmM6ckjyjB
        5herkXlevVr/2H/Bxogzr6Ok
X-Google-Smtp-Source: APiQypJs4NKtooznLYGK1Q0CNpQutjyoho0fhsR6ECi52CWVViTnzjebfvATF+x86awlTWrsVMHT5A==
X-Received: by 2002:a17:902:24b:: with SMTP id 69mr5531576plc.52.1589003477838;
        Fri, 08 May 2020 22:51:17 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e0c:55d2:2cb4:da01:ad1e:6ad9])
        by smtp.gmail.com with ESMTPSA id u13sm3750292pjb.45.2020.05.08.22.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 22:51:17 -0700 (PDT)
Date:   Sat, 9 May 2020 11:21:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v7 8/8] bus: mhi: core: Ensure non-zero session or
 sequence ID values are used
Message-ID: <20200509055110.GH5845@Mani-XPS-13-9360>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
 <1588991208-26928-9-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588991208-26928-9-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 07:26:48PM -0700, Bhaumik Bhatt wrote:
> While writing any sequence or session identifiers, it is possible that
> the host could write a zero value, whereas only non-zero values should
> be supported writes to those registers. Ensure that the host does not
> write a non-zero value for them and also log them in debug messages. A
> macro is introduced to simplify this check and the existing checks are
> also converted to use this macro.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c     | 15 +++++++--------
>  drivers/bus/mhi/core/internal.h |  1 +
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 80e4d76..0b38014 100644
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
