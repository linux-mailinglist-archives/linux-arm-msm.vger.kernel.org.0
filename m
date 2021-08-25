Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0573F7D09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 22:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbhHYUMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 16:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237031AbhHYUMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 16:12:54 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195FC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:12:08 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id 22so820558qkg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbP5UVTgmY2oS9CShjTY4KdaNELp9AGh568LVPRQ/jk=;
        b=RAjtwnACTWPvH7V/FtK/3NF3L+p0VuaFA4ON2soGuZMa791gAQoMQi/9tJ96yDeLQt
         yuZhqJRgsTnaZC+kFSyufkN3moBMPHP7mdVPJzbB4Wv9ATsAPcHkTuv3SmI3bHddewsz
         Ova2gkSoXbWPnsjc3k3ImYwM9PfUIAA0MQSSb+qCJUuihJm/6ei3rSAjRgaz3qaca9mz
         Ywge2QPkW5t14hwmBjUHqEugdmxGeaoZr5o66VXJ97iI/NxaODSOLJl+9dqrDGnbteEk
         1GgJQQCU//QeWV0tpKfcau5T6MUwlCFnhFcge4OTpbwt60LQWydV8+XKXOplny8ngJ3k
         zd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbP5UVTgmY2oS9CShjTY4KdaNELp9AGh568LVPRQ/jk=;
        b=QlFTxy45QnyV75aN3gPtfOps6EYPEm+cCDdhoRaQfY6I0E3gutNO+Ik/d723N4bHK8
         POCuFyQytmH3WXSSLXvjL4ye46xKr/QHgttvvNJF5Q6+uP70riaAE22RsyPY3pZFPc63
         A/muxhznDPYWBMkNSFy/nGQp09E0sM5UnsyZzqkI3OuI944Rf7e66zYAj9XJ0N+LZtvT
         wQZUxZtxy3WbXAUE69SxEe103q27pspZkGc8OcE1cIL66uIQ2lcTvr44ASaZyK6XIMVZ
         BgeVlEd9nBbjgRy1/Fs+6GV5/lJSQWxzpWOX+dT50y5xeoqqv1kMvjm6TrFutywIEsE7
         XWcw==
X-Gm-Message-State: AOAM532Z2P3sKQv1I/e1aCbihl/gq4n0SBLDYbPCNfwEahoFoUdk74IT
        jkrWNlh6jk0ZUOwNbXzWiUKfWK4ulJ2TlGelW0P2GJjjRe8=
X-Google-Smtp-Source: ABdhPJw8T5T0B+womDxHAuRLjClmJiHJj/LY69irmQweQjoRskwL2b8WjDIO9jWvOSnVu8LVwn/Mx7z3OxWuiBhoTPI=
X-Received: by 2002:a05:620a:1082:: with SMTP id g2mr341202qkk.138.1629922327665;
 Wed, 25 Aug 2021 13:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga> <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper> <87zgt65avm.fsf@kernel.org> <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper> <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
In-Reply-To: <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Aug 2021 23:11:54 +0300
Message-ID: <CAA8EJpoEJtELwA6+NGRa_jsKPfEka62uvZJzNc0dQaVqbsSssw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to dwc3-qcom
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <jackp@codeaurora.org>, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 25 Aug 2021 at 20:57, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 25/08/2021 16:53, Bjorn Andersson wrote:
> > But in the case of Type-C altmode several of our boards have either an
> > external gpio-based SBU-pin-swapper or some redriver on I2C with this
> > functionality, so we need a way to tell both the PHY and this external
> > contraption about the orientation.
>
> Its a very similar problem to orientation switch
>
> As an example
>
> - redriver may need to fix up signal integrity for
>    lane switching
>
> - PHY needs to toggle lanes from one IP block to another
>
> I don't think off the top of my head a USB controller or DPU cares much
> about the orientation switch but for argument sake you could add one to
> that list.
>
> I _think_ the type-c mux layer handles this though, as in what we did on
> RB5 has PHY and redriver receiving and reacting to a type-c orientation
> switch both with the existing type-c port driver and the new tcpm.
>
> + Dmitry - he did the mux work on the PHY and the redriver

For the RB5 case I ended up with the redriver acting as a client for
the type-c port orientation events, and then it would act as a source
for the event being sent to the DP PHY. This chained approach is far
from being ideal, but it allowed me to use the current framework
without applying significant changes. I've had some ideas on how to
improve the type-c framework, but I never had enough time to
materialize them.

> Seems to me that the type-c mux way of diseminating to more than one
> place might fight role-switching well too.

-- 
With best wishes
Dmitry
