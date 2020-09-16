Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408AF26C7EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 20:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgIPSgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 14:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgIPS3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 14:29:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2362C08E86F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 05:09:55 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so6676382wrt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+3jvoy/bBV/BNfVwVnfU8KcCZN1nPBtEmgjgdo9EwXk=;
        b=FENeMTOiWrFokQkUzY6vSvMhlCXV7HMJqSDFsMTbLqeNytwJMofYpFGvXfw3GhxJQe
         D9FUrSX8+Brv74I6kUhpyFb/XZioFwNiGTb+QuFgOQkexhfx/xeg364unF1nN8hvk40W
         Hh+h3hsu+pBXFmPF/2PAzcQ04fALpK5XDa9tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+3jvoy/bBV/BNfVwVnfU8KcCZN1nPBtEmgjgdo9EwXk=;
        b=kNr//K0PbzWMkS2eaJZqZ4Pt1UMHKfydnshZjNVJqX3YUodDK9Etu85DpWg0fBeDA1
         XoC/r2DnQcvZNIETjjCe6V7DlcV20z4ziuL57xIMb0fUXoQ9Yq428JPtp/DTl4GZfnuV
         04OTbs8sOm0zaN2VN8UJlfjkAwSKynlp23KtypOHCkoS0cQoADwKh7R+9C9O/birzwOE
         Bhe3mJiLCGA5NHYG7GDLj8Jsw87b7Bcg1wrd1BnzDf9JTjcuVYnszPpqRKlplDr6lda0
         f6mzC2Th/TvryHyzVf0MVA31B9rBaqlootI9HDXLmefBfjlcqWNN5yt/evQ38hWZ6rwQ
         FNog==
X-Gm-Message-State: AOAM533mmippw/xm5Ir4dIo7Ke3K3kPWVCDfIpGXNMxlOye6IpbQuUz4
        FULYWv5wlSwNxW2Xy5gl7rtCKQ==
X-Google-Smtp-Source: ABdhPJwcFrpBowFHXDaGWxAmgGA6UC0qLIIbiwK0yYyfwUChHgh/bXrgr93clOHTT0R4i2flV+cOiA==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr28185933wrr.207.1600258192468;
        Wed, 16 Sep 2020 05:09:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n11sm32655611wrx.91.2020.09.16.05.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:09:51 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:09:48 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
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
        emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 17/21] drm/virtgpu: Set PRIME export function in
 struct drm_gem_object_funcs
Message-ID: <20200916120948.GO438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-18-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-18-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:54PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces virtgpu's per-driver PRIME export
> function with a per-object function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 1 -
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index b039f493bda9..1f8d6ed11d21 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -203,7 +203,6 @@ static struct drm_driver driver = {
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_mmap = drm_gem_prime_mmap,
> -	.gem_prime_export = virtgpu_gem_prime_export,
>  	.gem_prime_import = virtgpu_gem_prime_import,
>  	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 842f8b61aa89..4f7d7ea8194c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -108,6 +108,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
>  	.close = virtio_gpu_gem_object_close,
>  
>  	.print_info = drm_gem_shmem_print_info,
> +	.export = virtgpu_gem_prime_export,
>  	.pin = drm_gem_shmem_pin,
>  	.unpin = drm_gem_shmem_unpin,
>  	.get_sg_table = drm_gem_shmem_get_sg_table,
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
