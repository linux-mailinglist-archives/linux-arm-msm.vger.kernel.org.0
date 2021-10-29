Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB66B43FCCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 14:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhJ2M75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 08:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhJ2M7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 08:59:55 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A0FC061570;
        Fri, 29 Oct 2021 05:57:26 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g8so38659362edb.2;
        Fri, 29 Oct 2021 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhSN8kedoZeC71/lNKcXSi8I8fonEQD4J4/TeNpr6vw=;
        b=JBgRi8Xilyx/PG5L52x52MAkiGMkFnYZOttYplJjAn4deDZYEHRWK/reRfubf1FGSt
         CqOpXj5jfHPegIMK5/A9+IsabK9Uy22s/59ebEEf7BPn78oXRaPN2AYINiTWVEnvW5oP
         awWrP0Aurn3BFI4TWnx6fDkByE+izf+UjlL3YkigiicGB5tgiLGFGv4+uiIXZXuj2PIi
         agxIrvB9wkw36fTHez4xQWLD/6uXf9zFb6MYXKeIgFelwl+mvj8wNIrFcruZUbIBopje
         AqdjO5ydEBGvDAL1YT1ILjd+crk5UzHze0EnNj/QwuTaTaY8qANFbSD3PuPvV7GocDgC
         Fb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhSN8kedoZeC71/lNKcXSi8I8fonEQD4J4/TeNpr6vw=;
        b=EXvPIdwkfgZ9Tfy9bh6h0frOZa8neI3g3L1rg3tt26pBRTUGIvKMYvBtjMNThzWvhP
         Sg1ADpN10uY8sOOw7DSxBQgMPGoo+1qWlWLM7fAVWwJ4m19mSUyd2hU6zz4bKCSGP5fu
         OOARH25uEn8Mpwf5zasoqIVkZ0gFJO8F4TO4aEyPKZ3KPkMNZyfnEHRPt5mc44rbRwyh
         FdM7l3uMdKEjyquPpG2wodd4+U5yshCUQ92sUOJeCeWfS6TWDew4t6SuNo9jvTvwGv6e
         a6lB/BvcWTQqcQoocTDQ1NCiLKOwqtvWFLfhGsljZPFfcMEDkln0wExFeUqudCu0nYDi
         sBGQ==
X-Gm-Message-State: AOAM531Bqp6kcGzaWe0m9JR8ChHapFaun3kD7HORdxpQ7iq8ZS+Ac5Tc
        69Z1MD1VyiwsqMoQIHVpHdM7IuwFAFVrbRvfEdY=
X-Google-Smtp-Source: ABdhPJyCoz8hyGdASer7LPDOoMscdW3QPsfedNxRAZF8N2vYp8OMBEHsLn6ZpInCpxDaGHDgeDjF9Ea8uV7h5T/VWCM=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr13200811ejd.425.1635512245127;
 Fri, 29 Oct 2021 05:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com> <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
 <87fsskqvvc.fsf@kernel.org> <CAHp75VdHpHMp7X=8WcVbSUaT3pfxo-ZOTQ0BwdQqD09bJ2ddKg@mail.gmail.com>
 <877ddwqaas.fsf@kernel.org>
In-Reply-To: <877ddwqaas.fsf@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Oct 2021 15:56:33 +0300
Message-ID: <CAHp75VcwbVh7K=UMgiJ1QpaeB_f_==K4Ewzjt5OwYcOAXqiyUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 29, 2021 at 3:34 PM Felipe Balbi <balbi@kernel.org> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Fri, Oct 29, 2021 at 7:48 AM Felipe Balbi <balbi@kernel.org> wrote:
> >> Andy Shevchenko <andy.shevchenko@gmail.com> writes:

...

> >> > Capital L will be better to read and understand the
> >> > abbreviation. Actually usually we do something like this:
> >> >
> >> > Extensible Boot Loader (EBL)
> >>
> >> nah, this is silly Andy. It's just capitalized as eXtensible Boot
> >> Loader, very much akin to eXtensible Host Controller Interface.
> >
> > My point here is to have a full name followed by the abbreviation. and
> > n(O)t in (F)ancy st(Y)le.
>
> too bad my patch removing acronyms from the kernel got rejects :-p
>
> Seriously, this is pretty pointless. You're vouching for something that
> will just cause confusion. Every piece of internal documentation refers
> to xbl and you want this to be renamed to ebl because it looks nicer for
> you. Thanks, but no thanks.

Maybe I was too unclear. I'm not pushing for EBL, I'm pushing for the form os

"Foo bAr BullSh*t (FABS)" vs. "(F)oo b(a)r (B)ull(s)h*t".

If you have x there to be capitalized, do it like "eXtensible Boot
Loader (XBL)". Is it too hard?

...

> >> >  +static const struct attribute_group inputs_attr_group = {
> >> >  +       .attrs = inputs_attrs,
> >> >  +};
> >> >  +
> >> >  +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
> >> >  +{
> >> >  +       return readb(base + offset);
> >> >  +}
> >> >  +
> >> >  +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
> >> >  +{
> >> >  +       return readw(base + offset);
> >> >  +}
> >> >
> >> > Either use corresponding io accessors in-line, or make first parameter
> >> > to be sirface_xbl pointer. Otherwise these helpers useless.
> >>
> >> I agree with passing surface_xbl point as first parameter, but calling
> >> the accessors pointless is a bit much. At a minimum, they make it easier
> >> to ftrace the entire driver by simply ftracing surface_xbl_*
> >
> > My point is that the above seems half-baked. It's pointless to have a
> > func(a,b) { return readl(a + b); }. It doesn't add value.
>
> sure it does. echo surface_xbl_* > ftrace_filter_function (or whatever
> the filename was) it reason enough IMHO. Not to mention that these
> little accessors will likely be optimized by the compiler.

readl() will appear in the traces, no? But yeah I also was thinking
about the weakness in your argument that the compiler can silently
inline them anyway.

-- 
With Best Regards,
Andy Shevchenko
