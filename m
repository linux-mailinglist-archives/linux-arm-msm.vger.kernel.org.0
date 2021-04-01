Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121E2350BF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 03:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhDAB0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 21:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhDAB0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 21:26:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097F6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 18:26:35 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id m11so265431pfc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 18:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tDlj4kgFlWpxX5ZVv654Fo3s6ByCdkV+7+iH8bJxbWo=;
        b=Y2bmJAAZ1L88j7Fq7ETNfSc1to4OpfmoSZzKcgtF3LX6Qv/4ZQxGHV5Brgca8Q4bmD
         QoG61xEhEN/axcAyAxDNTkfBopbDEKi0F6P8mcakoqvupLUaFdG3wZkF/iBhSUy5rBqX
         Xt6RyTt7eMAcM5xKTeBdpbRR3gR3jn/dILd6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tDlj4kgFlWpxX5ZVv654Fo3s6ByCdkV+7+iH8bJxbWo=;
        b=S5Ho2BA3OYetA9ax3uGQTHKsyU3XPDEcgDTq1W+KbibmZzX6x7oI1jv8ROd/IZvyvq
         O0KaNvXPh7kmNC8P2I4PONYHrqDARIV2GLTHZbRoai3ixznI+bCWFiPG50veAemrVOrT
         LCY0A524d7buQFofWoqsOVXy9tjo9snzU0mNE7qsJH/cxg7uhKqFSd3ECdlH68yPoISJ
         IgOeacpEN3/7q8R3a+9c1PrA4n5YlezdqKbVMiQX07t350fQjCyWTCbe4W7kaAPt/1OK
         IgvjJxazgAwnbdbpR7b8LhnBHkbG3IWD5cScTKe0MqdzJpiyTjEce/Xf+ZHbBPWQ0bSV
         9NRA==
X-Gm-Message-State: AOAM5314f1dTBY/Y++vF/Ih6MNHnR8hygxmxyUc8O0LVJOS9veyGq7Wb
        bNgiWa9L7WHxdHOLE1k2TnD7lz2AW3hbGg==
X-Google-Smtp-Source: ABdhPJwwTfEtXQITV+pDCnPPnBNonxYSo2tHMGeDp5oEqD13BD1KaVkiynE0bLTQCFc6nEaEkhpONA==
X-Received: by 2002:a63:4502:: with SMTP id s2mr5745137pga.94.1617240394404;
        Wed, 31 Mar 2021 18:26:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:7515:8c2e:1867:2767])
        by smtp.gmail.com with ESMTPSA id o1sm3426212pjp.4.2021.03.31.18.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 18:26:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210323224336.1311783-1-swboyd@chromium.org>
References: <20210323224336.1311783-1-swboyd@chromium.org>
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 31 Mar 2021 18:26:32 -0700
Message-ID: <161724039222.2260335.7485766796063332304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-03-23 15:43:36)
> These scm calls are never used outside of legacy ARMv7 based platforms.
> That's because PSCI, mandated on arm64, implements them for modern SoCs
> via the PSCI spec. Let's move them to the legacy file and only compile
> the legacy file into the kernel when CONFIG_ARM=3Dy. Otherwise provide
> stubs and fail the calls. This saves a little bit of space in an
> arm64 allmodconfig.
>=20
>  $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
>  add/remove: 0/8 grow/shrink: 5/6 up/down: 509/-4401 (-3892)
>  Function                                     old     new   delta
>  __qcom_scm_set_dload_mode.constprop          312     452    +140
>  qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
>  qcom_scm_io_writel                           288     408    +120
>  qcom_scm_io_readl                            376     492    +116
>  __param_str_download_mode                     23      28      +5
>  __warned                                    4327    4326      -1
>  e843419@0b3f_00010432_324                      8       -      -8
>  qcom_scm_call                                228     208     -20
>  CSWTCH                                      5925    5877     -48
>  _sub_I_65535_1                            163100  163040     -60
>  _sub_D_65535_0                            163100  163040     -60
>  qcom_scm_wb                                   64       -     -64
>  qcom_scm_lock                                320     160    -160
>  qcom_scm_call_atomic                         212       -    -212
>  qcom_scm_cpu_power_down                      308       -    -308
>  scm_legacy_call_atomic                       520       -    -520
>  qcom_scm_set_warm_boot_addr                  720       -    -720
>  qcom_scm_set_cold_boot_addr                  728       -    -728
>  scm_legacy_call                             1492       -   -1492
>  Total: Before=3D66737606, After=3D66733714, chg -0.01%
>=20
> Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and
> legacy conventions") didn't mention any motivating factors for keeping
> the legacy code around on arm64 kernels, i.e. presumably that commit
> wasn't trying to support these legacy APIs on arm64 kernels.
>=20
> Cc: Elliot Berman <eberman@codeaurora.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>=20

Elliot, can you ack/review this?

> Followup to v1 (https://lore.kernel.org/r/20210223214539.1336155-7-swboyd=
@chromium.org):
>  * Don't change the legacy file to use legacy calls only
>  * Wrap more things in CONFIG_ARM checks
>
