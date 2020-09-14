Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975CA268207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 02:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgINAHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 20:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgINAHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 20:07:35 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FCFC061787
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 17:07:34 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id u126so15939045oif.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 17:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SxN5M+okd8bgkrot+PciBtavxNn6+94ZVmee/ILOv80=;
        b=Hm/7GXRTleA/FNUxMOQmh32WIct++VIRYTC90p4J3CNsp2+uPKemH/lVRjWEjJea2X
         8WoXnrF/SHw5hcenPvAB6/HT86lgM6cYhQKZ7apWt4ZxOQNP/cgHEgrX70VYGezD9C/W
         Po98MfYunM3oUO8DNTyEQPDsa7NoNCxf0GNCEE48kwkkWSXp+XDnbWcZMX7o+W6CoNzo
         irqczr9hDNcgGY68KWX2a92tyQ1P8OUWa7kZT4j22lfV73jzsnhmBIugedui6pj5kZmV
         IVhvSgi3qkhF+/yKkwSg9GRwbaa455oLlasth+n3ZOhcuTecXoSq3hKveajkkXwPw8fJ
         fpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SxN5M+okd8bgkrot+PciBtavxNn6+94ZVmee/ILOv80=;
        b=cEN20ETDpc0Zre9g+7u85j5KgXcmP10XGHASusGp3EEOdIyqc+TW6lB7ZeFENJvmWl
         g8fJMhc6AFgXzNAps6/DiPjoFZ3rfajDG516JAz5AoGjm+8t+VRxzNmzWmyWs4o6Xd46
         UM2IC/IhEjYm4oqdzc7eUGkLHRhyleorhjiDa0R9masGV6/a9gY0c7qzaqiKySfYcZ6o
         wNqc/3qmbKNsgCuJu4T6RWJle3/hCyEYgNT57YQnqhWcbpz+YhcAacmhql0KL+kDPSxQ
         1rq62GKLIBFYA7TC3o5Ll8IU9Fns7IpfblGUaZTMu5PkPH2ChnZn+CJy3FyMwhjr8FUL
         s5xw==
X-Gm-Message-State: AOAM531xtvCTMNgaW+Of0t/YWn5FoSpho217DeDWfw4+QP5tvsfby4Pa
        /EOyMn4Xzh+2jfbmMEoTPm23HQ==
X-Google-Smtp-Source: ABdhPJxE8PkrkvLjT7yjG1zSXLpV3xQuvOu/Ky0XsUeRPO+thhHY+tNIwRjYkoHkgqEIh4cK2aMYQg==
X-Received: by 2002:aca:3158:: with SMTP id x85mr7469744oix.112.1600042053916;
        Sun, 13 Sep 2020 17:07:33 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id y25sm2217932oti.26.2020.09.13.17.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:07:33 -0700 (PDT)
Date:   Sun, 13 Sep 2020 19:07:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Message-ID: <20200914000730.GY3715@yoga>
References: <20200913225005.30218-1-dmitry.baryshkov@linaro.org>
 <20200913234452.GX3715@yoga>
 <CAA8EJpqCm3zF32qeEX3UR-FjXk1-_cgmEnW6h9aG9aDMp3ZXcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqCm3zF32qeEX3UR-FjXk1-_cgmEnW6h9aG9aDMp3ZXcw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 13 Sep 18:52 CDT 2020, Dmitry Baryshkov wrote:

> Hello,
> 
> On Mon, 14 Sep 2020 at 02:44, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Sun 13 Sep 17:50 CDT 2020, Dmitry Baryshkov wrote:
> >
> > > Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> > > 180 GPIO pins).
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-sm8250.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > index a660f1274b66..4f7dae61b089 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
> > >       [178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
> > >       [179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
> > >       [180] = UFS_RESET(ufs_reset, 0xb8000),
> > > -     [181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> > > +     [181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
> >
> > You're right.
> >
> > >       [182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
> > >       [183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
> > >  };
> > > @@ -1320,7 +1320,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
> > >       .nfunctions = ARRAY_SIZE(sm8250_functions),
> > >       .groups = sm8250_groups,
> > >       .ngroups = ARRAY_SIZE(sm8250_groups),
> > > -     .ngpios = 181,
> > > +     .ngpios = 180,
> >
> > But, while it is correct that SM8250 only has 180 GPIOs, we're exposing
> > UFS_RESET as a gpio as well, so this should therefor be 181. Sorry for
> > the obfuscation here...
> 
> True. Could you please drop the second part of the patch on your own?
> Or would you prefer for me to send v2?
> 

This goes through Linus' tree, so it would be up to him. If you want to
avoid waiting for his response go ahead and post a v2 - and I'll give
you a r-b on it.

Regards,
Bjorn
