Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D681C2255
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 04:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgEBCdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 22:33:18 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39466 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727924AbgEBCdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 22:33:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588386797; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iYIEoJGNhbKPN9zz/zszC6WL+W7rj9KlSLhmhiyLu+0=;
 b=jGnAcX7b6AFB4AOlYsbeB6JHbvXWUVWT51WJRAS7ZwVo0PxPqbPHqCWOvpzWnP0TQ0DMcSnf
 Tkkg0XmV5KV3iePqUoos3JmMVg1CjXoXYyLr7ftdSbqG6VJhi1sVAh4skxOoIBFQ0/CW89Fh
 CozrOMAhXi/eCcuwpLJA20sfUa8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eacdbe0.7f7d8d8fd378-smtp-out-n02;
 Sat, 02 May 2020 02:33:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88C5DC43637; Sat,  2 May 2020 02:33:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C80AC433CB;
        Sat,  2 May 2020 02:33:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 May 2020 19:33:03 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v3 9/9] bus: mhi: core: Ensure non-zero session or
 sequence ID values
In-Reply-To: <e609031b-33a1-2db6-21b9-8ebadafba509@codeaurora.org>
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
 <1588193551-31439-10-git-send-email-bbhatt@codeaurora.org>
 <e609031b-33a1-2db6-21b9-8ebadafba509@codeaurora.org>
Message-ID: <612b805e217eebbafeaa080655af2fba@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-30 08:12, Jeffrey Hugo wrote:
> On 4/29/2020 2:52 PM, Bhaumik Bhatt wrote:
>> While writing any sequence or session identifiers, it is possible that
>> the host could write a zero value, whereas only non-zero values are
>> supported writes to those registers. Ensure that host does not write a
>> non-zero value for those cases.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/boot.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> index 0bc9c50..c9971d4 100644
>> --- a/drivers/bus/mhi/core/boot.c
>> +++ b/drivers/bus/mhi/core/boot.c
>> @@ -199,6 +199,9 @@ static int mhi_fw_load_amss(struct mhi_controller 
>> *mhi_cntrl,
>>   	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
>>     	sequence_id = prandom_u32() & BHIE_TXVECSTATUS_SEQNUM_BMSK;
>> +	if (unlikely(!sequence_id))
>> +		sequence_id = 1;
> 
> Seems like you could use prandom_u32_max(), and add 1 to the result to
> eliminate the conditional.  What do you think?
> 

Agreed. Done using an internal macro in those places.

>> +
>>   	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
>>   			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
>>   			    sequence_id);
>> @@ -254,6 +257,9 @@ static int mhi_fw_load_sbl(struct mhi_controller 
>> *mhi_cntrl,
>>   		      lower_32_bits(dma_addr));
>>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
>>   	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
>> +	if (unlikely(!session_id))
>> +		session_id = 1;
>> +
>>   	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>>   	read_unlock_bh(pm_lock);
>> 
