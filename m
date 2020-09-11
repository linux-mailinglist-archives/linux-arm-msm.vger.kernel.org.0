Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C69C265D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgIKKPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:15:18 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:34428
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725777AbgIKKPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599819304;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=BPc59itjdfn4S/LEEM1dF+y9OU9b/XO3tELMEjFALsA=;
        b=GuqzlQpc1x4AU2+Utk5eELnoKOSyjABJhiy3+hdzrmIDqsOjnFeCbJwQ3XBMW6re
        xthYq1V5zxQYf0AsiA1jCH/qMZ9c60qbFPT/0HekXqbOR6sXFRIPEXwjhGTc8V3pV+m
        lzJBNAuMF8qMCzAd/GoABqMEZPTELgnIJln4Vi+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599819304;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=BPc59itjdfn4S/LEEM1dF+y9OU9b/XO3tELMEjFALsA=;
        b=IATbn8RPJcUqqh8yja6mbIyfeetT6qIMtEOOHawpWnODKPLUZAFC6Auc4TOa53IS
        5BMsqiR89RnTJT2a6HPecNoWxchxNCUvElD5dQGxHs2UTCVp4E1oSv/qRRgH09B6Vdc
        EFsb3Q0Q/CkkdKQOQJh9YH8hamzax0lXrIrwWoqo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 10:15:04 +0000
From:   skakit@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
In-Reply-To: <CAD=FV=ULJqgHutr524wb-wVq4gejqo1p_zqRXP=h4Co6Gvmzew@mail.gmail.com>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
 <CAD=FV=ULJqgHutr524wb-wVq4gejqo1p_zqRXP=h4Co6Gvmzew@mail.gmail.com>
Message-ID: <010101747ca94cce-42d129fa-0374-4f12-aab8-2ccafd02b3c7-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-10 20:10, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 10, 2020 at 5:55 AM satya priya <skakit@codeaurora.org> 
> wrote:
>> 
>> Add a suitable sleep configuration for uart3 to support Bluetooth 
>> wakeup.
>> 
>> If QUP function is selected in sleep state, UART RTS/RFR is pulled 
>> high
>> during suspend and BT SoC not able to send wakeup bytes. So, configure
>> GPIO mode in sleep state to keep it low during suspend.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>  - This patch adds sleep state for BT UART. Newly added in V2.
>> 
>> Changes in V3:
>>  - Remove "output-high" for TX from both sleep and default states
>>    as it is not required. Configure pull-up for TX in sleep state.
>> 
>> Changes in V4:
>>  - As per Matthias's comment, removed drive-strength for sleep state
>>    and fixed nit-pick.
>> 
>> Changes in V5:
>>  - As per Matthias's comments, moved pinmux change for sleep state,
>>    pinctrl and interrupt config to the board specific file.
>> 
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 48 
>> +++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
> 
> Similar comment to patch #1 in that this applies only to the IDP board
> but that's not obvious from ${SUBJECT}
> 

Okay.

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 04888df..e529a41 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -344,6 +344,10 @@
>>  };
>> 
>>  &uart3 {
>> +       pinctrl-names = "default", "sleep";
>> +       pinctrl-1 = <&qup_uart3_sleep>;
>> +       interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
> 
> You need a:
> 
> /delete-property/interrupts;
> 
> ...or, alternatively, a patch before this one that converts all the
> UARTs in sc7180 to just use interrupts-extended.
> 

Sure, I will add this. But I think when both are added, 
"interrupts-extended" will get priority as per [1] and there wouldn't be 
any problem.

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

> 
>>         status = "okay";
> 
> Slight nit is that usually I see the status line first.  All the other
> instances in this file have it that way.  Can you match?
> 

Ok, will correct it.

> 
> 
> 
> -Doug
