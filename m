Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9796649BFB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 00:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbiAYXql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 18:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234968AbiAYXql (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 18:46:41 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BC3C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 15:46:40 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id s18so9171469ioa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 15:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AQ3l/fKHo9O7TnyojJmIrMHKfVS+Fyc3ar6de8lzMbk=;
        b=Qz38uAnOZu6OaqUMO4A/m2zD9neIBK7ViTW/ql3z9leNHulqPn6NQVstJtVb8d1Jf5
         SXfafLtxHLziz+PId9YX2B2HKw4xFHoDa8pzo3M0fUlORBCh1GMsTSFRn8h9bcKic0Fn
         2fyN6ozieIE7G72eW3ts0SJ+mzR6HcRBNcyVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQ3l/fKHo9O7TnyojJmIrMHKfVS+Fyc3ar6de8lzMbk=;
        b=F2fAPAZXxEINZr84EZDWcjLxogE4bHwDL0NZ7RP2Kfwag5Rf83tlj3UPcc6krenOvn
         YrJhiGptm/q1+MsxP7REcgpJQ+GGnTOtarQPhLOhL26UiC0h0HzlzMl7K4dKRu5saB6u
         cV8hVNRoFFNcyuw3neSWDp09uqbRuTikJgSIInASkpr/GEbcp3xqG0Sg1UPy9iQeR4uz
         WZM9CG0QCizBoFp1z20cM4By7OURIFn2g9LaO1u39ltaZ8niqQfqC2cCafPNtLmgpWYI
         +bNJzP9z1CkTqxC6i4U9y0IA8pjWumnn5gY4I51txtkYt1UNqMHftAvIjPlB7rJwnY39
         NnuA==
X-Gm-Message-State: AOAM531SbH7POfPDnHGcR/67qSKc7S2/348SmCOW65H09kKzWseT84pp
        7kXwKARQUrt6pwNcG5dn2U4coggOUqHeMg==
X-Google-Smtp-Source: ABdhPJz6zWocqbUFVewLQsQn2tPyP/55YPxClqXE2aLmz+59cM6SZaoprVOqOzluIi4PfqEvS8ONzg==
X-Received: by 2002:a05:6638:4089:: with SMTP id m9mr11075431jam.43.1643154399970;
        Tue, 25 Jan 2022 15:46:39 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id r189sm5347468ior.2.2022.01.25.15.46.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 15:46:38 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e8so18219798ilm.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 15:46:38 -0800 (PST)
X-Received: by 2002:a05:6e02:20e6:: with SMTP id q6mr13264596ilv.180.1643154398313;
 Tue, 25 Jan 2022 15:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20220125224422.544381-1-dianders@chromium.org>
 <20220125144316.v2.5.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid> <CAE-0n528Bxdj+DKhi2Lan4qR_=4KHD7A1Zkr15tmu+MchryJ1A@mail.gmail.com>
In-Reply-To: <CAE-0n528Bxdj+DKhi2Lan4qR_=4KHD7A1Zkr15tmu+MchryJ1A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jan 2022 15:46:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UcpKaLQ31CGKUnaNnZcYnM4N_t8VC43FPGktoYDiMfsw@mail.gmail.com>
Message-ID: <CAD=FV=UcpKaLQ31CGKUnaNnZcYnM4N_t8VC43FPGktoYDiMfsw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc7280: Add herobrine-r1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kgodara@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        quic_rjendra@quicinc.com, Andy Gross <agross@kernel.org>,
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

On Tue, Jan 25, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-01-25 14:44:22)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
> > new file mode 100644
> > index 000000000000..f95273052da0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Herobrine board device tree source
> > + *
> > + * Copyright 2022 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7280-herobrine.dtsi"
> > +
> > +/ {
> > +       model = "Google Herobrine (rev1+)";
> > +       compatible = "google,herobrine", "qcom,sc7280";
>
> Can we stop adding "qcom,sc7280" to the board compatible string? It
> looks out of place. It's the compatible for the SoC and should really be
> the compatible for the /soc node.

I don't have any objections, but I feel like this is the type of thing
I'd like Bjorn to have the final say on. What say you, Bjorn?


> > +       pp3300_left_in_mlb: pp3300-left-in-mlb {
>
> Sometimes '-regulator' is left out. Is that intentional? I suppose it
> would be better if every node had regulator postfix, but it may be too
> long of a node name?

Huh, you're right. No, it's not intentional. It looks like it was that
way on herobrine-rev0 too... It also looks like it's missing on
"pp3300-hub" on trogdor.

Happy to add "-regulator" in the herobrine / trogdor nodes that need
it. I'll probably do it as a follow-on patch if that works OK? Then I
can just clean them all up at once...

-Doug
