Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DD535703E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353552AbhDGP3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:29:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57431 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353549AbhDGP3o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:29:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809374; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xPHNk0tSN6fBdYfDFq2flH2THH/Pg9Dmv893K4wcgpU=;
 b=SEGxU8nep9fV9dPTGPcqomm1NA49n19Cz82QH8DZ5HblDCbRw8TcMEX7HAGwB3iRmEMgL69a
 NJfj0An/B9uAPFqpWpEZ++7h94UZdXEbbO1PqYNUaur7AB2nHIAGFGMTho2nsz9Kh2gDdYet
 LtXL9bEXvv+xCkMpm2LM1OBzgwg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 606dcfd874f773a66458bef8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:29:28
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AFFDC43462; Wed,  7 Apr 2021 15:29:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3F10C433ED;
        Wed,  7 Apr 2021 15:29:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 20:59:26 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 1/5] arm64: dts: qcom: pm7325: Add PMIC peripherals for
 pm7325
In-Reply-To: <YGeAHKOq65WBr9Yr@google.com>
References: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
 <1617268396-1837-2-git-send-email-skakit@codeaurora.org>
 <YGdV+un4bGcF6jJH@google.com> <YGeAHKOq65WBr9Yr@google.com>
Message-ID: <6b85273758e5c667e1952b41fe901b8a@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-03 02:05, Matthias Kaehlcke wrote:
> On Fri, Apr 02, 2021 at 10:35:54AM -0700, Matthias Kaehlcke wrote:
>> On Thu, Apr 01, 2021 at 02:43:12PM +0530, satya priya wrote:
>> 
>> > subject: arm64: dts: qcom: pm7325: Add PMIC peripherals for pm7325
>> 
>> nit: maybe just 'arm64: dts: qcom: Add pm7325 support/.dtsi' or 
>> similar?
>> 
>> > Add temp-alarm and GPIO support for pm7325.
>> 
>> nit: it's more than that, you are adding the .dtsi for the PMIC 
>> itself.
>> 
>> > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > ---
>> >  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 53 insertions(+)
>> >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > new file mode 100644
>> > index 0000000..1e0848a
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
>> I saw the patches that add the compatible strings for the GPIOs, but
>> can't find those that add the strings for the PMICs themselves. Could
>> you provide a link if they have been sent already?
>> 
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
>> > +			reg = <0x8800>;
>> > +			gpio-controller;
>> > +			gpio-ranges = <&pm7325_gpios 0 0 10>;
> 
> The GPIO enumeration is a bit confusing. The pm7325 has GPIO_01 to
> GPIO_10, however IIUC they are mapped such that under Linux
> enumeration starts with 0. I guess it makes sense to start with 0 and
> it's done consistently for 'qcom,spmi-gpio', but it's something that 
> must
> be taken into account when using/configuring those GPIOs.

Sure, will take care of this while configuring the GPIOs.
