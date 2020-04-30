Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC41BFF87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 17:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgD3PDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 11:03:13 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34936 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726762AbgD3PDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 11:03:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588258992; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=jhdlQT2vqv3qEZdgFhTq6+MiNtZ4KjJ/qRTV4AVufrM=; b=Sffoe/hx+9KMDrBSYKI0029VU2fbLnUXwJP5thgssGkLO6Bh0jzW0X+ndfygcn46nRM7e/E4
 hcpWbTPnGEVNrUBCwB5+2VpWsetPf+scO6J430ADEMHDvXiP4TQBDXCbwSWCZamoK/GC0gSo
 Z7N8aLXxVkE1JqOlt4CU5qePTWA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaae87e.7f91e6aa95e0-smtp-out-n04;
 Thu, 30 Apr 2020 15:02:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49D2FC433D2; Thu, 30 Apr 2020 15:02:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CE8EC433CB;
        Thu, 30 Apr 2020 15:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CE8EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 6/9] bus: mhi: core: WARN_ON for malformed vector table
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
 <1588193551-31439-7-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <15f88b7a-a3cb-ac19-bffe-247f2e99d894@codeaurora.org>
Date:   Thu, 30 Apr 2020 09:02:19 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588193551-31439-7-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/29/2020 2:52 PM, Bhaumik Bhatt wrote:
> Add a bounds check in the firmware copy routine to exit if a malformed
> vector table is found while attempting to load the firmware in to the
> BHIe vector table.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 17c636b..bc70edc 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -362,8 +362,14 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
>   	int i = 0;
>   	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>   	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   
>   	while (remainder) {
> +		if (WARN_ON(i >= img_info->entries)) {
> +			dev_err(dev, "Malformed vector table\n");

I feel like this message needs more detail.  At a minimum, I think it 
should indicate what vector table (BHIe).  I think if you can identify 
what file, etc the the glitch is in, that would be better.  Maybe some 
detail about i and img_info->entries.

If I see this error message, I should have enough information to 
immediately debug the issue.  If it tells enough to go directly into the 
firmware file and have a look at entry X to see what might be corrupt 
about it, that makes my debugging very efficient.  If I have to go back 
to the code to figure out what "Malformed vector table" means, and then 
maybe apply a patch to get more data about the error - the error message 
is not as useful as it should be.

> +			return;
> +		}
> +
>   		to_cpy = min(remainder, mhi_buf->len);
>   		memcpy(mhi_buf->buf, buf, to_cpy);
>   		bhi_vec->dma_addr = mhi_buf->dma_addr;
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
