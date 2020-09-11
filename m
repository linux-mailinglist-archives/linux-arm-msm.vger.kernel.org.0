Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71164265D91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgIKKPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:15:32 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:34428
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbgIKKPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599819320;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=O6bC8bhUhqdxl1zTKzRMTL7CbV2UQz0pgM9sKc7A8p0=;
        b=Ir/B6+e25Cvr0NEjr0L3kDmCtFqKQ5poswFX45d3p8G4+tpNdkC8e4gEO4snPr9M
        jV/OkCqIUKAW8A9ljV0xczkAXM+A+OVlhU2ISjeq4L5Yx4bjngDo72bKSWiBUzsZ9aq
        G5GkcnE3Gd3rln6yInvMpBXRInS5dnDdIIXIsfnM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599819320;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=O6bC8bhUhqdxl1zTKzRMTL7CbV2UQz0pgM9sKc7A8p0=;
        b=Sv7+iSRxNOYnV28ECHAarsOJhbRSx9hL5r6Hy8Rm7lFUFYm7AjaC6r/uYcn8C7Xp
        6geqStHpu3uPBdVo8/KRn0s+aUNSfkulaCbw26O06hPQDko3xk/1dWWHzKvgIEfX4RU
        ZoKQYQ4xNKk4dVNtSPHwhlCiNCrBJ4TIYRU2ddjA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 10:15:20 +0000
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
Subject: Re: [PATCH V5 3/4] arm64: dts: qcom: sc7180-trogdor: Add pinctrl and
 interrupt config for BT UART
In-Reply-To: <CAD=FV=Wxo6ggLN39UMtMNwd6GOQwnEjA1MCxHjB6cmE9RTRMPA@mail.gmail.com>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-4-git-send-email-skakit@codeaurora.org>
 <CAD=FV=Wxo6ggLN39UMtMNwd6GOQwnEjA1MCxHjB6cmE9RTRMPA@mail.gmail.com>
Message-ID: <010101747ca98b3d-4779e154-4358-4b4f-8fe7-1f1840dbd72a-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-10 20:12, Doug Anderson wrote:
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
>> ---
>> Changes in V5:
>>  - Newly added in V5. This patch adds wakeup support for trogdor board 
>> files.
>> 
>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 48 
>> ++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
> 
> Note: I can't find this email on any of the mailing lists.  Can you
> check your config?  I tried:
> 
> http://lore.kernel.org/r/1599742438-16811-4-git-send-email-skakit@codeaurora.org
> 
> ...and also checked patchwork servers.  I only see patch 1 and 2.  I
> think Bjorn usually applies from patchwork so this'll likely be a
> problem...
> 

I guess it is updated, now it is showing all the 4 patches
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=346637

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index a6b9beb..96b5331 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -792,6 +792,11 @@ ap_spi_fp: &spi10 {
>>  #include <arm/cros-ec-sbs.dtsi>
>> 
>>  &uart3 {
>> +       pinctrl-names = "default", "sleep";
>> +       pinctrl-1 = <&qup_uart3_sleep>;
>> +       interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
>> +
>>         status = "okay";
> 
> Same comments here as for patch #2.
> 

Ok.

> 
>>         bluetooth: bluetooth {
>> @@ -1345,4 +1350,47 @@ ap_spi_fp: &spi10 {
>>                         drive-strength = <2>;
>>                 };
>>         };
>> +
>> +       qup_uart3_sleep: qup-uart3-sleep {
> 
> I believe things in this section are supposed to be sorted
> alphabetically.  Thus "qup..." should be sorted before "trackpad..."

Ok.
