Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5313CB997C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 00:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfITWHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 18:07:38 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33112 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfITWHi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 18:07:38 -0400
Received: by mail-vs1-f66.google.com with SMTP id p13so5735079vso.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03nfbfvsWWjjBwaHeiInD+GImNWbMhv6TdWghMdfSkE=;
        b=Fg0uHGtz9xrUmln9AWbT87mBPHsSYrvhbyp/Z2l6q5JCSTHmZmnE9NH9JbgABUqdaG
         gUjQSZgrNY0gvGOAiTX28wb9Vj6Rd+qUyBxBIQ2L4UWajRAzETrapZfKgVIt8Hf+QitM
         wGvL/Do5izdrq3ar6vEU5LHT87nhE2ihqb9u+Uq3pHX34e51aW7KNC4EOeo31piZB68x
         Y9wasNwm7hMgASdBb+p7pBu0h6BWMY324irB5UQC6fqLt7K6GZqYYQvAnmSJ35AZW6/0
         eR7lupLa5YgTGE75XoBK0N+zZaOjCC15N58CwMSQRmjdbBHrvl9QAY1J4zoC1tN0XTH9
         g/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03nfbfvsWWjjBwaHeiInD+GImNWbMhv6TdWghMdfSkE=;
        b=et/yWcyBZSps9NKVxSxVAmFr3IDo5LAO6RP/pVSqc7YVy15oTuZDkfOc4hsgNmFk5h
         Vay2ljAIeUi/0SPirDH/eQ8nh4veaTsqKVxBryWUVu89Pqq0VScPvtju10m72J9iF37k
         KiRNPIzfH0zA2y3FFGfEGvUkrxtbS3o0PfvSboxlWmrEkc2BaM4ViHdtjRSTSH1+a+Xl
         wFxVOkcGxR/qIQSnVCAVajgSiXAJYQ7B55/pggT1d+yEglPhahf3DNnczotbCYK+J98H
         skZdRiQP7sBfod7wK78TwYUXxpCkedzf+PdunNTve4oiNrurJahaLJFq3bhOJyx4fJPM
         opiw==
X-Gm-Message-State: APjAAAViyGAYzKjPsJgdszc325/EccbcWvCRdfHAoB+TUpCfQ+aXwPpg
        icBd27TO6Pl/R/aY9MyNIFSdh2j5ru5kVVPQniMtgQ==
X-Google-Smtp-Source: APXvYqyqthmZ/2dM7Axc4UDmIh60LcEGo84Gs0A+ZlbPDaKhFus8SJNw2ooezgIRH2f6v083XtEVhrMYLS8fTXPWU4w=
X-Received: by 2002:a67:f058:: with SMTP id q24mr4000012vsm.27.1569017256934;
 Fri, 20 Sep 2019 15:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569015835.git.amit.kucheria@linaro.org>
 <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
 <5d854c82.1c69fb81.66e1f.96ab@mx.google.com>
In-Reply-To: <5d854c82.1c69fb81.66e1f.96ab@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 20 Sep 2019 15:07:25 -0700
Message-ID: <CAHLCerPqEK2sSGGtDj85DH+qCzgtWi4ainuQv8BgQ3-Dgi93BQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 20, 2019 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-09-20 14:52:24)
> > Register upper-lower interrupts for each of the two tsens controllers.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 96c0a481f454..bb763b362c16 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -175,8 +175,8 @@
> >
> >         thermal-zones {
> >                 cpu0-thermal {
> > -                       polling-delay-passive = <250>;
> > -                       polling-delay = <1000>;
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
>
> I thought the plan was to make this unnecessary to change?

IMO that change should be part of a different series to the thermal
core. I've not actually started working on it yet (traveling for the
next 10 days or so) but plan to do it.

Regards,
Amit
