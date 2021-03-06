Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9587132F89C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 07:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCFGSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 01:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhCFGSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 01:18:30 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EBFC061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 22:18:30 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso295390pjd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 22:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=uM54gnYDcX3ayLqkvuuLshMpyvf+UdfbwjdQl4fQksU=;
        b=jusMkiMV2XpMVWXf4fdaCpVmkyYQsGdaVPRxEt0j4uokJWuXOjJ4pucBGg5ea/giCG
         0jIBY+Ilgmz+b3QxFfFD45zl6e39nHgXE0sAx1STttyzjcktLswDDNMcXtwsDI89oq4K
         M2W2q26W1UbyUveQP3jgXDh6GmSB85ckxArN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=uM54gnYDcX3ayLqkvuuLshMpyvf+UdfbwjdQl4fQksU=;
        b=F6Qs5LhSTOeEjAVWdvgGphIK5stcwDqRr+YM3zO/svtHXLsZwhhryJuGGugloutzvE
         5JHCw2W8lWlptMF3NNUbzDaqQZNEeMgSf8thDTM7aJgDIpha4Py8rfLnySkFO+6yFc0H
         g04BBx2Q/sMxccEALXs291smq0qYzFSDAcrsSUsHyOzER/hSA0/xByDjyINxASHf4DR8
         FQYee7zdq4+9tXX1gmYL/PDHyuXEg57NMkLs0U4phgLZtaPKlfiGwdjpcVRwAj7Ux+s6
         3YgsIO/jfL500WJb2tHt4ph1goVRIv0leVOJpI97G3y2AodGFa+dBYENwT4iQQ3Ch5Lk
         8JOA==
X-Gm-Message-State: AOAM530Dii/dIGbWMHvgqH40PLpL3O7hDvPcrVIkur91GJrG17KkoD5u
        CuUSuENB1HLNrwJBZvXz3UqPWQ==
X-Google-Smtp-Source: ABdhPJwLYBbsO6cxKPrHO9dtCkg9yMjXKDuDLSsyN+sbKtfvz4pwp78foLhfr2vQ4/ynQtLRRsXn5Q==
X-Received: by 2002:a17:90a:bf91:: with SMTP id d17mr13660408pjs.58.1615011509282;
        Fri, 05 Mar 2021 22:18:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:a907:cdd3:ab4a:ab44])
        by smtp.gmail.com with ESMTPSA id 17sm438823pfb.71.2021.03.05.22.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 22:18:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5ac262bf-a70a-4ca3-01a8-d1432732d26f@codeaurora.org>
References: <20210223214539.1336155-1-swboyd@chromium.org> <20210223214539.1336155-7-swboyd@chromium.org> <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org> <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com> <5ac262bf-a70a-4ca3-01a8-d1432732d26f@codeaurora.org>
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
Date:   Fri, 05 Mar 2021 22:18:27 -0800
Message-ID: <161501150705.1478170.3739297122787060750@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2021-03-05 10:18:09)
> On 3/3/2021 10:14 PM, Stephen Boyd wrote:
> > Quoting Elliot Berman (2021-03-03 19:35:08)
> >>
> >> On 2/23/2021 1:45 PM, Stephen Boyd wrote:
> >>> These scm calls are never used outside of legacy ARMv7 based platform=
s.
> >>> That's because PSCI, mandated on arm64, implements them for modern So=
Cs
> >>> via the PSCI spec. Let's move them to the legacy file and only compile
> >>> the legacy file into the kernel when CONFIG_ARM=3Dy. Otherwise provide
> >>> stubs and fail the calls. This saves a little bit of space in an
> >>> arm64 allmodconfig >
> >>>    $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
> >>>    add/remove: 0/8 grow/shrink: 5/7 up/down: 509/-4405 (-3896)
> >>>    Function                                     old     new   delta
> >>>    __qcom_scm_set_dload_mode.constprop          312     452    +140
> >>>    qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
> >>>    qcom_scm_io_writel                           288     408    +120
> >>>    qcom_scm_io_readl                            376     492    +116
> >>>    __param_str_download_mode                     23      28      +5
> >>>    __warned                                    4327    4326      -1
> >>>    qcom_iommu_init                              272     268      -4
> >>>    e843419@0b3f_00010432_324                      8       -      -8
> >>>    qcom_scm_call                                228     208     -20
> >>>    CSWTCH                                      5925    5877     -48
> >>>    _sub_I_65535_1                            163100  163040     -60
> >>>    _sub_D_65535_0                            163100  163040     -60
> >>>    qcom_scm_wb                                   64       -     -64
> >>>    qcom_scm_lock                                320     160    -160
> >>>    qcom_scm_call_atomic                         212       -    -212
> >>>    qcom_scm_cpu_power_down                      308       -    -308
> >>>    scm_legacy_call_atomic                       520       -    -520
> >>>    qcom_scm_set_warm_boot_addr                  720       -    -720
> >>>    qcom_scm_set_cold_boot_addr                  728       -    -728
> >>>    scm_legacy_call                             1492       -   -1492
> >>>    Total: Before=3D66737642, After=3D66733746, chg -0.01%
> >>>
> >>> Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC a=
nd
> >>> legacy conventions") didn't mention any motivating factors for keeping
> >>> the legacy code around on arm64 kernels, i.e. presumably that commit
> >>> wasn't trying to support these legacy APIs on arm64 kernels.
> >>
> >> There are arm targets which support SMCCC convention and use some of
> >> these removed functions. Can these functions be kept in qcom-scm.c and
> >> wrapped with #if IS_ENABLED(CONFIG_ARM)?
> >>
> >=20
> > It can be wrapped in qcom-scm.c, but why? It's all the same object file
> > so I'm lost why it matters. I suppose it would make it so the struct
> > doesn't have to be moved around and declared in the header? Any other
> > reason? I moved it to the legacy file so that it was very obvious that
> > the API wasn't to be used except for "legacy" platforms that don't use
> > PSCI.
> >=20
>=20
> There are "legacy" arm platforms that use the SMCCC (scm_smc_call) and=20
> use the qcom_scm_set_{warm,cold}_boot_addr and qcom_scm_cpu_power_down=20
> functions.

Ah ok. Weird, but I get it. Amazing that SMCCC was adopted there but
PSCI wasn't!

>=20
>  > +    desc.args[0] =3D flags;
>  > +    desc.args[1] =3D virt_to_phys(entry);
>  > +
>  > +    return scm_legacy_call_atomic(NULL, &desc, NULL);
>  > +}
>  > +EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
>=20
> This should still be qcom_scm_call.

You mean s/scm_legacy_call_atomic/qcom_scm_call/ right?

I don't really want to resend the rest of the patches if this last one
is the only one that needs an update. This was a semi-RFC anyway so
maybe it's fine if the first 5 patches get merged and then I can resend
this one? Otherwise I will resend this again next week or so with less
diff for this patch.
