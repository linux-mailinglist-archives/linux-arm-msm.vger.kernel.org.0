Return-Path: <linux-arm-msm+bounces-110314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLBbIRfJGWpXzAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:12:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D944606328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E2C530028D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0487F37B3F9;
	Fri, 29 May 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WM+BvkeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC0B376A1C;
	Fri, 29 May 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074641; cv=none; b=lk/oN+XoCQyNOV2MLvGVIngjsqYGwreHWA2dAo5zqFECmqIpsna7x5ksu4zpM8GpUIcy63qiYwyQSPF2oe6wc28jKHwGQcJILioY+NZWBqHoDNaNj9pZd9iKQQBhhIkUCQxodhuISSAP2KJI2peGkfswIT22fRlIZfZ3roniOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074641; c=relaxed/simple;
	bh=ZuWhak9qN2sQ+tzY00zjhZkVc1vvwe4ZkcNwHcngSxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iCXbqH1ilql5pWncrbEu9g62J3PtChcfHOppejvz5EMPhe5MqMHT8YBJUlpF9YkcM63/RsRoRwKXPKGdGw08cRYk8z4AhLV9jZNC5baO6zIgi9GFICmqSVG3lNWN4OSantdeJgOtW0pvohVc0OdjM3hen3zJ9IChqT9kJZIHwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WM+BvkeK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780074632;
	bh=ZuWhak9qN2sQ+tzY00zjhZkVc1vvwe4ZkcNwHcngSxQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WM+BvkeKUOSrgN1rt+hTrXbLAWcWn4Pc3kfn5lBBQmBuOR+IQPLBMNiWP3QgYU8oC
	 mq58Zx3JmkPY2NqM65Y+/dWq6RF7Gti3EbZBQ0fp/Jcu0OgBJmCP6AqyjrI/CseU/t
	 4JDG9p+eE4Yk2DUQ1sHKe0LNDwf8Ij1kzsRTJVetQY7wDRfsfplQi3VC3f4Gf0YJTW
	 egr2mE+VOPb2gnymq1gExh9RSg0vXcNFHyZXiNlCdmbvkrI9/Uw8f/cZtBLZO+C+UK
	 4SeFusWJCyN65gPOD1OlJlcvkY2OCJ1yCtpkSu5NoVWqlhQeM3SO0qxipt09XxzHNu
	 /0d+v5xH45avQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C8C917E0566;
	Fri, 29 May 2026 19:10:32 +0200 (CEST)
Date: Fri, 29 May 2026 19:10:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: dakr@kernel.org, steven.price@arm.com, liviu.dudau@arm.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
Message-ID: <20260529191027.40e1ec5b@fedora>
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
References: <20260421084701.24227-1-laura.nao@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-110314-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 8D944606328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, 21 Apr 2026 10:47:01 +0200
Laura Nao <laura.nao@collabora.com> wrote:

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
>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  include/drm/drm_debugfs.h             | 2 +-
>  include/drm/drm_drv.h                 | 6 ------
>  include/drm/drm_gem.h                 | 3 ---
>  9 files changed, 5 insertions(+), 18 deletions(-)

I took the liberty to queue this one to drm-misc-next even though it
was lacking R-b/A-b from Nouveau/Pvr maintainers because

- it's pretty trivial
- it's been posted more than a month ago
- we need it to make progress on the Tyr side
- if it's broken (I honestly doubt it), we still have a full release
  cycle to revert

Regards,

Boris

