Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EC4265D99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgIKKQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:16:06 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:46438
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725778AbgIKKQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599819364;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=CUjbIXOPCQTv92I5cHDEF+MyspFa8IsVdUzRKJRQ0X0=;
        b=PKJRRFtCVn/wAHc8/NZ/NMvw4vN6Vf8bESEFSOwEDN4iUScmiMw0TX7aqRyCGPfL
        qnrUyUeom180qQPwXGWhT9O1nGp/tWmQgEh9yd1iDrWKoHZuEZnRNr+wCJ47MRl1zJr
        FCR0yIr8BobzBjF7mYMefzw2K9AJNYbjfsy8cy/o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599819364;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=CUjbIXOPCQTv92I5cHDEF+MyspFa8IsVdUzRKJRQ0X0=;
        b=E28ooXhWN4zjNbefZ1/Ahy3Um1KV/+Gb03Iumq7e2Kt20WfWxdnq0BX+mwch3DqW
        wsQfrF7jlXVHNIximnKwviKFFLAIn2cx6lO2v9TPKIxwRNX7U+u2zccj9wODXd6okTe
        PIygBP82/hANfPQxXpI6s5I6GwPb93XqSCz+BL2c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 10:16:04 +0000
From:   skakit@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
In-Reply-To: <20200910234544.GC472@uller>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
 <20200910234544.GC472@uller>
Message-ID: <010101747caa38c1-6a4c0170-83ec-41d1-8050-b1d5b70469b9-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Thanks for reviewing the patches.

On 2020-09-11 05:15, Bjorn Andersson wrote:
> On Thu 10 Sep 12:53 UTC 2020, satya priya wrote:
> 
>> Add a suitable sleep configuration for uart3 to support Bluetooth 
>> wakeup.
>> 
>> If QUP function is selected in sleep state, UART RTS/RFR is pulled 
>> high
>> during suspend and BT SoC not able to send wakeup bytes. So, configure
>> GPIO mode in sleep state to keep it low during suspend.
>> 
> 
> But patch 4 says that you change this behavior, is that patch really
> needed if we switch the pins to GPIO, or if this patch really needed if
> we merge patch 4?
> 
> Could it be that in lower power states we drop the power to the uart
> block and rely on the PDC to wait for the BT chip to start sending the
> wakeup bytes on the rx pin?
> 

As discussed on V4 patch 
https://patchwork.kernel.org/patch/11753971/#23602723
The patch 4 is good to have, to make sure the UART_MANUAL_RFR is in 
ready state to receive the wakeup bytes.

> 
> This commit will become the reference for all other platforms where we
> enable the same functionality, so better document it properly.
> 

Okay.

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
>>  	status = "okay";
>> 
>>  	bluetooth: wcn3990-bt {
>> @@ -545,3 +549,47 @@
>>  	};
>>  };
>> 
>> +&tlmm {
>> +	qup_uart3_sleep: qup-uart3-sleep {
>> +		pinmux {
>> +			pins = "gpio38", "gpio39",
>> +			       "gpio40", "gpio41";
>> +			function = "gpio";
>> +		};
>> +
>> +		pinconf-cts {
>> +			/*
>> +			 * Configure a pull-down on CTS to match the pull of
>> +			 * the Bluetooth module.
>> +			 */
>> +			pins = "gpio38";
>> +			bias-pull-down;
>> +		};
>> +
>> +		pinconf-rts {
>> +			/*
>> +			 * Configure pull-down on RTS to make sure that the BT SoC can
>> +			 * wake up the system by sending wakeup bytes during suspend.
> 
> So "request to send" is active low and pulling it low will indicate to
> the BT chip that it's allowed to wake us up by pulling rx low?
> 
> I would like this comment to really describe what's actually going on.
> 

Ok, will modify the rationale.

>> +			 */
>> +			 pins = "gpio39";
>> +			 bias-pull-down;
>> +		};
>> +
>> +		pinconf-tx {
>> +			/* Configure pull-up on TX when it isn't actively driven */
> 
> Sure, but why? Wouldn't that be to prevent the BT chip from receiving
> garbage while the SoC is asleep?
> 

yes, this is to prevent the BT chip from receiving garbage, will mention 
the same.

>> +			pins = "gpio40";
>> +			bias-pull-up;
>> +		};
>> +
>> +		pinconf-rx {
>> +			/*
>> +			 * Configure a pull-up on RX. This is needed to avoid
>> +			 * garbage data when the TX pin of the Bluetooth module is
>> +			 * in tri-state (module powered off or not driving the
>> +			 * signal yet).
>> +			 */
> 
> It's nice to avoid "garbage data", but isn't the real reason that the
> floating pin on the other side would cause spurious wakeups?
> 

yes, we need pull-up on RX to prevent spurious wakeups, will modify this 
comment to mention it.

> Regards,
> Bjorn
> 
>> +			pins = "gpio41";
>> +			bias-pull-up;
>> +		};
>> +	};
>> +};
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Thanks,
Satya Priya
