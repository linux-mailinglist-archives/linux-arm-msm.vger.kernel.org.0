Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF0F2F02E1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 19:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbhAISkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 13:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbhAISkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 13:40:20 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D81C061786;
        Sat,  9 Jan 2021 10:39:39 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id x26so7490831vsq.1;
        Sat, 09 Jan 2021 10:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vo7QU1jn/MNR3ZLMnYmlFrmP/67S/5qA3ag8OfiuZXo=;
        b=F4NrHNRl6wSXFRf551VhA1QEaOWvrzlieBJAA3BUMRiom4EymuGXWf3qSZd2Zo4RZr
         e8paYqBC9AsXH5zLvdR5Ofss7XyRuT9IOSMTH8fAf3CXe6BJttFJcQFDI32+BO+i3vI+
         KHEysivbeR/aQ75MjqN/LN7/SaxVbNfbVv04qp8RH4Bpyhzk9DMUEwCpQiDRps2kKBwc
         U2LnxZyuoaj1H8XCXE96YY/T3cGSWWWd9kCMku4ELqEfsTDgI5UE5xxVyw354MdWcC2t
         87mCICsgVwgpLbY/vjZ6BKy3+PcPS1KlYXlUmZZ9x22hIu2pu66GuQPB8Fhuf0665sTW
         hWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vo7QU1jn/MNR3ZLMnYmlFrmP/67S/5qA3ag8OfiuZXo=;
        b=EPKED+exJCOqkYl0fgZkJbn8E5DymixyQ+7wZ6q0dqWgCTvYRIibwH933/JF/Gxxxx
         7dxcLHYFw7zGZIA9kEdFNtXfo8Nb7YCMlBib/5oOnKdw3apzGx7E6HXZGeEQVNoy3QEB
         7/9XJe/YXVAuC8SI7LYtJa5eDptUbmqLIF3+rUm5LDfZ6dbJRv1gwiIDQeVf0eeHuOQs
         UAHBKTEtlvp4I0zG4t6B+iNl65nwP/c50poVy4QATwmDLGLbAxMFLuO8RQ7s3XKzwwYB
         r0Vd80jx7EpFGfQysPoFYsGm/oQLErIDRuEQUq/ZPt/edbYfSz8ayhcmldWxrw6ye6VM
         b3rQ==
X-Gm-Message-State: AOAM531Sz4XVi7WfrAe2hlwakNpwKZVaccdT8WdqvlRr8K1BCezMTBvn
        RCI0wQtnBfWZPAe6fmcGkrHjg1Z7EYnhzuLRt3k=
X-Google-Smtp-Source: ABdhPJz5RXOBbsfRYVPZHWldYLS5QKMxp7/T8n+Rfl7vk3enVt/0kgJIuAiybUWxdD/3wxkide7Ue3ENnrEerrdV5js=
X-Received: by 2002:a67:d39b:: with SMTP id b27mr7662865vsj.22.1610217578896;
 Sat, 09 Jan 2021 10:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20200926130306.13843-1-kholk11@gmail.com> <20200926130306.13843-4-kholk11@gmail.com>
 <X8sV2UOipnhP1Y78@builder.lan>
In-Reply-To: <X8sV2UOipnhP1Y78@builder.lan>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 9 Jan 2021 19:39:28 +0100
Message-ID: <CAK7fi1Z0k8AE91KhjMUsBtKgu9ArEhnbfru2CYZHLDyjfgA6NQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: qcom: mmcc-sdm660: Add MDP clock source CXC to
 MDSS GDSC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        martin.botka1@gmail.com, MSM <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno sab 5 dic 2020 alle ore 06:08 Bjorn Andersson
<bjorn.andersson@linaro.org> ha scritto:
>
> On Sat 26 Sep 08:03 CDT 2020, kholk11@gmail.com wrote:
>
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > It is required for optimal performance and to avoid MDP stalls to
> > retain mem/periph on GDSC enablement: to achieve this, let's add
> > the required CXC to the MDSS GDSC.
> >
>
> Can you please explain how you came to this conclusion, I don't see the
> reference to the MDP_CLK_SRC in the downstream kernel.
>
> Thanks,
> Bjorn
>
Hey!
I am sure I don't have to go too deep with such an explanation. You know,
downstream is seriously tangled, perhaps that's why you couldn't find how.

By the way, as you can see, here in sdm660-mdss.dtsi we have the
MDP_CLK_SRC clock:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-mdss.dtsi?h=LA.UM.8.2.r2-03400-sdm660.0#n121

Since downstream uses to set the mem/periph retain in a different way,
here you find
some references to what you're looking for:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/video/fbdev/msm/mdss_mdp.c?h=LA.UM.8.2.r2-03400-sdm660.0#n1555

...of course, also from my own tests, failing to set these flags will
stall the MDP as
soon as we hit a resume from MDP idle power collapse.

P.S.: Sorry for the late reply!
--Angelo

> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  drivers/clk/qcom/mmcc-sdm660.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> > index 234aca7c873b..7b1384cf8506 100644
> > --- a/drivers/clk/qcom/mmcc-sdm660.c
> > +++ b/drivers/clk/qcom/mmcc-sdm660.c
> > @@ -2572,6 +2572,8 @@ static struct gdsc mdss_gdsc = {
> >       .pd = {
> >               .name = "mdss",
> >       },
> > +     .cxcs = (unsigned int []){ 0x2040 },
> > +     .cxc_count = 1,
> >       .pwrsts = PWRSTS_OFF_ON,
> >  };
> >
> > --
> > 2.28.0
> >
