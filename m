Return-Path: <linux-arm-msm+bounces-57506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD8AB1FFD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F984B23CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875C262FD8;
	Fri,  9 May 2025 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9HLyYt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BC25F79A;
	Fri,  9 May 2025 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830308; cv=none; b=Jpn8FM3G4NPX0pgc6HQ9LdxsQbxKTefPtOtFBtkJpbYyASkSZ/hbtAjZ8EAPIlFvCcIYYZ2ZTsHOxQTE/rEjs7hPosQxQ1UMeXX0QwJ2UyAuwg+L0oAgCt+sJRG8fUIbQZW6LP1JNgyAsmUIaNGZGQkxaGIMvlmgldebqryq0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830308; c=relaxed/simple;
	bh=UFLG+qJLt7G6jEoUzpzLZXtZ0sylu//S/7ihWu5mva8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J57z7reqrws2ajE3MFsEKKmj2bpUdntsCrJ+mIL9fh6wP/kNRr5NGx9jQ3tz060H54N2g93Ecrr3+VB3yIEpbzSr/g0kToE37WJw3S/jV2udXLJYBWFchX2ympPjLiDxJ6GRXFTQxVHcYrzJAJLv6ogX2pboJlZAMB7QZpCBLns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9HLyYt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABBCC4CEE4;
	Fri,  9 May 2025 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746830307;
	bh=UFLG+qJLt7G6jEoUzpzLZXtZ0sylu//S/7ihWu5mva8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9HLyYt786mNoMXtqssk56VK36x5mq/M717pcugDBZFZ1b+JUk0jUuo3xx0DOTtW2
	 TQBwky9/5D2p5nrdqVSRjvBZoedDCVLFZsJXcU9n59krYRRYv+eHVKUI+KJ+wZ0tTK
	 HdFPw48aANr941HIw+5SPrJ4DoTzDfLhYc6+PcK8dE1Iy6rPs8e1FFO+Ss4iilCJFE
	 3NhtmKMkCvzvm+EuLVZOFeeaR0uJCB186uQD+YLezv1wFFjI903+GOa358IkTH6o5q
	 LBRafNN+2xEpJPw4PAOODOsMhTSXOsVxNOxVZg5vsOxQij9t/mE56u6WTuTrq8+oo8
	 Kswje5XCCMqLQ==
Date: Fri, 9 May 2025 15:38:24 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org, konradybcio@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Message-ID: <qcpzoi6t2xvmncq4pbxnlnrdw5bj4dvedftsf5cp3zj7nbeklm@rmsrqqb5vta5>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-3-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-3-eugen.hristev@linaro.org>

On Tue, Apr 22, 2025 at 02:31:44PM +0300, Eugen Hristev wrote:
> Kmemdump mechanism allows any driver to mark a specific memory area

I know naming is a hard problem, but "kmemdump" sounds to me like a
mechanism where the kernel does the memory dumping - and in contrast to
existing mechanisms, that's not what this does.

> for later dumping purpose, depending on the functionality
> of the attached backend. The backend would interface any hardware
> mechanism that will allow dumping to complete regardless of the
> state of the kernel (running, frozen, crashed, or any particular
> state).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  drivers/Kconfig          |   2 +
>  drivers/Makefile         |   2 +
>  drivers/debug/Kconfig    |  16 ++++
>  drivers/debug/Makefile   |   3 +
>  drivers/debug/kmemdump.c | 185 +++++++++++++++++++++++++++++++++++++++
>  include/linux/kmemdump.h |  52 +++++++++++
>  6 files changed, 260 insertions(+)
>  create mode 100644 drivers/debug/Kconfig
>  create mode 100644 drivers/debug/Makefile
>  create mode 100644 drivers/debug/kmemdump.c
>  create mode 100644 include/linux/kmemdump.h
> 
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 7bdad836fc62..ef56588f559e 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
>  
>  source "drivers/dpll/Kconfig"
>  
> +source "drivers/debug/Kconfig"
> +
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 45d1c3e630f7..cf544a405007 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -195,3 +195,5 @@ obj-$(CONFIG_CDX_BUS)		+= cdx/
>  obj-$(CONFIG_DPLL)		+= dpll/
>  
>  obj-$(CONFIG_S390)		+= s390/
> +
> +obj-y				+= debug/
> diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
> new file mode 100644
> index 000000000000..22348608d187
> --- /dev/null
> +++ b/drivers/debug/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menu "Generic Driver Debug Options"
> +
> +config DRIVER_KMEMDUMP
> +	bool "Allow drivers to register memory for dumping"

You use kmemdump in non-driver code as well.

