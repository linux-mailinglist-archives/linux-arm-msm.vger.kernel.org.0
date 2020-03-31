Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA105198EF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 10:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbgCaI5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 04:57:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23741 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729425AbgCaI5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 04:57:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585645070; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8zUKrH2eIVqN6GKTdxqKOn/YdfA3gQCLto6btL9KOfk=; b=V5b62LzZ5XVIg5DAV4as6/ZEf7/aNurbrrtyNeGysyOX4ige1psD05QtUBUvt3aanzoL/oxR
 A27LTIkkj4YG90CcAtzNeNIG522L1IPB/szHXfm4hDYmhRuQ+jzoMzVnIdDM51cjUxEhb4OK
 OlYqEtOchYw1ciC5USAztaLxXxs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e83060d.7fe39cd5b960-smtp-out-n03;
 Tue, 31 Mar 2020 08:57:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8A0AC4478F; Tue, 31 Mar 2020 08:57:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.183.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16C5DC433F2;
        Tue, 31 Mar 2020 08:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16C5DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v14 6/6] soc: qcom: rpmh-rsc: Allow using free WAKE TCS
 for active request
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
 <1585244270-637-7-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=Vbo3JC6mBJXq+q+DQPC_bbNtn3bbScG5N8wzJZm87YuA@mail.gmail.com>
 <8d19958d-7334-ca4e-d7ba-f5919a56b279@codeaurora.org>
 <CAD=FV=UZTyfVN=a35hiXxdNSvdhfK60HewP_p_VvH1KdoUa1ww@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <65eb7236-0df0-8256-bfda-34d8d57b282d@codeaurora.org>
Date:   Tue, 31 Mar 2020 14:27:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UZTyfVN=a35hiXxdNSvdhfK60HewP_p_VvH1KdoUa1ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/28/2020 12:12 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, Mar 27, 2020 at 5:04 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> Why can't rpmh_write()
>>> / rpmh_write_async() / rpmh_write_batch() just always unconditionally
>>> mark the cache dirty?  Are there really lots of cases when those calls
>>> are made and they do nothing?
>> At rpmh.c, it doesn't know that rpmh-rsc.c worked on borrowed TCS to finish the request.
>>
>> We should not blindly mark caches dirty everytime.
> In message ID "5a5274ac-41f4-b06d-ff49-c00cef67aa7f@codeaurora.org"
> which seems to be missing from the archives, you said:
>
>> yes we should trust callers not to send duplicate data
> ...you can see some reference to it in my reply:
>
> https://lore.kernel.org/r/CAD=FV=VPSahhK71k_D+nfL1=5QE5sKMQT=6zzyEF7+JWMcTxsg@mail.gmail.com/
>
> If callers are trusted to never send duplicate data then ever call to
> rpmh_write() will make a change.  ...and thus the cache should always
> be marked dirty, no?  Also note that since rpmh_write() to "active"
> also counts as a write to "wake" even those will dirty the cache.
>
> Which case are you expecting a rpmh_write() call to not dirty the cache?
Ok, i will remove marking cache dirty here.
>
>
>>> ...interestingly after your patch I guess now I guess tcs_invalidate()
>>> no longer needs spinlocks since it's only ever called from PM code on
>>> the last CPU.  ...if you agree, I can always do it in my cleanup
>>> series.  See:
>>>
>>> https://lore.kernel.org/r/CAD=FV=Xp1o68HnC2-hMnffDDsi+jjgc9pNrdNuypjQZbS5K4nQ@mail.gmail.com
>>>
>>> -Doug
>> There are other RSCs which use same driver, so lets keep spinlock.
> It is really hard to try to write keeping in mind these "other RSCs"
> for which there is no code upstream.  IMO we should write the code
> keeping in mind what is supported upstream and then when those "other
> RSCs" get added we can evaluate their needs.

Agree but i would insist not remove locks in your cleanup/documentation 
series which are already there.

These will be again need to be added.

The locks don't cause any issue being there since only last cpu is 
invoking rpmh_flush() at present.

Adding support for other RSCs is in my to do list, and when that is 
being done we can re-evaluate and

remove if not required.

>
> Specifically when reasoning about rpmh.c and rpmh-rsc.c I can only
> look at the code that's there now and decide whether it is race free
> or there are races.  Back when I was analyzing the proposal to do
> rpmh_flush() all the time (not from PM code) it felt like there were a
> bunch of races, especially in the zero-active-TCS case.  Most of the
> races go away when you assume that rpmh_flush() is only ever called
> from the PM code when nobody could be in the middle of an active
> transfer.
>
> If we are ever planning to call rpmh_flush() from another place we
> need to re-look at all those races.
Sure. we can re-look all cases.
>
>
> -Doug
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
