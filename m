Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33950FC077
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 08:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfKNHFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 02:05:18 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5891 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfKNHFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 02:05:18 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dccfc750000>; Wed, 13 Nov 2019 23:04:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 13 Nov 2019 23:05:17 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 23:05:17 -0800
Received: from [10.26.11.169] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Nov
 2019 07:05:14 +0000
Subject: Re: [PATCH 3/3] tty: serial: tegra: Use dma_request_chan() directly
 for channel request
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        <gregkh@linuxfoundation.org>, <linux@armlinux.org.uk>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ldewangan@nvidia.com>, <thierry.reding@gmail.com>
CC:     <vkoul@kernel.org>, <jslaby@suse.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20191113094618.1725-1-peter.ujfalusi@ti.com>
 <20191113094618.1725-4-peter.ujfalusi@ti.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <17285b24-b94b-7e86-d386-c5cf3c15c259@nvidia.com>
Date:   Thu, 14 Nov 2019 07:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113094618.1725-4-peter.ujfalusi@ti.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573715061; bh=MmGvVClaBSWbtzpBesfEo9w93+ReynyzrTv2qlyinUQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=NzCSkIDf9d12kW3MGV3mug7cFZnDJlreQu81Qr6LBXvQylzu3tZ11GtT/aolC9wKy
         QBptuI0yVaOZ6fahNQCQocvg9kHQYNZGrN9kspr6TzjNk+2hL/Y0HhYT9m+4SBzfJT
         TGR4orC5nLpmA1A34lzswdmHFH+4v7rtFNDTwPVLvMFfXx1n0hCa4xuE84TjY0EJx9
         htmguJR0/LuUzNiV8siJ0L+ZGQxW/Ez0viy+lmVhfMyK/mfEztDKC2Twg+25GqTgUp
         fg0ngmbyE3LPrbIoW1bKPLA71BJMpdscXlifLo4JLxRT+As64lXLBugQlAeib40Rcv
         +GsV9h98+dfQA==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 13/11/2019 09:46, Peter Ujfalusi wrote:
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/tty/serial/serial-tegra.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
> index 2f599515c133..b6ace6290e23 100644
> --- a/drivers/tty/serial/serial-tegra.c
> +++ b/drivers/tty/serial/serial-tegra.c
> @@ -1122,8 +1122,7 @@ static int tegra_uart_dma_channel_allocate(struct tegra_uart_port *tup,
>  	int ret;
>  	struct dma_slave_config dma_sconfig;
>  
> -	dma_chan = dma_request_slave_channel_reason(tup->uport.dev,
> -						dma_to_memory ? "rx" : "tx");
> +	dma_chan = dma_request_chan(tup->uport.dev, dma_to_memory ? "rx" : "tx");
>  	if (IS_ERR(dma_chan)) {
>  		ret = PTR_ERR(dma_chan);
>  		dev_err(tup->uport.dev,
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
