Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA75264727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 15:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgIJNla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 09:41:30 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:60452
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730921AbgIJNgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 09:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599742237;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=A9Lh+vWkVNILygqWZqjls4YC1TZDnQLkSvqL2XZ3eIY=;
        b=NxfYxLCx5rlXYYDTuelbyMbjN32D2KSdTUxQIaitStu/OcDhhTxt/k7a9bInokxb
        uH059kXmlQ8+vw8HB/aAWx/xHGdk1dOq3a9kO/LUw0Fio1z6JGWpjP1SfAg6Tq7zwLA
        OqySPARGPcA5wO4eciHZAgAsjbsmOGOZY77+OWMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599742237;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=A9Lh+vWkVNILygqWZqjls4YC1TZDnQLkSvqL2XZ3eIY=;
        b=UuYYvFIzIIrkH4W7FFzYBwgGZdTyMev1iIAKnKd2rW1t9IfsVCf9gdEPUKQvP4th
        2RZ6X8kf3kZx+lsieWBY3qoHDy5LgQK0fdruwR8CRSVTuUjoMIXNFAmGSixWJVAUUWT
        C5le0DXzBGAr8bN3rCn/b1n/ttvmL6+2q52GAt3g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Sep 2020 12:50:36 +0000
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
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: sc7180: Add sleep state for BT
 UART
In-Reply-To: <CAD=FV=VyRU3+BLx_6YPrOsaA6E05cJn_OpBR1y3Dt0LA0X5REA@mail.gmail.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
 <CAD=FV=VyRU3+BLx_6YPrOsaA6E05cJn_OpBR1y3Dt0LA0X5REA@mail.gmail.com>
Message-ID: <010101747811583e-172b27b5-ea28-4660-a64b-407b13bb6fd1-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.10-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-10 02:59, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 3, 2020 at 8:08 AM satya priya <skakit@codeaurora.org> 
> wrote:
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index cecac3e..77e3523 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -507,6 +507,43 @@
>>         };
>>  };
>> 
>> +&qup_uart3_sleep {
>> +       pinconf-cts {
>> +               /*
>> +                * Configure no-pull on CTS. As this is driven by BT, 
>> do not
>> +                * specify any pull in order to not conflict with BT 
>> pulls.
>> +                */
>> +               pins = "gpio38";
>> +               bias-disable;
> 
> Same comment as in the previous patch that I'm not convinced removing
> the bias here is correct.
> 

Okay.

> 
>> +       };
>> +
>> +       pinconf-rts {
>> +               /*
>> +                * Configure pull-down on RTS to make sure that the BT 
>> SoC can
>> +                * wake up the system by sending wakeup bytes during 
>> suspend.
>> +                */
>> +               pins = "gpio39";
>> +               bias-pull-down;
>> +       };
>> +
>> +       pinconf-tx {
>> +               /* Configure pull-up on TX when it isn't actively 
>> driven */
>> +               pins = "gpio40";
>> +               bias-pull-up;
>> +       };
>> +
>> +       pinconf-rx {
>> +               /*
>> +                * Configure a pull-up on RX. This is needed to avoid
>> +                * garbage data when the TX pin of the Bluetooth 
>> module is
>> +                * in tri-state (module powered off or not driving the
>> +                * signal yet).
>> +                */
>> +               pins = "gpio41";
>> +               bias-pull-up;
>> +       };
>> +};
>> +
>>  &qup_uart8_default {
> 
> Slight nit that "default" starts with a "d" which sorts before "sleep"
> which starts with an "s".  Thus "qup_uart8_default" should be above
> "qup_uart3_sleep", not below.

Okay.
