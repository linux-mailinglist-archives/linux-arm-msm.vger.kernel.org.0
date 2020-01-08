Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AB3133E7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 10:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgAHJnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 04:43:09 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43715 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgAHJnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 04:43:09 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A72C020007;
        Wed,  8 Jan 2020 09:43:04 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Yangtao Li <tiny.windzz@gmail.com>, jassisinghbrar@gmail.com,
        nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 13/13] mailbox: armada-37xx-rwtm: convert to devm_platform_ioremap_resource
In-Reply-To: <20191228183538.26189-13-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com> <20191228183538.26189-13-tiny.windzz@gmail.com>
Date:   Wed, 08 Jan 2020 10:43:04 +0100
Message-ID: <87imlmb7x3.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Yangtao Li,

> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Applied on mvebu/drivers

Thanks,

Gregory

> ---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> index 19f086716dc5..02b7b28e6969 100644
> --- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> +++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> @@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
>  static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  {
>  	struct a37xx_mbox *mbox;
> -	struct resource *regs;
>  	struct mbox_chan *chans;
>  	int ret;
>  
> @@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  	if (!chans)
>  		return -ENOMEM;
>  
> -	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base)) {
>  		dev_err(&pdev->dev, "ioremap failed\n");
>  		return PTR_ERR(mbox->base);
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
