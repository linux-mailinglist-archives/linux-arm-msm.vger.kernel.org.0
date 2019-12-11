Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC97311A823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 10:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbfLKJtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 04:49:06 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18348 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbfLKJtG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 04:49:06 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df0bb7b0000>; Wed, 11 Dec 2019 01:48:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 11 Dec 2019 01:49:05 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 11 Dec 2019 01:49:05 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 09:49:04 +0000
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Wed, 11 Dec 2019 09:49:03 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 83C0540D1A; Wed, 11 Dec 2019 11:49:01 +0200 (EET)
Date:   Wed, 11 Dec 2019 11:49:01 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Yangtao Li <tiny.windzz@gmail.com>
CC:     <afaerber@suse.de>, <manivannan.sadhasivam@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Eugeniy.Paltsev@synopsys.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <agross@kernel.org>,
        <s.nawrocki@samsung.com>, <tomasz.figa@gmail.com>,
        <cw00.choi@samsung.com>, <kgene@kernel.org>, <krzk@kernel.org>,
        <palmer@sifive.com>, <paul.walmsley@sifive.com>,
        <dinguyen@kernel.org>, <mripard@kernel.org>, <wens@csie.org>,
        <emilio@elopez.com.ar>, <pgaikwad@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <matthias.bgg@gmail.com>, <rfontana@redhat.com>,
        <gregkh@linuxfoundation.org>, <t-kristo@ti.com>,
        <john@phrozen.org>, <tglx@linutronix.de>, <allison@lohutok.net>,
        <kstewart@linuxfoundation.org>, <swinslow@gmail.com>,
        <aisheng.dong@nxp.com>, <robh@kernel.org>, <daniel.baluta@nxp.com>,
        <weiyongjun1@huawei.com>, <wangyan.wang@mediatek.com>,
        <chunhui.dai@mediatek.com>, <miquel.raynal@bootlin.com>,
        <heiko@sntech.de>, <jcmvbkbc@gmail.com>, <nsekhar@ti.com>,
        <geert+renesas@glider.be>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 06/17] clk: tegra: convert to
 devm_platform_ioremap_resource
Message-ID: <20191211094901.GY28289@pdeschrijver-desktop.Nvidia.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-6-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191209195749.868-6-tiny.windzz@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576057723; bh=r6KMkLsJhUlJn6kT8Vu8wn2241qWLrLOKRW+auTAdBw=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=fehz9BkDjC3DMVoGOpqVqlRcbFB+5HaVT04s5D4cWHQvhLCn6gXQEF6JJYvG9urlB
         s4hOQT8rZMu0RxfbGXBHlrizVjlU+MBWpN0zdOvs7VXqzPEAx0rJQEoyRB1VSgAF0A
         m289OxsJav4Sxdi0oVtNIPZGjVdeNbo8sx+JhKsl1iNDcTpdmnXX5k0gKmMauhQ+9Z
         XDGiV4yhyfPTseM3aKAa1n/aVdjBBiRP1CcndpVLoWBMQIL+f1qomtdDweAF2jj+Oc
         haxlit6zV7iSueYhAjyDiFWvEhl7qBKIz75rmqG+D6byUdQIM6BSB47B6wmYyTUifb
         AkfA7cHM53gag==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 09, 2019 at 07:57:38PM +0000, Yangtao Li wrote:
> External email: Use caution opening links or attachments
> 
> 

Acked-by:  Peter De Schrijver <pdeschrijver@nvidia.com>

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 34 ++++------------------------------
>  1 file changed, 4 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index c051d92c2bbf..070a2957e119 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1935,7 +1935,6 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
>  int tegra_dfll_register(struct platform_device *pdev,
>                         struct tegra_dfll_soc_data *soc)
>  {
> -       struct resource *mem;
>         struct tegra_dfll *td;
>         int ret;
> 
> @@ -1985,51 +1984,26 @@ int tegra_dfll_register(struct platform_device *pdev,
>                 return ret;
>         }
> 
> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!mem) {
> -               dev_err(td->dev, "no control register resource\n");
> -               return -ENODEV;
> -       }
> -
> -       td->base = devm_ioremap(td->dev, mem->start, resource_size(mem));
> +       td->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!td->base) {
>                 dev_err(td->dev, "couldn't ioremap DFLL control registers\n");
>                 return -ENODEV;
>         }
> 
> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -       if (!mem) {
> -               dev_err(td->dev, "no i2c_base resource\n");
> -               return -ENODEV;
> -       }
> -
> -       td->i2c_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
> +       td->i2c_base = devm_platform_ioremap_resource(pdev, 1);
>         if (!td->i2c_base) {
>                 dev_err(td->dev, "couldn't ioremap i2c_base resource\n");
>                 return -ENODEV;
>         }
> 
> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -       if (!mem) {
> -               dev_err(td->dev, "no i2c_controller_base resource\n");
> -               return -ENODEV;
> -       }
> -
> -       td->i2c_controller_base = devm_ioremap(td->dev, mem->start,
> -                                              resource_size(mem));
> +       td->i2c_controller_base = devm_platform_ioremap_resource(pdev, 2);
>         if (!td->i2c_controller_base) {
>                 dev_err(td->dev,
>                         "couldn't ioremap i2c_controller_base resource\n");
>                 return -ENODEV;
>         }
> 
> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> -       if (!mem) {
> -               dev_err(td->dev, "no lut_base resource\n");
> -               return -ENODEV;
> -       }
> -
> -       td->lut_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
> +       td->lut_base = devm_platform_ioremap_resource(pdev, 3);
>         if (!td->lut_base) {
>                 dev_err(td->dev,
>                         "couldn't ioremap lut_base resource\n");
> --
> 2.17.1
> 
