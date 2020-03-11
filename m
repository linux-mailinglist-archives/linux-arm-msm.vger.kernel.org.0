Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9AC182139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 19:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbgCKSu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 14:50:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32890 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730781AbgCKSu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 14:50:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id c20so2657624lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 11:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LnTrTKnk0g/RH8zM4WZS8y2NAu9H2imsDcqUNNoLStw=;
        b=TkvesgPuZRaGjQDQW6T+eZITafm2pIlZPeKTSNl4AkOEqBPjOpc8/o+Gm/soX2t8FS
         1X5syjcEu3dJOU8Jx2UFtzxv8W8wyngVfdVfNNBi56LaxM711Zv3NobZo4akdjBUAk9m
         pcN0X3RcTKSuYYpwfyvPd5ZPqMaNGJOI19h30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnTrTKnk0g/RH8zM4WZS8y2NAu9H2imsDcqUNNoLStw=;
        b=So3R9qLV6djFZtpmUmIafoV8yCQYEe8QIKPmf0B32TLn5C76cTfXiclYbs8nr5Gbmh
         BK9QS9qf35gvs4m1wcCiLSHvRip24ssUCbsiZFMAR0VdRdXrZde1GJEy0u92dSXXV8zq
         slzYclpDnFi7x6xApl1QlsCgSZvsgx5VyKO876of64nvzSTMIQtxTEC4C/puxjw056Tw
         o/1pk2TiXeDl24M9fVHCqLH7oAGbKSYKFa63zAFJYV54t4/7RFxJQQrs7oM2z0oIzv8M
         0K681/SQnNu58RGck1u46PoBENMOnNKq/jk9ROjlAj2fLEz7g8Y+HwPFJo/RExjdwDyt
         4iKA==
X-Gm-Message-State: ANhLgQ0+oWN/0UkhFIqnljzcc/oGVGdRq8SXsjdQobb0rzfn9oLBahlq
        5mZwC/xv/gpqHBCK0FjnMcBFKM4tKZM=
X-Google-Smtp-Source: ADFU+vtLqMCeWyC7CoS01yyttwD714dG1pr1ACh0QeE8fFPyAy6v3BYjanq84A8fgzS8CHVqKkFX3w==
X-Received: by 2002:ac2:5473:: with SMTP id e19mr2931717lfn.24.1583952622671;
        Wed, 11 Mar 2020 11:50:22 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id r186sm11733777lff.66.2020.03.11.11.50.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 11:50:21 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id q19so3511000ljp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 11:50:21 -0700 (PDT)
X-Received: by 2002:a2e:869a:: with SMTP id l26mr2839395lji.286.1583952620980;
 Wed, 11 Mar 2020 11:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
 <285d3315-7558-d9f6-fe65-24d8ad07949d@codeaurora.org> <CAD=FV=W5RGwu=ywtM7aCv3H-EpJ1i23S0awgVc8QtOsXtige4w@mail.gmail.com>
In-Reply-To: <CAD=FV=W5RGwu=ywtM7aCv3H-EpJ1i23S0awgVc8QtOsXtige4w@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 11 Mar 2020 11:49:44 -0700
X-Gmail-Original-Message-ID: <CAE=gft7Z0aq5p5sPhBH7Q86T-pHmOL1i-E5sPBV2PQH3tFLMAQ@mail.gmail.com>
Message-ID: <CAE=gft7Z0aq5p5sPhBH7Q86T-pHmOL1i-E5sPBV2PQH3tFLMAQ@mail.gmail.com>
Subject: Re: [RFT PATCH 2/9] drivers: qcom: rpmh-rsc: Document the register
 layout better
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 11, 2020 at 8:28 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 11, 2020 at 2:35 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >
> > Hi Doug,
> >
> > On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> > > Perhaps it's just me, it took a really long time to understand what
> > > the register layout of rpmh-rsc was just from the #defines.
> > i don't understand why register layout is so important for you to understand?
> >
> > besides, i think all required registers are properly named with #define
> >
> > for e.g.
> > /* Register offsets */
> > #define RSC_DRV_IRQ_ENABLE              0x00
> > #define RSC_DRV_IRQ_STATUS              0x04
> > #define RSC_DRV_IRQ_CLEAR               0x08
> >
> > now when you want to enable/disable irq in driver code, its pretty simple to figure out
> > that we need to read/write at RSC_DRV_IRQ_ENABLE offset.
>
> It's not the specific layout that's important to me.  It's the
> relationships between everything.  In other words:
>
> a) one rpmh-rsc contains some registers and then a whole bunch of TCS blocks
>
> b) one TCS block contains some registers and space for up to 16 commands.
>
> c) each command has a handful of registers
>
> Nothing describes this in the existing code--you've gotta read through
> all the code and figure out how it's reading/writing registers to
> figure it out.
>
>
> > this seems unnecessary change to me, can you please drop this when you spin v2?
>
> In v2 I'll replace this with the prose below.  Personally I find this
> inferior to the struct definitions which are easier to read
> at-a-glance, but it seems like it would be less controversial...
>
> /*
>  * Here's a high level overview of how all the registers in RPMH work
>  * together:
>  *
>  * - The main rpmh-rsc address is the base of a register space that can
>  *   be used to find overall configuration of the hardware
>  *   (DRV_PRNT_CHLD_CONFIG).  Also found within the rpmh-rsc register
>  *   space are all the TCS blocks.  The offset of the TCS blocks is
>  *   specified in the device tree by "qcom,tcs-offset" and used to
>  *   compute tcs_base.
>  * - TCS blocks come one after another.  Type, count, and order are
>  *   specified by the device tree as "qcom,tcs-config".
>  * - Each TCS block has some registers, then space for up to 16 commands.
>  *   Note that though address space is reserved for 16 commands, fewer
>  *   might be present.  See ncpt (num cmds per TCS).
>  * - The first TCS block is special in that it has registers to control
>  *   interrupts (RSC_DRV_IRQ_XXX).  Space for these registers is reserved
>  *   in all TCS blocks to make the math easier, but only the first one
>  *   matters.
>  */
>
> I'll also move the documentation of "irq_clear", "cmd_wait_for_cmpl",
> "status", and "cmd_enable" next to the respective #defines.

Perhaps, I'm biased in the same way Doug is, but reviewing RPMh
patches is especially difficult because exactly this kind of
documentation is missing. The relationship and inheritance between
TCS, DRV, RSC, and how many of each are inside of what is never really
spelled out. This makes it difficult to reason about what new patches
are doing and whether or not it works. Having the register layout and
documentation helps convey these relationships, and helps others to
ensure that the code is correctly doing what it's intended to do.

-Evan
