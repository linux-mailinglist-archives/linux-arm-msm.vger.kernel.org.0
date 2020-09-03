Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1895625C419
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgICPDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgICN6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 09:58:32 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0CFC061A19
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 06:46:46 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id v20so921868ual.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j0CWDjHuel9BhIbAeE9SClU/k1SGiwHbME2EsbEVqqg=;
        b=H0ZpLV8XVaPO5Koy+JT8TV7Werq7grrAXsb7ndgYrWD9aaM+kA2QtzugtG05VDPave
         ses3ofeebxQHSLAcjOGBkC9btWfyNNGqg8vbRKxZ07es2kQ6lWMR4pK7q2EDD14dauZP
         30UPjbW4pxO5QwJcqFdY16nw8daWweukbCV/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j0CWDjHuel9BhIbAeE9SClU/k1SGiwHbME2EsbEVqqg=;
        b=KHEQR92Jg7iPuctGsRJ2/tAUvjN4hX/O1EL054sP7rSef97vPuHQPbi+Kmk6xcIzfZ
         oeYudMPJzFc6i9VHZ1ZEU41NrMt0WpOmLZnE77iRn4peNKfozWwuSnuG1aVVMZCx0RkN
         96qf8CeDZLd1hrTcSybkt9G0ylkd1S984SX8SZ8ve3NHGKXH9BplYMs+bXRuQBySorN0
         VAQ6+4RhwPYRJtkJGUqGC7UETNE6LEypBsg25LgG+/geTO6za7ycLwNdaRN8W589K2Uh
         wjeFId1ELduFgzUfk5e+QQKRhvPuINUufnA/cHScNIro0zv0LLLCzkEvSARTgtmO8D3w
         y8+g==
X-Gm-Message-State: AOAM532/3G4DBk0LB/Hq0FNi/eqeN/GX3Z0xXV8/f8l/8eAtSVZWD3dG
        QG6B3I5Pyfn7yxuBwgR7wiupH/IY2XqPcQ==
X-Google-Smtp-Source: ABdhPJxhpXJIqptPtcPF73kV1oBgPFU7vyONP0v04vtDDxuO138nBk+aX33MUrsQBp/V6gnPG6/sgw==
X-Received: by 2002:ab0:4162:: with SMTP id j89mr1204388uad.50.1599140804395;
        Thu, 03 Sep 2020 06:46:44 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id d193sm392425vsc.30.2020.09.03.06.46.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 06:46:43 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id a16so1724857vsp.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 06:46:43 -0700 (PDT)
X-Received: by 2002:a67:e447:: with SMTP id n7mr1767573vsm.53.1599140802881;
 Thu, 03 Sep 2020 06:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
 <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org> <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
 <d949bdfa15b133f74a47727401553c76@codeaurora.org> <7714ee57f75542839d5c33b28f232aa6@codeaurora.org>
In-Reply-To: <7714ee57f75542839d5c33b28f232aa6@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 06:46:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt0NTNjCEJ2USfyd2qZ+FfBz9xwctbpv+hSWvvCoAZFg@mail.gmail.com>
Message-ID: <CAD=FV=Xt0NTNjCEJ2USfyd2qZ+FfBz9xwctbpv+hSWvvCoAZFg@mail.gmail.com>
Subject: Re: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 2:58 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi,
>
> On 2020-08-18 21:07, Sai Prakash Ranjan wrote:
> > Hi Doug,
> >
> >>
> >> I guess to start, it wasn't obvious (to me) that there were two
> >> choices and we were picking one.  Mentioning that the other
> >> alternative was way-based allocation would help a lot.  Even if you
> >> can't fully explain the differences between the two, adding something
> >> to the commit message indicating that this is a policy decision (in
> >> other words, both work but each have their tradeoffs) would help.
> >> Something like this, if it's correct:
> >>
> >> In general we try to enable capacity based allocation (instead of the
> >> default way based allocation) since that gives us better performance
> >> with the current software / hardware configuration.
> >>
> >
> > Thanks, I will add it for next version. Let me also go poke some arch
> > teams
> > to understand if we actually do gain something with this selection, who
> > knows
> > we might get some additional details as well.
> >
>
> I got some information from arch team today, to quote them exactly:
>
> 1) What benefits capacity based allocation brings over the default way
> based allocation?
>
> "Capacity based allows finer grain partition. It is not about improved
> performance but more flexibility in configuration."
>
> 2) Retain through power collapse, doesn=E2=80=99t it burn more power?
>
> "This feature is similar to the standard feature of retention. Yes, when
> we
> have cache in retention mode it burns more power but it keeps the values
> so
> that when we wake up we can get more cache hits."
>
>
> If its good enough, then I will add this info to the commit msg and post
> next version.

Sounds fine to me.  I was mostly looking for a high level idea of what
was happening here.  I am at least a little curious about the
retention bit.  Is that retention during S3, or during some sort of
Runtime PM?  Any idea how much power is burned?  Unless the power is
miniscule it seems hard to believe that it would be a net win to keep
a cache powered up during S3 unless you're planning on waking up a
lot.

-Doug
