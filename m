Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A84832D972
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234222AbhCDS22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:28:28 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:55142 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234559AbhCDS20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:28:26 -0500
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Mar 2021 10:27:36 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 04 Mar 2021 10:27:35 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id CD0E9174F; Thu,  4 Mar 2021 10:27:35 -0800 (PST)
Date:   Thu, 4 Mar 2021 10:27:35 -0800
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regmap-irq: Add support for peripheral offsets
Message-ID: <20210304182735.GA31587@codeaurora.org>
References: <cover.1603402280.git.gurus@codeaurora.org>
 <40581a58bd16442f03db1abea014ca1eedc94d3c.1603402280.git.gurus@codeaurora.org>
 <20201112193312.GE4742@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112193312.GE4742@sirena.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

Sorry for the delay in my response.

On Thu, Nov 12, 2020 at 07:33:12PM +0000, Mark Brown wrote:
> It is difficult to follow what this change is supposed to do, in part
> because it looks like this is in fact two separate changes, one adding
> the _base feature and another adding the polarity feature.  These should
> each be in a separate patch if that is the case, and I think each needs
> a clearer changelog - I'm not entirely sure what the polarity feature is
> supposed to do.  Nothing here says what POLARITY_HI and POLARITY_LO are,
> how they interact or anything.

Sure, I can split this into two patches for easier review.

The POLARITY_HI and POLARITY_LO registers were described very briefly in
the cover letter. If an interrupt is already configured as either edge-
or level-triggered, setting the corresponding bit for it in the
POLARITY_HI register further configures it as rising-edge or level-high
triggered (as the case may be), while setting the same bit in
POLARITY_LO further configures it as falling-edge or level-low
triggered. I could certainly add this information to the commit message
as well.

> 
> For the address offsets I'm not sure that this is the best way to
> represent things.  It looks like the hardware this is trying to describe
> is essentially a bunch of separate interrupt controllers that happen to
> share an upstream interrupt

Sorry but isn't this essentially the same as what the framework already knows as
the "sub-irq" concept, with the key difference that the register stride
is not fixed? Everything else is the same (except for a couple of minor
points noted below) - a main IRQ register that indicates sub-irq blocks
that have unhandled interrupts, as well as interrupt handling and
servicing.

The two minor differences are:
  - type_buf handling in regmap_irq_set_type() for IRQ_TYPE_LEVEL_HIGH and
    IRQ_TYPE_LEVEL_LOW
  - Two extra registers: POLARITY_HI and POLARITY_LO

> clearer if at least the implementation looked like this.  Instead of
> having to check for this array of offsets at every use point (which is
> going to be rarely used and hence prone to bugs)

Well, using irq_reg_stride already does exactly this - calculating the
right register to access at every use point, as an offset from the _base
register (status, ack, type, et c.). Peripheral offsets would just be
another way of calculating the right register, that's all. And we could
have a macro as well.

> we'd have a set of separate regmap-irqs and then we'd mostly only have
> to loop through them on handling, the bulk of the implementation
> wouldn't have to worry about this special case.
> 
> Historically genirq didn't support sharing threaded interrupts, if
> that's not changed we'd need to open code everything inside regmap-irq
> but it would be doable, or ideally genirq could grow this feature.  If
> it's done inside regmap you'd have a separate API that took an array of
> regmap-irq configurations instead of just one and then when an interrupt
> is delivered just loops through all of them handling it.  A quick scan
> through the interrupt code suggests it might be able to cope with shared
> IRQs now though which would make life easier.

Sure, I can look into how this approach would look like, but given that
the QCOM register arrangement of main vs sub-irq is essentially the same
as what the framework currently understands, couldn't we simply have a
macro to change the way the right register offset is calculated
(irq_reg_stride vs. peripheral offsets)?

Also, could you elaborate more on the genirq route? I'm not sure where
to start looking to evaluate one route vs the other.

Thank you.

Guru Das.
