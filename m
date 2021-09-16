Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C8540DE44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbhIPPkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236278AbhIPPky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:40:54 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A70C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:39:34 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id b200so8405270iof.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fp+WsN+/19LlXaTrj9rS9XEtYNaEuPe0MZNGvgmzeS0=;
        b=LrRfdOuv4v1U4l5TfO7zbI2TtX9zs8u7MNP33iX3tsISWkQjHcwQVENfEuc6HJiY7H
         UPRZhWgbqPMh0g/x+OiTzUqajlTdwUni8GUe0flczkfRVqF24fDtInWw+FZiRwP3Nbvt
         Z4UYSDrMGvs2+YYF+7CLl53gqJ00fTkaUQhzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fp+WsN+/19LlXaTrj9rS9XEtYNaEuPe0MZNGvgmzeS0=;
        b=7aado83GW/X/77pOjMNsH1aMJyE1/JD6XrCLFx/0thf3wetTci+U0QLC5BNkpSPmCM
         3okwwnle3GN17xcSvC+LoWPV6knBkRLi5L5meDTxpAA/qcJCkzinZ1VkVwf6nNtcRQfs
         EBI4yU4BMxkp/55Vxzb06NZ/oknLgdgWhX4+ofE9lqM8b9LzBLvdcifDvTvD9utWg44Z
         qPlqUShEH9fb9gpbKJrPoA8JXYUgMIqhV5eV/YiV/QlXPuMbykG6vBtzz6xrEyIoWCOn
         JUBlWjRH6S0lxyp8+Sl1S/QHqUPBBs6h0wk9FDEXNKtlro0mGr+Qtv60UZUpStpw4akl
         LEog==
X-Gm-Message-State: AOAM5310BfV6PtwIG+hH0+8S0/eLnT24OwldjXAu2qNwAcm2BK2FgX1e
        hmvJ4WzT1tPvu/6tworxpc5nsUQ6L0je0w==
X-Google-Smtp-Source: ABdhPJzdwFpK6IZeAnoNhvE70o0UeZWxOvdt0bvoQqCQu5sNPPtakaCiH1oY2Cka/v+kdKLfUMZzag==
X-Received: by 2002:a6b:f214:: with SMTP id q20mr4884635ioh.84.1631806773517;
        Thu, 16 Sep 2021 08:39:33 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id c11sm1890453ioh.50.2021.09.16.08.39.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:39:32 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id d11so3131972ilc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:39:32 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id n13mr2282176ili.142.1631806772106;
 Thu, 16 Sep 2021 08:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <1628642571-25383-1-git-send-email-tdas@codeaurora.org> <CAD=FV=U1zARov=8q9ZSOS4BRe919uFLJh56b8WKk-9LF0r5KZA@mail.gmail.com>
In-Reply-To: <CAD=FV=U1zARov=8q9ZSOS4BRe919uFLJh56b8WKk-9LF0r5KZA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Sep 2021 08:39:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_Ng1iFjAsYf=echLNzeSLy42baCWM83MHrS2SZ++V1g@mail.gmail.com>
Message-ID: <CAD=FV=W_Ng1iFjAsYf=echLNzeSLy42baCWM83MHrS2SZ++V1g@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add clock controller ID headers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 24, 2021 at 3:52 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Aug 10, 2021 at 5:43 PM Taniya Das <tdas@codeaurora.org> wrote:
> >
> > Add the GPUCC, DISPCC and VIDEOCC clock headers which were dropped
> > earlier.
> >
> > Fixes: 422a295221bb ("arm64: dts: qcom: sc7280: Add clock controller nodes")
>
> IMO drop the "Fixes". To me having the "Fixes" there means that there
> was a bug in the old patch. This isn't really fixing a bug.
>
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Other than removing the "Fixes" then this seems like it would be nice
> to land soon after the next -rc1 comes out so that patches that start
> referring to the clocks in these controllers can take advantage of
> them. Snooze 3 weeks till (presumably) -rc1 might come out.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Bjorn: if you agree and are willing to drop the "Fixes" line yourself
when applying then I think this is ready to land since it's now "soon
after the next -rc1". ;-)

-Doug
