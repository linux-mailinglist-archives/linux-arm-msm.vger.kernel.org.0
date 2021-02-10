Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7CC315F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 07:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhBJGXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 01:23:44 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:48215 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231690AbhBJGXf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 01:23:35 -0500
Received: from tarshish (unknown [10.0.8.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id C755744083D;
        Wed, 10 Feb 2021 08:10:22 +0200 (IST)
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <YCGCRQpqVNI2KZyi@builder.lan>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
In-reply-to: <YCGCRQpqVNI2KZyi@builder.lan>
Date:   Wed, 10 Feb 2021 08:10:22 +0200
Message-ID: <87sg64wj01.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Thanks for your review comments.

On Mon, Feb 08 2021, Bjorn Andersson wrote:
> On Mon 08 Feb 00:00 CST 2021, Baruch Siach wrote:
>> From: Balaji Prakash J <bjagadee@codeaurora.org>
>> 
>> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
>> to control the behavior of controller with respect to SOF and ITP.
>> The reset values of these registers are aligned for 19.2 MHz
>> reference clock source. This change will add option to override
>> these settings for reference clock other than 19.2 MHz
>> 
>> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
>> 
>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
>> [ baruch: mention tested hardware ]
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
>>  drivers/usb/dwc3/core.c                       | 52 +++++++++++++++++++
>>  drivers/usb/dwc3/core.h                       | 12 +++++
>>  3 files changed, 69 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 1aae2b6160c1..4ffa87b697dc 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -89,6 +89,11 @@ Optional properties:
>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>>  	register for post-silicon frame length adjustment when the
>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields of GFLADJ
>> +	register for reference clock other than 19.2 MHz is used.
>
> What are typical values for this property? What unit does it have? How
> does it actually relate to the frequency of the reference clock?

Downstream codeaurora kernel (fig branch) sets 0xA87F0 for IPQ6018
(24MHz reference clock), and 0x49459 for IPQ5018 (60MHz). So this value
appears to correlates with clock rate. I have no access to DWC3
documentation. I only tested IPQ6018 hardware.

>> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL. This field
>> +	indicates in terms of nano seconds the period of ref_clk. To calculate the
>> +	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
>
> Can't we make the dwc3 reference this clock and use clk_get_rate() and
> then do this math in the driver?

This is doable, I believe. Though current code does not identify
specific clocks, as far as I can see.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
