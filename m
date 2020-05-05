Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B2D1C5CB5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 17:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgEEP5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 11:57:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:64901 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729317AbgEEP5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 11:57:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588694249; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BP/jfHmx8eY86jcPlNpWPLEBZRDhZTNjqeOkpv8ek/U=; b=r+zylgJrJcdFx971gP7SIX6GIW3Rc52jHZEJkEv0f77tMEmi/T2J8P3njhXqrpgae1sbQRC+
 X3t/e+MK/2gBObSlnE6G7To4pSJnH/QU5nC2AbKgzQ1QghUJaUtkG9eM8VZpnY7OlhoDoWGr
 WmNfbfwZU4sAoXMZM149wpspwgM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb18cd5.7f3ee3e30df8-smtp-out-n03;
 Tue, 05 May 2020 15:57:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69336C432C2; Tue,  5 May 2020 15:57:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E2AFC433BA;
        Tue,  5 May 2020 15:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E2AFC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v5 8/8] bus: mhi: core: Ensure non-zero session or
 sequence ID values are used
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588646662-25785-1-git-send-email-bbhatt@codeaurora.org>
 <1588646662-25785-9-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4c224193-cdcf-b304-6652-e44b60e6e624@codeaurora.org>
Date:   Tue, 5 May 2020 09:57:06 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588646662-25785-9-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/4/2020 8:44 PM, Bhaumik Bhatt wrote:
> While writing any sequence or session identifiers, it is possible that
> the host could write a zero value, whereas only non-zero values should
> be supported writes to those registers. Ensure that the host does not
> write a non-zero value for them and also log them in debug messages.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c     | 15 +++++++--------
>   drivers/bus/mhi/core/internal.h |  2 ++
>   2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index e5fcde1..7b9b561 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -43,10 +43,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   		      lower_32_bits(mhi_buf->dma_addr));
>   
>   	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
> -	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
> -
> -	if (unlikely(!sequence_id))
> -		sequence_id = 1;
> +	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_RXVECSTATUS_SEQNUM_BMSK);
>   
>   	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
>   			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
> @@ -189,7 +186,9 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>   		return -EIO;
>   	}
>   
> -	dev_dbg(dev, "Starting AMSS download via BHIe\n");
> +	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_TXVECSTATUS_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting AMSS download via BHIe. Sequence ID:%u\n",
> +		sequence_id);
>   	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
>   		      upper_32_bits(mhi_buf->dma_addr));
>   
> @@ -198,7 +197,6 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>   
>   	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
>   
> -	sequence_id = prandom_u32() & BHIE_TXVECSTATUS_SEQNUM_BMSK;
>   	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
>   			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
>   			    sequence_id);
> @@ -246,14 +244,15 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
>   		goto invalid_pm_state;
>   	}
>   
> -	dev_dbg(dev, "Starting SBL download via BHI\n");
> +	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting SBL download via BHI. Session ID:%u\n",
> +		session_id);
>   	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
>   		      upper_32_bits(dma_addr));
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
>   		      lower_32_bits(dma_addr));
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
> -	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>   	read_unlock_bh(pm_lock);
>   
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 0965ca3..3205a92 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -452,6 +452,8 @@ enum mhi_pm_state {
>   #define PRIMARY_CMD_RING		0
>   #define MHI_DEV_WAKE_DB			127
>   #define MHI_MAX_MTU			0xffff
> +#define MHI_RANDOM_U32_NONZERO(bmsk)	((prandom_u32_max(U32_MAX - 1) & \
> +					 (bmsk)) + 1)

I still think this is broken.  I'm sorry for the back and forth.

So, again if prandom_u32_max returns 0xFF, and bmsk is 0xF, we get 0xF 
by the & operation, then we add 1, which makes the result 0x10, which is 
outside of the range of bmsk, and is basically 0, assuming the register 
doesn't accept values outside of the lower 4 bits.

I think the solution should be:
prandom_u32_max(bmsk) + 1

If we treat bmsk like a ordinary value (say 7), then prandom_u32_max 
will return a value from 0-6.  Then by adding 1, we shift that range to 
1-7, which I think is exactly what we want.

Now, this assumes that bmsk is a contiguous mask of bits from bit 0 to 
N.  IE 0xFF and 0x4F are valid, but 0xFB is not.  Do you think that is a 
valid assumption?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
