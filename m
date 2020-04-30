Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2011BFFD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 17:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgD3PMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 11:12:45 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27315 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726419AbgD3PMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 11:12:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588259564; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+Elf3SEuakpHyKtLd2fhgPxNApOMvDXgdZ23op/04/o=; b=raszGkcn6qzpFgcSrQbSvrgY/iEOabQmzBBmLRQhTams+tp+FfwXWwXzO+prVVv3AzyVHSoq
 3HY47lRAoDFRBtQVyoA+BhZ+LYMlw7ks9R+d47ORvox+7XTsUu61Dkma6T4cffOSsaCx8IRQ
 CxA6UIBJfdtSDirts/HSgy5i1HA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaaeae7.7f2dc00b1998-smtp-out-n03;
 Thu, 30 Apr 2020 15:12:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38A40C433CB; Thu, 30 Apr 2020 15:12:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA60CC432C2;
        Thu, 30 Apr 2020 15:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA60CC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 9/9] bus: mhi: core: Ensure non-zero session or
 sequence ID values
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
 <1588193551-31439-10-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e609031b-33a1-2db6-21b9-8ebadafba509@codeaurora.org>
Date:   Thu, 30 Apr 2020 09:12:35 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588193551-31439-10-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/29/2020 2:52 PM, Bhaumik Bhatt wrote:
> While writing any sequence or session identifiers, it is possible that
> the host could write a zero value, whereas only non-zero values are
> supported writes to those registers. Ensure that host does not write a
> non-zero value for those cases.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 0bc9c50..c9971d4 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -199,6 +199,9 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>   	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
>   
>   	sequence_id = prandom_u32() & BHIE_TXVECSTATUS_SEQNUM_BMSK;
> +	if (unlikely(!sequence_id))
> +		sequence_id = 1;

Seems like you could use prandom_u32_max(), and add 1 to the result to 
eliminate the conditional.  What do you think?

> +
>   	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
>   			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
>   			    sequence_id);
> @@ -254,6 +257,9 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
>   		      lower_32_bits(dma_addr));
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
>   	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
> +	if (unlikely(!session_id))
> +		session_id = 1;
> +
>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>   	read_unlock_bh(pm_lock);
>   
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
