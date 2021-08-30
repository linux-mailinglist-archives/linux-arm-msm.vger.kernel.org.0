Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4393FB061
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 06:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhH3ETW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 00:19:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63540 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231561AbhH3ETV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 00:19:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630297108; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1o0FmZbIKug3vf0o+NtUykmzlIUNMLcvxSthEnoYj3U=; b=msWPxe2STeNz2Aoba7druc8GUf0Njs0cb+TypNfff4nR7xXbcLjqQjcI7kSvTgQ8zI229a1h
 Q8i8cmtycZLh4gA+QN16h2OBpWgEv49m+Wij3E/hWpg07ggICvmCGgkBt6rByexgZrzTKBnI
 Dt1R8j9KLZ6+uzTyOthpo0QwUSI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 612c5c13cd680e8969fc1e82 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 04:18:27
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51511C43635; Mon, 30 Aug 2021 04:18:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [124.123.190.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1289BC4338F;
        Mon, 30 Aug 2021 04:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1289BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: Regarding usb dwc3 core shutdown callback
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
References: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
 <87bl63yqq8.fsf@kernel.org>
 <eb975a76-1482-f502-4dc1-7993cc3f30d0@codeaurora.org>
 <87eeaga39m.fsf@kernel.org>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <7a6bf94b-91cd-15d5-dd9c-798e7a927727@codeaurora.org>
Date:   Mon, 30 Aug 2021 09:48:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87eeaga39m.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/26/2021 4:13 PM, Felipe Balbi wrote:
> Hi,
>
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>> (why isn't this email plain/text? Content Type was set to multipart
>>> alternative, please configure your email client correctly :-)
>>>
>>> While at that, also make sure to break lines at 80-columns)
>>>
>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>> Hi,
>>>>
>>>> Earlier I have posted the patch for usb dwc3 core shutdown callback
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/1618380209-20114-1-git-send-email-sanm@codeaurora.org/
>>>>
>>>> and it was reverted due to issues.
>>> Right, as should be expected when we find regressions
>>>
>>>> https://lore.kernel.org/linux-usb/20210603151742.298243-1-alexandru.elisei@arm.com/
>>>>
>>>> As we already have shutdown callback in xhci plat driver where we halt
>>>> the controller, so there will be no transactions with usb devices.
>>>>
>>>> https://lore.kernel.org/linux-usb/20200306092328.41253-1-ran.wang_1@nxp.com/
>>>>
>>>> So I think dwc3 core shutdown may not be required at least when we are
>>>> using host mode. Let me know your opinion about this.
>>> If that's the case, then sure. Please validate the condition, though,
>>> and kindly report back on your findings
>> I have enabled couple of logs in shutdown path and see no URBs
>> enqueued after xhci shut down.
>>
>> Hope this is enough for validation . Please suggest if anything more I
>> could do.
> how about writing a little script to kexec into another kernel for a few
> hundred iterations and make sure things still work after all that?

Currently kexec is not supported on qcom devices.  Anything we can do 
apart from kexec?


