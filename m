Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5734E26637D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIKQRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgIKPbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:31:06 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02177C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:31:04 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id x142so2487589vke.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQ0JFGk0jynIKmq2K3P16bVN8Djod/Kezzi4snKiADY=;
        b=XsBD6bIs7vKHNxYE82q8A7ZEoSoOU6Ljp4t42+euB+op9GjboVKdeD6RYJ4B6IbaUP
         Ns2pack5xHA8MIWOe2/QY0z0Q7TrcLRLIWaDLimGj8nhXT45RAd/BxJtfAzpiOE7oI3h
         tabyhOgNLFJE+PAW1KTQWcHZr/cM5YEcKWi4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQ0JFGk0jynIKmq2K3P16bVN8Djod/Kezzi4snKiADY=;
        b=Vcb37SLlrFeD3FSQvhXxUF4V/4QQfx22bK7puuzPFnK7OWtKiCRKGUh+YGCPRrV+9L
         xLuibn0YjEMj7jHBhHrG31gUAPZn4CWMavzvw+Aqyi/iGcpHE/4/4yA0ihITVUQIHhCg
         Wo1fr1m+4wTOQYySAzxqq1xPETc89Was88WwDUikUAf/YUNEScAailAXQ3eFYEA/zGAw
         GfODQWWyu+9+ZArBWf/34MvcDqxBnAZERmq+oH787u/ereLD2qmOgOz6/Rb816EqwCSf
         al6uB+L0ncfxegKOG32k7z7kZL/rnZNrhwLUtmilBlZbQNXZtKUitD8gmAhruMJx0TBB
         CL8w==
X-Gm-Message-State: AOAM5310qqj65lAfV+Y6AQqS91cf7BbT8UypK4x7e2obQxwHCKHcBe48
        8x0cNDKTQ/0uZGZrEcwqpPqjKTfdraqj3Q==
X-Google-Smtp-Source: ABdhPJwiXOWvClYeuQgLvzBrDpTUNAFMqixxnrq327HF0pfpMGTwBAVqVp7qnWek8nkHhHvx6MRQDA==
X-Received: by 2002:ac5:ccac:: with SMTP id p12mr1481041vkm.5.1599838262378;
        Fri, 11 Sep 2020 08:31:02 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id t71sm402582vkc.9.2020.09.11.08.31.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 08:31:01 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id j3so5613749vsm.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:31:01 -0700 (PDT)
X-Received: by 2002:a05:6102:10c2:: with SMTP id t2mr1521400vsr.10.1599838261153;
 Fri, 11 Sep 2020 08:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org> <CAD=FV=ULJqgHutr524wb-wVq4gejqo1p_zqRXP=h4Co6Gvmzew@mail.gmail.com>
 <010101747ca94cce-42d129fa-0374-4f12-aab8-2ccafd02b3c7-000000@us-west-2.amazonses.com>
 <20200911135232.GY3715@yoga>
In-Reply-To: <20200911135232.GY3715@yoga>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Sep 2020 08:30:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uf80P0_aOJw5NMd_oNm5fd8etXnM7m03ogUo7_Kk9G-A@mail.gmail.com>
Message-ID: <CAD=FV=Uf80P0_aOJw5NMd_oNm5fd8etXnM7m03ogUo7_Kk9G-A@mail.gmail.com>
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 11, 2020 at 6:52 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > > >  &uart3 {
> > > > +       pinctrl-names = "default", "sleep";
> > > > +       pinctrl-1 = <&qup_uart3_sleep>;
> > > > +       interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                               <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
> > >
> > > You need a:
> > >
> > > /delete-property/interrupts;
> > >
> > > ...or, alternatively, a patch before this one that converts all the
> > > UARTs in sc7180 to just use interrupts-extended.
> > >
> >
> > Sure, I will add this. But I think when both are added,
> > "interrupts-extended" will get priority as per [1] and there wouldn't be any
> > problem.
> >
>
> You're indeed correct, please stick with what you have.

IMO this is ugly, but I won't fight too hard on it if you guys really
want to do it that way.  Reading the documentation it sounds as if
allowing for both is intended to be used in cases where the same
device tree might be used on old software (that didn't understand
interrupts-extended) and on new software (that does).  The
interrupts-extended property by far predates any sc7180 support,
though, so I can't imagine anyone really needing to use that these
days.  Is it really that bad to add the /delete-property/ to end up
with a cleaner final device tree?

-Doug
