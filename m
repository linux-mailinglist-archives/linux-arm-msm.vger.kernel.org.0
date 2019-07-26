Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D7376BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 16:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfGZOb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 10:31:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34182 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfGZOb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 10:31:26 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so105244875iot.1;
        Fri, 26 Jul 2019 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZ/UBeNiBanOLKs9K5WAA6k/h0iDCXstzGMvYChhbN8=;
        b=Qkr83lkT49ARvGJVqpIAVKE+c3OskLUv7tZduSwYle/0YBDI1fhM3M35Dcm10CPOD6
         oGBJhLWanlvfEu/PCaAedYdFu3iFX9GnV0PyK5Gcoz6j0Y5iEEBn3sYWFz5Hd+F2arb0
         T2sokMAFO0/Sygfx4x/RYdUfRKTMg+sJlzbw2E0TxCmNd95v35OovB5jQws5FGWwQVKp
         tGbHGXnypMThoSExSEfOyJyB0uds+q5lX9GPtaJeVTzfIjhGoFtp10AqYWIz/UUmowJr
         MnV9vSAvagmcnnWHdHv8NZVXwoR9uoiCBznhNgb6GaRVLk+lD2nfRmPOfcHfvK9a+HV/
         4NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZ/UBeNiBanOLKs9K5WAA6k/h0iDCXstzGMvYChhbN8=;
        b=PoONsJBRJGh19vgP30/rfsPxo1wnj6wMzIxTW5s7UKHt3Tsd8/EP6tFZfsb5islFvO
         VfboKd16KPUKdyPCJ7t6C9q9MbB7Mufx2kW/KzQHkaP6u5JcWjvk0R+QP9ydXnfk4VRs
         IAhJ0buEYTTEB4rAxDowiM6MD3Z3i3y6r+r0jrMmmIvY/FH8BTnI5f0GqJoTei7CImkB
         MWT+l+gdjlqr/G2pK0fnJBGezz1JyeOP84qo/zQ4jMxGXKlN6urdXgmG6/FZLMsPyhGY
         fd76lPvCmUwY2CqVDTSPuLeij/J/MjQwufIOXhnFJNzcVWPkT34CfJejb6/9eZJUnwRo
         VLVw==
X-Gm-Message-State: APjAAAWWCW2C8d1/q7UCRetIifjAZ5tqdrQqGDTaJ6PmSwtnfLHjPCYO
        WhMUgybSN/82qq6/ryJ/ktnHRZ1Q+S8fr6KX99Q=
X-Google-Smtp-Source: APXvYqyoFusi9rRAzb8Sz4ryxauK7V4EPDxozJDRC9Dy92L8oHNobVWt0IqcIZkUd2t5E2rbe4hpr1GOx/+E7EEzITA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr13636701ioi.42.1564151485320;
 Fri, 26 Jul 2019 07:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com> <20190726123625.GA17037@ravnborg.org>
In-Reply-To: <20190726123625.GA17037@ravnborg.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 26 Jul 2019 08:31:15 -0600
Message-ID: <CAOCk7NqU7G-afjHwTnQxqrRFcH9=kqDJAUABPHuwRWsdm6xENQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, thierry.reding@gmail.com,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 26, 2019 at 6:36 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> On Mon, Jul 08, 2019 at 09:56:47AM -0700, Jeffrey Hugo wrote:
> > The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
> > or Sharp option.  This likely provides options during manufacturing.
> >
> > These panels connect via eDP, however they sit behind a DSI to eDP
> > bridge on the laptop, so they can easily be handled by the existing
> > simple panel code.
> >
> > This series adds support for the Sharp option.
> >
> > v2:
> > -removed no-hpd from dt example
> > -added .bus_format and .bus_flags fields based on reviews
> > -added .flags after Bjorn pointed me to something I missed
> > -added Sam's reviewed-by tags
> >
> > Jeffrey Hugo (2):
> >   dt-bindings: panel: Add Sharp LD-D5116Z01B
> >   drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
>
> Thanks.
> Both patches applied and pushed to drm-misc-next.

Excellent.  Thanks

> Are you up to a little janitorial work?
> Today the preferred format for bindings files are the new yaml format.
> Could you update 'your' file, and maybe the other sharp files too?

I confess I haven't yet familiarized myself with the yaml format yet,
but I'll take a look and do an update once I understand the
requirements.
