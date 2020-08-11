Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D203C241AA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 13:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgHKLyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 07:54:21 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:29173 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728326AbgHKLyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 07:54:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597146859; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BbgBllrGixV1VF5JA2+YDRoW43ZC6IFJKZUmb8h6+nw=; b=FqGGNMUL78nrG83nyHCaua+q4PesYVRYbOe3/fHm4NwqpBr2vcr2VSa8todVbSgdx4a8BhD5
 NhFSq4CWnHPxgRoGXpBbGXnkhDNCh9Bwc3TfPx+13jt/1rbtU0kzcm1eLVwxkaOWs4xlf2mv
 sck9lQ6NP/yuu7vDxKVs+SkeX3Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f3286eb4c787f237b268b1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 11:54:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF4FCC433CA; Tue, 11 Aug 2020 11:54:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [157.43.31.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B877C433C6;
        Tue, 11 Aug 2020 11:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B877C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] serial: qcom_geni_serial: Fix recent kdb hang
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kgdb-bugreport@lists.sourceforge.net,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
 <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
 <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <b4cd8daf-ef37-4cc1-546e-ba46cb19392a@codeaurora.org>
Date:   Tue, 11 Aug 2020 17:24:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/11/2020 2:56 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Aug 10, 2020 at 5:32 AM Akash Asthana <akashast@codeaurora.org> wrote:
>> Hi Doug,
>>
>> On 8/7/2020 10:49 AM, Douglas Anderson wrote:
>>> The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
>>> even if UART isn't console") worked pretty well and I've been doing a
>>> lot of debugging with it.  However, recently I typed "dmesg" in kdb
>>> and then held the space key down to scroll through the pagination.  My
>>> device hung.  This was repeatable and I found that it was introduced
>>> with the aforementioned commit.
>>>
>>> It turns out that there are some strange boundary cases in geni where
>>> in some weird situations it will signal RX_LAST but then will put 0 in
>>> RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.
>> IMO that means we received a word in RX_FIFO and it is the last word
>> hence RX_LAST bit is set.
> What you say would make logical sense, but it's not how I have
> observed geni to work.  See below.
>
>
>> RX_LAST_BYTE is 0 means none of the bytes are valid in the last word.
> This would imply that qcom_geni_serial_handle_rx() is also broken
> though, wouldn't it?  Specifically imagine that WORD_CNT is 1 and
> RX_LAST is set and RX_LAST_BYTE_VALID is true.  Here's the logic from
> that function:
>
>    total_bytes = BYTES_PER_FIFO_WORD * (word_cnt - 1);
>    if (last_word_partial && last_word_byte_cnt)
>      total_bytes += last_word_byte_cnt;
>    else
>      total_bytes += BYTES_PER_FIFO_WORD;
>    port->handle_rx(uport, total_bytes, drop);
>
> As you can see that logic will set "total_bytes" to 4 in the case I'm
> talking about.

Yeah IMO as per theory this should also be corrected but since you have 
already pulled out few experiment to prove garbage data issue(which I  
was suspecting) is not seen.

It's already consistent with existing logic and it behaves well 
practically . So the changes could be merge. Meanwhile I am checking 
with HW team to get clarity.

>
>
>> In such scenario we should just read RX_FIFO buffer (to empty it),
>> discard the word and return NO_POLL_CHAR. Something like below.
>>
>> ---------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>>                   else
>>                           private_data->poll_cached_bytes_cnt = 4;
>>
>>                   private_data->poll_cached_bytes =
>>                           readl(uport->membase + SE_GENI_RX_FIFOn);
>>           }
>>
>> +        if (!private_data->poll_cached_bytes_cnt)
>> +              return NO_POLL_CHAR;
>>           private_data->poll_cached_bytes_cnt--;
>>           ret = private_data->poll_cached_bytes & 0xff;
>> -------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> Please let me know whether above code helps.
> Your code will avoid the hang.  Yes.  ...but it will drop bytes.  I
> devised a quick-n-dirty test.  Here's a test of your code:
I assumed those as invalid bytes and don't wanted to read them so yeah 
dropping of bytes was expected.
>
> https://crrev.com/c/2346886
>
> ...and here's a test of my code:
>
> https://crrev.com/c/2346884
>
> I had to keep a buffer around since it's hard to debug the serial
> driver.  In both cases I put "DOUG" into the buffer when I detect this
> case.  If my theory about how geni worked was wrong then we should
> expect to see some garbage in the buffer right after the DOUG, right?
> ...but my code gets the alphabet in nice sequence.  Your code drops 4
> bytes.
Yeah I was expecting garbage data.
>
>
> NOTE: while poking around with the above two test patches I found it
> was pretty easy to get geni to drop bytes / hit overflow cases and
> also to insert bogus 0 bytes in the stream (I believe these are
> related).  I was able to reproduce this:
> * With ${SUBJECT} patch in place.
> * With your proposed patch.
> * With the recent "geni" patches reverted (in other words back to 1
> byte per FIFO entry).
>
> It's not terribly surprising that we're overflowing since I believe
> kgdb isn't too keen to read characters at the same time it's writing.
> That doesn't explain the weird 0-bytes that geni seemed to be
> inserting, but at least it would explain the overflows.  However, even
> after I fixed this I _still_ was getting problems.  Specifically geni
> seemed to be hiding bytes from me until it was too late.  I put
> logging in and would see this:
>
> 1 word in FIFO - wxyz
> 1 word in FIFO (last set, last FIFO has 1 byte) - \n
> Check again, still 0 bytes in FIFO
> Suddenly 16 bytes are in FIFO and S_RX_FIFO_WR_ERR_EN is set.

RX data first stored in RX_ASYNC_FIFO then it's transfered to RX_FIFO

When get_char is called and we observe 0 bytes in RX_FIFO, most probably 
data is not transfered from RX_ASYNC_FIFO to RX_FIFO.

BITS 27:25 of SE_GENI_RX_FIFO_STATUS register shows RX_ASYNC_FIFO word 
count.


>
> I spent a whole bunch of time poking at this and couldn't find any
> sort of workaround.  Presumably geni is taking some time between me
> reading the last word out of the FIFO from the "previous" packet and
> then transitioning to the new packet.  I found a lot of references to
> this process in the hardware register description (see GENI_CFG_REG69,
> for instance), but I couldn't manage to make the kick to happen any
> faster.  Presumably this isn't a problem for things like Bluetooth
> since flow control saves them.  ...and I guess this isn't a problem in
> practice because we usually _send_ a lot of data to the host for
> console/kgdb and it's only the host => DUT path that has problems.
>
>
>> I am not sure about what all scenario can leads to this behavior from
>> hardware, I will try to get an answer from hardware team.
>>
>> Any error bit was set for SE_GENI_S_IRQ_STATUS & SE_GENI_M_IRQ_STATUS
>> registers?
> As per above I can see overflows in my test case and geni seems to be
> behaving pretty badly.  If you have ideas on how to fix this I'd love
> it.  However, it still seems like my patch is right because (at least
> in the cases I tested) it avoids dropping bytes in some cases.  It
> also matches how qcom_geni_serial_handle_rx() works and if that was
> broken we'd have noticed by now.

Reviewed-by: Akash Asthana <akashast@codeaurora.org>


>
>> I guess the hang was seen because *poll_cached_bytes_cnt* is unsigned
>> int and it's value was 0, when it's decremented by 1 it's value become
>> '4294967295' (very large) and dummy RX (0x00) would happen that
>>
>> many times before reading any actual RX transfers/bytes.
> Right.  That would be why it was hanging.
>
>
> -Doug

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

