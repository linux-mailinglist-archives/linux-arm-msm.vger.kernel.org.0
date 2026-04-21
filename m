Return-Path: <linux-arm-msm+bounces-103964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHelJS6a52kV+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:39:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45E43CD7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0245D309F3FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5CF29B77E;
	Tue, 21 Apr 2026 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FfmbpygB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF5926ED3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785554; cv=none; b=YfA7L9d8lwyuZvBPk1/X1OwIN6WsJoyapvQqy/l9wKhK23Kw73m0ZEnWfIEAmLNsQrXgIqmHZ9bsdlsuDFxKiwdbXMgZb7jbVSp9AklOTKPXCvY2F64/F0MtfJiXPDo+bPERmGq0x1d1TzjGyAwdDQra3Wmb78X5Lkj6lRokHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785554; c=relaxed/simple;
	bh=fhBy7ZTDUwKSbf3HhFiViEZekUwSlWT1MQ0rYA5c8Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l55RcipVODJeXh57bFpV7CVIuyBMUJ2VN/ZIGI3IMgjHHM9+XYKDkPVasuzJHM/5MniQC5AoKY32VZ7lmHjysDSnGzEAxa1DsQl8uPokzr0jayjnws448lgc89NYLJ4LZhb+/UcdxIVLH9II+YWMbZAxDW3LFWga30wkWUtQFhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FfmbpygB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A313227B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:32:26 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEA203FAF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776785552; bh=fhBy7ZTDUwKSbf3HhFiViEZekUwSlWT1MQ0rYA5c8Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfmbpygByk23YzbABMyTRXWW85LQhh39rMk/SBDS7be7vcThpdAMi7FVHx4+734Lg
	 Fh4YPeHC0X2PdGG1at/V8wsnqvGs6KgdkfLFOFEDr6ec38YW+gQgkTl21X2jA28D11
	 oXZwVnnKX2+wfNt66d6nhHZbHEN8s+kwATnOD+Fs=
Date: Tue, 21 Apr 2026 16:32:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: dakr@kernel.org, boris.brezillon@collabora.com, steven.price@arm.com,
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
Message-ID: <aeeYhWsRqXqfnzge@e142607>
References: <20260421084701.24227-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103964-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 3A45E43CD7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:47:01AM +0200, Laura Nao wrote:
> The DRIVER_GEM_GPUVA feature flag is currently only used to control two
> behaviors within the DRM core:
> - calling  drm_gem_gpuva_init() during
>   GEM object initialization
> - creating the "gpuvas" debugfs entry
> 
> drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is cheap
> to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
> referenced by GPU-VA capable drivers, so clearing the feature bit does
> not cause any unrelated drivers to get the "gpuvas" debugfs node. The
> flag doesn't have any relevant purpose (e.g. gating ioctl handlers or MM
> logic) and doesn't provide any practical benefit.
> 
> Remove the flag definition and drop it from all drivers that use it,
> call drm_gem_gpuva_init() unconditionally and clear the driver features
> bit in DRM_DEBUGFS_GPUVA_INFO.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c             | 3 +--
>  drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c         | 2 --
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-

For panthor changes:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  include/drm/drm_debugfs.h             | 2 +-
>  include/drm/drm_drv.h                 | 6 ------
>  include/drm/drm_gem.h                 | 3 ---
>  9 files changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0377a5fd402d..cb703d0072aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  	if (!obj->resv)
>  		obj->resv = &obj->_resv;
>  
> -	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> -		drm_gem_gpuva_init(obj);
> +	drm_gem_gpuva_init(obj);
>  
>  	drm_vma_node_reset(&obj->vma_node);
>  	INIT_LIST_HEAD(&obj->lru_node);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index 268900464ab6..80033d4cb66a 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
>  DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
>  
>  static struct drm_driver pvr_drm_driver = {
> -	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER |
> +	.driver_features = DRIVER_GEM | DRIVER_RENDER |
>  			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>  	.open = pvr_drm_driver_open,
>  	.postclose = pvr_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 195f40e331e5..ee38c18715f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -825,7 +825,6 @@ static const struct file_operations fops = {
>  
>  #define DRIVER_FEATURES_GPU ( \
>  		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
>  		DRIVER_RENDER | \
>  		DRIVER_SYNCOBJ | \
>  		DRIVER_SYNCOBJ_TIMELINE | \
> @@ -833,7 +832,6 @@ static const struct file_operations fops = {
>  
>  #define DRIVER_FEATURES_KMS ( \
>  		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
>  		DRIVER_ATOMIC | \
>  		DRIVER_MODESET | \
>  		0 )
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..0f5f662e5429 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1364,7 +1364,6 @@ static struct drm_driver
>  driver_stub = {
>  	.driver_features = DRIVER_GEM |
>  			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
> -			   DRIVER_GEM_GPUVA |
>  			   DRIVER_MODESET |
>  			   DRIVER_RENDER,
>  	.open = nouveau_drm_open,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 87d27c3c1456..1a1d40a744db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> -			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +			   DRIVER_SYNCOBJ_TIMELINE,
>  	.open = panthor_open,
>  	.postclose = panthor_postclose,
>  	.show_fdinfo = panthor_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ffea4a453c01..b3acc202df76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,7 +393,7 @@ static struct drm_driver driver = {
>  	.driver_features =
>  	    DRIVER_GEM |
>  	    DRIVER_RENDER | DRIVER_SYNCOBJ |
> -	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = xe_file_open,
>  	.postclose = xe_file_close,
>  
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index ea8cba94208a..eb93512b0f23 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -48,7 +48,7 @@
>   * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info() from
>   * their @show callback.
>   */
> -#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_GPUVA, data}
> +#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
>  
>  /**
>   * struct drm_info_list - debugfs info list entry
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..e09559495c5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -107,12 +107,6 @@ enum drm_driver_feature {
>  	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
>  	 */
>  	DRIVER_COMPUTE_ACCEL            = BIT(7),
> -	/**
> -	 * @DRIVER_GEM_GPUVA:
> -	 *
> -	 * Driver supports user defined GPU VA bindings for GEM objects.
> -	 */
> -	DRIVER_GEM_GPUVA		= BIT(8),
>  	/**
>  	 * @DRIVER_CURSOR_HOTSPOT:
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..996aa418dce9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>   *
>   * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
>   *
> - * Calling this function is only necessary for drivers intending to support the
> - * &drm_driver_feature DRIVER_GEM_GPUVA.
> - *
>   * See also drm_gem_gpuva_set_lock().
>   */
>  static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

