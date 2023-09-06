Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31407936B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjIFIBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbjIFIBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:01:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1258CEE;
        Wed,  6 Sep 2023 01:01:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 182296600BB0;
        Wed,  6 Sep 2023 09:01:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693987293;
        bh=vSEIaR0lPEZiYOY+uQLPwZjudJxV4ZVUe6FLxcVC0oM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BlCQogUgTVT6d/M0WuRpPNnxcGrYQsqBEPt5nZTW+RnlfvDefBMOijc0pc2WBAqWX
         I8vZ1WhUPmG6/Fdqnt+vjclknMeJ6Yn/gPfr71yyCQRbas99W7A0fIMg46imeFMIz9
         d0lPsbRf6q/LDXLrgiqbGq9LgxQNEXJGK2GUREm+5B74v0f7lwVCcPIOvPDOLkZcXx
         xlEAFah0wCK1uVE/MTkPtSoIR08Hd3wNhfrbAr8xpb9q6HHSdKQtEQZQCS+PLWyZwk
         VoA1N1uJWB48Ks3P8agTXP8ovAA2bIIvOGSWYI6IvUb/dp2onK7BKe3xujQTtXscPP
         NDQd7n7rSqxPg==
Date:   Wed, 6 Sep 2023 10:01:30 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org,
        steven.price@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        healych@amazon.com, kernel@collabora.com,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 7/8] drm/panfrost: Implement generic DRM object RSS
 reporting function
Message-ID: <20230906100130.530c4e4a@collabora.com>
In-Reply-To: <20230905184533.959171-8-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
        <20230905184533.959171-8-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue,  5 Sep 2023 19:45:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> BO's RSS is updated every time new pages are allocated on demand and mapp=
ed
> for the object at GPU page fault's IRQ handler, but only for heap buffers.
> The reason this is unnecessary for non-heap buffers is that they are mapp=
ed
> onto the GPU's VA space and backed by physical memory in their entirety at
> BO creation time.
>=20
> This calculation is unnecessary for imported PRIME objects, since heap
> buffers cannot be exported by our driver, and the actual BO RSS size is t=
he
> one reported in its attached dmabuf structure.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++++----
>  3 files changed, 27 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 7d8f83d20539..cb92c0ed7615 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -208,6 +208,19 @@ static enum drm_gem_object_status panfrost_gem_statu=
s(struct drm_gem_object *obj
>  	return res;
>  }
> =20
> +static size_t panfrost_gem_rss(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +
> +	if (bo->is_heap)
> +		return bo->heap_rss_size;
> +	else if (bo->base.pages) {
> +		WARN_ON(bo->heap_rss_size);
> +		return bo->base.base.size;
> +	} else
> +		return 0;

Nit: please add brackets on all conditional blocks, even if only the
second one needs it.

> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs =3D {
>  	.free =3D panfrost_gem_free_object,
>  	.open =3D panfrost_gem_open,
> @@ -220,6 +233,7 @@ static const struct drm_gem_object_funcs panfrost_gem=
_funcs =3D {
>  	.vunmap =3D drm_gem_shmem_object_vunmap,
>  	.mmap =3D drm_gem_shmem_object_mmap,
>  	.status =3D panfrost_gem_status,
> +	.rss =3D panfrost_gem_rss,
>  	.vm_ops =3D &drm_gem_shmem_vm_ops,
>  };
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index ad2877eeeccd..13c0a8149c3a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -36,6 +36,11 @@ struct panfrost_gem_object {
>  	 */
>  	atomic_t gpu_usecount;
> =20
> +	/*
> +	 * Object chunk size currently mapped onto physical memory
> +	 */
> +	size_t heap_rss_size;
> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index d54d4e7b2195..67c206124781 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -285,17 +285,19 @@ static void panfrost_mmu_flush_range(struct panfros=
t_device *pfdev,
>  	pm_runtime_put_autosuspend(pfdev->dev);
>  }
> =20
> -static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu=
 *mmu,
> +static size_t mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_=
mmu *mmu,
>  		      u64 iova, int prot, struct sg_table *sgt)
>  {
>  	unsigned int count;
>  	struct scatterlist *sgl;
>  	struct io_pgtable_ops *ops =3D mmu->pgtbl_ops;
>  	u64 start_iova =3D iova;
> +	size_t total =3D 0;
> =20
>  	for_each_sgtable_dma_sg(sgt, sgl, count) {
>  		unsigned long paddr =3D sg_dma_address(sgl);
>  		size_t len =3D sg_dma_len(sgl);
> +		total +=3D len;
> =20
>  		dev_dbg(pfdev->dev, "map: as=3D%d, iova=3D%llx, paddr=3D%lx, len=3D%zx=
", mmu->as, iova, paddr, len);
> =20
> @@ -315,7 +317,7 @@ static int mmu_map_sg(struct panfrost_device *pfdev, =
struct panfrost_mmu *mmu,
> =20
>  	panfrost_mmu_flush_range(pfdev, mmu, start_iova, iova - start_iova);
> =20
> -	return 0;
> +	return total;
>  }
> =20
>  int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
> @@ -447,6 +449,7 @@ static int panfrost_mmu_map_fault_addr(struct panfros=
t_device *pfdev, int as,
>  	pgoff_t page_offset;
>  	struct sg_table *sgt;
>  	struct page **pages;
> +	size_t mapped_size;
> =20
>  	bomapping =3D addr_to_mapping(pfdev, as, addr);
>  	if (!bomapping)
> @@ -518,10 +521,11 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
>  	if (ret)
>  		goto err_map;
> =20
> -	mmu_map_sg(pfdev, bomapping->mmu, addr,
> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +	mapped_size =3D mmu_map_sg(pfdev, bomapping->mmu, addr,
> +				 IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> =20
>  	bomapping->active =3D true;
> +	bo->heap_rss_size +=3D mapped_size;

The alloc-on-fault granularity is set static (2MB), so no need to
make mmu_map_sg() return the mapped size, we can just do +=3D SZ_2M if
things worked.

> =20
>  	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
> =20

