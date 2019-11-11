Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA01F7270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 11:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfKKKqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 05:46:54 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:52051 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726829AbfKKKqy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 05:46:54 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iU7Df-0008K6-Aj; Mon, 11 Nov 2019 11:46:51 +0100
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 06/13] drivers: irqchip: qcom-pdc: Move to an SoC  independent compatible
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 11 Nov 2019 11:56:12 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, <agross@kernel.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mka@chromium.org>, <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>
In-Reply-To: <20191111071030.GB3797@yoga>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
 <20191108092824.9773-7-rnayak@codeaurora.org>
 <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
 <9c2b33f2-02bb-e516-4cb5-b466757cd67a@codeaurora.org>
 <20191111071030.GB3797@yoga>
Message-ID: <d622482d92059533f03b65af26c69b9b@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: bjorn.andersson@linaro.org, rnayak@codeaurora.org, agross@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mka@chromium.org, swboyd@chromium.org, ilina@codeaurora.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-11 08:19, Bjorn Andersson wrote:
> On Fri 08 Nov 01:55 PST 2019, Rajendra Nayak wrote:
>
>>
>> On 11/8/2019 3:10 PM, Marc Zyngier wrote:
>> > On 2019-11-08 10:37, Rajendra Nayak wrote:
>> > > Remove the sdm845 SoC specific compatible to make the driver
>> > > easily reusable across other SoC's with the same IP block.
>> > > This will reduce further churn adding any SoC specific
>> > > compatibles unless really needed.
>> > >
>> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> > > Reviewed-by: Lina Iyer <ilina@codeaurora.org>
>> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> > > Cc: Marc Zyngier <maz@kernel.org>
>> > > ---
>> > >  drivers/irqchip/qcom-pdc.c | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/irqchip/qcom-pdc.c 
>> b/drivers/irqchip/qcom-pdc.c
>> > > index faa7d61b9d6c..c175333bb646 100644
>> > > --- a/drivers/irqchip/qcom-pdc.c
>> > > +++ b/drivers/irqchip/qcom-pdc.c
>> > > @@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node
>> > > *node, struct device_node *parent)
>> > >      return ret;
>> > >  }
>> > >
>> > > -IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
>> > > +IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>> >
>> > Acked-by: Marc Zyngier <marc.zyngier@arm.com>
>> >
>> > How do you want me get this (and the DT change) merged? I can 
>> either take
>> > these two patches in the irqchip tree, or you arrange them to be 
>> taken
>> > by the platform maintainers. Your call.
>>
>> I think it makes sense for you to take these two via your tree (The 
>> driver
>> and binding doc updates) and the DT node addition for pdc to go via 
>> Andy/Bjorn.
>> Andy/Bjorn, does that sound fine?
>>
>
> Yes, that sounds good.

Applied to irqchip/next

         M.
-- 
Jazz is not dead. It just smells funny...
