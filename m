Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0951727570E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 13:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgIWLSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 07:18:49 -0400
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:23009
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726332AbgIWLSp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 07:18:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCaP/uGNXw6HZ2ZCO69SxY5dXzWEo50Zx1xnmgdDLLd/DjdG1Pham7z/dRotdz4TA8Mn0MmGWhfq/3ZbgnpxFHBVXlNfHk8Kh68q12XCV92Tq4Xbsz574n1I6WhRBw9LEkQSNl+OnCca+ncycRet8j+cc+jnY9kDilLW6Y91/uTgkQ+9KPoZeTsqTbf776tDQW3NXjI/bMi6+jIkcEFuraO+eMXCTZMNDRvtHC63bVqCSRXbavhdAs/s6Su7GsukyqMy/3dZqbrSGOfbZxhshX+RQihuUIyvpAvfPnAk1yHydBv+WtamiR6Iqzr7x+uIvOA7m1D2EZa/PeKm+Hi0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAkLMJGw7Vv/vvyJ1mi700q4G3h4xSaJtX4PCcR/n8Q=;
 b=SF4lHP3dTItZIoxSOnx/sUplrrIw9qEgg+WqEOfvO7jnpCB4MB3ag95aRbsMOWq/e0JCVWtemQSpTHGutCpg8pBCTVv+5NaA+XnVuFFTN73DcCaRCJbpYtj0BWtYYkPjFsi1Hswv8EQnGPOR/7UKXiaNNFiy9iZtpZJZxTplqPgSkx1zQvsmJsQh9dXVMc1p3SdnQzDGNVbjec3/5TQ1d0PPJz+LQ0Wv7MrJ+TaJSDqsTt8jr4HEHb12m8TzZlUorvHlVKALwLlSDd0NsoSb45zHp0skT/xQEV3aVqOwTfCTPY4Tq+3sTEfeTniy+PybaCf8tqDTZoz0UqqpIMLJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAkLMJGw7Vv/vvyJ1mi700q4G3h4xSaJtX4PCcR/n8Q=;
 b=IhaOeAiLhydbVcliIEHIxwHK8uy+OFYk24U03M6rPJ3678PrAOUVPaRY1ZuprY4ya7UN5z6Wq5hrgRHr9x6apoNer+HEktwoAznNrjHep2kx4Npy2+kc0awqfbNc//sb+1Tw6PjGG66mBfjAZLGSFqhaBZtNVSVfy7Xoe358A9w=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB5789.eurprd04.prod.outlook.com
 (2603:10a6:803:e2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 11:18:37 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3412.021; Wed, 23 Sep 2020
 11:18:36 +0000
Date:   Wed, 23 Sep 2020 14:18:27 +0300
From:   Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 07/22] drm/imx/dcss: Initialize DRM driver instance
 with CMA helper macro
Message-ID: <20200923111827.dtpgxpa7ydd4kxio@fsr-ub1864-141>
References: <20200923102159.24084-1-tzimmermann@suse.de>
 <20200923102159.24084-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923102159.24084-8-tzimmermann@suse.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM4PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:205::49)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by AM4PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:205::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 23 Sep 2020 11:18:31 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8600018-cf47-486d-b728-08d85fb269f7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5789:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5789EE9EDF94E109850D8E27BE380@VI1PR04MB5789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cmbn5QGDKVdeukmXn+cSl5AnvEvL0ckzdWVYbUbIiFKDufVmovnsHe9+cBwKmqrhGAG48LjAdqYsNoRhOEb8u9iyvPYM0ZS6zY56r6wNCrzz8xYAd8cTMnCpD9nBU8fXCCd6WoyUShskT4fo1a+IxvsJe/kG4XvCooOWlcINdPn8JeKfPw6JwN7e3dkIREdzpkPWplfEFUUCO7CV1zJRiDfS4vfBYCKYoKXYi2vz+1T659axyOmJJzPzkLvzd4tN0P12rR2TZ/GO7jzB8wV6ciy9akEwGjTLGpBlmXJXFl4h/s5Q8mv/EEkORN7auCVwZMC12OryeiWc3X4P2c+I9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3902.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(86362001)(7366002)(7416002)(7406005)(83380400001)(5660300002)(2906002)(6666004)(8936002)(66946007)(33716001)(1076003)(55016002)(66556008)(66476007)(9686003)(6496006)(6916009)(4326008)(8676002)(52116002)(16526019)(44832011)(316002)(956004)(26005)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YH6/GixFZP1cMd5wQlgyMojaOxfMwE5sHkpGKdNK74B/W7U0HBFvECepHtetZN8rzrviI1iMfCLKDW6lNqlv4ioK0DKlIsG2ebDfGpMMW96aopjhu1hB1B9+gXrgtenHXJVj5REKsiC/svUeV6FUMjb/v7dyoVtvzJoX6gfpMUwaX3tCfMJO6VeNyz6vnQB7FkXduiUjyInDToTOH+xRSPwfIlgP8TLl5/RsRSZi4bmbDm25Ia/ssmlIODu0sI8hlggBQf4+mGRb3V5tHuAx3ry6L6vjkR73gjnxwPDPLukIUoE+HKx33w82c5FZa9zDuyxvpMByPJ+O4HNbZo42DUV4/bc7x5Ze8t+eXxA8D9djSiHDOHiCezBcCj38npuRNUEfqlXS6237vyUofgkZkQZfM7XeJdM4BhdApgB8j/lXXiHuT7+3dlSKCirJpEOhqJu3HYhh9yCrJjm4Dpt36Wik0MqNkX8cO9LdOQkoB+GRgia88YzrBIHWrUZvogM7UF6hOBCG43Jf1vTLZ3rSZzJvDgvgA1G/T6Gy5HRQetklf5l1AMEsAKH0qsXPXiqMfNWKHfHvIQ+Lt8Mlvj2TaDH9r5pDH3Rf/3H3rO3q40NorExRF5I7cPzo1fto2cqq8KE8tGIDDo0c5fz1qFMM2w==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8600018-cf47-486d-b728-08d85fb269f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 11:18:36.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lZLGbhnJQjJpuaMRljf8APd1c9V2G5Oo5JlPEh+eK3QI/loeb5TW6ThgWbwHNTOGTy7vQTpDlxVPdBJxYiV8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5789
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Wed, Sep 23, 2020 at 12:21:44PM +0200, Thomas Zimmermann wrote:
> The i.MX DCSS driver uses CMA helpers with default callback functions.
> Initialize the driver structure with the rsp CMA helper macro. The
> driver is being converted to use GEM object functions as part of
> this change.
> 
> Two callbacks, .gem_prime_export and .gem_prime_import, were initialized
> to their default implementations, so they are just kept empty now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> ---

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
laurentiu

>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 135a62366ab8..b72e5cef7e40 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -28,19 +28,7 @@ static const struct drm_mode_config_funcs dcss_drm_mode_config_funcs = {
>  
>  static struct drm_driver dcss_kms_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.dumb_create		= drm_gem_cma_dumb_create,
> -
> -	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_import	= drm_gem_prime_import,
> -	.gem_prime_export	= drm_gem_prime_export,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> +	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops			= &dcss_cma_fops,
>  	.name			= "imx-dcss",
>  	.desc			= "i.MX8MQ Display Subsystem",
> -- 
> 2.28.0
> 
