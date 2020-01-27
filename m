Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A775B14AC6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 00:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgA0XLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 18:11:48 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44586 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgA0XLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 18:11:48 -0500
Received: by mail-vs1-f66.google.com with SMTP id p6so6863853vsj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFyx78bNfJdYMQzj2ScVwGzqFx4mrb1379eblt0uZNc=;
        b=MExhXoMfg02P9/yakWtP+xXn+J78PWEh1A07lSTu8IFkOejgP+WOYPIyheYzf6eLtu
         J5w7nBlZfZxOCI3mxIChwse1+GITAFMvG477NTCPRAtYItZNJPE/8YIQu60aTd4kzXzQ
         3/X5Fge0czKgktZJYTIKeA4OhcprssE8bc1Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFyx78bNfJdYMQzj2ScVwGzqFx4mrb1379eblt0uZNc=;
        b=rpFPiKc56pJP75z6tyCVtdCOerB2idBu7IyORoMN+0iTeov0ogcXnIehbo/MufBYnb
         7gD9PxpzwVfgV8f/ZeV62pbmVQeRjWDbSso3bgAqOCmGbVXqHPPxU+QR+b5QZgJhXBoO
         eSKaOmmXwhlebe8j67BrxBEDlUbxzOugMs8bty5KCfeYBDoFbF036d+9n4+PdOaApfiF
         WsC7MeJjAMFsshuM+nd3Yh3yMI2rKNLOGXJILZbbPLcmibZU2GXcD3HRinbLvOOyUdgZ
         e7DteuYtqVSFBA8ZkuP0WVfnBW4Xbh0jpjRhgdxI7nB9ASEjaFnzKLkyu64JYrvy9DeR
         YdzA==
X-Gm-Message-State: APjAAAVvhg7ftfRHc4F9e9KRBP+I/aM0NcqSJmNJNb3SI0sLI7r2789R
        u1enaq7vblbq+lOCnRi58UEAHvihSOI=
X-Google-Smtp-Source: APXvYqxLW0H0kk46lvAqQj6OKPRNATcEY776GHRo+PhWq1idJAIN1Rk92nzrvcpILI4l9iDqgoH+6A==
X-Received: by 2002:a67:f253:: with SMTP id y19mr117622vsm.158.1580166706153;
        Mon, 27 Jan 2020 15:11:46 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id s123sm4967722vka.27.2020.01.27.15.11.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 15:11:45 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id u6so3101108vkn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 15:11:45 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr5333526vkl.92.1580166704728;
 Mon, 27 Jan 2020 15:11:44 -0800 (PST)
MIME-Version: 1.0
References: <1577435867-32254-1-git-send-email-tdas@codeaurora.org> <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jan 2020 15:11:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UGSN8YRtbEsbHOF6DRvi5=hUTeV+Aam4QKKVL99L4uBA@mail.gmail.com>
Message-ID: <CAD=FV=UGSN8YRtbEsbHOF6DRvi5=hUTeV+Aam4QKKVL99L4uBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Add clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jan 22, 2020 at 4:46 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Dec 27, 2019 at 12:38 AM Taniya Das <tdas@codeaurora.org> wrote:
> >
> > Add the display, video & graphics clock controller nodes supported on
> > SC7180.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
>
> Can you add these to your patch?
>
> #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
>
> ...otherwise the first user of each of the clocks will need to add the
> #include and depending on what order patches landed things can get
> weird.  I think it's cleaner to assume that there will soon be a user
> and proactively add the #includes.
>
> NOTE: at least one user of your patch can be found at
> <https://lore.kernel.org/r/1579621928-18619-1-git-send-email-harigovi@codeaurora.org>.
> They don't add the #includes which means they don't compile atop your
> patch.

Breadcrumbs that I addressed my own feedback because I wanted to
include Taniya's patch atop my series.  See:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid

-Doug
