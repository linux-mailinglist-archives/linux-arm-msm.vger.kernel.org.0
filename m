Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209E8688783
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 20:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjBBTZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 14:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjBBTZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 14:25:45 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D8D6F720
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 11:25:44 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id k2so1581302qvd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 11:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXDOSIgEEoHR6xTZYXK64ggEfAX9oGh0xr53bP11U+I=;
        b=L8jTekOKG7ZkdA59DuF4ggneg4XbzgOCkCPGFxmBkHXzkeKPFn1dHq8BsBArzQ70lM
         xMv/JuswS+sNL9Ef+sdqxPdJyZfAR/afJyB7Bn0di3cCO53pWQjCpvKm6Jun/fRWlUL4
         iUYvhfpGl3yRUBIl+3e+5eUTvQworRHZo1vrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXDOSIgEEoHR6xTZYXK64ggEfAX9oGh0xr53bP11U+I=;
        b=Re4zlT4KeFHrVprKdAeFSDzuEkArW2ZyjiqPOX7LdToSAimOLZcu7z/yGxFcQzNRDU
         RUvi/lrvmwnBS/pu2DgVkwHWmgfSTy/qPae2iy/7fGcKT9QUjm3QdMuiWiZL1Yxb8hM4
         eigh3bnO27oDaB0H+zB/Zx40MKuSqWZ0ViXN1RRtC/9VTq8GvmLm1jPMXzqdUcIVdv2u
         /fRMqgd14JWyB8fCtH8Us5goYMkMrPqEM1aE89K0EJPyb1UhgHdOoeBlb2VK9nQwDDhb
         XAfKJ/csgqMMPyb9BgwWjEFH6vmpfG1eAgTTJHcxHRSF+YLwqUVbKqDQvqOQoKZNcfVy
         2jNw==
X-Gm-Message-State: AO0yUKWS3YwpYgdl7sGKW+2kkB+gLPVSY+ZxI5kSD0RmEZxBM8MFiEV6
        djAIURzl5aKOPA50pm5f9Kx7cwIWo048WfuB
X-Google-Smtp-Source: AK7set8YLRlyikerhIzmXdIPqbd/XSyo5dnWs5gzGBKaJutLhc8xVs7thv2textjgjK1e1Bh52qNGg==
X-Received: by 2002:ad4:4150:0:b0:557:a5c5:7dfc with SMTP id z16-20020ad44150000000b00557a5c57dfcmr4435517qvp.20.1675365942694;
        Thu, 02 Feb 2023 11:25:42 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 71-20020a37034a000000b00706c1fc62desm261964qkd.112.2023.02.02.11.25.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 11:25:42 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5063029246dso40045577b3.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 11:25:42 -0800 (PST)
X-Received: by 2002:a25:ab2e:0:b0:862:2861:6e7b with SMTP id
 u43-20020a25ab2e000000b0086228616e7bmr168861ybi.211.1675365619797; Thu, 02
 Feb 2023 11:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20230127104054.895129-1-abel.vesa@linaro.org> <Y9v/z8CYik3faHh7@google.com>
In-Reply-To: <Y9v/z8CYik3faHh7@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Feb 2023 11:20:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XsiANcf1bp9aVuiQsDD8cRO=yzWMW7pffHwv9D9djvfw@mail.gmail.com>
Message-ID: <CAD=FV=XsiANcf1bp9aVuiQsDD8cRO=yzWMW7pffHwv9D9djvfw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] PM: domains: Skip disabling unused domains if
 provider has sync_state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
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
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
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

On Thu, Feb 2, 2023 at 10:24 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Abel,
>
> On Fri, Jan 27, 2023 at 12:40:53PM +0200, Abel Vesa wrote:
> > Currently, there are cases when a domain needs to remain enabled until
> > the consumer driver probes. Sometimes such consumer drivers may be built
> > as modules. Since the genpd_power_off_unused is called too early for
> > such consumer driver modules to get a chance to probe, the domain, since
> > it is unused, will get disabled. On the other hand, the best time for
> > an unused domain to be disabled is on the provider's sync_state
> > callback. So, if the provider has registered a sync_state callback,
> > assume the unused domains for that provider will be disabled on its
> > sync_state callback. Also provide a generic sync_state callback which
> > disables all the domains unused for the provider that registers it.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >
> > This approach has been applied for unused clocks as well.
> > With this patch merged in, all the providers that have sync_state
> > callback registered will leave the domains enabled unless the provider's
> > sync_state callback explicitly disables them. So those providers will
> > need to add the disabling part to their sync_state callback. On the
> > other hand, the platforms that have cases where domains need to remain
> > enabled (even if unused) until the consumer driver probes, will be able,
> > with this patch in, to run without the pd_ignore_unused kernel argument,
> > which seems to be the case for most Qualcomm platforms, at this moment.
>
> I recently encountered a related issue on a Qualcomm platform with a
> v6.2-rc kernel, which includes 3a39049f88e4 ("soc: qcom: rpmhpd: Use
> highest corner until sync_state"). The issue involves a DT node with a
> rpmhpd, the DT node is enabled, however the corresponding device driver
> is not enabled in the kernel. In such a scenario the sync_state callback
> is never called, because the genpd consumer never probes. As a result
> the Always-on subsystem (AOSS) of the SoC doesn't enter sleep mode during
> system suspend, which results in a substantially higher power consumption
> in S3.
>
> I wonder if genpd (and some other frameworks) needs something like
> regulator_init_complete(), which turns off unused regulators 30s after
> system boot. That's conceptually similar to the current
> genpd_power_off_unused(), but would provide time for modules being loaded.

Just for completeness, there are at least a few other similar concepts
in the kernel where the kernel needs to decide that it's going to stop
waiting for modules to show up and it just shuts off anything that's
unused. The other one that jumps to the top of my head is related to
"driver_deferred_probe_timeout". There we give 10 seconds (by default)
for userspace to load modules. After that point in time we start
returning errors instead of waiting longer. You can even see that the
default depends on whether "CONFIG_MODULES" is set.

-Doug
