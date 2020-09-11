Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F627265D94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgIKKPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:15:45 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:46438
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725778AbgIKKPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599819340;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Y7RKLOxS3+KoDrWgfJYThTKOx2dY1mfwjrzru2TOvXY=;
        b=bWmzYG2zLD5ReV8tyVFqA51xo83YNvNe5RzovufmhQ5DUREs2g6GXlcxBUqhGruy
        FxPxQH8VZDZWrSA+vuPvytcEDOig+KjuJcJ/l/zfqNJBfKGfR7fbNcWS0N0Axtx+D92
        T9qs5lzfIbaphQ6Apm88T0Fu7iIsXrIaik7niyiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599819340;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Y7RKLOxS3+KoDrWgfJYThTKOx2dY1mfwjrzru2TOvXY=;
        b=kI91WRitHiY+u1s2zD2UW/tZZNkxj5Ol2yeDhaWCzkeFXOzsK6hMAUZyru1UmiJW
        dvn0zS5DYX8Bug1NkdUHSzIX+2ZNswquj0bsbD1uPU7x2kBdz3z9IbwyGadDpUC/pUD
        bl/BPlW3K8ccy1i7RTC4lr9RiK+bmX42UvKjjArk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 10:15:40 +0000
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
In-Reply-To: <20200910153536.lcifa6ljy7hwgptn@debian>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
 <20200910153536.lcifa6ljy7hwgptn@debian>
Message-ID: <010101747ca9db5e-dbe9f5b8-f9fd-4d1c-8040-ecd88c824da7-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2020-09-10 21:05, Matthias Kaehlcke wrote:
> El Thu, Sep 10, 2020 at 06:23:56PM +0530 satya priya ha dit:
> 
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
> 
> Was this change really reviewed (privately) by Akash or are you still
> carrying forward this tag from v2? The configuration and the comments
> have change substantially since v2, IMO you should drop the tag unless
> Akash really reviewed the current version or something close to it.
> 

Okay, will drop the tag.

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
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 04888df..e529a41 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -344,6 +344,10 @@
>>  };
>> 
>>  &uart3 {
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart3_sleep>;
>> +	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +				<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
> 
> As Doug already said, you need to delete the 'interrupts' property now
> that we have 'interrupts-extended'.

okay.

Thanks,
Satya Priya
