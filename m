Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1A81583D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 20:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJTlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 14:41:21 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45064 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgBJTlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 14:41:19 -0500
Received: by mail-pg1-f195.google.com with SMTP id b9so4424911pgk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7ivqNM+XNnF2NduI9XPvPsjcawkQDDIuJxxbUTZS70I=;
        b=e9afxVCBltANlhIP0TTphK41BACkirOo7MmnkUOHrwI8/ONL4gUNJW+/jlutjgIyTM
         m9iTPLTxC1GUGwK7rlEsp/ZfgE+POtAnN0+2wd/9XPHTH9R5VZ+NRsKBCVx9lYgoGZn9
         sZmgX4+usRBPoE8eCS2k/9rH0l4pzMF+f4BL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7ivqNM+XNnF2NduI9XPvPsjcawkQDDIuJxxbUTZS70I=;
        b=avDj9Sq87Lk6cdv9GNGOxkvS86GLpT7yKQN7LBQv/YtDTXiTQOTy3+mFzz340bt79w
         X4ctxc3P18Epywpbr4mxjZRk6FgqqKBFELrrzpa7DIdS0v5BRi9P6A13ADy5bU5DuR+o
         1Av1xsOFqh/NssvoAsjUoZgDmMFN28ay8/QP72xVczqsGzCOT+DE0+O3JEW12yL51aHF
         tlyDGYxamDiwahqmYG28gRdF6H9eTpCn9d6YemkbFDdy3xNoTOugFCJkONNRSOWmDNMN
         msJ77kXBULLdvmwnoiS8o00vOk1ngY41wZx2BJDx2Jt16EGRPrX1uQZDtNGykQnEuMJ+
         Cm9g==
X-Gm-Message-State: APjAAAVZVFy4yNHrF8xx95zCrBGcl6f2Hj4o/8gP3aZgroZULc+6H1g5
        eBWcjNcPxo/Xs4tlvVhIOTxM3w==
X-Google-Smtp-Source: APXvYqyL3xU2GxC0ppxiK1j1x5dqjfCDDqBmdVXIr+06LB0Gb7x6nvbyw6kgjLFqdzL7dOSmuxanxA==
X-Received: by 2002:a62:e91a:: with SMTP id j26mr2645081pfh.189.1581363677533;
        Mon, 10 Feb 2020 11:41:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 199sm1276209pfv.81.2020.02.10.11.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:41:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581081650-22228-1-git-send-email-sbhanu@codeaurora.org>
References: <1581081650-22228-1-git-send-email-sbhanu@codeaurora.org>
Subject: Re: [PATCH V2] mmc: sdhci-msm: Update system suspend/resume callbacks of sdhci-msm platform driver.
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Mon, 10 Feb 2020 11:41:16 -0800
Message-ID: <158136367603.121156.1867941302835915258@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shaik Sajida Bhanu (2020-02-07 05:20:50)
> The existing suspend/resume callbacks of sdhci-msm driver are just
> gating/un-gating the clocks. During suspend cycle more can be done
> like disabling controller, interrupts and card detection.
>=20
> So updating the system pm callbacks for performing these extra
> actions besides controlling the clocks.
>=20
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>=20
> Changes since V1:
>         Addressed review comments

Please don't write this. Instead, describe what's actually different so
the reader doesn't have to go figure out what the review comments were.

> ---
>  drivers/mmc/host/sdhci-msm.c | 50 ++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..e30c8a3 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2159,9 +2159,55 @@ static __maybe_unused int sdhci_msm_runtime_resume=
(struct device *dev)
>         return 0;
>  }
> =20
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host =3D dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +       int ret;
> +
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               ret =3D cqhci_suspend(host->mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D sdhci_suspend_host(host);
> +       if (ret)
> +               return ret;
> +       /* Disable pwr-irq since SDHC would be inactive */
> +       disable_irq(msm_host->pwr_irq);

Why do we need to do this? If it's inactive then the irq won't be raised
by the inactive hardware. Given that we're going to suspend the device,
the irq won't matter unless it's marked for wakeup. Please remove this
irq enable/disable logic, or explain why it's really needed.

> +
> +       return pm_runtime_force_suspend(dev);
> +}
> +
