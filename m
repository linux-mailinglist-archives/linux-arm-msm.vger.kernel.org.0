Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2AB181D94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 17:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbgCKQRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 12:17:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41985 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbgCKQRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 12:17:32 -0400
Received: by mail-pl1-f194.google.com with SMTP id t3so1317039plz.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eGB8HLn34Ay+oTWhql5ATheorHKXdDNb1Y38OeMfZ0w=;
        b=V1FnRQ1L3bblXi4JseWibpSlMPHSWCCa8FQHLozbgJBRgDgqs1i34nh150UBybDfY9
         qpz1rYB7r8IltEW2bXAEI/YQh4n3irUfxn+TD5jdeT7sggcxFuUDoHr9TSSeKip0NXWo
         wDOPA2JYHFO211/0qHHCmU8ivE9ZRdPuIggeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eGB8HLn34Ay+oTWhql5ATheorHKXdDNb1Y38OeMfZ0w=;
        b=rS/d+v5PlmN0aOwr7SK4hElXWdouY73BNOvGEt9zEMXW51z30TfjeJl87YroC6kAbI
         M7gW/7PwJDWc8KOYp+KASxjiIXcHNPeYjRRh99AMSH6HGbXeHdEtN9TGRywUbG+Zbye4
         7KvtJfJkXwqF9G8DJ9DMOtIff+cQ0FcLYMReVggcP2eszUWVBOWMhvnjI708t1aB/uwL
         /a/Y18r0AK68zjPRGHmcB9MRFtgyu6vF0fuNCGH/+Av1pF4ve2zK8ERb9tf8qL+6Fvk5
         DjaB7b/IvbCQY/Xsp/jC4nLQVHixN6tEYf1K9kCm7MGb7p3FEaBPcVmR03zlzw0Wyc4+
         ummA==
X-Gm-Message-State: ANhLgQ1isqx8i44ydlgdBdlLbS98iCYDiAlvbGg41YSMA0qaXS+kgW23
        pKogBPFBAiqPdcaeKNzeJLGj4Q==
X-Google-Smtp-Source: ADFU+vshhiwVVGqo0dONSe/FWHePlzAq5T+rk31M7o0XbB+wx4eKCGFnSPWzp/SOMGkIF+9iuxQHdA==
X-Received: by 2002:a17:902:528:: with SMTP id 37mr3891621plf.322.1583943449493;
        Wed, 11 Mar 2020 09:17:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id bb13sm6129763pjb.43.2020.03.11.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 09:17:28 -0700 (PDT)
Date:   Wed, 11 Mar 2020 09:17:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFT PATCH 1/9] drivers: qcom: rpmh-rsc: Clean code
 reading/writing regs/cmds
Message-ID: <20200311161726.GA144492@google.com>
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
 <85758e97-8c0c-5c4e-24ad-d3e8b2b01d3c@codeaurora.org>
 <CAD=FV=X649r8qrNRZSezUBEuJbt0oZg6VBweAGjEhxOPp0zf2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=X649r8qrNRZSezUBEuJbt0oZg6VBweAGjEhxOPp0zf2w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 11, 2020 at 08:03:27AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 11, 2020 at 1:47 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >
> > Hi,
> >
> > On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> > > This patch makes two changes, both of which should be no-ops:
> > >
> > > 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
> > >    write_tcs_cmd().
> >
> > i agree that there are two different write function doing same thing except last addition (RSC_DRV_CMD_OFFSET * cmd_id)
> >
> > can you please rename write_tcs_cmd() to write_tcs_reg(), add above operation in it, and then remove existing write_tcs_reg().
> > this way we have only one read and one write function.
> >
> > so at the end we will two function as,
> >
> > static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> > {
> >         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> >                              RSC_DRV_CMD_OFFSET * cmd_id);
> > }
> >
> > static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
> >                           u32 data)
> > {
> >         writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> >                        RSC_DRV_CMD_OFFSET * cmd_id);
> > }
> 
> I can if you insist and this is still better than the existing
> (inconsistent) code.
> 
> ...but I still feel that having two functions adds value here.
> 
> 
> Anyone else who is CCed want to weigh in and tie break?

I agree with Doug, having two functions makes the code that calls them
clearer. It makes it evident when a command is read/written and doesn't require
a useless extra parameter when accessing a non-command register.

> > > 2. Change the order of operations in the above functions to make it
> > >    more obvious to me what the math is doing.  Specifically first you
> > >    want to find the right TCS, then the right register, and then
> > >    multiply by the command ID if necessary.
> > With above change, i don't think you need to re-order this.
> > specifically from tcs->base, we find right "reg" first and if it happens to be tcs then intended tcs, and then cmd inside tcs.
> 
> There was never any "need" to re-order.  That math works out to be the
> same.  This is just clearer.
> 
> As an example, let's look at this:
> 
> struct point {
>   int x;
>   int y;
> };
> struct point points[10];
> 
> Let's say you have:
>   void *points_base = &(points[0]);
> 
> ...and now you want to find &(points[5].y).  What does your math look like?
> 
> a) points_base + (sizeof(struct point) * 5) + 4 ;
> 
> ...or...
> 
> b) points_base + 4 + (sizeof(struct point) * 5);
> 
> 
> Both calculations give the same result, but I am arguring that "a)" is
> more intuitive.  Specifically you deal with the array access first and
> then deal with the offset within the structure that you found.

+1
