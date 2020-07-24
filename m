Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0F522BCA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 05:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXD4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 23:56:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46748 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726493AbgGXD4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 23:56:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595563005; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jKEWa5p6iwN7F8E6ld+cf+QtH5BZYYsHm6Lj0pjjaxU=;
 b=IK+v2i8W4G+lLUbcPTHHagpHlflQzkelMBUTHJ+BVyTfamcB8aAQyq33zNweYLlhqrfJ6Y4z
 lVhl2H4I/fskN8FRo2XZZMSCvu7AKneMjUYOzIj3Wmgj2eJrK9MtGL3/rBwOuPKoYMMFq9VK
 9/TxiUcOT4QtZJpqiS87vEBLnIQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f1a5bed0cb8533c3b758614 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 03:56:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC532C43395; Fri, 24 Jul 2020 03:56:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4BB7DC433C9;
        Fri, 24 Jul 2020 03:56:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Jul 2020 09:26:28 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org
Subject: Re: [PATCH] arm64: dts: sc7180: Add wakeup support over UART RX
In-Reply-To: <20200427165616.GF4525@google.com>
References: <1587968844-26667-1-git-send-email-skakit@codeaurora.org>
 <20200427165616.GF4525@google.com>
Message-ID: <a2f118592a9039ee63098651f5e5c6f6@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2020-04-27 22:26, Matthias Kaehlcke wrote:
> Hi,
> 
> On Mon, Apr 27, 2020 at 11:57:24AM +0530, satya priya wrote:
>> Add the necessary pinctrl and interrupts to make UART
>> wakeup capable.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 4216b57..3a49603 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -637,9 +637,12 @@
>>  				reg = <0 0x0088c000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart3_default>;
>> -				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart3_default>;
> 
> Why is the 'sleep' configuration needed if it's the same as 'default'?

Sleep configuration is needed to make sure correct pinctrl setting is 
done for RX.
When we register wakeup interrupt, function select is changed to 0 or 
GPIO, and after that when state on is called, down the line it is 
checking the current state, if it's same as previous state(default), it 
won't do any thing and returns 0. Thus the pinctrl setting for RX 
remains with "GPIO" function select causing transfer failures.

int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
{
         if (p->state == state)
                 return 0;

         return pinctrl_commit_state(p, state);
}
EXPORT_SYMBOL_GPL(pinctrl_select_state);

However, in V2 we have added sleep state separately to make wakeup 
feature work properly.

> 
>> +				interrupts-extended =
>> +					<&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +					<&tlmm 41 0>;
>>  				status = "disabled";
>>  			};
> 
> This patch only adds wakeup support for uart3, which seems an arbitrary
> choice at SoC level. Either it should do it for all UARTs of the 
> SC7180,
> or in the .dtsi of devices that use UART3 and need it to be wakeup 
> capable.

Ok. Added wakeup support to all the UARTs of SC7180 in V2.

Thanks,
Satya Priya
