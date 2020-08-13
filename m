Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42192438E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 12:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHMKrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 06:47:32 -0400
Received: from mail-dm6nam11on2053.outbound.protection.outlook.com ([40.107.223.53]:58209
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbgHMKr1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 06:47:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdj0grcaIIecbwllRgGWhUlIlUjv13/R78NNehk1PCGSsCQxqbj1TEw/ObrGIlzPLZlHEa8MW9w8nM+cCCDqPSRSB2pJRJMCH4O7SIql6Zp+4jzn0Y2Wpbee3EAZ+UjfLr4d20vCKEOYNHdqr3RHAH/paiq2ULNhCz6XBz47drGw/KOjZELlxt1X/HMxH2pcou/rV7i9j7+tdmXyKuBAlx+OnAXDQa5T/i6+kv6uCEnLu84Dkq5h2SDShJ+r/okDG3ZhOlnSec+RSd2IRvfHaqKElC6pIqiJOptijkAE9+JU3nFhMXDHjYd7FuOqWPoU+h/7+eOvNsCqYH3IGAdLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBd8DQ/bfMAfOk7SWaHtrVKCOWBNjh1g7eNQlYG5zBI=;
 b=m0mI5rL95cXVyf+YuiVP6uYt4JKxjzgIRb9eHS4uuatdO9Q+MpZ1jnbikskRCmLuQnsbjpZbVSZbP55ZGrIH815TeGvjc1N3TxH75MLzOpdKS2+y6zc0AN9m68k1TuMlVwZYKVIzEHcWqzTdpTKIwj8+6ds5poscou9r+oyfFdszFW0rdLaZu78yV9GaTurbZiyYgNPe9tN6lE6ruoBH2F23N1mJhINEKG4E2oMADFCHRHabvGM2X7LogU41tyVK1+z1VWZZPwQSNA71APVJJERLCMbkgqLl/9z5r8pPZxx7at9K0H/F0ddwEmoPUjjfUnbKiD8c6FL+o+ouKR1Ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBd8DQ/bfMAfOk7SWaHtrVKCOWBNjh1g7eNQlYG5zBI=;
 b=14JkI7HQW+JlY8Q+sZRyDe6ABruAgDWZ5LTJYOZ9kJKX8wlLmed5jAiW0nGCFnWvB3FlXBuxLmm4WgdEUsySPGmhJQ1I1e+q5Hm6trYDBAlVAP7MvqhVObtGGELyvGUOxuSeAYUAf29UdkkGwqDSz4oxlZWP6TPQZNYTHSFkm0Y=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 10:47:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 10:47:20 +0000
Subject: Re: [PATCH 12/20] drm/radeon: Introduce GEM object functions
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
        abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
        andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-13-tzimmermann@suse.de>
 <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>
 <5372b2ef-b7cf-f4e9-9199-6dee5bf6696f@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f6792a90-6dfb-5806-47b2-3208a85ec79b@amd.com>
Date:   Thu, 13 Aug 2020 12:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5372b2ef-b7cf-f4e9-9199-6dee5bf6696f@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0101CA0067.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 10:47:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab994f1c-ee35-497a-985d-08d83f764080
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399990A8E65661C03D1DA2FB83430@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: huQnBvIEPPPlt5fmax/wAQd/SeYGnhqX13yrHJLiFk8oUlakhZe8r0BQKN4W96V2DdBw4LE2bTjkTGxojJRyIMsw+W6aXafEZyjBZNXU33xX9ERj022oRKls3pfgb0YAbm1c49/ZQ0YlOWB8WjiSWaFGjX7ycnH4P9mmMqgAmhTl3PiYkA3k0K9afZBJTtkuyHqFIucUAc4Ik2c4pxobGpvHIkvv+pam2jnJGHF2eN5lmmptzNgqnUiPvzqHFbCA7zR7so5ucIt+vIwOvr/b2eNoTPHtuV3BTF8v1g0NtwwwO1j7C+wdo9IfThB8cfQHCDsp0sK1B54lvCFLLEXXD7ANUkwpaZMiAMNtfOMIvp7tn6cWfxcRz2amMKj4bzQv8TQbFCXsOnq3xrwyWMuNbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(186003)(66574015)(8936002)(6486002)(31696002)(2616005)(83380400001)(7406005)(7366002)(2906002)(6666004)(66946007)(66476007)(31686004)(498600001)(52116002)(36756003)(16526019)(5660300002)(8676002)(1191002)(66556008)(7416002)(86362001)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: C7QVq5xWUUnSFRVFtIbelIBtkBVKbqpntqzuFq5dEbyvSaYRcg+GBGhHRsxIgue0QMNrl1uJV5CcmD837zdQRab3IRuDubWfQ3/QZznZzLXxacrP2lTu1hU2s8t32abKfhjESUMVwbDcATpwOmyZ7spUXO10HzPAkFGZpsHQCUYURYRAAG/pIvpgdBqqfSsTXKh/wFEzjQTILBopcbQo2GqQzAUVFA2UoDSGiLOkJ0P4J8BxAbUyedvqDAv0cJbY8u2O722MLR+P79HBRVJolucyqafW4MdALOmuYxqzwCUmqvYCVpdYgh9HRJpelIGWRhlFMfgO/zNGou/9LLNYUySHyj4d2NNPR3ZUxpOLquMetAVZI8mj/xHjwlbotMVAYapLpBAt95kXTgIoXpnfIKZTxiW2UWKcNe7WNWr91LXXho1J04nmKoZOJEpL52zLtEjuMVG6zs9TJES8NTq4puJHHfubXqYDXguKTx2pRK5OuH0USeg1px5onCQkwz+s+TD6wL7nH26aiYNDPMoAmXuKiml9cBzT1PURepTBxTCKpfBNF1PDGYdocBnZwZhBPhqm/52ZuxfsTWK+GE5+CdVzWiEDC1Qa4nCleMfeeN1RuQXAaNo12cbp9efAYUTl+4VayxoqNSN1MxEdeir839f9yqTbKzjxocKbYUl9FFeJRpJIpO7fpFymBG7kaVQO7CzyLshxgK5dZh94rEZ1OQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab994f1c-ee35-497a-985d-08d83f764080
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 10:47:19.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s63P4Wxp/CKackyV6vflQiOjfqlpzMa8Br1qIsa/tN6WAbx9naWAPaCCXvsETFkD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am 13.08.20 um 12:41 schrieb Thomas Zimmermann:
> Hi
>
> Am 13.08.20 um 12:24 schrieb Christian König:
>> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>>> GEM object functions deprecate several similar callback interfaces in
>>> struct drm_driver. This patch replaces the per-driver callbacks with
>>> per-instance callbacks in radeon.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>    drivers/gpu/drm/radeon/radeon_drv.c    | 23 +----------------------
>>>    drivers/gpu/drm/radeon/radeon_object.c | 26 ++++++++++++++++++++++++++
>>>    2 files changed, 27 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c
>>> b/drivers/gpu/drm/radeon/radeon_drv.c
>>> index 4cd30613fa1d..65061c949aee 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>>> @@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct
>>> drm_device *dev);
>>>    int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
>>>    void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
>>>    irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
>>> -void radeon_gem_object_free(struct drm_gem_object *obj);
>>> -int radeon_gem_object_open(struct drm_gem_object *obj,
>>> -                struct drm_file *file_priv);
>>> -void radeon_gem_object_close(struct drm_gem_object *obj,
>>> -                struct drm_file *file_priv);
>>> -struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>>> -                    int flags);
>>>    extern int radeon_get_crtc_scanoutpos(struct drm_device *dev,
>>> unsigned int crtc,
>>>                          unsigned int flags, int *vpos, int *hpos,
>>>                          ktime_t *stime, ktime_t *etime,
>>> @@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>>>    int radeon_mode_dumb_create(struct drm_file *file_priv,
>>>                    struct drm_device *dev,
>>>                    struct drm_mode_create_dumb *args);
>>> -struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object
>>> *obj);
>>>    struct drm_gem_object *radeon_gem_prime_import_sg_table(struct
>>> drm_device *dev,
>>>                                struct dma_buf_attachment *,
>>>                                struct sg_table *sg);
>>> -int radeon_gem_prime_pin(struct drm_gem_object *obj);
>>> -void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>>> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
>>> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>>>      /* atpx handler */
>>>    #if defined(CONFIG_VGA_SWITCHEROO)
>>> @@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
>>>        }
>>>          ret = drm_ioctl(filp, cmd, arg);
>>> -
>>> +
>>>        pm_runtime_mark_last_busy(dev->dev);
>>>        pm_runtime_put_autosuspend(dev->dev);
>>>        return ret;
>>> @@ -609,22 +597,13 @@ static struct drm_driver kms_driver = {
>>>        .irq_uninstall = radeon_driver_irq_uninstall_kms,
>>>        .irq_handler = radeon_driver_irq_handler_kms,
>>>        .ioctls = radeon_ioctls_kms,
>>> -    .gem_free_object_unlocked = radeon_gem_object_free,
>>> -    .gem_open_object = radeon_gem_object_open,
>>> -    .gem_close_object = radeon_gem_object_close,
>>>        .dumb_create = radeon_mode_dumb_create,
>>>        .dumb_map_offset = radeon_mode_dumb_mmap,
>>>        .fops = &radeon_driver_kms_fops,
>>>          .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>        .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>> -    .gem_prime_export = radeon_gem_prime_export,
>>> -    .gem_prime_pin = radeon_gem_prime_pin,
>>> -    .gem_prime_unpin = radeon_gem_prime_unpin,
>>> -    .gem_prime_get_sg_table = radeon_gem_prime_get_sg_table,
>>>        .gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
>>> -    .gem_prime_vmap = radeon_gem_prime_vmap,
>>> -    .gem_prime_vunmap = radeon_gem_prime_vunmap,
>>>          .name = DRIVER_NAME,
>>>        .desc = DRIVER_DESC,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c
>>> b/drivers/gpu/drm/radeon/radeon_object.c
>>> index bb7582afd803..882390e15dfe 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>>> @@ -45,6 +45,19 @@ int radeon_ttm_init(struct radeon_device *rdev);
>>>    void radeon_ttm_fini(struct radeon_device *rdev);
>>>    static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>>>    +void radeon_gem_object_free(struct drm_gem_object *obj);
>>> +int radeon_gem_object_open(struct drm_gem_object *obj,
>>> +                struct drm_file *file_priv);
>>> +void radeon_gem_object_close(struct drm_gem_object *obj,
>>> +                struct drm_file *file_priv);
>>> +struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>>> +                    int flags);
>>> +struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object
>>> *obj);
>>> +int radeon_gem_prime_pin(struct drm_gem_object *obj);
>>> +void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>>> +void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
>>> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>>> +
>>>    /*
>>>     * To exclude mutual BO access we rely on bo_reserve exclusion, as all
>>>     * function are calling it.
>>> @@ -180,6 +193,18 @@ void radeon_ttm_placement_from_domain(struct
>>> radeon_bo *rbo, u32 domain)
>>>        }
>>>    }
>>>    +static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>>> +    .free = radeon_gem_object_free,
>>> +    .open = radeon_gem_object_open,
>>> +    .close = radeon_gem_object_close,
>>> +    .export = radeon_gem_prime_export,
>>> +    .pin = radeon_gem_prime_pin,
>>> +    .unpin = radeon_gem_prime_unpin,
>>> +    .get_sg_table = radeon_gem_prime_get_sg_table,
>>> +    .vmap = radeon_gem_prime_vmap,
>>> +    .vunmap = radeon_gem_prime_vunmap,
>>> +};
>>> +
>> Same comment as for amdgpu, please put that into radeon_gem.c instead.
> There's no good header file to put the declarations, right? I'm asking
> because checkpatch warns about declarations in the source files.

Yes, that is kind of a mess because radeon used to support both KMS and UMS.

Thanks for cleaning this up,
Christian.

>
> Best regards
> Thomas
>
>> Christian.
>>
>>>    int radeon_bo_create(struct radeon_device *rdev,
>>>                 unsigned long size, int byte_align, bool kernel,
>>>                 u32 domain, u32 flags, struct sg_table *sg,
>>> @@ -209,6 +234,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>>>        bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
>>>        if (bo == NULL)
>>>            return -ENOMEM;
>>> +    bo->tbo.base.funcs = &radeon_gem_object_funcs;
>>>        drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
>>>        bo->rdev = rdev;
>>>        bo->surface_reg = -1;

