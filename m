Return-Path: <linux-arm-msm+bounces-52501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2CA710B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 07:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B481517276E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 06:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C7019066B;
	Wed, 26 Mar 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGexHaIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F13823DE;
	Wed, 26 Mar 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742971491; cv=none; b=pkuZUmLSglBQjuEtK0BR0NkpOCSz9AOaDlilSAwqswd9YBDw7V082I6+F436L4PuWuPt9FGI3R7Zcg+9p2qVvpdaCoz+BN9ChWw7JECGb4fGC48WzUDBNSHUqbtLnVu7YOGXMi8RJvlI8J0kCFqcczMrgr4ZcEoYxmHCIjjpGTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742971491; c=relaxed/simple;
	bh=N+Le9MFtc/k1LZ1LVkIPmZk2oGdIyqo4T5HKb+AHZPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUT15Ve5bPs/JkfsZl+Xe1j0zLM4JT4Dof5SrRG7BubS+VRqM15ohoiDIv/lIgkp4OJqhOHMQjBIZmqECFn22dVpRABz61K04O8qWC0kB2NgzdKSOVudimx6xy8Eta/41KjjWKWfrHGMgFCqlx7LHxfXPcYcI4nC/Sy2gAxUW+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGexHaIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876BAC4CEED;
	Wed, 26 Mar 2025 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742971490;
	bh=N+Le9MFtc/k1LZ1LVkIPmZk2oGdIyqo4T5HKb+AHZPQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mGexHaIgLbSTRVHs1aAeFQlPGcyoCZW7ra4H38PmdGzDelCOcdKx1PSXmCzV7zHg4
	 t4BXlaPJZl4M++7SmdtJc6OS8JjvQRphtWZwBCWtmx/alHR1Io5/u7TZToVoyJOSou
	 96VjLRob86BRO7cjMzROfgRLhBnxIvMMr+R4vtlIUeOGTcng2xdyftnauroj5ZowGD
	 xzqLtB/oFZyge5ZZJr/oxGRcBJ2TtgorNnVd6M4vPVwtA8/remvhxw2JO6w5AmNBGW
	 LWfgRtD9plTNy/EtRrTL21OA4Ltzhsl8gLg9J9a66/mPT8tJvI+frlHwy6w6//C7jk
	 Cj6THAiU6V/PQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so66700351fa.2;
        Tue, 25 Mar 2025 23:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrmuqXy0K9cajr0azmFL4+Pf6aBWNe3qYxGW0g2O/hfr5Lcj66UTi8OLbcqOmB7DfRjc364FcBdqT0@vger.kernel.org, AJvYcCVzTu2309+2Q4uD9wIfI0yq+XWdKBq62p4IY1yhlVgcrkjs4Un9AgSf6K+qZdYcbD250UTVuZaDIL+hAmrm@vger.kernel.org, AJvYcCX22mXorEkFKLJ0KozHNYfK+7KjiR4EBG+qA1xn9QhQlKOXnXQtUG8QdEHbLtbg6PPMdD3QsDhmvpMIDy2o2w==@vger.kernel.org, AJvYcCXYa84ydnApj4NIDQwClnlzVJFosKZsXWTnNOmUfwvoEU0a4sWVpF75yBx/u8AoGKfUlIbOOopmxiNh5S8cz+gpAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw67eBUdY2FzEQWUbBU42acRzwWpawS/ryPLQQDkLkF/ciZTNz
	TqXDmz9tVm++JqWhZNtWsy7wowpNTCfQlT1Hyhh5q25YpcDoM2rLyc6HqKjshjkIcQeaM53LvlU
	9ZZ8DqpW8UUdaVRffXvNXDqT7qpk=
X-Google-Smtp-Source: AGHT+IGMF6j2X+Jr6WCvccPSUBNATvTU7YZt+i3mWvl9VVSwRgH7cCtIrbRrCInxLepNvpLKepp5tmas4mw+ODC5pdo=
X-Received: by 2002:a05:651c:201c:b0:30b:f924:3554 with SMTP id
 38308e7fff4ca-30d7e236c49mr59160551fa.21.1742971488912; Tue, 25 Mar 2025
 23:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
