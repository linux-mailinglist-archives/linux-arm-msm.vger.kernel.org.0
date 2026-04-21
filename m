Return-Path: <linux-arm-msm+bounces-103954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G3fFIR152nu9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784243B108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 112D5300C833
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C3E3D646C;
	Tue, 21 Apr 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV3Yid/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7243B8D4B;
	Tue, 21 Apr 2026 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776489; cv=none; b=oRkc7IfV3baQdXO81ah5u2MBwy6O5HHMIt3ZDq9wreamWLgf32DBu92HFhMt6/m1T+trtrY90AAzHXhf8VDQIarprCTLS60pwaV1LGekanf9tB8P1RdibJsX3XnYB94de9bj+fr7h8ehezDEPj7d+iM9G0BwAtuXpwFrq1jRfrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776489; c=relaxed/simple;
	bh=ExQH+zV+8U/927CEGo05bwJx79KV6l1JOmKPtBkTdK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sk8KabLV1HlFo60GnxXL4YL5ZCglnSR2ZkZAHKF6sPdaLdOjMs1dFLfvO44lPo+EJxKcpIUFNKVInYqLUcc6j9J4Da8wIXX4ECwW5TQI3PNhXLOuEFE+kt1Q5xsSOMwdLL1/tzcAOBIobQZeuVgR6I8mnPIqPBukm/imsKjMvJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV3Yid/B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776776487; x=1808312487;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ExQH+zV+8U/927CEGo05bwJx79KV6l1JOmKPtBkTdK0=;
  b=lV3Yid/B9WFR01vZnE3wm6CIgjb6enY3AflKIOUxTuU8adj+AhF0FQNO
   2rCoElr3bTjUjaph3CTXwy37FnDc8Z52lry/IdV+G8o2Z6ylh+fP71NAR
   64AkFKWgOnzzs2LrVYDOISKEAq657e2N203ast5XRM3BpwY48jSP+J3Tv
   AW++4w6VZD1YWG5H4AzqElTVSxnVY+rYvJ9HiylJ9b8Y0dwHyvrPFuSgd
   ZFQxn2rYc7iFyYoou4Xy5QgQq/2DuTKZF7hLcm7vOqQSdWp1/Y+2xprAs
   Mc9Ot3jE638e9hduGNdTLU9iABMEMgiVqia7I2NKg+MXNQmQ9OgGgeZI+
   g==;
X-CSE-ConnectionGUID: vEE1fbIaSjyXCmwkxr0zBw==
X-CSE-MsgGUID: MKD2XvJMR0ytV3aQxXkV0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76869297"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="76869297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 06:01:27 -0700
X-CSE-ConnectionGUID: 0W+zIImbQ2mnXN6mz3nlYQ==
X-CSE-MsgGUID: kVhuQxrbR5WsgiO3/e8znA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="232312278"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.31]) ([10.245.245.31])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 06:01:23 -0700
Message-ID: <b205e3410cfe0086b02013ffb1a46f1f37d6f2a3.camel@linux.intel.com>
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Laura Nao <laura.nao@collabora.com>, dakr@kernel.org, 
	boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com, 
	matthew.brost@intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	kernel@collabora.com
Date: Tue, 21 Apr 2026 15:01:21 +0200
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
References: <20260421084701.24227-1-laura.nao@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-103954-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,linux.intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9784243B108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-04-21 at 10:47 +0200, Laura Nao wrote:
> The DRIVER_GEM_GPUVA feature flag is currently only used to control
> two
> behaviors within the DRM core:
> - calling=C2=A0 drm_gem_gpuva_init() during
> =C2=A0 GEM object initialization
> - creating the "gpuvas" debugfs entry
>=20
> drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is
> cheap
> to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
> referenced by GPU-VA capable drivers, so clearing the feature bit
> does
> not cause any unrelated drivers to get the "gpuvas" debugfs node. The
> flag doesn't have any relevant purpose (e.g. gating ioctl handlers or
> MM
> logic) and doesn't provide any practical benefit.
>=20
> Remove the flag definition and drop it from all drivers that use it,
> call drm_gem_gpuva_init() unconditionally and clear the driver
> features
> bit in DRM_DEBUGFS_GPUVA_INFO.
>=20
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

