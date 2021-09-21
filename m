Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC224412F7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 09:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhIUHcX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 03:32:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29807 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230294AbhIUHcW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 03:32:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632209454; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OFZWp+6f6TpmtHBWFeHMQYaxckaDcifPYI6YFQ7nMQY=; b=NxJU86dz34oJBmwqg1nHwtAXcrDUqISM3CQfRTNwa+jR4gmqTbC/aOcb/yNxAMcOpx8yKqzb
 faFY9t4fq7DLYR0tkbDY6CfYuiI78y2ORw5JR5nKY/OMhZLzq9SRNU+hQfc0ihzPLx3EUS1L
 NqukEZj/sm4ehqPzXuCQm2hTlKQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61498a2e648642cc1c243aee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 07:30:54
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE109C43460; Tue, 21 Sep 2021 07:30:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.6] (cpe-75-80-185-151.san.res.rr.com [75.80.185.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 616FDC4338F;
        Tue, 21 Sep 2021 07:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 616FDC4338F
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
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <47a06078-dd41-7b3d-3de3-4e6c24211691@codeaurora.org>
Date:   Tue, 21 Sep 2021 00:30:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd2MCxJgbHz9oGWe4L+MXNM3p+Xntpcg6t3TvZxwjJTy0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Amit,

On 9/21/2021 12:04 AM, Amit Pundir wrote:
> Hi Wesley,
> 
> On Tue, 21 Sept 2021 at 02:44, Wesley Cheng <wcheng@codeaurora.org> wrote:
>>
>> Hi Amit,
>>
>> On 9/20/2021 1:45 PM, Amit Pundir wrote:
>>> Hi Wesley, All,
>>>
>>> I see a reboot loop on Xiaomi Pocophone F1 (sdm845) with TX FIFO
>>> resize patches which landed in v5.15-rc1. Upstream commit cefdd52fa045
>>> "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default" to
>>> be specific, which switched on this feature by default.
>>>
>>> At times the phone crashes into the fastboot mode after the reboot
>>> loop, but mostly end up booting to UI after a while. This is what it
>>> looks like https://people.linaro.org/~amit.pundir/beryllium-userdebug/PXL_20210920_162749483.mp4.
>>>
>>
>> I believe Android will attempt a number of bootup sequences and if it
>> fails, it falls back to fastboot mode.  Are there any available logs you
>> might be able to collect to see where the issue is?
> 
> It is a stock phone with no UART access, so I can't get early crash
> logs unless I'm booted up to adb shell. I can try getting some info
> using pstore-ramoops but warm reset support for sdm845 was not
> upstreamed when I tried using that the last time.
> 

I see, can we maybe avoid the actual resizing by commenting out the
following writel() calls, but let the fifo resize logic calculate the EPs?

void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
{
...
		/* Don't change TXFRAMNUM on usb31 version */
		size = DWC3_IP_IS(DWC3) ? 0 :
			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
				   DWC31_GTXFIFOSIZ_TXFRAMNUM;
		/* Comment the dwc3_writel() */
		//dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);

and

static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
{
...
	/* Comment the dwc3_writel() */
	//dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
	dwc->num_ep_resized++;

Those 2 writel() would be the one that actually programs the TXFIFO
register.  I hope when commented out, no resize should actually happen
anymore.

With this, hopefully we can get some logs from the device at least :)

>>
>>> PocoF1 does support TX fifo resizing as I can see that in the
>>> downstream dts. So maybe it is the tx-fifo-max-num which need to be
>>> adjusted for the device? I couldn't find the tx-fifo-max-num
>>> equivalent in the downstream tree though
>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/dipper-q-oss/
>>>
>>
>> I assume that you've already confirmed reverting that change resolves
>> the constant reboots?
> 
> Yes reverting that change resolves the reboot loop issue. Speaking of
> which, since no other platform seem to be running into this issue and
> "tx-fifo-max-num" property is apparently not at fault either, is it
> reasonable to skip adding "tx-fifo-resize" property for PocoF1 using
> of_machine_is_compatible("xiaomi,beryllium") as a workaround?
> 

Since SDM845 does technically support txfifo resize downstream, let me
see if I can figure out what is different on this particular device
after getting the logs.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
