Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066FC1C4C32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 04:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgEECcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 22:32:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59639 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726788AbgEECcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 22:32:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588645970; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aWsP1jrgv5VOaBcGYPLjJDNZ7GM9ZWmCxTTYgdbAIYY=;
 b=a8TmWCez8Afhptf8/LVHLfhwOts/+ZE253AimWcZvhyNdLlistR/kv38ceDMg8ll/gaN4W6l
 MFArN4pOLLLQyq6ayjHCS2kCr9OzurY3wl87mheXokOI825xcBK0jA3sZ8Yrn0VpJWitpD3S
 pOUogW3OVkDmFkKVvmfxnn914kM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A4F5C433BA; Tue,  5 May 2020 02:32:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACAD7C433D2;
        Tue,  5 May 2020 02:32:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 May 2020 19:32:41 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, hemantk@codeaurora.org
Subject: Re: [PATCH v4 8/8] bus: mhi: core: Ensure non-zero session or
 sequence ID values are used
In-Reply-To: <2a249d99-b1e7-7943-0ed4-d5529f7abc33@codeaurora.org>
References: <1588386725-1165-1-git-send-email-bbhatt@codeaurora.org>
 <1588386725-1165-9-git-send-email-bbhatt@codeaurora.org>
 <2a249d99-b1e7-7943-0ed4-d5529f7abc33@codeaurora.org>
Message-ID: <623c100dc1850c8d8f9a6412d7153fd1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-04 07:33, Jeffrey Hugo wrote:
> On 5/1/2020 8:32 PM, Bhaumik Bhatt wrote:
>> While writing any sequence or session identifiers, it is possible that
>> the host could write a zero value, whereas only non-zero values should
>> be supported writes to those registers. Ensure that the host does not
>> write a non-zero value for them and also log them in debug messages.
>> 
>> Suggested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/boot.c     | 15 +++++++--------
>>   drivers/bus/mhi/core/internal.h |  1 +
>>   2 files changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> index e5fcde1..9fe9c59 100644
>> --- a/drivers/bus/mhi/core/boot.c
>> +++ b/drivers/bus/mhi/core/boot.c
>> @@ -43,10 +43,7 @@ void mhi_rddm_prepare(struct mhi_controller 
>> *mhi_cntrl,
>>   		      lower_32_bits(mhi_buf->dma_addr));
>>     	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, 
>> mhi_buf->len);
>> -	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
>> -
>> -	if (unlikely(!sequence_id))
>> -		sequence_id = 1;
>> +	sequence_id = (MHI_RANDOM_U32_NONZERO & 
>> BHIE_RXVECSTATUS_SEQNUM_BMSK);
> 
> I don't think this math works.  For example, if MHI_RANDOM_U32_NONZERO
> is 0x0FF0, and BHIE_RXVECSTATUS_SEQNUM_BMSK is 0xF, then sequence_id
> will end up being 0.

In this case, SEQNUM BMSK is set to 0x3FFFFFFF so this change will still 
work as
we only supplied a non-zero number macro to AND with the mask.
However, I agree that may not be the case always that we would know the 
bitmask
in advance so it is better to fix it for good.

Thanks for the catch! I have updated the change to have the macro take 
the
bitmask as a parameter and output a non-zero value.