> +	help
> +	  Kmemdump mechanism allows any driver to mark a specific memory area

I think it would be better to express this as "register specific memory
areas with kmemdump for dumping" - you're not really marking any
memory...

> +	  for later dumping purpose, depending on the functionality
> +	  of the attached backend. The backend would interface any hardware
> +	  mechanism that will allow dumping to complete regardless of the
> +	  state of the kernel (running, frozen, crashed, or any particular
> +	  state).
> +
> +	  Note that modules using this feature must be rebuilt if option
> +	  changes.

While true, hopefully no human should be needed to act upon this fact?

> +endmenu
> diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
> new file mode 100644
> index 000000000000..cc14dea250e3
> --- /dev/null
> +++ b/drivers/debug/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
> diff --git a/drivers/debug/kmemdump.c b/drivers/debug/kmemdump.c
> new file mode 100644
> index 000000000000..a685c0863e25
> --- /dev/null
> +++ b/drivers/debug/kmemdump.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/kmemdump.h>
> +#include <linux/idr.h>
> +
> +#define MAX_ZONES 512

Why is this 512?

Seems this depend on the backend, in which case 512 is unlikely to be
the choosen limit.

> +
> +static struct kmemdump_backend *backend;
> +static DEFINE_IDR(kmemdump_idr);
> +static DEFINE_MUTEX(kmemdump_lock);
> +static LIST_HEAD(kmemdump_list);
> +
> +/**
> + * kmemdump_register() - Register region into kmemdump.
> + * @handle: string of maximum 8 chars that identifies this region
> + * @zone: pointer to the zone of memory
> + * @size: region size
> + *
> + * Return: On success, it returns an allocated unique id that can be used
> + *	at a later point to identify the region. On failure, it returns
> + *	negative error value.

You can say this more succinctly, something like:

Return: "unique id for the zone, or negative errno on failure"

> + */
> +int kmemdump_register(char *handle, void *zone, size_t size)
> +{
> +	struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
> +	int id;
> +
> +	if (!z)
> +		return -ENOMEM;
> +
> +	mutex_lock(&kmemdump_lock);
> +
> +	id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
> +	if (id < 0) {
> +		mutex_unlock(&kmemdump_lock);
> +		return id;

A goto out_unlock; seems reasonable here and below.

And you're leaking 'z'

> +	}
> +
> +	if (!backend)
> +		pr_debug("kmemdump backend not available yet, waiting...\n");

"waiting" tells me that we're waiting here, but you're "deferring".

> +
> +	z->zone = zone;
> +	z->size = size;
> +	z->id = id;
> +
> +	if (handle)
> +		strscpy(z->handle, handle, 8);

Isn't the 8 optional, given that z->handle is a statically sized array?

> +
> +	if (backend) {
> +		int ret;
> +
> +		ret = backend->register_region(id, handle, zone, size);
> +		if (ret) {
> +			mutex_unlock(&kmemdump_lock);
> +			return ret;
> +		}
> +		z->registered = true;
> +	}
> +
> +	mutex_unlock(&kmemdump_lock);
> +	return id;
> +}
> +EXPORT_SYMBOL_GPL(kmemdump_register);
> +
> +/**
> + * kmemdump_unregister() - Unregister region from kmemdump.
> + * @id: unique id that was returned when this region was successfully
> + *	registered initially.
> + *
> + * Return: None
> + */
> +void kmemdump_unregister(int id)
> +{
> +	struct kmemdump_zone *z;
> +
> +	mutex_lock(&kmemdump_lock);
> +
> +	z = idr_find(&kmemdump_idr, id);
> +	if (!z)
> +		return;

You forgot to unlock &kmemdump_lock.

> +	if (z->registered && backend)
> +		backend->unregister_region(z->id);
> +
> +	idr_remove(&kmemdump_idr, id);
> +	kfree(z);
> +
> +	mutex_unlock(&kmemdump_lock);
> +}
> +EXPORT_SYMBOL_GPL(kmemdump_unregister);
> +
> +static int kmemdump_register_fn(int id, void *p, void *data)
> +{
> +	struct kmemdump_zone *z = p;
> +	int ret;
> +
> +	if (z->registered)
> +		return 0;
> +
> +	ret = backend->register_region(z->id, z->handle, z->zone, z->size);
> +	if (ret)
> +		return ret;
> +	z->registered = true;
> +
> +	return 0;
> +}
> +
> +/**
> + * kmemdump_register_backend() - Register a backend into kmemdump.
> + * Only one backend is supported at a time.
> + * @be: Pointer to a driver allocated backend. This backend must have
> + *	two callbacks for registering and deregistering a zone from the
> + *	backend.
> + *
> + * Return: On success, it returns 0, negative error value otherwise.
> + */
> +int kmemdump_register_backend(struct kmemdump_backend *be)
> +{
> +	mutex_lock(&kmemdump_lock);
> +
> +	if (backend)
> +		return -EALREADY;

unlock

> +
> +	if (!be || !be->register_region || !be->unregister_region)
> +		return -EINVAL;

unlock


Although neither one of these cases actually need to be handled under
the lock.

> +
> +	backend = be;
> +	pr_info("kmemdump backend %s registered successfully.\n",

pr_debug() is probably enough.

> +		backend->name);
> +
> +	/* Try to call the backend for all previously requested zones */
> +	idr_for_each(&kmemdump_idr, kmemdump_register_fn, NULL);
> +
> +	mutex_unlock(&kmemdump_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(kmemdump_register_backend);
> +
> +static int kmemdump_unregister_fn(int id, void *p, void *data)
> +{
> +	int ret;
> +	struct kmemdump_zone *z = p;
> +
> +	if (!z->registered)
> +		return 0;
> +
> +	ret = backend->unregister_region(z->id);
> +	if (ret)
> +		return ret;
> +	z->registered = false;
> +
> +	return 0;
> +}
> +
> +/**
> + * kmemdump_register_backend() - Unregister the backend from kmemdump.
> + * Only one backend is supported at a time.
> + * Before deregistering, this will call the backend to unregister all the
> + * previously registered zones.

These three lines seems more suitable below the argument definitions.

> + * @be: Pointer to a driver allocated backend. This backend must match
> + *	the initially registered backend.
> + *
> + * Return: None
> + */
> +void kmemdump_unregister_backend(struct kmemdump_backend *be)
> +{
> +	mutex_lock(&kmemdump_lock);
> +
> +	if (backend != be) {
> +		mutex_unlock(&kmemdump_lock);
> +		return;
> +	}
> +
> +	/* Try to call the backend for all previously requested zones */
> +	idr_for_each(&kmemdump_idr, kmemdump_unregister_fn, NULL);
> +
> +	backend = NULL;
> +	pr_info("kmemdump backend %s removed successfully.\n", be->name);

pr_debug()

> +
> +	mutex_unlock(&kmemdump_lock);
> +}
> +EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
> diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
> new file mode 100644
> index 000000000000..b55b15c295ac
> --- /dev/null
> +++ b/include/linux/kmemdump.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _KMEMDUMP_H
> +#define _KMEMDUMP_H
> +
> +#define KMEMDUMP_ZONE_MAX_HANDLE 8
> +/**
> + * struct kmemdump_zone - region mark zone information
> + * @id: unique id for this zone
> + * @zone: pointer to the memory area for this zone
> + * @size: size of the memory area of this zone
> + * @registered: bool indicating whether this zone is registered into the
> + *	backend or not.
> + * @handle: a string representing this region
> + */
> +struct kmemdump_zone {

It seems this is the internal-only representation of the zones and isn't
part of the API (in either direction). Better move it into the
implementation.

> +	int id;
> +	void *zone;
> +	size_t size;
> +	bool registered;
> +	char handle[KMEMDUMP_ZONE_MAX_HANDLE];
> +};
> +
> +#define KMEMDUMP_BACKEND_MAX_NAME 128
> +/**
> + * struct kmemdump_backend - region mark backend information
> + * @name: the name of the backend
> + * @register_region: callback to register region in the backend
> + * @unregister_region: callback to unregister region in the backend
> + */
> +struct kmemdump_backend {
> +	char name[KMEMDUMP_BACKEND_MAX_NAME];
> +	int (*register_region)(unsigned int id, char *, void *, size_t);
> +	int (*unregister_region)(unsigned int id);
> +};
> +
> +#ifdef CONFIG_DRIVER_KMEMDUMP
> +int kmemdump_register(char *handle, void *zone, size_t size);
> +void kmemdump_unregister(int id);
> +#else
> +static inline int kmemdump_register(char *handle, void *area, size_t size)
> +{
> +	return 0;
> +}
> +
> +static inline void kmemdump_unregister(int id)
> +{
> +}
> +#endif
> +
> +int kmemdump_register_backend(struct kmemdump_backend *backend);
> +void kmemdump_unregister_backend(struct kmemdump_backend *backend);

These two functions are defined in kmemdump.c which is only built if
CONFIG_DRIVER_KMEMDUMP=y, so shouldn't they be defined under the guard
as well?

Regards,
Bjorn

> +#endif
> -- 
> 2.43.0
> 

