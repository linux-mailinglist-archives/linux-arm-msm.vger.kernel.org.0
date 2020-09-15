Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8848126A851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 17:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgIOPFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 11:05:51 -0400
Received: from mail-co1nam11on2056.outbound.protection.outlook.com ([40.107.220.56]:13984
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727412AbgIOPFo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:05:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+uURhelGsy+bQucw/1ZAZ8eP0eI+QDiaPC113yDUdf+X3gMJFFw2YoUUz+AuOv19mqilDhBVkNqFAdKwF4hPzKwFKevGcZO9KufDD40bVnmd9ysZO8+M7zv9by3XVzyVTWJCiUonBNhdiNqprA4nodI7q9BmBfiq0Aj5EXAmgRgyoFcFtzYgiHs0PZpbqGhno3ML+lP2VPGN87eFUtDzq/ekTr31vqfPTpnXOGzIJ6lTMnGviyURDMNh7rdwNxTN/mF2VXlOZFyHhwfXO8XhHFSbpEjHGdd2yGYXPQiPnbR7avCx8nFtUwt9yI+oQWhXzbhs7H4/1ZK4n8ax/garA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH6uLUSOGlskccVBIX+AS4mkIM1KgY3H2c/OM9SZuao=;
 b=L9I7u/OiqMoUsZifvVRwnr2UI6HgYwzd1k+kkX17C6QcWgSYvaK0wfe49k+GIJt3irVTwbj/sRNY6jW88dlHZQdLAl/xCysEweFOVNQyUp6dlYAXr4ChUUlbN6hq6TtX1wdU15pA4P/c3F1V6LlLm7Ru6A11j1aEF4A+CXw4TkiHzgz0k8MqHZqhdciwnNgngLTDZVgrMZkU/6lkS59v/UnybhRx7D5aG/RKuVf6JpAYMMUfI82PvwN/stRF6HZJYMJ2MuqVUKaYMzKjuDuKA1zqRtUOlrHxEvg2rrxKNVTiMa6FoLUEzEKXiier/pd6Il/ykPbC/SDnl7wmOKrLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH6uLUSOGlskccVBIX+AS4mkIM1KgY3H2c/OM9SZuao=;
 b=BeFzVoSEuTGKsuQkkQeo0LftvEvZm89B/cv9FHSjBVfpkWpUvqA0Wcu0z8xvtMPLXmlgq1DQ3M87Ct6iw/HjqiL0JonaDw/9b+A549Fc/riXv78+sdV6KCl77biQB7nkC5lMjOYfJ/MXLWQC5qp4FeGesQ5ej3As3jaRxuLjy7g=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 15:05:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 15:05:29 +0000
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
To:     Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
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
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <835ba167-3576-1af6-5421-552075588796@amd.com>
Date:   Tue, 15 Sep 2020 17:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915145958.19993-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0058.eurprd05.prod.outlook.com
 (2603:10a6:200:68::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0501CA0058.eurprd05.prod.outlook.com (2603:10a6:200:68::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 15:05:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a838726-fffa-4157-c269-08d85988c810
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41250AA01CA1B95601DC4CEF83200@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7GgM4bqO5JcsIWOJL4//UUkwnNJXGNHZKrCDBcRkBJwuojXEgpW/xVeuyAoaF46u0080mwzt2ZsAb7SlPB6HDpijAmcwXMCw93dvH5flZgFFIXoEHx65eyx5ceMm6e6qGOk5uwSTSWrnzBTnYFNCEgvTFMDDnp+EasoXNq1ElrDyVFmbp8PnnuzJeRiq1yYXqcdWbu8Kl1dVJQtspbgKB6KlRlIXXxc+kIf4WAcCYQYmYf+NM6+9AxPsLDTalzcP6epv/M0eTd0cq+sa1jQ8aD0BiMnCM32aQDBXtTLuIjbMdTajQeJ0WR2t4Fvk69jqj3myMJDDTa857l3gKUoG2pa2WJRl05wuaKXWBhlyVHaJGJOPvD0CpIhGZMPYg1ia8eW5a1P10wKcn2DOS9smUL9fp+VohPilgYh0FBoKMQcNDZA+D3FAdO1c244DM+VS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(8676002)(16526019)(6666004)(31686004)(316002)(31696002)(52116002)(86362001)(5660300002)(66946007)(2906002)(6486002)(478600001)(8936002)(66476007)(66556008)(4326008)(1191002)(186003)(7406005)(2616005)(36756003)(7366002)(7416002)(66574015)(83380400001)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 64GigJExS88f6Sc/sZN+EAOYkB3JVxzWEXWUv/xT9N4/NxYk06hvG3FZ9dvkYiVEyf4M+krJrNQ0SHQuHDRdOXdZRHOHj+fOrClXsn2mwqa2alfLJ25CHBdPcqfG3WCUZECWSgjlthDvGqlEpw1HToJUL0O/5ND2eZ8PHU9rdSHA0pKAesLEbr2TqXukA3sTDzllVlbCEj9zAWLgj0LcB2wrqbKu8LOTaZY56FwJvVVf/v7qBnX8390lkX587slVuXoN5/kliWDEMJ9k1obTeSbuFASAZuXvkWeZucKvvj1UnuQ4Kddgn90u8njC8ABejQN2Bj/KWiQl3xGpXgGOChjNHMvVQzHyMkN3WpYTAPpbfcaSl6CFGkquFcAiDk2+otmg3c7I//Dhwo8/Mwz3dRfeqgvDlLweqf92zTEbyPE8dlaPMj2ZyPDB5Tx8UjNgWyva78w2Ikjp3X5rlJMvv7xbmJCpw/RQQNXAW06GEiEZUTtcf2Ju8j4UnSR1nDODqrmAlKBhmuCoWK7uLt4mliEzUzdmWBlYADbPOT1SOFpFActK8lPxhO/gj54j9lKEquLbIdUR8xcWWiQaECKrUi1pKTsPoaabK1A7yIom1CAw+e7FUXPHFYqX014dhNTMduCxAzdzfR3n3mTpPDVV1bQDsBgV/1+7Y8xvF7z4LPFdqezMF64JeiD/VbsQriXRxxdWfkjM1TzrN1KuEyM7uQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a838726-fffa-4157-c269-08d85988c810
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 15:05:28.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdj71nAlM95T5fuk70sjB5LBFvFYtCngbb20CQ4yyHoA22s1l11i0QYZ1aTJh0WE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
>
> v2:
> 	* move object-function instance to amdgpu_gem.c (Christian)
> 	* set callbacks in amdgpu_gem_object_create() (Christian)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 23 +++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h    |  5 -----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>   4 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 6edde2b9e402..840ca8f9c1e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver = {
>   	.lastclose = amdgpu_driver_lastclose_kms,
>   	.irq_handler = amdgpu_irq_handler,
>   	.ioctls = amdgpu_ioctls_kms,
> -	.gem_free_object_unlocked = amdgpu_gem_object_free,
> -	.gem_open_object = amdgpu_gem_object_open,
> -	.gem_close_object = amdgpu_gem_object_close,
>   	.dumb_create = amdgpu_mode_dumb_create,
>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>   	.fops = &amdgpu_driver_kms_fops,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = amdgpu_gem_prime_export,
>   	.gem_prime_import = amdgpu_gem_prime_import,
> -	.gem_prime_vmap = amdgpu_gem_prime_vmap,
> -	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
>   	.gem_prime_mmap = amdgpu_gem_prime_mmap,
>   
>   	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index aa7f230c71bf..aeecd5dc3ce4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -36,9 +36,12 @@
>   
>   #include "amdgpu.h"
>   #include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
>   #include "amdgpu_xgmi.h"
>   
> -void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
> +
> +static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>   {
>   	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
>   
> @@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   		return r;
>   	}
>   	*obj = &bo->tbo.base;
> +	(*obj)->funcs = &amdgpu_gem_object_funcs;
>   
>   	return 0;
>   }
> @@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
>    * Call from drm_gem_handle_create which appear in both new and open ioctl
>    * case.
>    */
> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
> -			   struct drm_file *file_priv)
> +static int amdgpu_gem_object_open(struct drm_gem_object *obj,
> +				  struct drm_file *file_priv)
>   {
>   	struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
> @@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object *obj,
>   	return 0;
>   }
>   
> -void amdgpu_gem_object_close(struct drm_gem_object *obj,
> -			     struct drm_file *file_priv)
> +static void amdgpu_gem_object_close(struct drm_gem_object *obj,
> +				    struct drm_file *file_priv)
>   {
>   	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> @@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   	ttm_eu_backoff_reservation(&ticket, &list);
>   }
>   
> +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
> +	.free = amdgpu_gem_object_free,
> +	.open = amdgpu_gem_object_open,
> +	.close = amdgpu_gem_object_close,
> +	.export = amdgpu_gem_prime_export,
> +	.vmap = amdgpu_gem_prime_vmap,
> +	.vunmap = amdgpu_gem_prime_vunmap,
> +};
> +
>   /*
>    * GEM ioctls.
>    */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> index e0f025dd1b14..637bf51dbf06 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> @@ -33,11 +33,6 @@
>   #define AMDGPU_GEM_DOMAIN_MAX		0x3
>   #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tbo.base)
>   
> -void amdgpu_gem_object_free(struct drm_gem_object *obj);
> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
> -void amdgpu_gem_object_close(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
>   unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index ac043baac05d..c4e82a8fa53f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -561,6 +561,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
>   	if (bo == NULL)
>   		return -ENOMEM;
> +

The newline is not unrelated.

Apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

But I think we need some smoke testing of it.

Christian.

>   	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>   	INIT_LIST_HEAD(&bo->shadow_list);
>   	bo->vm_bo = NULL;

