Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038FF43D75C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 01:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhJ0XPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 19:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhJ0XPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 19:15:49 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDA5C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 16:13:23 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id v65so5766219ioe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rl0KiyZVmnRa9RIsZlZ/dKBg5oxrwgNJJclLrbASD8g=;
        b=HjFzfoLJ+HriIHgi6MmL9orHjnaLdbN7A06ITgUTPEL1Gnfof/gyL4GBHhc6Fepxwb
         8vZrGwr+DOoKI8CPHpsQpT4Ksl/Adasiqn7vJ52uqBFWis6zN6KqTLNnZLwWoesiX0wa
         Rogrcleh20EWM10gudKnGxlNQELGWDArr4k3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rl0KiyZVmnRa9RIsZlZ/dKBg5oxrwgNJJclLrbASD8g=;
        b=oy7mp477uEQ27L13zZxdXnTRxxqL87wKSgBGexIIlfKomyPbEnCLhLa2v2IycSuQqU
         3SMcC39EP9VLmLbzaskEHZCLXitgcAVn5dtpRYIaN007vMsNXGYr8tU+Hcy50kSY6J3n
         5YT1cQpzyYC74FRuNE0rCxISGEe31g2Pwu6V2xe6qJtG9ba+tBrAoHr28np30aE9+1yX
         NVLQ4zcqTj1P5JBF0dWa1HdweaX6/RxMXqEG1HZXfXedkWwOfV2/HFJ/Aj3SgFWz4/jg
         YKhqpDkI9MF+6dBXnBxPdbnES3zTCuvBVndxW+kl5hKVUJT6rP/Pq03B7vIDs39OPg/t
         wkxg==
X-Gm-Message-State: AOAM531PvClA2ryBLflR+2rAgbak2S2cOmsOlUJgH9xP7qpgZWEzrOSw
        4JD0Vxm49n/KpOgaG3jLcHi9cT74c/sP/A==
X-Google-Smtp-Source: ABdhPJxDQYJ2EzpOaFpaJqVA3DNFNw8ED8yfnOEbE9B1H7uAOBFX/uexMo5o44q+yGme6ccEPYigeA==
X-Received: by 2002:a02:cb58:: with SMTP id k24mr553440jap.59.1635376402731;
        Wed, 27 Oct 2021 16:13:22 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id k16sm645113ior.50.2021.10.27.16.13.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 16:13:22 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id i14so5672008ioa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 16:13:21 -0700 (PDT)
X-Received: by 2002:a05:6638:13d2:: with SMTP id i18mr549944jaj.3.1635376401029;
 Wed, 27 Oct 2021 16:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210929153553.1.Ib44c2ac967833d7a3f51452d44d15b7b8d23c1f0@changeid>
 <86b0d847ddf06c1b445f3dbac9c771a9@codeaurora.org> <CAD=FV=WnMnEckHdu0DG3U8MnyjwQ42aybFxq35nWSLG=vs=LGA@mail.gmail.com>
 <YXTY6BdmKBa+jPeN@builder.lan>
In-Reply-To: <YXTY6BdmKBa+jPeN@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Oct 2021 16:13:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ue-OUOOQTZnvtW1-88+NhzUp5nOo80OKT9Pgx27L0VkA@mail.gmail.com>
Message-ID: <CAD=FV=Ue-OUOOQTZnvtW1-88+NhzUp5nOo80OKT9Pgx27L0VkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8350: Make RTC disabled by default;
 enable on sc7280-idp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Oct 23, 2021 at 8:54 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 18 Oct 16:45 CDT 2021, Doug Anderson wrote:
>
> > Bjorn,
> >
> > On Wed, Sep 29, 2021 at 9:00 PM <skakit@codeaurora.org> wrote:
> > >
> > > On 2021-09-30 04:08, Douglas Anderson wrote:
> > > > The RTC on the pmk8350 is not useful on all boards. Some boards may
> > > > not provide backup power to the PMIC but might have another RTC on the
> > > > board that does have backup power. In this case it's better to not use
> > > > the RTC on the PMIC.
> > > >
> > > > At the moment, the only boards that includes this PMIC are sc7280-idp
> > > > and sc7280-idp2. On sc7280-idp I'm not aware of any other RTCs, but
> > > > sc7280-idp2 has a Chrome OS EC on it and this is intended to provide
> > > > the RTC for the AP.
> > > >
> > > > Let's do what we normally do for hardware that's not used by all
> > > > boards and set it to a default status of "disabled" and then enable it
> > > > on the boards that need it.
> > > >
> > > > NOTE: for sc7280-idp it's _possible_ we might also want to add
> > > > `allow-set-time;`. That could be the subject of a future patch if it
> > > > is indeed true.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > >
> > > Reviewed-by: Satya Priya <skakit@codeaurora.org>
> >
> > If you're still accepting patches for 5.16, it'd be keen if you'd
> > consider taking this one. Thanks!
> >
>
> I've picked the patch and hope to get it included in v5.16.
>
> I do however not understand why the commit message so clearly defines
> that the only device including pmk8350 is the sc7280 idp when the
> sm8350-mtp.dts contains the following line:
>
> #include "pmk8350.dtsi"
>
>
> Perhaps I'm missing something obvious, but I took the liberty of also
> enabling the RTC in the SM8350 MTP.

Thank you for fixing this up. I must have just glazed over that part
of things. :( Glad you caught and fixed it.

-Doug
