Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F51C32CC7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbhCDGOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbhCDGOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:14:43 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF8DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:14:03 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d8so5113866plg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JMf0oYw54Ty2bOfPG3m/Nvn4kAT7uR9ncRyApQL8Vyo=;
        b=b44nBrdqOAU6EGHYgU7UpgTvqXfZ61tr9FyNRS5LeLSzIAk3tZ3ikMbRkdVTihrPup
         6PSzrWF6far8bQ01TE1GOcuf+gxMvsFEln5XiWkgX0mh1yA4Y3PyJQc3MnJV9C/A+b+9
         gc3SqlF6FdnJJOxXgH2oG4zXfgjsTuCqhDAXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JMf0oYw54Ty2bOfPG3m/Nvn4kAT7uR9ncRyApQL8Vyo=;
        b=LXTC3zAg5B63YpD0gnFZlviJSzfgCEYHcP2u7+g7wZ4mpm2+6YjK7S1HzAPJ/4inxi
         FeGvSKRFhyoODMeNVjhcjKNvMQigAKkeHQuBeTVdpZ6Mq+wAdh2I/55yDh2zi0gDrhHQ
         eH5QM5gwBfz2FvnDg+E7Wi4wIoxvzCsecPeoUizUX/3CZojFf/YdC7CluHq5cs+F/86D
         KTB5+U3bJuWsoCyGI7xM8l00glZTz9Y5S1GCqmEZObL7rr8+Ii8EQJbQhjxnyshO0EXR
         4u6KIux0A42AJ2vtQNa+VYsGBWp4x7W7nvZ/siUAb+tJeBcaYIfpCCirr6zwClO1mSv6
         nTRw==
X-Gm-Message-State: AOAM5316PdtzbG+UQN14FDkA2ShGBo9DgG8YK1cluPtWaoT76T6MPSfB
        pL2cw93j1g4ZAsoWlYjztjQLsw==
X-Google-Smtp-Source: ABdhPJyfuEDJrfmm6azs2dCtl+S62mzbbw8Dy6nnA5zhX9Lr/9Bijk3lGv0K7z2QMyH8l9fxdBUDvg==
X-Received: by 2002:a17:90a:ea96:: with SMTP id h22mr2628625pjz.24.1614838443190;
        Wed, 03 Mar 2021 22:14:03 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id w1sm7952784pjq.38.2021.03.03.22.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:14:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org>
References: <20210223214539.1336155-1-swboyd@chromium.org> <20210223214539.1336155-7-swboyd@chromium.org> <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org>
Subject: Re: [PATCH 6/6] firmware: qcom_scm: Only compile legacy calls on ARM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
Date:   Wed, 03 Mar 2021 22:14:00 -0800
Message-ID: <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2021-03-03 19:35:08)
>=20
> On 2/23/2021 1:45 PM, Stephen Boyd wrote:
> > These scm calls are never used outside of legacy ARMv7 based platforms.
> > That's because PSCI, mandated on arm64, implements them for modern SoCs
> > via the PSCI spec. Let's move them to the legacy file and only compile
> > the legacy file into the kernel when CONFIG_ARM=3Dy. Otherwise provide
> > stubs and fail the calls. This saves a little bit of space in an
> > arm64 allmodconfig >
> >   $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
> >   add/remove: 0/8 grow/shrink: 5/7 up/down: 509/-4405 (-3896)
> >   Function                                     old     new   delta
> >   __qcom_scm_set_dload_mode.constprop          312     452    +140
> >   qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
> >   qcom_scm_io_writel                           288     408    +120
> >   qcom_scm_io_readl                            376     492    +116
> >   __param_str_download_mode                     23      28      +5
> >   __warned                                    4327    4326      -1
> >   qcom_iommu_init                              272     268      -4
> >   e843419@0b3f_00010432_324                      8       -      -8
> >   qcom_scm_call                                228     208     -20
> >   CSWTCH                                      5925    5877     -48
> >   _sub_I_65535_1                            163100  163040     -60
> >   _sub_D_65535_0                            163100  163040     -60
> >   qcom_scm_wb                                   64       -     -64
> >   qcom_scm_lock                                320     160    -160
> >   qcom_scm_call_atomic                         212       -    -212
> >   qcom_scm_cpu_power_down                      308       -    -308
> >   scm_legacy_call_atomic                       520       -    -520
> >   qcom_scm_set_warm_boot_addr                  720       -    -720
> >   qcom_scm_set_cold_boot_addr                  728       -    -728
> >   scm_legacy_call                             1492       -   -1492
> >   Total: Before=3D66737642, After=3D66733746, chg -0.01%
> >=20
> > Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and
> > legacy conventions") didn't mention any motivating factors for keeping
> > the legacy code around on arm64 kernels, i.e. presumably that commit
> > wasn't trying to support these legacy APIs on arm64 kernels.
>=20
> There are arm targets which support SMCCC convention and use some of=20
> these removed functions. Can these functions be kept in qcom-scm.c and=20
> wrapped with #if IS_ENABLED(CONFIG_ARM)?
>=20

It can be wrapped in qcom-scm.c, but why? It's all the same object file
so I'm lost why it matters. I suppose it would make it so the struct
doesn't have to be moved around and declared in the header? Any other
reason? I moved it to the legacy file so that it was very obvious that
the API wasn't to be used except for "legacy" platforms that don't use
PSCI.
