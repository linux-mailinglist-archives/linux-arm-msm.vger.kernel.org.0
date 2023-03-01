Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50786A7705
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 23:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjCAWqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 17:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjCAWqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 17:46:48 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF3819F13
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 14:46:47 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id c19so16129667qtn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 14:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P9KlPRdN24U2nZifrh47RGztoR1RSBxdmlJs02laf8=;
        b=d4/myq9vduzzfqGKUrqatHviSOUeyfGXpmI1wLVtbkU4eLFrheTw9Jay/aWkkAqcIQ
         lrVJ1ygEX23dReHZKRse+tyC0N0jsJPrhKg+ZPVMerXand+RXspxh0OSYNmmhGbSaoRU
         jDGcG8u2dBXbZc7ICYCAadTkuohw55nv0o54s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P9KlPRdN24U2nZifrh47RGztoR1RSBxdmlJs02laf8=;
        b=X2ss9OlXHQpCZV6iY+12Sy/JRnUHj026f/GFjkhON7n/At6pcQiNpKOtMc+J3jQ9Q8
         wLatEetTr1ieiYaKkAySjOpfrpB65G/C36aEbAUuIlp/TWCwPzLsQoIxKZwUI617VxMj
         PnTWXPSvGVZXUb3lpmHmmWyWIpACptRRUlblaaRDAwkS7IDwU8S6s1ogaUi5Wq62MOXO
         QDlg8q6fF2QMsfK6tRfXottfZhipP8rkNQARK6aa6CQESQvk8O0SyV4pUGDucWGQOmS4
         SDOvdTg/bTN/jIc9bR9M8kwB8qK957HGjvWXxmVt263jAdIqUnmk0jZ6b2bm+VW7hMpJ
         TdbQ==
X-Gm-Message-State: AO0yUKWVnIeEBEdDTeJKEc4lYpNZo6FxuFcLxSv/U8xOumG5qDf6ESL0
        VW/nbJe20Fqj5lN75hh8JqPUMi64BWFbBIZO
X-Google-Smtp-Source: AK7set8+oUA6MdVsyrj7+22/MG4T0KGSrZTejqN4Vx4S1DR8W3o8nm51wdt7FmfsFyYdE93QYnz0fQ==
X-Received: by 2002:a05:622a:60f:b0:3bf:d87d:4945 with SMTP id z15-20020a05622a060f00b003bfd87d4945mr14855681qta.18.1677710806285;
        Wed, 01 Mar 2023 14:46:46 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id s13-20020a05622a018d00b003bfa8e1b7d1sm9228764qtw.32.2023.03.01.14.46.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 14:46:45 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536cb25982eso392202337b3.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 14:46:45 -0800 (PST)
X-Received: by 2002:a5d:8919:0:b0:74a:f35:ca88 with SMTP id
 b25-20020a5d8919000000b0074a0f35ca88mr3594955ion.2.1677710416683; Wed, 01 Mar
 2023 14:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20230127104054.895129-1-abel.vesa@linaro.org> <Y9v/z8CYik3faHh7@google.com>
 <Y+ErWTyV8CnE3Hl+@linaro.org> <Y+E3T6bozU1K2sFb@google.com>
 <Y+E9Z+/+eCpPK6DE@linaro.org> <CAGETcx99ev_JdgYoifEdUg6rqNCs5LHc-CfwTc7j3Bd_zeizew@mail.gmail.com>
 <CAD=FV=X3nnwuTK2=w7DJfjL_Ai7MiuvTwv8BiVJPMVEWKzR-_g@mail.gmail.com>
 <CAGETcx-LJEZAXT1VazhRf7xtNpST0tfLNmgxH878gkOOP4TDAw@mail.gmail.com>
 <CAD=FV=WG1v4U5iQirG=-ECZFtXE=hwL=oY+6zjsu6TWCiBX=QA@mail.gmail.com> <20230220171550.43a3h56gznfc3gec@ripper>
In-Reply-To: <20230220171550.43a3h56gznfc3gec@ripper>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 1 Mar 2023 14:40:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UmbBOPAg6d-G=XpEyf0Sk=dmrp7wuthn1Cx+DmB1gvGQ@mail.gmail.com>
Message-ID: <CAD=FV=UmbBOPAg6d-G=XpEyf0Sk=dmrp7wuthn1Cx+DmB1gvGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] PM: domains: Skip disabling unused domains if
 provider has sync_state
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 20, 2023 at 9:12=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> > I suspect that here we'll have to agree to disagree. IMO it's a
> > non-goal to expect hardware to work for which there is no driver. So
> > making the backlight work without a backlight driver isn't really
> > something we should strive for.
> >
>
> Without trying to make you agree ;)
>
> How can you differentiate between "the driver wasn't built" and "the
> driver isn't yet available"?

BTW, when I was responding to Saravana's series [1], I realized that
you _can_ differentiate between these two cases, at least from a
practical point of view. Specifically, when the
"deferred_probe_timeout" expires then you should assume that "the
driver wasn't built". Said another way, once the
"deferred_probe_timeout" expires then you should assume that the
driver won't be available in the future. While you still could try
loading it, in general once that timeout has expired the kernel has
made decisions (like making -EPROBE_DEFER non-retriable) that make it
very awkward to load new drivers.

Of course, one could say "hey, let's get rid of the
deferred_probe_timeout". That might be a tough sell unless you can
come up with an equivalent solution for those currently using this
feature.

[1] https://lore.kernel.org/r/CAD=3DFV=3DXQnLpD1P8sRBcizTMjCQyHTjaiNvjcPdgy=
Zc5JCzvOtw@mail.gmail.com


> Consider the case where I boot my laptop, I have some set of builtin
> drivers, some set of drivers in the ramdisk and some set of drivers in
> the root filesystem.
>
> In the event that something goes wrong mounting the rootfs, I will now
> be in the ramdisk console. Given the current timer-based disabling of
> regulators, I have ~25 seconds to solve my problem before the backlight
> goes blank.

I personally don't love the timeout. It feels like the kind of thing
that userspace knows and should be able to tell the kernel. I know we
don't like to put impositions on userspace, but userspace is pretty
definitely involved in things like loading modules. It just makes
sense (in my mind) for userspace to say when it's done and all modules
for cold-plugged devices have been loaded...

-Doug
