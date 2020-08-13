Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D85243740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 11:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHMJIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 05:08:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:6798 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMJIt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 05:08:49 -0400
IronPort-SDR: 00QbEfF72nisPJYXqTaJq/W9ISoFl1LPH/CLzt+Q0oukCG7IdbgLPnkWOqeBURyzbuAHR/lhif
 2MPdsT4yySjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="218522299"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="218522299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 02:08:48 -0700
IronPort-SDR: MzLdBg29y17Qw947zHTwHA+CSmHBs2Zvn+6Bs6sqi/aBfHd1F5a0YahIdS8U60Hdv6sgpLlMWW
 /z+PVkWCy4qA==
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="470144306"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost) ([10.252.50.170])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 02:08:15 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, l.stach@pengutronix.de,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        patrik.r.jakobsson@gmail.com, joonas.lahtinen@linux.intel.com,
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
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
In-Reply-To: <20200813083644.31711-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200813083644.31711-1-tzimmermann@suse.de> <20200813083644.31711-7-tzimmermann@suse.de>
Date:   Thu, 13 Aug 2020 12:08:12 +0300
Message-ID: <877du2j4lf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Aug 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in i915.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c       |  9 ++++++++-
>  drivers/gpu/drm/i915/i915_drv.c                  | 10 ++++++----
>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c |  3 ---
>  4 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index c8421fd9d2dc..bc15ee4f2bd5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -41,7 +41,14 @@ static struct i915_global_object {
>  
>  struct drm_i915_gem_object *i915_gem_object_alloc(void)
>  {
> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
> +	obj->base.funcs = &i915_gem_object_funcs;
> +
> +	return obj;
>  }
>  
>  void i915_gem_object_free(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 068447f565a9..b09eee11c540 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1840,6 +1840,12 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
>  };
>  
> +const struct drm_gem_object_funcs i915_gem_object_funcs = {
> +	.free = i915_gem_free_object,
> +	.close = i915_gem_close_object,
> +	.export = i915_gem_prime_export,
> +};
> +

Any reason not to make this static in i915_gem_object.c next to its only
user?

BR,
Jani.


>  static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
> @@ -1853,12 +1859,8 @@ static struct drm_driver driver = {
>  	.lastclose = i915_driver_lastclose,
>  	.postclose = i915_driver_postclose,
>  
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
> -
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = i915_gem_prime_export,
>  	.gem_prime_import = i915_gem_prime_import,
>  
>  	.dumb_create = i915_gem_dumb_create,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index bacb4c762f5b..666db65fe69e 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1736,6 +1736,7 @@ intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *dev_priv)
>  
>  /* i915_drv.c */
>  extern const struct dev_pm_ops i915_pm_ops;
> +extern const struct drm_gem_object_funcs i915_gem_object_funcs;
>  
>  int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>  void i915_driver_remove(struct drm_i915_private *i915);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index ce4d4303229c..4725dad63e0a 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -86,9 +86,6 @@ static struct drm_driver mock_driver = {
>  	.name = "mock",
>  	.driver_features = DRIVER_GEM,
>  	.release = mock_device_release,
> -
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
>  };
>  
>  static void release_dev(struct device *dev)

-- 
Jani Nikula, Intel Open Source Graphics Center
