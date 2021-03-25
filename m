Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1345134884C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 06:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhCYFV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 01:21:29 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57550 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhCYFVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 01:21:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616649677; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WHPiw1feldgt4gfcCUTFJNoBPpp+MESLBL9s3gDzyOw=;
 b=emu4T4wr/fzEdAwWyzc0fRn/yF1SOdm+OgZ9PstRDEL0zWcVKGWqJT0zYc3NlsoTTlewUgDI
 R/5BDl2n3pxBpAMBh5OJgyp/UQwvFx6MxZgUoSSEPXuPPVHRe5ExbkUgj+GoI1u8ucCJwaYx
 G1KPzQtT/F2M9kUd+nnCFFDs74Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 605c1dbbc32ceb3a916dd6c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 05:20:59
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99879C433ED; Thu, 25 Mar 2021 05:20:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C02B9C433CA;
        Thu, 25 Mar 2021 05:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Mar 2021 10:50:57 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
In-Reply-To: <YFjVEjcx36J97hVW@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
 <YEvR1kDm32tE7mK3@google.com>
 <4dc784eb3c00a9805141148732476838@codeaurora.org>
 <YFjVEjcx36J97hVW@google.com>
Message-ID: <e8af9692a9a54e44ad687bb8984fad7a@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2021-03-22 23:04, Matthias Kaehlcke wrote:
> Hi Satya,
> 
> On Mon, Mar 22, 2021 at 06:50:47PM +0530, skakit@codeaurora.org wrote:
>> Hi Matthias,
>> 
>> On 2021-03-13 02:10, Matthias Kaehlcke wrote:
>> > Hi Satya,
>> >
>> > On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
>> > > Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
>> > > GPIOs, RTC and other PMIC infra modules for SC7280.
>> > >
>> > > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > > ---
>> > > This patch depends on base DT and board files for SC7280 to merge
>> > > first
>> > > https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
>> > >
>> > >  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>> > >  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>> > >  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104
>> > > ++++++++++++++++++++++++++++++++++
>> > >  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>> > >  5 files changed, 292 insertions(+)
>> > >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > >  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> > >  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> > >  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > new file mode 100644
>> > > index 0000000..393b256
>> > > --- /dev/null
>> > > +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > @@ -0,0 +1,60 @@
>> >
>> > ...
>> >
>> > > +		polling-delay-passive = <100>;
>> > > +		polling-delay = <0>;
>> >
>> > Are you sure that no polling delay is needed? How does the thermal
>> > framework
>> > detect that the temperatures is >= the passive trip point and that it
>> > should
>> > start polling at 'polling-delay-passive' rate?
>> >
>> 
>> As the temp-alarm has interrupt support, whenever preconfigured 
>> threshold
>> violates it notifies thermal framework, so I think the polling delay 
>> is not
>> needed here.
> 
> From the documentation I found it's not clear to me how exactly these
> interrupts work. Is a single interrupt triggered when the threshold is
> violated or are there periodic (?) interrupts as long as the 
> temperature
> is above the stage 0 threshold?
> 
> Why is 'polling-delay-passive' passive needed if there are interrupts? 
> Maybe
> to detect that the zone should transition from passive to no cooling 
> when the
> temperature drops below the stage 0 threshold?

The PMIC TEMP_ALARM peripheral maintains an internal over-temperature 
stage: 0, 1, 2, or 3.  Stage 0 is normal operation below the lowest 
(stage 1) threshold [usually 95 C].  When in stage 1, the temperature is 
between the stage 1 and 2 thresholds [stage 2 threshold is usually 115 
C].  Upon hitting the stage 3 threshold [usually 145 C], the PMIC 
hardware will automatically shut down the system.

The TEMP_ALARM IRQ fires on stage 0 -> 1 and 1 -> 0 transitions.  We 
therefore set polling-delay = <0> since there is no need for software to 
monitor the temperature periodically when operating in stage 0.  Upon 
crossing the stage 1 threshold, SW receives the IRQ and the thermal 
framework hits its first trip changing the thermal zone to passive mode. 
  This then engages the 100 ms polling enabled via polling-delay-passive 
= <100>.  If the temperate keeps climbing and passes the stage 2 
threshold, the thermal framework hits the second trip (which is 
critical) and it initiates an orderly shutdown.  If the temperature 
drops below the stage 1 threshold, then the thermal framework exits 
passive mode and stops polling.  This approach reduces/eliminates the 
software overhead when not at an elevated temperature.

Thanks,
Satya Priya
