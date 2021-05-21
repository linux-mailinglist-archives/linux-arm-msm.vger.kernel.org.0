Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C4538C66F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbhEUMYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:24:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14384 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhEUMYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:24:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621599798; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RLZE+bZ7ki1GXmnh6NsT82bZ77r++gqhEjntmVGOlBs=;
 b=huNyHlHWe0x8+zfKwSniU/JLceb3keWjxepIAxbV8Jx6KE99jG5JvK76IZISDPc/uH99INeF
 8aH4w9/chb7RzMHduk9Ewvin84DXOBT+/hjGikFkuenAPVf4NU4K0kC5erZkgHzX+i4LngwF
 5+Eq8ntkiheHPc9y6QPRQX6dXms=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60a7a620f752fca668c21fe6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 12:22:56
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46DF6C43144; Fri, 21 May 2021 12:22:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03C83C4338A;
        Fri, 21 May 2021 12:22:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 17:52:54 +0530
From:   skakit@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 3/8] arm64: dts: qcom: pm7325: Add pm7325 base
 dts file
In-Reply-To: <YKYNrKFrGQlfUf4S@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-4-git-send-email-skakit@codeaurora.org>
 <YKOpE1V25rdDj4Tk@vkoul-mobl.Dlink> <YKPua2M6t9yIJ5uy@google.com>
 <52d277a8598277716f37ad0c1f724845@codeaurora.org>
 <YKYNrKFrGQlfUf4S@vkoul-mobl.Dlink>
Message-ID: <f6086a960c1aa1717125b2c7d7f1f7b3@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-20 12:50, Vinod Koul wrote:
> On 20-05-21, 12:02, skakit@codeaurora.org wrote:
>> On 2021-05-18 22:12, Matthias Kaehlcke wrote:
>> > On Tue, May 18, 2021 at 05:16:27PM +0530, Vinod Koul wrote:
>> > > On 18-05-21, 11:50, satya priya wrote:
>> > > > Add base DTS file for pm7325 along with GPIOs and temp-alarm nodes.
>> > > >
>> > > > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> > > > ---
>> > > > Changes in RESEND V4:
>> > > >  - No Changes.
>> > > >
>> > > >  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>> > > >  1 file changed, 53 insertions(+)
>> > > >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > >
>> > > > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > > new file mode 100644
>> > > > index 0000000..e7f64a9
>> > > > --- /dev/null
>> > > > +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
>> > > > @@ -0,0 +1,53 @@
>> > > > +// SPDX-License-Identifier: BSD-3-Clause
>> > > > +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> > > > +
>> > > > +#include <dt-bindings/interrupt-controller/irq.h>
>> > > > +#include <dt-bindings/spmi/spmi.h>
>> > > > +
>> > > > +&spmi_bus {
>> > > > +	pm7325: pmic@1 {
>> > > > +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
>> > >
>> > > where is qcom,pm7325 documented?
>> 
>> >
>> > good point, I missed that one.
>> >
>> 
>> Actually this point was discussed during V2(
>> https://lore.kernel.org/patchwork/patch/1406186/#1607321 ).
>> As far as I understand it is not mandatory to add "qcom,pm7325" as we 
>> are
>> adding "qcom,spmi-pmic". It is just a good to have change.
>> I could not find the documentation for pm8350c, pmk8350 and pmr735a as 
>> well.
> 
> Yes that is a miss too, IMO all of these should be added to
> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt or the yaml
> file replacing this
> 

Okay, will add those four pmics to qcom,spmi-pmic.txt.

> Thanks
