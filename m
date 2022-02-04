Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93AF64AA25E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238467AbiBDVeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:34:19 -0500
Received: from gloria.sntech.de ([185.11.138.130]:37822 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234460AbiBDVeS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:34:18 -0500
Received: from p508fdcd8.dip0.t-ipconnect.de ([80.143.220.216] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nG6Db-0003Tl-Cw; Fri, 04 Feb 2022 22:34:11 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     joro@8bytes.org, will@kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu/rockchip: : Use standard driver registration
Date:   Fri, 04 Feb 2022 22:34:05 +0100
Message-ID: <4984895.Adqdaih0Sd@phil>
In-Reply-To: <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
References: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com> <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Freitag, 4. Februar 2022, 21:16:41 CET schrieb Robin Murphy:
> It's been a long time since there was any reason to register IOMMU
> drivers early. Convert to the standard platform driver helper.
> 
> CC: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/iommu/rockchip-iommu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 7f23ad61c094..204a93a72572 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1407,9 +1407,4 @@ static struct platform_driver rk_iommu_driver = {
>  		   .suppress_bind_attrs = true,
>  	},
>  };
> -
> -static int __init rk_iommu_init(void)
> -{
> -	return platform_driver_register(&rk_iommu_driver);
> -}
> -subsys_initcall(rk_iommu_init);
> +builtin_platform_driver(rk_iommu_driver);
> 




