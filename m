Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A653F782B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 17:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239398AbhHYPWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 11:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237885AbhHYPWG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 11:22:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4580E61052;
        Wed, 25 Aug 2021 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629904880;
        bh=aYtJL+XzHAv8sp8iAQndV5fUFlEcZ2mZ2KvUpHxvOeI=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=MOx4s1lw78+n0Y8tAU1Voo21jwh8FsHWESfFP1mpajG+1EXXKTiwe3dtca74yPFC2
         xlqRlhhVrSD3UeGUxHHbvpQ5d9fH03nHOPj2iELxMzbu3vZYCLlfALaNOsQJTmJFRh
         eK5RHpUwtzRH5cBUfLnAP5YhhxaZNc/axd+DBd9meOrz4J9OsecXJRJqvrbjMwagT/
         m+UvHOJbNAUWwe+u0Qp++BM1qViOnN7gH7MMR+jcd2tIYexs6vcyEvKd9WNE78MBZF
         IwvGCvnsjjEGx3+0rR6H0oU2cxG0o38k2JqKV00yalDmQM39WN1bbHZTlctF1hoIU/
         7/A61qwyyLJoA==
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <CAL_JsqLxm6P0KyYtUFvB5otR3BUkJN7dN89QixeWh67WoDtunA@mail.gmail.com>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Gross, Andy" <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <jackp@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd
 to dwc3-qcom
Date:   Wed, 25 Aug 2021 18:20:59 +0300
In-reply-to: <CAL_JsqLxm6P0KyYtUFvB5otR3BUkJN7dN89QixeWh67WoDtunA@mail.gmail.com>
Message-ID: <87r1eha6tv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Rob Herring <robh+dt@kernel.org> writes:
>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> > On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
>> >
>> >> On 21-07-07 14:03:19, Bjorn Andersson wrote:
>> >> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
>> >> >
>> >> > Allow me to reorder your two questions:
>> >> >
>> >> > > And why using a notifier need to concern core's deferral probe?
>> >> >
>> >> > The problem at hand calls for the core for somehow invoking
>> >> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
>> >> >
>> >> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
>> >> > this (and stash the pointer). And this can't be done until dwc3-core
>> >> > actually exist, which it won't until dwc3_probe() has completed
>> >> > successfully (or in particular allocated struct dwc).
>> >>
>> >> Maybe you misunderstood the notifier I meant previous, my pointer was
>> >> calling glue layer API directly.
>> >>
>> >> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
>> >> allocated successfully, you could call glue layer notifier at function
>> >> dwc3_usb_role_switch_set directly.
>> >> Some references of my idea [1] [2]
>> >>
>> >> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
>> >> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
>> >>
>> >
>> > Hi Peter, I took a proper look at this again, hoping to find a way to
>> > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
>> > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
>> > changes.
>>
>> I would rather keep the strict separation between glue and core.
>
> On the surface that seems nice, but obviously there are issues with
> the approach. It's also not how pretty much every other instance of
> licensed IP blocks are structured.
>
> The specific need here seems to be multiple entities needing role
> switch notifications. Seems like that should be solved in a generic
> way.

right, solve it generically without breaking the module isolation ;-)

-- 
balbi
