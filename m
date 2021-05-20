Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92CD389DFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 08:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhETGdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 02:33:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28875 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhETGde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 02:33:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621492333; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RN9lgRAgMkbnuV8dyfImkunBot4H1ttLFkBzjmJVfK4=;
 b=bOVlWCP/4HgbJhd8n+ebtT820wsP7PqrWaIQ9AA34HAKxHr/IbC2KmIQ786saW9heVLFWLQd
 61P9385+epMUfm+aUGM0DNC3lfRHP6McKumUP9xq48q/0LZoQJorAK4eNkuJoueejHAxWekh
 HO5S6sFS0XPRzxWB5ZGUJszKle4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a602617b5af81b5ce0b7f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 06:32:01
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5134DC4338A; Thu, 20 May 2021 06:32:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 71E51C433F1;
        Thu, 20 May 2021 06:32:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 12:02:00 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 3/8] arm64: dts: qcom: pm7325: Add pm7325 base
 dts file
In-Reply-To: <YKPua2M6t9yIJ5uy@google.com>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-4-git-send-email-skakit@codeaurora.org>
 <YKOpE1V25rdDj4Tk@vkoul-mobl.Dlink> <YKPua2M6t9yIJ5uy@google.com>
Message-ID: <52d277a8598277716f37ad0c1f724845@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-18 22:12, Matthias Kaehlcke wrote:
> On Tue, May 18, 2021 at 05:16:27PM +0530, Vinod Koul wrote:
>> On 18-05-21, 11:50, satya priya wrote:
>> > Add base DTS file for pm7325 along with GPIOs and temp-alarm nodes.
>> >
>> > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> > ---
>> > Changes in RESEND V4:
>> >  - No Changes.
>> >
>> >  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 53 insertions(+)
>> >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > new file mode 100644
>> > index 0000000..e7f64a9
>> > --- /dev/null
>> > +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > @@ -0,0 +1,53 @@
>> > +// SPDX-License-Identifier: BSD-3-Clause
>> > +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> > +
>> > +#include <dt-bindings/interrupt-controller/irq.h>
>> > +#include <dt-bindings/spmi/spmi.h>
>> > +
>> > +&spmi_bus {
>> > +	pm7325: pmic@1 {
>> > +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
>> 
>> where is qcom,pm7325 documented?

> 
> good point, I missed that one.
> 

Actually this point was discussed during V2( 
https://lore.kernel.org/patchwork/patch/1406186/#1607321 ).
As far as I understand it is not mandatory to add "qcom,pm7325" as we 
are adding "qcom,spmi-pmic". It is just a good to have change.
I could not find the documentation for pm8350c, pmk8350 and pmr735a as 
well.

>> > +		reg = <0x1 SPMI_USID>;
>> > +		#address-cells = <1>;
>> > +		#size-cells = <0>;
>> > +
>> > +		pm7325_temp_alarm: temp-alarm@a00 {
>> > +			compatible = "qcom,spmi-temp-alarm";
>> > +			reg = <0xa00>;
>> > +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> > +			#thermal-sensor-cells = <0>;
>> > +		};
>> > +
>> > +		pm7325_gpios: gpios@8800 {
>> > +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
>> 
>> where is qcom,pm7325-gpio documented?
> 
> It's added by the 'Add GPIO support for PM7325' series
> (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=481133)
> 
> The binding change was acked by Rob and the code by Bjorn, so it can be
> expected to land, but it would still be good to mention the dependency
> explicitly.

The binding patch is applied now.

Thanks,
Satya Priya
