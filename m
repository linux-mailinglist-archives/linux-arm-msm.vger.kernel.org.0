Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80722275A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 16:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgIWOdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 10:33:46 -0400
Received: from mail-bn8nam11on2082.outbound.protection.outlook.com ([40.107.236.82]:16928
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726603AbgIWOdq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 10:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN2ZYEtEXk1Qj4f41rNRyTKdQorN7gK2cZ8UG2SsgikjgyGCfJ4zXdnRYSr59RVtl6A+peYiA/Q8kmPjVY9LYtVX54DOpP+18HhAUnbjChfJB47xExKGjAydnWRxlKPZifIJWJvu+W/xAXsg+vl1X788JATZCXk6oskNVtW4G9tf78QEHvH5dWiPf7oI6JM09r+MHapPRgYIQnEcQsRELhlIlhkDLwp58nB2J4b9owKiW7qQc50PTw31kpjg13L5/WrC6YSVNOSfAHohF9uDvXBrk3F9rx7FzpF9ZnlJZyrtj3oW8IzlyB35Z1kc98cqQGB8ajL5w057en6VlcemNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3IPL0ivarmUKpPMxxGaKq/U0k8n2iy8w/Y9wuxWLRA=;
 b=d2qBK9gw3bM9OkvzoKJXY49zOERZzDZt6t0S2GcvYy416uWNS+frtbQxQp4YsgfqquozCPCICUmmqpnczm84zKGLKHPW9cXH/VdWgjUrnUOrMZj09NvTYZbuqvQBvMnUxum4K/PoQZxHwLhrtE3c9lC4fw4He/QBT51DLbevNbHwSmwfnqHn77QW2iVQNA2Qg6KyiDB6vF4IWadXlL9qPHdzcZjaAvKo8+W/s+LlSFUfhdzz1tZUCSHYv0Z8+ZK5+yeHbX+OV21wC65wTzvPFD2ZGf8RuvkoztN7h6fcgq7xXvnC+hWOVunj/18GK/RqoRqdWpfbVlPvrDvoAL/Fjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3IPL0ivarmUKpPMxxGaKq/U0k8n2iy8w/Y9wuxWLRA=;
 b=I2UjvRQOXfBXt2LnrW+t8TVooCzskuZ3ACdaCxSCfLpKdMWhvd50ncNr/Iwhow6EeJKRE/NpMz38W1VVRHIANHViG2Dp1CqBo13b+X+dBChoqLVur5YSrzWLckSpUSBUE97C+R15uF3ypFGJ8J1fiVQFua19/DJowti2N2XhT/U=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:33:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:33:41 +0000
Subject: Re: [PATCH v3 00/22] Convert all remaining drivers to GEM object
 functions
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
        emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20200923102159.24084-1-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>
Date:   Wed, 23 Sep 2020 16:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0101.eurprd02.prod.outlook.com
 (2603:10a6:208:154::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR02CA0101.eurprd02.prod.outlook.com (2603:10a6:208:154::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 14:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cdc5d2fe-1c0c-4af6-44a3-08d85fcdaa89
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549FCDCA2E53DF248C9E00583380@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ap4vP6/2a9OIkw75pLp/ouoPmmiv0yY6sfZ7LPtk6OyHVwNVqxHrWq443HM6aTGHUFQOQxYJ3uA2aA8Tm8BeL0fu0ORFsdua7Ex71HOGfNMGd0e7AKPFIrGMgwSW16gLrMbxRTpwTuFvhp3OjBPO4JKOk0hWo7q1x0jFE6au0HUukALB/Ij3/EvctIO+7GEZCIArQoqdEXnQUJdUoEY/6zEsrjNK+IuGLwV9s7RVhD8Ztcct9mwH33IWyLrQRH8WQAAtAMaDHY68bkKiDwKCAzwuli+XO00zyWWo2H86l4w4njQfxgBow/g/OnfXeu3L/o3J/p+2dipwsRwsjNLIF/+YOoTSvUO6cYfa9tx588/FmhYwjafC0vMyODqW0I6nqddOvel9LE+8rJ3Zem4Mp1Nl9cGAA1PLel3kp21N+9QkAUcpj6g8blfR1vL0aZh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(66574015)(8936002)(52116002)(66476007)(316002)(7406005)(7366002)(7416002)(66556008)(66946007)(4326008)(8676002)(478600001)(6666004)(6486002)(16526019)(2616005)(186003)(36756003)(2906002)(31686004)(5660300002)(86362001)(1191002)(83380400001)(31696002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XcUTekjQMx9d/ieEiI3o4xdJ23NeWOEK7c6wtUYschSBxtmwgmI3Ti7WLdQdP+iYbgjIInFx3ArSf6fdxUxFGdYokBrNDR5fOTkwSTcSZzwIfnucFyo/dn2KDnxy/eT66XVoGUq8vwMX78OYt7RFTY+Z5Yx81rvDoTMcaJbzTZujI9MlZjOufm6P4Z/nVIvAhP0j86+VGPDHODnnZtyrnxIHerDgPfvRqvOeux+S1d2ripf3XtuQgj11oe5SXPc9/xi7RBULsRMTP/gcya9Upzfhk3n31BrF5cAf4npUaD57wEntdfgmkflQjWVMF6mslTWXS58tc5nOuHV63EL2OJOkdYVJ6pkdgp18+BfvMG3FoaDIeuv4KI3h6cYgi7dEGT1j4HWfRWMGaxenObA80xW9vKnPySC+2wyZO+GFhNMrQzC9WywilaBdvtIhtSAbGQSxMmPUvGesJBNwlIJYcLlBGAbTjK/MuKjN5vZlv+27aZ2sKAUkMuHSARfYebYXFNs9Alm3BMtVJ04kHFrKkWw/J3dMIUn5h55aODYHf7WDR64xc9R3J+ZKEGyPa1QchIPrh6mlGFeCuK4sZhMeip9YhEH9hP/Eq6A2DSrAYkuO+pgUFTT2L0o+LH+mEyO3F+OZAjSIo9IAQenZjkYHHWCQEmRVv4oH1HEFutxJCLkhYbabNsAWRxqfArIUW68XSRy1QlAKt34vI4q1i0zYeA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc5d2fe-1c0c-4af6-44a3-08d85fcdaa89
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:33:41.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYPcp7VH3V+QYnBgkjSyEP1koe+X8eMtnU2MNQVB3vhRL5SYivz4KcFlfJ4tP5y1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to all patches which I haven't explicitly reviewed.

I would say we should just push this to drm-misc-next now.

Thanks for the nice cleanup,
Christian.

Am 23.09.20 um 12:21 schrieb Thomas Zimmermann:
> The GEM and PRIME related callbacks in struct drm_driver are deprecated in
> favor of GEM object functions in struct drm_gem_object_funcs. This patchset
> converts the remaining drivers to object functions and removes most of the
> obsolete interfaces.
>
> Version 3 of this patchset mostly fixes drm_gem_prime_handle_to_fd and
> updates i.MX's dcss driver. The driver was missing from earlier versions
> and still needs review.
>
> Patches #1 to #6, #8 to #17 and #19 to #20 convert DRM drivers to GEM object
> functions, one by one. Each patch moves existing callbacks from struct
> drm_driver to an instance of struct drm_gem_object_funcs, and sets these
> funcs when the GEM object is initialized. The expection is .gem_prime_mmap.
> There are different ways of how drivers implement the callback, and moving
> it to GEM object functions requires a closer review for each.
>
> Patch #18 fixes virtgpu to use GEM object functions where possible. The
> driver recently introduced a function for one of the deprecated callbacks.
>
> Patches #7 and #20 convert i.MX's dcss and xlnx to CMA helper macros. There's
> no apparent reason why the drivers do the GEM setup on their's own. Using CMA
> helper macros adds GEM object functions implicitly.
>
> With most of the GEM and PRIME moved to GEM object functions, related code
> in struct drm_driver and in the DRM core/helpers is being removed by patch
> #22.
>
> Further testing is welcome. I tested the drivers for which I have HW
> available. These are gma500, i915, nouveau, radeon and vc4. The console,
> Weston and Xorg apparently work with the patches applied.
>
> v3:
> 	* restore default call to drm_gem_prime_export() in
> 	  drm_gem_prime_handle_to_fd()
> 	* return -ENOSYS if get_sg_table is not set
> 	* drop all checks for obj->funcs
> 	* clean up TODO list and documentation
> v2:
> 	* moved code in amdgpu and radeon
> 	* made several functions static in various drivers
> 	* updated TODO-list item
> 	* fix virtgpu
>
> Thomas Zimmermann (22):
>    drm/amdgpu: Introduce GEM object functions
>    drm/armada: Introduce GEM object functions
>    drm/etnaviv: Introduce GEM object functions
>    drm/exynos: Introduce GEM object functions
>    drm/gma500: Introduce GEM object functions
>    drm/i915: Introduce GEM object functions
>    drm/imx/dcss: Initialize DRM driver instance with CMA helper macro
>    drm/mediatek: Introduce GEM object functions
>    drm/msm: Introduce GEM object funcs
>    drm/nouveau: Introduce GEM object functions
>    drm/omapdrm: Introduce GEM object functions
>    drm/pl111: Introduce GEM object functions
>    drm/radeon: Introduce GEM object functions
>    drm/rockchip: Convert to drm_gem_object_funcs
>    drm/tegra: Introduce GEM object functions
>    drm/vc4: Introduce GEM object functions
>    drm/vgem: Introduce GEM object functions
>    drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
>    drm/vkms: Introduce GEM object functions
>    drm/xen: Introduce GEM object functions
>    drm/xlnx: Initialize DRM driver instance with CMA helper macro
>    drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
>
>   Documentation/gpu/drm-mm.rst                  |  4 +-
>   Documentation/gpu/todo.rst                    |  9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 23 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h       |  5 --
>   drivers/gpu/drm/armada/armada_drv.c           |  3 -
>   drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
>   drivers/gpu/drm/armada/armada_gem.h           |  2 -
>   drivers/gpu/drm/drm_gem.c                     | 53 ++++--------
>   drivers/gpu/drm/drm_gem_cma_helper.c          |  8 +-
>   drivers/gpu/drm/drm_prime.c                   | 14 +--
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
>   drivers/gpu/drm/gma500/framebuffer.c          |  2 +
>   drivers/gpu/drm/gma500/gem.c                  | 18 +++-
>   drivers/gpu/drm/gma500/gem.h                  |  3 +
>   drivers/gpu/drm/gma500/psb_drv.c              |  9 --
>   drivers/gpu/drm/gma500/psb_drv.h              |  2 -
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 -
>   drivers/gpu/drm/i915/i915_drv.c               |  4 -
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
>   drivers/gpu/drm/imx/dcss/dcss-kms.c           | 14 +--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
>   drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
>   drivers/gpu/drm/msm/msm_drv.h                 |  1 -
>   drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
>   drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
>   drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
>   drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
>   drivers/gpu/drm/omapdrm/omap_gem.c            | 18 +++-
>   drivers/gpu/drm/omapdrm/omap_gem.h            |  2 -
>   drivers/gpu/drm/pl111/pl111_drv.c             |  5 +-
>   drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
>   drivers/gpu/drm/radeon/radeon_gem.c           | 31 ++++++-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 12 ++-
>   drivers/gpu/drm/tegra/drm.c                   |  4 -
>   drivers/gpu/drm/tegra/gem.c                   |  8 ++
>   drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
>   drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
>   drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
>   drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  1 -
>   drivers/gpu/drm/virtio/virtgpu_object.c       |  1 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
>   drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
>   drivers/gpu/drm/xen/xen_drm_front.c           | 44 ++++------
>   drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
>   drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
>   include/drm/drm_drv.h                         | 85 +------------------
>   include/drm/drm_gem.h                         |  2 +-
>   59 files changed, 333 insertions(+), 375 deletions(-)
>
> --
> 2.28.0
>

