Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE71357025
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhDGPYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:24:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16654 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235542AbhDGPYv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:24:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809082; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=psl1A1ZEsRP4pkzzImQ/0PBt/vIS3ULOg0voZ57vuNE=;
 b=nvc74S0geifNRPvTom5BGafed6qktDAXmM77kTZuZqXre+WHitBemsZfBDHKwNdL8o9NNUCI
 8yJksgay3p6hUKGV0WfAVUqZAa2E8B3+7L3+lTS9h8moPbzpRiTV2x80suwM9x6Mi5etiGOs
 GVZSelqL4sx1U1CcBo3tgYQGlRQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 606dceb78807bcde1df9c2e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:24:39
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8793C43463; Wed,  7 Apr 2021 15:24:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D307CC433ED;
        Wed,  7 Apr 2021 15:24:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 20:54:37 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 1/5] arm64: dts: qcom: pm7325: Add PMIC peripherals for
 pm7325
In-Reply-To: <YGdV+un4bGcF6jJH@google.com>
References: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
 <1617268396-1837-2-git-send-email-skakit@codeaurora.org>
 <YGdV+un4bGcF6jJH@google.com>
Message-ID: <10d26e4cc8888833298b0ebe7756e032@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2021-04-02 23:05, Matthias Kaehlcke wrote:
> On Thu, Apr 01, 2021 at 02:43:12PM +0530, satya priya wrote:
> 
>> subject: arm64: dts: qcom: pm7325: Add PMIC peripherals for pm7325
> 
> nit: maybe just 'arm64: dts: qcom: Add pm7325 support/.dtsi' or 
> similar?
> 
>> Add temp-alarm and GPIO support for pm7325.
> 
> nit: it's more than that, you are adding the .dtsi for the PMIC itself.
> 

Okay, will change the commit text.

>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 
>> ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> new file mode 100644
>> index 0000000..1e0848a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> @@ -0,0 +1,53 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus {
>> +	pm7325: pmic@1 {
>> +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
> 
> I saw the patches that add the compatible strings for the GPIOs, but
> can't find those that add the strings for the PMICs themselves. Could
> you provide a link if they have been sent already?
> 

They are not sent yet, qcom,spmi-pmic.txt file conversion to yaml [1] is 
currently on hold as all the child node bindings needs to be converted 
to yaml first. Once that is done we can add these strings.

[1] https://lore.kernel.org/patchwork/patch/1359552/

>> +		reg = <0x1 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pm7325_temp_alarm: temp-alarm@a00 {
>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pm7325_gpios: gpios@8800 {
>> +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pm7325_gpios 0 0 10>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> +&thermal_zones {
>> +	pm7325_thermal: pm7325-thermal {
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <0>;
>> +		thermal-sensors = <&pm7325_temp_alarm>;
>> +
>> +		trips {
>> +			pm7325_trip0: trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			pm7325_trip1: trip1 {
> 
> nit: the critical trip point is often named <name>-crit. One reason for
> this could be that it allows to add other non-critical trip points (in
> the .dtsi itself or the <board>.dts), without messing up the
> enumeration scheme.
> 

ok.

>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "critical";
>> +			};
>> +		};
>> +	};
>> +};