In-Reply-To: <20250317232426.952188-3-robh@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 26 Mar 2025 14:44:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6AIDujd8iNXwgSFrroWq7EbdFM1zyiw-quoSbfHrKnBQnEEqsHIIoRaI
Message-ID: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Simplify of_dma_set_restricted_buffer() by using of_property_present()
> and of_for_each_phandle() iterator.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/device.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index edf3be197265..bb4a47d58249 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
>  static void
>  of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
>  {
> -       struct device_node *node, *of_node =3D dev->of_node;
> -       int count, i;
> +       struct device_node *of_node =3D dev->of_node;
> +       struct of_phandle_iterator it;
> +       int rc, i =3D 0;
>
>         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>                 return;
>
> -       count =3D of_property_count_elems_of_size(of_node, "memory-region=
",
> -                                               sizeof(u32));
>         /*
>          * If dev->of_node doesn't exist or doesn't contain memory-region=
, try
>          * the OF node having DMA configuration.
>          */
> -       if (count <=3D 0) {
> +       if (!of_property_present(of_node, "memory-region"))
>                 of_node =3D np;
> -               count =3D of_property_count_elems_of_size(
> -                       of_node, "memory-region", sizeof(u32));
> -       }
>
> -       for (i =3D 0; i < count; i++) {
> -               node =3D of_parse_phandle(of_node, "memory-region", i);
> +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
>                 /*
>                  * There might be multiple memory regions, but only one
>                  * restricted-dma-pool region is allowed.
>                  */
> -               if (of_device_is_compatible(node, "restricted-dma-pool") =
&&
> -                   of_device_is_available(node)) {
> -                       of_node_put(node);
> -                       break;
> +               if (of_device_is_compatible(it.node, "restricted-dma-pool=
") &&
> +                   of_device_is_available(it.node)) {
> +                       if (!of_reserved_mem_device_init_by_idx(dev, of_n=
ode, i)) {
> +                               of_node_put(it.node);
> +                               return;
> +                       }
>                 }
> -               of_node_put(node);
> +               i++;
>         }
>
> -       /*
> -        * Attempt to initialize a restricted-dma-pool region if one was =
found.
> -        * Note that count can hold a negative error code.
> -        */
> -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node,=
 i))
> -               dev_warn(dev, "failed to initialise \"restricted-dma-pool=
\" memory node\n");
> +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memor=
y node\n");

This changes the behavior. Before this patch, it was:

    if a restricted dma pool was found, but initializing it failed, print
    a warning.

Whereas now it has become:

     print a warning unless a restricted dma pool was found and successfull=
y
     initialized.

This change causes the kernel to print out the warning for devices that
don't even do DMA:

simple-pm-bus soc: failed to initialise "restricted-dma-pool" memory node
simple-pm-bus 10006000.syscon: failed to initialise
"restricted-dma-pool" memory node
mtk-tphy soc:t-phy@11c80000: failed to initialise
"restricted-dma-pool" memory node
mtk-tphy soc:t-phy@11ca0000: failed to initialise
"restricted-dma-pool" memory node
mediatek-mipi-tx 11cc0000.dsi-phy: failed to initialise
"restricted-dma-pool" memory node
mediatek-mipi-tx 11cc0000.dsi-phy: can't get nvmem_cell_get, ignore it
clk-mt8186-apmixed 1000c000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-topck 10000000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-infra-ao 10001000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a04f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a06f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-img 15020000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-img 15820000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-imp_iic_wrap 11017000.clock-controller: failed to
initialise "restricted-dma-pool" memory node
clk-mt8186-ipe 1c000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mcu c53a000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mdp 1b000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mfg 13000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-vdec 1602f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-venc 17000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-wpe 14020000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
mt-pmic-pwrap 1000d000.pwrap: failed to initialise
"restricted-dma-pool" memory node
platform 1000d000.pwrap:pmic: failed to initialise
"restricted-dma-pool" memory node
mtk-svs 1100bc00.svs: failed to initialise "restricted-dma-pool" memory nod=
e


ChenYu
>  }
>
>  /**
> --
> 2.47.2
>
>

