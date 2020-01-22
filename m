Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 534DE145A64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 17:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAVQ5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 11:57:30 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42713 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgAVQ5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 11:57:30 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so115601pfz.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=9LNpISLBBtmZPXNKsiH0lufw2QrgHH3oOxpdWJdbgPM=;
        b=g5mzDL6dVlGjCnPBzczWoxg5k4Yh5gc+T56tvHgovpgDUdYThPuIT0D0uBdiOhPJXy
         X8GtFl/rC8JO/xwNRXhAChPXrR8k304gYvr12LD4euWJePnIuCGX9/wezUK7T86twNFl
         61BHtu0trihkmhYsv3/EVWFi5ybajHZY2ZGwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=9LNpISLBBtmZPXNKsiH0lufw2QrgHH3oOxpdWJdbgPM=;
        b=VABihXMzuanU4A+PvJPLYpk9Pth6elf0eGbZ+67M/vtcOoET6vEM/EzSvch1d0BuWk
         BeqyTfziOhDNXPhJ1kd/x9n8/9YD0mg3Um21BM9+mIO/CVzttCxnSumkw+gEGxh7zrhU
         bqxFKeDVErP1pX1DiXA60th/UnPnLP4uXGFGLj0CWsu75oZtoLyQMQsRIDrPyGZUMgpf
         2knNNBpXYuPvo0xP+fWpvNdGvaXnLaznMitbhbQCxHGkHnZzeE1sh0nrpJhZc5bWLDnz
         KUxv2EtjFqlxLV/IdCnsu42Uk/mkRcl/zWAWC3Il8t8muJXg29aNwIiYK+zUxjDawRwB
         wKVA==
X-Gm-Message-State: APjAAAU/ubypS892/M/Ik9WfSeLO/nGnp/WdBYivfWgIT4YulhSqmfO8
        WivL4dyJBtQL1ZQVKy3CJE55Wg==
X-Google-Smtp-Source: APXvYqwTvQymP17CF0MbRVMcbMrpGvYkD/WLGbAlHkqEbbOryCDsRTj2ir6Av/MFbAe390j8UEXyoQ==
X-Received: by 2002:a63:1c5e:: with SMTP id c30mr12399716pgm.30.1579712249359;
        Wed, 22 Jan 2020 08:57:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o23sm2480108pgn.17.2020.01.22.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 08:57:28 -0800 (PST)
Message-ID: <5e287ef8.1c69fb81.cacd.4c1b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
References: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org
Subject: Re: [PATCH V1] mmc: sdhci-msm: Add system suspend/resume callbacks
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 22 Jan 2020 08:57:27 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shaik Sajida Bhanu (2020-01-21 06:30:22)
> Add system suspend/resume callbacks to sdhci-msm platform driver.

Yes, but why? There are already suspend/resume callbacks so this is
replacing them too.

>=20
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 47 ++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 71f29ba..4984857 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2028,9 +2028,52 @@ static __maybe_unused int sdhci_msm_runtime_resume=
(struct device *dev)
>         return 0;
>  }
> =20
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host =3D dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +       int ret =3D 0;
> +
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {

It would be nice if this if check was rolled into cqhci_suspend so that
all the callers wouldn't have to check it.

> +               ret =3D cqhci_suspend(host->mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       disable_irq(msm_host->pwr_irq);

Why is the irq disabled? Please add a comment.

> +       ret =3D sdhci_suspend_host(host);
> +       if (ret)
> +               return ret;
> +
> +       return sdhci_msm_runtime_suspend(dev);

pm_runtime_force_suspend() does different things than just call the
runtime suspend function for the driver. For example, it disables
runtime PM on the device. Can you explain in the commit text how this is
a correct conversion?

> +}
> +
> +static int sdhci_msm_resume(struct device *dev)
> +{
> +       struct sdhci_host *host =3D dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +       int ret =3D 0;
> +
> +       ret =3D sdhci_msm_runtime_resume(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D sdhci_resume_host(host);
> +       if (ret < 0)
> +               return ret;
> +       enable_irq(msm_host->pwr_irq);

Same question here about irq. Deserves a comment.

> +
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> +               ret =3D cqhci_resume(host->mmc);
> +
> +       return ret;
> +}
> +
>  static const struct dev_pm_ops sdhci_msm_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
> +                               sdhci_msm_resume)
>         SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
>                            sdhci_msm_runtime_resume,
>                            NULL)
