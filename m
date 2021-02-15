Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09A331BFFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 18:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhBORA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 12:00:28 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:20056 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231776AbhBOQ7o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:59:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613408349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6/7x/zTiP849A84Hz7Ue0M0/fXbMktUF0+XXQ6/mdCU=;
 b=Zv9mR7f16HS9nTHjDsCTM5LeFYU0N0K7YZqnGepVU94VlbR/EdZtL2f71XOyeHeL3rHjVSXi
 9fMOWSrbeYioSr2vOvzkVKds6EMwhZWfNmhvwr5H8EFhUGG0BGlTquedxn0jRyoZv4ONEat0
 rBAKz0BnhBbKGBAvJ+QRz81OxV0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602aa83f8e43a988b7ba360f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Feb 2021 16:58:39
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40005C433CA; Mon, 15 Feb 2021 16:58:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34185C433C6;
        Mon, 15 Feb 2021 16:58:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Feb 2021 22:28:38 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
In-Reply-To: <87sg64wj01.fsf@tarshish>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <YCGCRQpqVNI2KZyi@builder.lan> <87sg64wj01.fsf@tarshish>
Message-ID: <e1a05b5c6bf70e62b526a7a7d70b1a12@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-10 11:40, Baruch Siach wrote:
> Hi Bjorn,
> 
> Thanks for your review comments.
> 
> On Mon, Feb 08 2021, Bjorn Andersson wrote:
>> On Mon 08 Feb 00:00 CST 2021, Baruch Siach wrote:
>>> From: Balaji Prakash J <bjagadee@codeaurora.org>
>>> 
>>> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
>>> to control the behavior of controller with respect to SOF and ITP.
>>> The reset values of these registers are aligned for 19.2 MHz
>>> reference clock source. This change will add option to override
>>> these settings for reference clock other than 19.2 MHz
>>> 
>>> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
>>> 
>>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
>>> [ baruch: mention tested hardware ]
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
>>>  drivers/usb/dwc3/core.c                       | 52 
>>> +++++++++++++++++++
>>>  drivers/usb/dwc3/core.h                       | 12 +++++
>>>  3 files changed, 69 insertions(+)
>>> 
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt 
>>> b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> index 1aae2b6160c1..4ffa87b697dc 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -89,6 +89,11 @@ Optional properties:
>>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field 
>>> of GFLADJ
>>>  	register for post-silicon frame length adjustment when the
>>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>>> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields 
>>> of GFLADJ
>>> +	register for reference clock other than 19.2 MHz is used.
>> 
>> What are typical values for this property? What unit does it have? How
>> does it actually relate to the frequency of the reference clock?
> 
> Downstream codeaurora kernel (fig branch) sets 0xA87F0 for IPQ6018
> (24MHz reference clock), and 0x49459 for IPQ5018 (60MHz). So this value
> appears to correlates with clock rate. I have no access to DWC3
> documentation. I only tested IPQ6018 hardware.
> 

It will be written as (0xA87F0 << 7) retaining the 0-7 LSB value.
I could see, BIT(23) of GFLADJ register enables the functionality of
running SOF/ITP counters based on the reference clock. Since this bit is 
set, we need to
compute the other fields as well i.e., from 8th bit to 31st bit. Finally 
it is derived to
0xA87F0 for IPQ6018.


>>> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL. 
>>> This field
>>> +	indicates in terms of nano seconds the period of ref_clk. To 
>>> calculate the
>>> +	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
>> 
>> Can't we make the dwc3 reference this clock and use clk_get_rate() and
>> then do this math in the driver?
> 
> This is doable, I believe. Though current code does not identify
> specific clocks, as far as I can see.
> 
> baruch

We can mention one more clock(ref) in the USB device node and do the 
math (NSEC_PER_SEC / clk_get_rate()) in dwc3 driver.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
