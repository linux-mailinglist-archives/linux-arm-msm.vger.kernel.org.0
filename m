Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 634996889A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 23:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjBBWVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 17:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbjBBWVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 17:21:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DA779604
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 14:21:32 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v10so3509736edi.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rH/CjhyJNQEwSLrMEM5qNeWkTDcedq7ualEg2lSdsU=;
        b=JbqhA0mQfqbApQUxfJfjEi2rhBeSz4DbzvSgMyiMmWx5+JOA4UYTKPNmfz9DncqGdN
         YYa41TQAvUJ1wPOkB72GfIGx/XYwx7/mGiIZFq98ZcMFbN2M8Nfhi4dkjExDrVeiK6d/
         KAGyheGjIZCt3wkKCXOyhNBtOp+YwLeSVUpSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rH/CjhyJNQEwSLrMEM5qNeWkTDcedq7ualEg2lSdsU=;
        b=N+UUgiJe1Rds7OwxqInn+0kwKR5SdVSe0o6FxFDqU7MhnsEzL2cfn9PkLTnMec9HpE
         KWf/2idcQ1mtxD+qsrR1vHoZFjV2UIxRAXLWAm0d/UAXReYEsruTrqNK9+jPy6BYIVTK
         DZkek1wieMTl5/VjSRKUZif5po5H1RYsrIdYqYVrD9viYfiRlUOBl3fnQVod4O7d1DNJ
         HOCvvqu9UgONp35g4i0F04Y916+9CYgT/aSfoadmqXO9S8IB5+hus0uO7JY8p1H7UJaW
         4WhjCNf1lBszgde+Ve0QKe1XFtK23M03JxentX0qgKSXKaOIi1vKSByTrSO6ogZJBVIK
         4DWw==
X-Gm-Message-State: AO0yUKXgwUmbKDjLB7p4R1ih0clPBZJbNnY/HM/D3kvGb6Y5UD0Rhzyd
        PB3e18Q53bNOQPq2/xGzQhq/U0YZOseiBe5zTqw=
X-Google-Smtp-Source: AK7set/9i3eGglmMccQjFUnubB+USY0RCXeZmMHNzBp1xoEEmvFdL+lGLRMt/hV2f+DwDuXzbXX0mQ==
X-Received: by 2002:a05:6402:248b:b0:46d:35f6:5a9b with SMTP id q11-20020a056402248b00b0046d35f65a9bmr9139721eda.24.1675376491100;
        Thu, 02 Feb 2023 14:21:31 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id u2-20020a509502000000b0049e08f781e3sm306845eda.3.2023.02.02.14.21.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 14:21:29 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4777460wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:21:29 -0800 (PST)
X-Received: by 2002:a05:600c:1912:b0:3d7:fa4a:6827 with SMTP id
 j18-20020a05600c191200b003d7fa4a6827mr247592wmq.188.1675376488834; Thu, 02
 Feb 2023 14:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20230127104054.895129-1-abel.vesa@linaro.org> <Y9v/z8CYik3faHh7@google.com>
 <3826e0e6-bb2b-409d-d1c3-ed361305bce3@linaro.org>
In-Reply-To: <3826e0e6-bb2b-409d-d1c3-ed361305bce3@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Feb 2023 14:20:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ue71nnCEBWSw7A9U0Tzi9pFSqZaQk_5CygakS2j+_tfw@mail.gmail.com>
Message-ID: <CAD=FV=Ue71nnCEBWSw7A9U0Tzi9pFSqZaQk_5CygakS2j+_tfw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] PM: domains: Skip disabling unused domains if
 provider has sync_state
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Feb 2, 2023 at 11:53 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 02/02/2023 20:24, Matthias Kaehlcke wrote:
> > Hi Abel,
> >
> > On Fri, Jan 27, 2023 at 12:40:53PM +0200, Abel Vesa wrote:
> >> Currently, there are cases when a domain needs to remain enabled until
> >> the consumer driver probes. Sometimes such consumer drivers may be built
> >> as modules. Since the genpd_power_off_unused is called too early for
> >> such consumer driver modules to get a chance to probe, the domain, since
> >> it is unused, will get disabled. On the other hand, the best time for
> >> an unused domain to be disabled is on the provider's sync_state
> >> callback. So, if the provider has registered a sync_state callback,
> >> assume the unused domains for that provider will be disabled on its
> >> sync_state callback. Also provide a generic sync_state callback which
> >> disables all the domains unused for the provider that registers it.
> >>
> >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >> ---
> >>
> >> This approach has been applied for unused clocks as well.
> >> With this patch merged in, all the providers that have sync_state
> >> callback registered will leave the domains enabled unless the provider's
> >> sync_state callback explicitly disables them. So those providers will
> >> need to add the disabling part to their sync_state callback. On the
> >> other hand, the platforms that have cases where domains need to remain
> >> enabled (even if unused) until the consumer driver probes, will be able,
> >> with this patch in, to run without the pd_ignore_unused kernel argument,
> >> which seems to be the case for most Qualcomm platforms, at this moment.
> >
> > I recently encountered a related issue on a Qualcomm platform with a
> > v6.2-rc kernel, which includes 3a39049f88e4 ("soc: qcom: rpmhpd: Use
> > highest corner until sync_state"). The issue involves a DT node with a
> > rpmhpd, the DT node is enabled, however the corresponding device driver
> > is not enabled in the kernel. In such a scenario the sync_state callback
> > is never called, because the genpd consumer never probes. As a result
> > the Always-on subsystem (AOSS) of the SoC doesn't enter sleep mode during
> > system suspend, which results in a substantially higher power consumption
> > in S3.
> >
> > I wonder if genpd (and some other frameworks) needs something like
> > regulator_init_complete(), which turns off unused regulators 30s after
> > system boot. That's conceptually similar to the current
> > genpd_power_off_unused(), but would provide time for modules being loaded.
>
> I think the overall goal is to move away from ad-hoc implementations
> like clk_disable_unused/genpd_power_off_unused/regulator_init_complete
> towards the sync_state.
>
> So inherently one either has to provide drivers for all devices in
> question or disable unused devices in DT.

Hmm. I guess I haven't been involved too much in those discussions,
but overall I thought:

1. The device tree should ideally be describing the hardware. Thus if
the hardware is there / available to use on a given board then the
device should be marked enabled.

2. Users are not actually required to enable drivers for all hardware
on their board. Things should still function OK even if a driver is
disabled. For instance, if the SoC had a crypto accelerator you'd
describe it in the device tree but it would be OK for someone to build
a kernel that didn't enable the crypto accelerator driver.

Am I mistaken? Which point did I get wrong, #1, or #2?

-Doug
