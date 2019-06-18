Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0308749780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 04:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfFRCaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 22:30:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42271 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfFRCaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 22:30:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id z25so19153202edq.9;
        Mon, 17 Jun 2019 19:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t+K2dK7BB+ZRPcC5GlPxOx9E2uiXydCb4k3N74jOxNw=;
        b=eWt7+9O8Te8FdO0baANBy+PyjNKsRirDGc/YMiULXRAQzbbf46urshe2L4HaunhBDl
         +6dEajtT4AC0XyOBf6LMFpeRYsM4yxgwKlf3hxjlCTRIPQl4IwI90+Gg6hE/Q7Az2O1a
         HqVYcoterlzR1FJwDrO2hAUseHILpm1RB3dhjzGctLJXB9mVs7OjxgfsmJxk2Tkn477c
         WdSUEQnrXD2Pvqs9V1UfG5vCQsQ/cqYFCe5sJGkBml4RCUSyxUFYqxYY7OWDFdNsYMvT
         Ljblp8OTZnRBbwFN1ESgnqCvqurvwsdNa95hg7kzDHzhHDP5L4mz27j5GoblSAC1YdJM
         E3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t+K2dK7BB+ZRPcC5GlPxOx9E2uiXydCb4k3N74jOxNw=;
        b=KSaOkfsLRB2Tk4h5W5SrKwfjApNWC6Qv50PGYCEHbFfb11wzBRcmKTIP+HYoUTGd2G
         I/8Aq0lHdIXPZde5rWX5g2MKGrfMGA1Di1I9h1loubApNvdPrskLFgnb1N0NmN+2qMAe
         JaSWA2y59FX99bj5Lto38dKbpxEiptBUdin7SI2UiUT5Do2LFaoBlKmopWsGEtAIKowa
         mLf6KHJtiqojubJJZGPVS8Q1ZgvV2wEhY9OxenrqCd0+8EnVDcUZzBHZAHJwkNmFWRZy
         2hOhRTRRp7JjBpvkBPyw+pXtOKyu1ZomAXXHmiWmAF3LA6skcFzc31V7YS0TWj25OLuU
         GGsQ==
X-Gm-Message-State: APjAAAWmJeg1ZPopvhG8kITTMoScB8VLRmZOHkRL42i9+Uifl8dr9Snn
        ogd6Sr/AAhb9e9mccVn//8R5btB10m0evZp5gAE=
X-Google-Smtp-Source: APXvYqygOwpTD9IA5CyUz2wEgTceJDuw085NFm3Qof/qmK4dkSGOHrK44tOaUF27/hs7YV0dS75TPtWBLPZe5g0GQeI=
X-Received: by 2002:a50:cbc4:: with SMTP id l4mr89273565edi.264.1560825002272;
 Mon, 17 Jun 2019 19:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-6-masneyb@onstation.org>
 <20190616174106.GO22737@tuxbook-pro> <20190618020200.GB22330@onstation.org>
In-Reply-To: <20190618020200.GB22330@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 17 Jun 2019 19:29:47 -0700
Message-ID: <CAF6AEGsoPNL52h5gEHP8UtmD9_MhX89E=aWiPZXS7zepykEMFA@mail.gmail.com>
Subject: Re: [PATCH 5/6] soc: qcom: add OCMEM driver
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        David Brown <david.brown@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 7:02 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Hi Rob Clark,
>
> On Sun, Jun 16, 2019 at 10:41:06AM -0700, Bjorn Andersson wrote:
> > > diff --git a/drivers/soc/qcom/ocmem.xml.h b/drivers/soc/qcom/ocmem.xml.h
> >
> > I would prefer that these lived at the top of the c file, rather than
> > being generated.
>
> I think it would be nice to make this change as well.
>
> Rob C: Your original file ocmem.xml.h was licensed under the MIT
> license. I just wanted confirmation from you that it's OK to put
> the contents of that file into ocmem.c which has the GPL 2.0 only
> SPDX license tag. This will relicense the work. I imagine it's not
> an issue but I just wanted to get confirmation so there is no
> ambiguity regarding the licensing in the future.

fine by me.. I defaulted to generated headers since that is extremely
useful for gpu side of things (and userspace stuff defaults to MIT),
but probably overkill for ocmem which just has a handful of registers
(and no need for decoding userspace blob cmdstream dumps)

BR,
-R


>
> Brian
>
>
> >
> > > new file mode 100644
> > > index 000000000000..b4bfb85d1e33
> > > --- /dev/null
> > > +++ b/drivers/soc/qcom/ocmem.xml.h
> > > @@ -0,0 +1,86 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +
> > > +#ifndef OCMEM_XML
> > > +#define OCMEM_XML
> > > +
> > > +/* Autogenerated file, DO NOT EDIT manually!
> > > +
> > > +This file was generated by the rules-ng-ng headergen tool in this git repository:
> > > +http://github.com/freedreno/envytools/
> > > +git clone https://github.com/freedreno/envytools.git
> > > +
> > > +The rules-ng-ng source files this header was generated from are:
> > > +- /home/robclark/src/freedreno/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2015-09-24 17:30:00)
> > > +
> > > +Copyright (C) 2013-2015 by the following authors:
> > > +- Rob Clark <robdclark@gmail.com> (robclark)
> > > +*/