For the xe changes:
Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> =C2=A0drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
> =C2=A0drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 --
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
> =C2=A0drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A0include/drm/drm_debugfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ------
> =C2=A0include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ---
> =C2=A09 files changed, 5 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0377a5fd402d..cb703d0072aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct
> drm_device *dev,
> =C2=A0	if (!obj->resv)
> =C2=A0		obj->resv =3D &obj->_resv;
> =C2=A0
> -	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> -		drm_gem_gpuva_init(obj);
> +	drm_gem_gpuva_init(obj);
> =C2=A0
> =C2=A0	drm_vma_node_reset(&obj->vma_node);
> =C2=A0	INIT_LIST_HEAD(&obj->lru_node);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c
> b/drivers/gpu/drm/imagination/pvr_drv.c
> index 268900464ab6..80033d4cb66a 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct
> drm_device *drm_dev,
> =C2=A0DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
> =C2=A0
> =C2=A0static struct drm_driver pvr_drm_driver =3D {
> -	.driver_features =3D DRIVER_GEM | DRIVER_GEM_GPUVA |
> DRIVER_RENDER |
> +	.driver_features =3D DRIVER_GEM | DRIVER_RENDER |
> =C2=A0			=C2=A0=C2=A0 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
> =C2=A0	.open =3D pvr_drm_driver_open,
> =C2=A0	.postclose =3D pvr_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c
> b/drivers/gpu/drm/msm/msm_drv.c
> index 195f40e331e5..ee38c18715f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -825,7 +825,6 @@ static const struct file_operations fops =3D {
> =C2=A0
> =C2=A0#define DRIVER_FEATURES_GPU ( \
> =C2=A0		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
> =C2=A0		DRIVER_RENDER | \
> =C2=A0		DRIVER_SYNCOBJ | \
> =C2=A0		DRIVER_SYNCOBJ_TIMELINE | \
> @@ -833,7 +832,6 @@ static const struct file_operations fops =3D {
> =C2=A0
> =C2=A0#define DRIVER_FEATURES_KMS ( \
> =C2=A0		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
> =C2=A0		DRIVER_ATOMIC | \
> =C2=A0		DRIVER_MODESET | \
> =C2=A0		0 )
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..0f5f662e5429 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1364,7 +1364,6 @@ static struct drm_driver
> =C2=A0driver_stub =3D {
> =C2=A0	.driver_features =3D DRIVER_GEM |
> =C2=A0			=C2=A0=C2=A0 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE
> |
> -			=C2=A0=C2=A0 DRIVER_GEM_GPUVA |
> =C2=A0			=C2=A0=C2=A0 DRIVER_MODESET |
> =C2=A0			=C2=A0=C2=A0 DRIVER_RENDER,
> =C2=A0	.open =3D nouveau_drm_open,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
> b/drivers/gpu/drm/panthor/panthor_drv.c
> index 87d27c3c1456..1a1d40a744db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct
> drm_minor *minor)
> =C2=A0 */
> =C2=A0static const struct drm_driver panthor_drm_driver =3D {
> =C2=A0	.driver_features =3D DRIVER_RENDER | DRIVER_GEM |
> DRIVER_SYNCOBJ |
> -			=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE |
> DRIVER_GEM_GPUVA,
> +			=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE,
> =C2=A0	.open =3D panthor_open,
> =C2=A0	.postclose =3D panthor_postclose,
> =C2=A0	.show_fdinfo =3D panthor_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index ffea4a453c01..b3acc202df76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,7 +393,7 @@ static struct drm_driver driver =3D {
> =C2=A0	.driver_features =3D
> =C2=A0	=C2=A0=C2=A0=C2=A0 DRIVER_GEM |
> =C2=A0	=C2=A0=C2=A0=C2=A0 DRIVER_RENDER | DRIVER_SYNCOBJ |
> -	=C2=A0=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +	=C2=A0=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE,
> =C2=A0	.open =3D xe_file_open,
> =C2=A0	.postclose =3D xe_file_close,
> =C2=A0
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index ea8cba94208a..eb93512b0f23 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -48,7 +48,7 @@
> =C2=A0 * For each DRM GPU VA space drivers should call
> drm_debugfs_gpuva_info() from
> =C2=A0 * their @show callback.
> =C2=A0 */
> -#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show,
> DRIVER_GEM_GPUVA, data}
> +#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct drm_info_list - debugfs info list entry
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..e09559495c5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -107,12 +107,6 @@ enum drm_driver_feature {
> =C2=A0	 * acceleration should be handled by two drivers that are
> connected using auxiliary bus.
> =C2=A0	 */
> =C2=A0	DRIVER_COMPUTE_ACCEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D BIT(7),
> -	/**
> -	 * @DRIVER_GEM_GPUVA:
> -	 *
> -	 * Driver supports user defined GPU VA bindings for GEM
> objects.
> -	 */
> -	DRIVER_GEM_GPUVA		=3D BIT(8),
> =C2=A0	/**
> =C2=A0	 * @DRIVER_CURSOR_HOTSPOT:
> =C2=A0	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..996aa418dce9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const
> struct drm_gem_object *obj)
> =C2=A0 *
> =C2=A0 * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
> =C2=A0 *
> - * Calling this function is only necessary for drivers intending to
> support the
> - * &drm_driver_feature DRIVER_GEM_GPUVA.
> - *
> =C2=A0 * See also drm_gem_gpuva_set_lock().
> =C2=A0 */
> =C2=A0static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)

