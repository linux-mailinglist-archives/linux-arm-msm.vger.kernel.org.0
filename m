Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCAF81665C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 19:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgBTSCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 13:02:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:44532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727298AbgBTSCw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 13:02:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CE1624673;
        Thu, 20 Feb 2020 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582221771;
        bh=37+6kRfe020nr3eTo55dbdOiwQoX7FUjUISiaAj1H6w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m9xMxs8WLpZ1tJSTx12u4kJ78qow2BN0C/TsjYyITx052s7EDMb/8bu27UZaEaKQC
         H7QOJcDNsK/KnboXjYJA7tTRsrQRUXUYO9KooPvCYVrO6GtCB9OR6Ad8q7QChfs8qv
         gReuLai284/7HyoFHLCd3CtiEsSTtgxNdxqidEew=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
References: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org> <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
Subject: Re: [PATCH RFC] mmc: sdhci-msm: Toggle fifo write clk after ungating sdcc clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Sayali Lokhande <sayalil@codeaurora.org>
To:     Sayali Lokhande <sayalil@codeaurora.org>, adrian.hunter@intel.com,
        asutoshd@codeaurora.org, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, mka@chromium.org, ppvk@codeaurora.org,
        rampraka@codeaurora.org, robh+dt@kernel.org,
        stummala@codeaurora.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org
Date:   Thu, 20 Feb 2020 10:02:50 -0800
Message-ID: <158222177078.184098.4974715009961694108@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sayali Lokhande (2020-02-20 01:20:46)
> From: Ram Prakash Gupta <rampraka@codeaurora.org>
>=20
> During GCC level clock gating of MCLK, the async FIFO

Is this automatic hardware clock gating?

> gets into some hang condition, such that for the next
> transfer after MCLK ungating, first bit of CMD response
> doesn't get written in to the FIFO. This cause the CPSM
> to hang eventually leading to SW timeout.
>=20
> To fix the issue, toggle the FIFO write clock after
> MCLK ungated to get the FIFO pointers and flags to
> valid states.
>=20
> Change-Id: Ibef2d1d283ac0b6983c609a4abc98bc574d31fa6
> Signed-off-by: Ram Prakash Gupta <rampraka@codeaurora.org>
> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 43 ++++++++++++++++++++++++++++++++++++++=
+++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..eaa3e95 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1554,6 +1556,43 @@ static void __sdhci_msm_set_clock(struct sdhci_hos=
t *host, unsigned int clock)
>         sdhci_enable_clk(host, clk);
>  }
> =20
> +/*
> + * After MCLK ugating, toggle the FIFO write clock to get

What is ugating?

> + * the FIFO pointers and flags to valid state.
> + */
> +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +       const struct sdhci_msm_offset *msm_offset =3D
> +                                       msm_host->offset;
> +       struct mmc_card *card =3D host->mmc->card;
> +
> +       if (msm_host->tuning_done ||
> +                       (card && card->ext_csd.strobe_support &&
> +                       card->host->ios.enhanced_strobe)) {
> +               /*
> +                * set HC_REG_DLL_CONFIG_3[1] to select MCLK as
> +                * DLL input clock
> +                */
