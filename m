Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8478A1C2258
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 04:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgEBCjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 22:39:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32714 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbgEBCjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 22:39:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588387157; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yg4vNvD6TR74+JEaI5qINyXnJgDOYi1EBUxzQjIX5ug=;
 b=Z1H/8JuGBPhGIrlEkjWDzBCzYallmyfKAeV5dNDZJnuIq3Hf+yeVz6eLTC9BxTd6IL2HfKgp
 13fI76c2GT8+zQ5rvBkSa+j6++76va9BbTNVgW6gqp7h1sd+UoCunp3GYlCMlOeaOTnGfnHb
 +OLxMDifFA4J8mfrDdoB2nzqVFc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eacdd3e.7f0d22a59768-smtp-out-n03;
 Sat, 02 May 2020 02:38:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66F67C433CB; Sat,  2 May 2020 02:38:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9A3BC433F2;
        Sat,  2 May 2020 02:38:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 May 2020 19:38:52 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, hemantk@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v3 6/9] bus: mhi: core: WARN_ON for malformed vector table
In-Reply-To: <15f88b7a-a3cb-ac19-bffe-247f2e99d894@codeaurora.org>
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
 <1588193551-31439-7-git-send-email-bbhatt@codeaurora.org>
 <15f88b7a-a3cb-ac19-bffe-247f2e99d894@codeaurora.org>
Message-ID: <4d26ba11678e0302a0e6199b2b393cc2@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-30 08:02, Jeffrey Hugo wrote:
> On 4/29/2020 2:52 PM, Bhaumik Bhatt wrote:
>> Add a bounds check in the firmware copy routine to exit if a malformed
>> vector table is found while attempting to load the firmware in to the
>> BHIe vector table.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/boot.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> index 17c636b..bc70edc 100644
>> --- a/drivers/bus/mhi/core/boot.c
>> +++ b/drivers/bus/mhi/core/boot.c
>> @@ -362,8 +362,14 @@ static void mhi_firmware_copy(struct 
>> mhi_controller *mhi_cntrl,
>>   	int i = 0;
>>   	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>>   	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>     	while (remainder) {
>> +		if (WARN_ON(i >= img_info->entries)) {
>> +			dev_err(dev, "Malformed vector table\n");
> 
> I feel like this message needs more detail.  At a minimum, I think it
> should indicate what vector table (BHIe).  I think if you can identify
> what file, etc the the glitch is in, that would be better.  Maybe some
> detail about i and img_info->entries.
> 
> If I see this error message, I should have enough information to
> immediately debug the issue.  If it tells enough to go directly into
> the firmware file and have a look at entry X to see what might be
> corrupt about it, that makes my debugging very efficient.  If I have
> to go back to the code to figure out what "Malformed vector table"
> means, and then maybe apply a patch to get more data about the error -
> the error message is not as useful as it should be.
> 

I plan on dropping this patch as it looks like an unnecessary check 
since we
will always rely on the firmware->size from the request_firmware() API 
in order
to calculate the img_info->entries (or we can call it the number of 
segments, in
our case). And we will never fail in the if loop as values will already 
be
bounded.

>> +			return;
>> +		}
>> +
>>   		to_cpy = min(remainder, mhi_buf->len);
>>   		memcpy(mhi_buf->buf, buf, to_cpy);
>>   		bhi_vec->dma_addr = mhi_buf->dma_addr;
>> 
