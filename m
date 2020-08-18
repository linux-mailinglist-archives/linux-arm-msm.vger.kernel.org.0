Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92375247F9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 09:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgHRHia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 03:38:30 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:53057 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726324AbgHRHi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 03:38:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597736309; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oBlBFLNCfpm1tApUYPpLjT+H0f58c4Dojdn1tDV42qA=;
 b=mqz5uoNXrOYoitDznXvHM8kLy1sgNAnuJ4d2QmBoLTLL/+Oaf5NHjkGyGbLSXbU1FmNdWZyD
 yCr3RI/kFzcEnPN3Oy9t49zAKNi/iPIu/UbVBm4rZArkQQDLkBRWFnxH5lZbnixE0toRvrfI
 S/hUOeYf3y9byZZStfpnmJ+FfOo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f3b8573ba4c2cd36742c78e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 07:38:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7369C433CB; Tue, 18 Aug 2020 07:38:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E2EBC433CB;
        Tue, 18 Aug 2020 07:38:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Aug 2020 13:08:26 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix the LLCC base register size
In-Reply-To: <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com>
References: <20200817040417.11111-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com>
Message-ID: <5c8b1664adceab8c600c80058e40cc97@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-08-18 02:42, Doug Anderson wrote:
> Hi,
> 
> On Sun, Aug 16, 2020 at 9:04 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> There is only one LLCC logical bank on SC7180 SoC of size
>> 0x50000(320KB) not 2MB, so correct the size and fix copy
>> paste mistake from SDM845 which had 4 logical banks.
> 
> I guess SDM845 not only has 4 banks but each bank is bigger?  At first
> I thought "yeah, 4 banks and 4 * 0x5 = 0x20" except that's not true in
> hex.  ;-)
> 

Hehe, no I didn't mean 0x5 * 4 = 0x20 because I mentioned 320KB and 2MB 
specifically
for the same reason in case people think that ;) I just meant that we 
are correcting
the copied size from SDM845, but I agree I need to make it clear in the 
commit msg
which warrants a V2.

> 
>> Fixes: 7cee5c742899 ("arm64: dts: qcom: sc7180: Fix node order")
>> Fixes: c831fa299996 ("arm64: dts: qcom: sc7180: Add Last level cache 
>> controller node")
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Without having any documentation ,this seems sane to me.  I guess it
> doesn't do a whole lot because the driver just reads one register from
> this whole space (at 0x0003000c bytes off).  So it's just a cleanup,
> or is it needed to actually fix something?
> 

No, it is not required to fix any functional problems but is correcting 
the
wrong size which I think qualifies for a fixes tag? I don't have a 
strong opinion
though, so I can remove the tag if you feel strongly about it.

> ...the fact that there's a status register in the middle of this seems
> strange, though.  Your commit message makes it sound as if this range
> is describing the size of the cache itself and then I would think that
> this was the address range where you could read from the cache memory
> directly, but that doesn't seem to mesh in my mind with there being a
> status register.  Hrm.  Am I just confused as usual?
> 

It's not describing the cache size, it is the LLCC(LLC Controller) 
register space.
But I believe that the confusion is because of my commit msg, so I will 
post a v2
clearing this with something like below (I have removed the confusing 4 
banks info
of SDM845).

"
There is one LLCC logical bank(LLCC0) on SC7180 SoC and the size of the 
LLCC0 base
is 0x50000(320KB) not 2MB, so correct the size and fix copy paste 
mistake
carried over from SDM845.
"

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
