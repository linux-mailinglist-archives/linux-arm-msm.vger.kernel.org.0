Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9461A3E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 23:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiKDWIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 18:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKDWIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 18:08:36 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E667AFCE1
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 15:08:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id t25so16679683ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUWMpfCp8yMYMN27hOBTPmmaRDIODrfLy/QYyrxVC9U=;
        b=N/5MobyCqMqaDHUf0VYAeGDlaShVI6gW3R/fr1tLkTjRzSd0mrwTwe6AgO1bc6rMAQ
         vGqaYuhfvQ82vWTraoh76WIR9XOumQyzsOIhiQlm7A5wwEuKKd3o4BWpzigWjyVJAaHB
         lXa1OaNbz5gonB88NC84ox0/3fAaw8jeOZ6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUWMpfCp8yMYMN27hOBTPmmaRDIODrfLy/QYyrxVC9U=;
        b=e0QWHNpFdBEtVSmotWq2+LhTMGUjKI06xCdAQX1bPrpw+Vnri3J77i+eGH761+HU0r
         CHj/SDWX4YZBvDdk8UE2aHCEgtt/iztGdeJtZC6DNiWv36+0r64yaTNXfsF006m3T7zV
         aDJ9WpSd5mZIlBXkwB/qrgnkk3WTzoQ/spyLKx07Pg5kbY2J4VgS20Pi1ABtf1FfOW1A
         Y/hOIUSQuBmfOpVN7GNkkFUqQiko2FkbNXpyMtAQp0bMee/KdDAtq/V6MK6D/GnA13Nh
         fkZRgEGU/2tMF372MkfU6OAlNrUtfNEaskZbiawDap/9vk2umLDKztEwS8E+Bxtpu9no
         RqYw==
X-Gm-Message-State: ACrzQf2WdI/UK+hlIPPyNncFmtbcguSeziIUhaJEqGN4JfJuF6MluHP1
        UPis1LspM9jTynQs7d466xChjpjuXHIOCnTa
X-Google-Smtp-Source: AMsMyM4NDUTHsgvt5/kOvmXSy0GcXTvqLhMGoUN93zzAJ2da+SbaR8HUg7pDC6utQtLcTgfbi+gxow==
X-Received: by 2002:a17:906:6a17:b0:794:f0e8:1918 with SMTP id qw23-20020a1709066a1700b00794f0e81918mr36933601ejc.474.1667599713216;
        Fri, 04 Nov 2022 15:08:33 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906829300b007abaff3a97asm53447ejx.221.2022.11.04.15.08.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 15:08:30 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso6229989wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 15:08:29 -0700 (PDT)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr25419745wml.57.1667599706005; Fri, 04
 Nov 2022 15:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid> <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
In-Reply-To: <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Nov 2022 15:08:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSh90tdSDaxThoGaE_uYWPTMrGYBMM0UqcH=HUZaScNg@mail.gmail.com>
Message-ID: <CAD=FV=VSh90tdSDaxThoGaE_uYWPTMrGYBMM0UqcH=HUZaScNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: lpass-sc7180: Fix pm_runtime usage
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 4, 2022 at 2:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-11-04 06:56:29)
> > The sc7180 lpass clock controller's pm_runtime usage wasn't broken
> > quite as spectacularly as the sc7280's pm_runtime usage, but it was
> > still broken. Putting some printouts in at boot showed me this (with
> > serial console enabled, which makes the prints slow and thus changes
> > timing):
> >   [    3.109951] DOUG: my_pm_clk_resume, usage=1
> >   [    3.114767] DOUG: my_pm_clk_resume, usage=1
> >   [    3.664443] DOUG: my_pm_clk_suspend, usage=0
> >   [    3.897566] DOUG: my_pm_clk_suspend, usage=0
> >   [    3.910137] DOUG: my_pm_clk_resume, usage=1
> >   [    3.923217] DOUG: my_pm_clk_resume, usage=0
> >   [    4.440116] DOUG: my_pm_clk_suspend, usage=-1
> >   [    4.444982] DOUG: my_pm_clk_suspend, usage=0
> >   [   14.170501] DOUG: my_pm_clk_resume, usage=1
> >   [   14.176245] DOUG: my_pm_clk_resume, usage=0
> >
> > ...or this w/out serial console:
> >   [    0.556139] DOUG: my_pm_clk_resume, usage=1
> >   [    0.556279] DOUG: my_pm_clk_resume, usage=1
> >   [    1.058422] DOUG: my_pm_clk_suspend, usage=-1
> >   [    1.058464] DOUG: my_pm_clk_suspend, usage=0
> >   [    1.186250] DOUG: my_pm_clk_resume, usage=1
> >   [    1.186292] DOUG: my_pm_clk_resume, usage=0
> >   [    1.731536] DOUG: my_pm_clk_suspend, usage=-1
> >   [    1.731557] DOUG: my_pm_clk_suspend, usage=0
> >   [   10.288910] DOUG: my_pm_clk_resume, usage=1
> >   [   10.289496] DOUG: my_pm_clk_resume, usage=0
> >
> > It seems to be doing roughly the right sequence of calls, but just
> > like with sc7280 this is more by luck than anything. Having a usage of
> > -1 is just not OK.
> >
> > Let's fix this like we did with sc7280.
>
> Any Fixes tag?

Ah, right. I guess the most obvious one is actually:

Fixes: ce8c195e652f ("clk: qcom: lpasscc: Introduce pm autosuspend for SC7180")

That's what got us going negative. One could _sorta_ make the argument
for a "Fixes" tag all the way to the start of the driver, though. The
driver never did a pm_runtime_get() during probe and so there was (I
guess) a chance that some of the bare register writes in probe could
have been unclocked. I'm not aware of that ever being a problem, so I
guess just the above "Fixes" is fine.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks! Yell if you want me to spin a v2 with the Fixes in place.

-Doug
