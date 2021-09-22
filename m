Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20E641443F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 10:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhIVIzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 04:55:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54985 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbhIVIzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 04:55:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632300822; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=id+uOqWXqh1BzsspNKQReK/0+hKAUXpygQ1iBVBGuvw=; b=Pm1QvnFiXAXUmcVSpNqJHjrlEx+va/hToQTMmfRz8UedKvq+ofO4X9o8d21WOk5+oHahxxY5
 1xOQgWYYFC9nDFTfpGSQIPATcYul/YBG4kIbrLBjq9Oqw/EIBc3fDKP99OlMR8uBOnSy5df/
 PUEowwtO5uJQqurutqesY7XsDFs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 614aef08b585cc7d2461cdf1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 08:53:28
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03754C43617; Wed, 22 Sep 2021 08:53:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.6] (cpe-75-80-185-151.san.res.rr.com [75.80.185.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36681C43460;
        Wed, 22 Sep 2021 08:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 36681C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: dwc3-qcom: tx-fifo-resize regression on Poco F1 (sdm845) with
 v5.15-rc1
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>
References: <CAMi1Hd3k2snB4-=M57pVrMVom=a9_2a0DTFk-+Hzpubwk-Pr9Q@mail.gmail.com>
 <64a2a428-8bb1-0078-2403-1ca8e28cf4b1@codeaurora.org>
 <CAMi1Hd2MCxJgbHz9oGWe4L+MXNM3p+Xntpcg6t3TvZxwjJTy0Q@mail.gmail.com>
 <47a06078-dd41-7b3d-3de3-4e6c24211691@codeaurora.org>
 <CAMi1Hd1UtTECaDROGm7hE377Dp5qLzZeqBowmxoQJpOm9uQFHw@mail.gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <a126f6f3-1313-64f9-98bf-fcb7984220cd@codeaurora.org>
Date:   Wed, 22 Sep 2021 01:53:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd1UtTECaDROGm7hE377Dp5qLzZeqBowmxoQJpOm9uQFHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Amit,

On 9/21/2021 3:18 AM, Amit Pundir wrote:
> On Tue, 21 Sept 2021 at 13:00, Wesley Cheng <wcheng@codeaurora.org> wrote:
>>
>> Hi Amit,
>>
>> On 9/21/2021 12:04 AM, Amit Pundir wrote:
>>> Hi Wesley,
>>>
>>> On Tue, 21 Sept 2021 at 02:44, Wesley Cheng <wcheng@codeaurora.org> wrote:
>>>>
>>>> Hi Amit,
>>>>
>>>> On 9/20/2021 1:45 PM, Amit Pundir wrote:
>>>>> Hi Wesley, All,
>>>>>
>>>>> I see a reboot loop on Xiaomi Pocophone F1 (sdm845) with TX FIFO
>>>>> resize patches which landed in v5.15-rc1. Upstream commit cefdd52fa045
>>>>> "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default" to
>>>>> be specific, which switched on this feature by default.
>>>>>
>>>>> At times the phone crashes into the fastboot mode after the reboot
>>>>> loop, but mostly end up booting to UI after a while. This is what it
>>>>> looks like https://people.linaro.org/~amit.pundir/beryllium-userdebug/PXL_20210920_162749483.mp4.
>>>>>
>>>>
>>>> I believe Android will attempt a number of bootup sequences and if it
>>>> fails, it falls back to fastboot mode.  Are there any available logs you
>>>> might be able to collect to see where the issue is?
>>>
>>> It is a stock phone with no UART access, so I can't get early crash
>>> logs unless I'm booted up to adb shell. I can try getting some info
>>> using pstore-ramoops but warm reset support for sdm845 was not
>>> upstreamed when I tried using that the last time.
>>>
>>
>> I see, can we maybe avoid the actual resizing by commenting out the
>> following writel() calls, but let the fifo resize logic calculate the EPs?
>>
>> void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>> {
>> ...
>>                 /* Don't change TXFRAMNUM on usb31 version */
>>                 size = DWC3_IP_IS(DWC3) ? 0 :
>>                         dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
>>                                    DWC31_GTXFIFOSIZ_TXFRAMNUM;
>>                 /* Comment the dwc3_writel() */
>>                 //dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
>>
>> and
>>
>> static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>> {
>> ...
>>         /* Comment the dwc3_writel() */
>>         //dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
>>         dwc->num_ep_resized++;
>>
>> Those 2 writel() would be the one that actually programs the TXFIFO
>> register.  I hope when commented out, no resize should actually happen
>> anymore.
>>
>> With this, hopefully we can get some logs from the device at least :)
> 
> I can boot fine with above 2 writel() removed but I don't see EP
> counts being printed in the log anywhere and the only relevant
> message in dmesg I see is this:
> 
>     Duplicate name in dwc3@a600000, renamed to "tx-fifo-resize#1"
> 
> which is interesting because I don't see tx-fifo-resize property being
> set by any of the upstream sdm845 or relevant dtsi files.
> 
> 
Thanks for testing.  What is the current composition the device is
exposing to the host?

Can we get a ftrace log w/ the DWC3 events enabled, as well as the
kernel log? (if not at boot up then maybe a plug in/out)  This will at
least help us identify when the DWC3 ep enable is being called (which
triggers the resize routine)

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
