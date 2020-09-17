Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6C926DA46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 13:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIQLbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 07:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgIQLbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 07:31:32 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CBBC061788;
        Thu, 17 Sep 2020 04:31:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so1610286wmh.4;
        Thu, 17 Sep 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
        b=WT+tCnqscdjnhBzx4pey4qfrs3TpF1Xktu7jt8T8cQSP0yZJdX3KoYHPdWspzIugsq
         6HSKY9VJKgsdLw89cCYxqdbs7Vt7/k4/jK9LtTE+4i9XvfXW1Lr/Fm+fEnngxxWPD5dx
         hAgvu8wEl2ImGMZ/Vxi1axcUTWC/C1hcCZmRCP+VMlQrWSEcu/Hqzj+fuVKA2INfBjX3
         /zcARTJCVi7gGPGSYovxguWtsuZzPwF6TsPs2IH9t/Kp5k3R+t/9fCDbL8cqbYXRyKxo
         iHGdqfCt+o61f/ixQfUMrk5tyRoSS69zCZaqGiTmJsGllEHi/xlz25EYavgN+6zZY8AL
         WM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
        b=aqjDBpusXuNQUj7CV+AkN9pQhHXDrkvYezt/YCQfSCm3JbRvtEAsOK6MmDn7TGscnd
         pM3DULz9ei+usiI0HQIgf/SnTZQnpCXeocXi3Ra1rmUwriJXZRaX8NFR2Sh5BAFHetcc
         LDFzexaVOpRFVXadVab6h3gfYDRn93FLG5GQ+BsUROm0m4kp6BT8hvHC/OoKbraFfi/1
         eV9q4bo/Iwz4eduj2WAy30OZDiw2YQ/xrcAxEOQJwix7ad4KxmHZunuMi7RqdFi4pMHq
         g/YIE+MXtBn7/znatiKyxN0lcdNmrnx8iPigDoa0t/q85MHqaF6LelCQtl30T5WCGaGW
         j/uQ==
X-Gm-Message-State: AOAM532rw2w2svcJsxjGy+a3a/LHq2P7waiaLVBHBzPTdvraUoSlbpid
        YiIDvbOUqcFwRxAxrIRO/fs=
X-Google-Smtp-Source: ABdhPJyuZcp+AqRLPz3yJIfvdwNUATarIMvgIK7I09VrN4WEXhLqSMqZyvaS1A1ZqiWgJrdIoQA/Hg==
X-Received: by 2002:a1c:96:: with SMTP id 144mr9601334wma.84.1600342290200;
        Thu, 17 Sep 2020 04:31:30 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
        by smtp.gmail.com with ESMTPSA id 11sm10489240wmi.14.2020.09.17.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:31:29 -0700 (PDT)
Date:   Thu, 17 Sep 2020 08:31:20 -0300
From:   Melissa Wen <melissa.srw@gmail.com>
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
        emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/21] drm/vkms: Introduce GEM object functions
Message-ID: <20200917113120.dtz7yxvdg7xdgbx5@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-19-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On 09/15, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! Looks fine.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
>  drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index cb0b6230c22c..726801ab44d4 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
>  	.release	= drm_release,
>  };
>  
> -static const struct vm_operations_struct vkms_gem_vm_ops = {
> -	.fault = vkms_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
> @@ -98,8 +92,6 @@ static struct drm_driver vkms_driver = {
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	.dumb_create		= vkms_dumb_create,
> -	.gem_vm_ops		= &vkms_gem_vm_ops,
> -	.gem_free_object_unlocked = vkms_gem_free_object,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index a017fc59905e..19a0e260a4df 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -7,6 +7,17 @@
>  
>  #include "vkms_drv.h"
>  
> +static const struct vm_operations_struct vkms_gem_vm_ops = {
> +	.fault = vkms_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
> +	.free = vkms_gem_free_object,
> +	.vm_ops = &vkms_gem_vm_ops,
> +};
> +
>  static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  						 u64 size)
>  {
> @@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->gem.funcs = &vkms_gem_object_funcs;
> +
>  	size = roundup(size, PAGE_SIZE);
>  	ret = drm_gem_object_init(dev, &obj->gem, size);
>  	if (ret) {
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
