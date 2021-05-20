Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B001C389DD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 08:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhETG0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 02:26:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33857 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhETG0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 02:26:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621491926; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZvljEfjgHImzFCUS9ix2qhLabTsKyDhyS23O+8X/0vI=;
 b=dQDsydIafsvnb2cJPnV8dUZkWlBolC8IEG0uFYSf7pxHqqC3eS+lPTYRoGCca1p0emNBmR8t
 LqaN3BOhfgLDAQe4yPNATHq6/ZN68YZYZ8jma242GYcYFLV1ihmw+nEPykKN+lWQtIB5Oi9e
 W6nb1UZkX4nWBewaJVhlXMHaVGw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60a600cd0d60c09896d70e6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 06:25:17
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3212C43144; Thu, 20 May 2021 06:25:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8FCBC433F1;
        Thu, 20 May 2021 06:25:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 11:55:15 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 2/8] arm64: dts: qcom: sc7280: Add thermal-zones
 node
In-Reply-To: <YKPq84r7soE0yjMA@google.com>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-3-git-send-email-skakit@codeaurora.org>
 <YKOog43JZghth3Np@vkoul-mobl.Dlink> <YKPq84r7soE0yjMA@google.com>
Message-ID: <f7d2584dfd69d514c8f2aed053204b66@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2021-05-18 21:57, Matthias Kaehlcke wrote:
> On Tue, May 18, 2021 at 05:14:03PM +0530, Vinod Koul wrote:
>> On 18-05-21, 11:50, satya priya wrote:
>> > Add thermal-zones node for SC7280 SoC.
>> >
>> > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> > ---
>> > Changes in RESEND V4:
>> >  - No Changes.
>> >
>> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > index 2cc4785..2a7d488 100644
>> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > @@ -1125,4 +1125,7 @@
>> >  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>> >  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>> >  	};
>> > +
>> > +	thermal_zones: thermal-zones {
>> > +	};
>> 
>> Empty node..? what am i missing here...
> 
> The 'thermal-zones' node with the SoC thermal zones is usually created
> in the <soc>.dtsi, however it doesn't exist yet. The 'Add DT bindings
> and device tree nodes for TSENS in SC7280' series
> (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=478225)
> is creating it, but the series hasn't landed yet.
> 
> The node is needed by other patches in this series that add non-SoC
> thermal zones. Hence either an empty node needs to be added (for now)
> or this series should 'officially' depend on the TSENS series mentioned
> above.

I will add the dependency in cover letter and drop this patch.

Thanks,
Satya Priya
