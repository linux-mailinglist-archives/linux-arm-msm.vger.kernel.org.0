Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAB02C1A3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 01:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgKXAu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 19:50:27 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46382 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgKXAu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 19:50:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id q206so21832565oif.13;
        Mon, 23 Nov 2020 16:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gI7zhBhIP0+6Xsp8/COOViVeUh5gtUo2CsgJ6HRlj/M=;
        b=U3KYKXzLKSRpowRZ44/7lM+eVbTnJ/e/+EQxQn8Tt7Y7eH/CDFvLc61ST67JgfsMpx
         T5Y7YI+NdiVH23ZagCwDs+BlqW0qivMIp4z82xOrEXo35nqZz9fLKcNfM9Ex6R8aTres
         ir8iHLbmEMIo+DvV9VcMUSnNXA7qis4iLXC+DTWCR1Ox4lxN7JHaPtekoVl/IWDlh78r
         RcCjgp9B0/b4mDDLb/lRekyMMl4eNA0mWWKCrh+9AUQAxDDbkCeZS13eLXlWvqalJyBH
         3lUJz52yFnRwnpMQbzMvSm4iJBjPySGQnHq1bU1MfzdlvVh/87Opa32Xz1C8Wi5vtu+n
         cCWg==
X-Gm-Message-State: AOAM533bpRXZuj/oyUo6+XCEqnIaKYyswf8AEXtjA1+1V9uX4q+P9Xqs
        SsNlf755KMq6p0LhXckBfLOf+RkUbPavHw==
X-Google-Smtp-Source: ABdhPJwJWyBDfbJ4UWMzCUO8Aw1qkmKHgxsqLfkxp072xhp3wemr1BTakI+3GYQ7JEeJp1ZvZfsTQA==
X-Received: by 2002:aca:af88:: with SMTP id y130mr1150530oie.81.1606179024831;
        Mon, 23 Nov 2020 16:50:24 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id j23sm7796970otr.80.2020.11.23.16.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 16:50:24 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id q206so21832522oif.13;
        Mon, 23 Nov 2020 16:50:24 -0800 (PST)
X-Received: by 2002:aca:4cf:: with SMTP id 198mr1036440oie.175.1606178695336;
 Mon, 23 Nov 2020 16:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20201103152838.1290217-1-lee.jones@linaro.org>
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Mon, 23 Nov 2020 18:44:43 -0600
X-Gmail-Original-Message-ID: <CADRPPNQx2=f46EQOvYLZUMbL+4qyDXUyvzjsKqFLC-iuQFRAQQ@mail.gmail.com>
Message-ID: <CADRPPNQx2=f46EQOvYLZUMbL+4qyDXUyvzjsKqFLC-iuQFRAQQ@mail.gmail.com>
Subject: Re: [PATCH 00/25] Rid W=1 warnings in SoC
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>, act <dmalek@jlc.net>,
        Andy Gross <agross@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Ben Dooks <ben@simtec.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cyril Chemparathy <cyril@ti.com>,
        Dan Malek <dan@embeddedalley.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Doug Anderson <dianders@chromium.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Sandeep Nair <sandeep_n@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Scott Wood <scottwood@freescale.com>,
        "Software, Inc" <source@mvista.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vitaly Bordug <vbordug@ru.mvista.com>,
        YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 3, 2020 at 9:29 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> Lee Jones (25):

>   soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
>   soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
>   soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

The above are applied for next.  Thanks.

Regards,
Leo
>
>  drivers/soc/bcm/brcmstb/pm/pm-arm.c      |  2 +
>  drivers/soc/fsl/dpio/qbman-portal.c      | 18 +++++--
>  drivers/soc/fsl/qbman/qman.c             |  8 +--
>  drivers/soc/fsl/qe/qe_common.c           |  2 +-
>  drivers/soc/qcom/kryo-l2-accessors.c     |  2 +-
>  drivers/soc/qcom/llcc-qcom.c             |  2 +-
>  drivers/soc/qcom/qcom-geni-se.c          |  5 +-
>  drivers/soc/qcom/qcom_aoss.c             |  4 +-
>  drivers/soc/qcom/rpmh.c                  |  2 +-
>  drivers/soc/qcom/rpmhpd.c                |  3 ++
>  drivers/soc/qcom/smem.c                  |  3 +-
>  drivers/soc/qcom/smp2p.c                 |  3 +-
>  drivers/soc/qcom/smsm.c                  |  4 +-
>  drivers/soc/qcom/wcnss_ctrl.c            |  8 +--
>  drivers/soc/rockchip/io-domain.c         |  3 --
>  drivers/soc/samsung/s3c-pm-check.c       |  2 +-
>  drivers/soc/tegra/fuse/speedo-tegra124.c |  7 ++-
>  drivers/soc/tegra/fuse/speedo-tegra210.c |  8 +--
>  drivers/soc/ti/k3-ringacc.c              |  1 +
>  drivers/soc/ti/knav_dma.c                |  2 +-
>  drivers/soc/ti/knav_qmss_queue.c         | 62 ++++++++++++------------
>  drivers/soc/ti/pm33xx.c                  |  4 +-
>  drivers/soc/ti/wkup_m3_ipc.c             |  8 ++-
>  23 files changed, 86 insertions(+), 77 deletions(-)
>
> Cc: act <dmalek@jlc.net>
> Cc: Andy Gross <agross@kernel.org>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Cyril Chemparathy <cyril@ti.com>
> Cc: Dan Malek <dan@embeddedalley.com>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Roy Pledge <Roy.Pledge@nxp.com>
> Cc: Sandeep Nair <sandeep_n@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Scott Wood <scottwood@freescale.com>
> Cc: "Software, Inc" <source@mvista.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Vitaly Bordug <vbordug@ru.mvista.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
>
> --
> 2.25.1
>
