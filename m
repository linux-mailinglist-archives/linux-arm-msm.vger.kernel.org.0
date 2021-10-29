Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B0943F94F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 10:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhJ2JAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 05:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhJ2JAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 05:00:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE07EC061570;
        Fri, 29 Oct 2021 01:57:55 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w1so17397764edd.0;
        Fri, 29 Oct 2021 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIjcrUqHtWhKxyVJiyTFwpHjZKAKU+hvaZr8ovt9D+g=;
        b=FEzRq4GXzOnhMDFOTm6Nmk3VzViYKFMbqthEuUK2wsaIB1+0m2dsjLLrA6RlljEdvt
         4dK+DjFwbphOuDMekm+U9QwqE0CZXp0SqIVprfoLlmq/pOy7P+7e7KDBgJlGx/2KqZwT
         D94go9OutP9aTDSUIBKiNli00EKP9y8QPrNrBwBsC9HWtkA88crExmnZVs5y8gYUFGY1
         SFvP/0A/HwlM7uS2yufCkZ43Skb34IIq7AXRZR3CEZLflkkBw/6qeE6k9PAAj0uZ8KNy
         vjPwtzrrMFcowBSBqwOWCI48rGbMuLtlUKV8HmwpCGDqohpjxG+Ar2xblL7FHJdCqNhD
         W32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIjcrUqHtWhKxyVJiyTFwpHjZKAKU+hvaZr8ovt9D+g=;
        b=PAA3taKr0JH9L8RlIs8kWBkw8QrGlHOxWo+6N5tJPRW7ZN9ce3JnjEO+jocY3GhP4/
         o3+yTAVlCtrhMrNc2VlaLO2n1VLqY25uSr1WKy/0zpDxZr62OyyRhGJFLT/ds3i4CPP5
         sAxv0yCNvd/ouSytSKWeeKySxnu1PU2EkKF2nPmir42Hf/Qy5lhUeM0I1A9TVEhxGjB8
         CCZb48DrY7rXXzc5jMl1/cgBcetcLg/b8mK/DQBBB0t9Mas5iYs/Gb35xwXkVOa1cJ0S
         rm1JJyHkfEVRVWMPfOo/d2lINzldH9EwZ0qLuiszzjsAMALsdNcxKR1CVtUid6Si34XY
         Ay4w==
X-Gm-Message-State: AOAM532WhH1fLifgNzIDBm3SY6+RccSXIRojZT91dcEHPj0HHbniHYgQ
        GO0U5Zbic+45/QtrAS6Tb6F+THdNcRPCZIfmXEc=
X-Google-Smtp-Source: ABdhPJyco3f4t3HCaZMFI+/LYJq8w/Z6wGPGHXZ7sA8fx01gtfcHgx3TLUT1XFwj1KXGvRMzNgqza4kz5JrQbv+Perg=
X-Received: by 2002:aa7:da05:: with SMTP id r5mr13337068eds.238.1635497874000;
 Fri, 29 Oct 2021 01:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com> <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
 <87fsskqvvc.fsf@kernel.org>
In-Reply-To: <87fsskqvvc.fsf@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Oct 2021 11:57:17 +0300
Message-ID: <CAHp75VdHpHMp7X=8WcVbSUaT3pfxo-ZOTQ0BwdQqD09bJ2ddKg@mail.gmail.com>
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

On Fri, Oct 29, 2021 at 7:48 AM Felipe Balbi <balbi@kernel.org> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:

...

> > Capital L will be better to read and understand the
> > abbreviation. Actually usually we do something like this:
> >
> > Extensible Boot Loader (EBL)
>
> nah, this is silly Andy. It's just capitalized as eXtensible Boot
> Loader, very much akin to eXtensible Host Controller Interface.

My point here is to have a full name followed by the abbreviation. and
n(O)t in (F)ancy st(Y)le.

...

> >  +static const struct attribute_group inputs_attr_group = {
> >  +       .attrs = inputs_attrs,
> >  +};
> >  +
> >  +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
> >  +{
> >  +       return readb(base + offset);
> >  +}
> >  +
> >  +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
> >  +{
> >  +       return readw(base + offset);
> >  +}
> >
> > Either use corresponding io accessors in-line, or make first parameter
> > to be sirface_xbl pointer. Otherwise these helpers useless.
>
> I agree with passing surface_xbl point as first parameter, but calling
> the accessors pointless is a bit much. At a minimum, they make it easier
> to ftrace the entire driver by simply ftracing surface_xbl_*

My point is that the above seems half-baked. It's pointless to have a
func(a,b) { return readl(a + b); }. It doesn't add value.

-- 
With Best Regards,
Andy Shevchenko
