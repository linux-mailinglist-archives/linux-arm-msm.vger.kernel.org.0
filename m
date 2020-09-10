Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379D3265458
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 23:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgIJVmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 17:42:46 -0400
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:60004
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730834AbgIJMuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 08:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599742198;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=s775L7iCYKpGMncC/fTv63fok23Pnh/vNT1134dXG/I=;
        b=Elr96xnzsEBEUVxFkM7+mD6XMQzh9xlVq4Brz8bIKJnMDvSi1h14zCUFkejWeOfW
        R5SACiNIuAObBH2Pb82/9UAy99TS7GDOfNucN4Z2Euqhv8MST+nzqQBcb1yZ5s9Cieu
        yzLU6A6PeyNu1POswfM/bDdYqidogQwTXneVxHkg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599742198;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=s775L7iCYKpGMncC/fTv63fok23Pnh/vNT1134dXG/I=;
        b=Wv3iIPZmLaD1mQJyPljMTQiUJ40ELe5fJ5rkE7TTk/pyGEVNsuHRr8997X2cDNW3
        VxFwSm8ikScENv1tYJJ/UnEWPM0hQKxyOcXAtARDo5ZF+H+hdqvKqSRm4Kxulje5q5w
        rxYqdhdLfUrgb/QP2LSW18r/xKRCcV+uXTapIEdE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Sep 2020 12:49:58 +0000
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
Subject: Re: [PATCH V4 2/4] arm64: dts: qcom: sc7180: Improve the pin config
 settings for CTS and TX
In-Reply-To: <CAD=FV=XZgmQXCzVx3CdeOkAWC6zz8bNW+f6Qt1=O9ZSaGUr75g@mail.gmail.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-3-git-send-email-skakit@codeaurora.org>
 <CAD=FV=XZgmQXCzVx3CdeOkAWC6zz8bNW+f6Qt1=O9ZSaGUr75g@mail.gmail.com>
Message-ID: <010101747810c24f-a169785b-0866-4932-a24e-80ff53393de2-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.10-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2020-09-10 02:58, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 3, 2020 at 8:07 AM satya priya <skakit@codeaurora.org> 
> wrote:
>> 
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -474,32 +474,30 @@
>>  &qup_uart3_default {
>>         pinconf-cts {
>>                 /*
>> -                * Configure a pull-down on 38 (CTS) to match the pull 
>> of
>> -                * the Bluetooth module.
>> +                * Configure no-pull on CTS. As this is driven by BT, 
>> do not
>> +                * specify any pull in order to not conflict with BT 
>> pulls.
>>                  */
>>                 pins = "gpio38";
>> -               bias-pull-down;
>> -               output-high;
> 
> Weird, how did that output-high sneak in there?  Glad it's going away.
> 
> 
>> +               bias-disable;
> 
> I'm not convinced that the removal of the pul is the correct thing
> here.  Specifically for the rx line the comment makes the argument
> that if we power off the Bluetooth module then it will stop driving
> this pin.  In that case if we remove the pull here then the line will
> be floating and that can cause some extra power consumption as the
> line floats between different logic levels.  Do you really need to
> remove this pull?
> 

Okay, will keep the pull-down back for CTS.

> Same comment for the next patch where you add the sleep settings.
> 
> 
> -Doug
