Return-Path: <linux-arm-msm+bounces-96915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKnvAl8xsWm0rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:09:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D926007B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6234D304F0B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFBF3BD256;
	Wed, 11 Mar 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hiav0/5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA234372EFE;
	Wed, 11 Mar 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220162; cv=none; b=L9G/BVX7S9QHGoKsOVNqIY2PoSFqOWAuP4yq0eS7RIM0xD0yrNoCjy8OuYgIGP4l16IEF9DgCMwV300fboyWH4CuUOPjsfEmE4CIUHZfhiO/frOaDCiCK44oMpDIpUakRWZot9C+kpBnepaLETc7Y8Ce3uAlOx/RNEU/hTuSzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220162; c=relaxed/simple;
	bh=82aUC4VRpBGw7JMuttBYhm6dWXOcxLKrXkiWiKokSkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA86p5hNHRazNRIOu1r1qHyEYdUKyurQX1CcgrbCmfY+i1Mrfha/Is0uBqxHN8jTWAl66NrJId0jT1ldiRoBw5tIEL9leeSKyAUgJOh6062HuxRqzgjb+4fxhzNZ9Vdg9kqAaCk438hPp3/IIFMFgtDxiMGdLFS7E9iY9TRje/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hiav0/5S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97481C4CEF7;
	Wed, 11 Mar 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220162;
	bh=82aUC4VRpBGw7JMuttBYhm6dWXOcxLKrXkiWiKokSkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hiav0/5SDxMf9zR8suSIZHhKHiHBJdBn25HKmiP6Nvb/vZamKVkRaC+bkUU+MMoo3
	 Ni0yaCeLrupAUaWRFNEnAuXIqphbhDlWgHLpNADqlynBDF7c35TM9zxQLOe8P0jKnC
	 d1QXefq7ueIltcKqNd6w6N5kWro0EIIaImFy76V51md/QPFfq9cNwZLAKiY4+Iu9zH
	 OAoeKfTgXg0iSyPWwQKKoQ/v1L08Sm6Dj3xv/KywOB97OeG83b4hfoG2GwyCSdg1IB
	 zu45S0H/TgnahEqJdikaJQTJWaM9V9+zgqHuKySEF2INd3fBkw7cRzVCzwi155hFHW
	 TDLU+bfophjrQ==
Date: Wed, 11 Mar 2026 10:09:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 25/25] meminspect: Add debug kinfo compatible driver
Message-ID: <20260311-poetic-transparent-barracuda-b7a3ab@quoll>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-25-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-minidump-v2-v2-25-f91cedc6f99e@oss.qualcomm.com>
X-Rspamd-Queue-Id: 792D926007B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96915-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,vger.kernel.org,kvack.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:46:09AM +0530, Mukesh Ojha wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> With this driver, the registered regions are copied to a shared memory
> zone at register time. The shared memory zone is supplied via OF. This
> driver will select only regions that are of interest, and keep only
> addresses. The format of the list is Kinfo compatible, with devices like
> Google Pixel phone. The firmware is only interested in some symbols'
> addresses.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/of/platform.c      |   1 +
>  kernel/meminspect/Kconfig  |  11 ++
>  kernel/meminspect/Makefile |   1 +
>  kernel/meminspect/kinfo.c  | 284 +++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 298 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2504b7df0e7d..48b5457fae98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16597,6 +16597,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
>  M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> +F:	kernel/meminspect/kinfo.c
>  
>  MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
>  M:	Mike Rapoport <rppt@kernel.org>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 2a7111e8354d..09047e021de4 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -495,6 +495,7 @@ static const struct of_device_id reserved_mem_matches[] = {
>  	{ .compatible = "ramoops" },
>  	{ .compatible = "nvmem-rmem" },
>  	{ .compatible = "google,open-dice" },
> +	{ .compatible = "google,debug-kinfo" },

place it before open-dice

>  	{}
>  };
>  
> diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
> index fa2b5a84b251..396510908e47 100644
> --- a/kernel/meminspect/Kconfig
> +++ b/kernel/meminspect/Kconfig
> @@ -17,3 +17,14 @@ config MEMINSPECT
>  
>  	  Note that modules using this feature must be rebuilt if option
>  	  changes.
> +
> +config MEMINSPECT_KINFO
> +	tristate "Shared memory KInfo compatible driver"
> +	depends on MEMINSPECT
> +	help
> +	  Say y here to enable the Shared memory KInfo compatible driver
> +	  With this driver, the registered regions are copied to a shared
> +	  memory zone at register time.
> +	  The shared memory zone is supplied via OF.
> +	  This driver will select only regions that are of interest,
> +	  and keep only addresses. The format of the list is Kinfo compatible.
> diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
> index 09fd55e6d9cf..283604d892e5 100644
> --- a/kernel/meminspect/Makefile
> +++ b/kernel/meminspect/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_MEMINSPECT) += meminspect.o
> +obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
> diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
> new file mode 100644
> index 000000000000..79918908968d
> --- /dev/null
> +++ b/kernel/meminspect/kinfo.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> + * Copyright 2021 Google LLC
> + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> + */
> +#include <linux/container_of.h>
> +#include <linux/kallsyms.h>
> +#include <linux/meminspect.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/utsname.h>
> +
> +#define BUILD_INFO_LEN		256
> +#define DEBUG_KINFO_MAGIC	0xcceeddff
> +
> +/*
> + * Header structure must be byte-packed, since the table is provided to
> + * bootloader.
> + */
> +struct kernel_info {
> +	/* For kallsyms */
> +	u8 enabled_all;
> +	u8 enabled_base_relative;
> +	u8 enabled_absolute_percpu;
> +	u8 enabled_cfi_clang;
> +	u32 num_syms;
> +	u16 name_len;
> +	u16 bit_per_long;
> +	u16 module_name_len;
> +	u16 symbol_len;
> +	u64 _relative_pa;
> +	u64 _text_pa;
> +	u64 _stext_pa;
> +	u64 _etext_pa;
> +	u64 _sinittext_pa;
> +	u64 _einittext_pa;
> +	u64 _end_pa;
> +	u64 _offsets_pa;
> +	u64 _names_pa;
> +	u64 _token_table_pa;
> +	u64 _token_index_pa;
> +	u64 _markers_pa;
> +	u64 _seqs_of_names_pa;
> +
> +	/* For frame pointer */
> +	u32 thread_size;
> +
> +	/* For virt_to_phys */
> +	u64 swapper_pg_dir_pa;
> +
> +	/* For linux banner */
> +	u8 last_uts_release[__NEW_UTS_LEN];
> +
> +	/* Info of running build */
> +	u8 build_info[BUILD_INFO_LEN];
> +
> +	/* For module kallsyms */
> +	u32 enabled_modules_tree_lookup;
> +	u32 mod_mem_offset;
> +	u32 mod_kallsyms_offset;
> +} __packed;
> +
> +struct kernel_all_info {
> +	u32 magic_number;
> +	u32 combined_checksum;
> +	struct kernel_info info;
> +} __packed;
> +
> +struct debug_kinfo {
> +	struct device *dev;
> +	void *all_info_addr;
> +	size_t all_info_size;
> +	struct notifier_block nb;
> +};
> +
> +static void update_kernel_all_info(struct kernel_all_info *all_info)
> +{
> +	struct kernel_info *info;
> +	u32 *checksum_info;
> +	int index;
> +
> +	all_info->magic_number = DEBUG_KINFO_MAGIC;
> +	all_info->combined_checksum = 0;
> +
> +	info = &all_info->info;
> +	checksum_info = (u32 *)info;
> +	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
> +		all_info->combined_checksum ^= checksum_info[index];
> +}
> +
> +static u8 global_build_info[BUILD_INFO_LEN];

Don't create singletons. That's a driver so you can have multiple
instances of it.

> +
> +static int build_info_set(const char *str, const struct kernel_param *kp)
> +{
> +	size_t build_info_size = sizeof(global_build_info);
> +
> +	if (strlen(str) > build_info_size)
> +		return -ENOMEM;
> +	memcpy(global_build_info, str, min(build_info_size - 1, strlen(str)));
> +	return 0;
> +}
> +
> +static const struct kernel_param_ops build_info_op = {
> +	.set = build_info_set,
> +};
> +
> +module_param_cb(build_info, &build_info_op, NULL, 0200);
> +MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");

Drop. Build info is a static, fixed information, there is no need to write it
from user-space.


...

> +	memset(all_info, 0, sizeof(struct kernel_all_info));
> +	info = &all_info->info;
> +	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
> +	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
> +	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
> +	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
> +	info->name_len = KSYM_NAME_LEN;
> +	info->bit_per_long = BITS_PER_LONG;
> +	info->module_name_len = MODULE_NAME_LEN;
> +	info->symbol_len = KSYM_SYMBOL_LEN;
> +	info->thread_size = THREAD_SIZE;
> +	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
> +	info->mod_mem_offset = offsetof(struct module, mem);
> +	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
> +
> +	memcpy(info->build_info, global_build_info, strlen(global_build_info));
> +
> +	kinfo->nb.notifier_call = kinfo_notifier_cb;
> +
> +	meminspect_notifier_register(&kinfo->nb);
> +	meminspect_lock_traverse(kinfo, register_kinfo_region);
> +
> +	return 0;
> +}
> +
> +static void debug_kinfo_remove(struct platform_device *pdev)
> +{
> +	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
> +
> +	meminspect_notifier_unregister(&kinfo->nb);
> +}
> +
> +static const struct of_device_id debug_kinfo_of_match[] = {
> +	{ .compatible	= "google,debug-kinfo" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
> +
> +static struct platform_driver debug_kinfo_driver = {
> +	.probe = debug_kinfo_probe,
> +	.remove = debug_kinfo_remove,
> +	.driver = {
> +		.name = "debug-kinfo",
> +		.of_match_table = of_match_ptr(debug_kinfo_of_match),

Drop of_match_ptr, you have warning here.

> +	},
> +};
> +module_platform_driver(debug_kinfo_driver);
> +
> +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
> +MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
> +MODULE_DESCRIPTION("meminspect Kinfo Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.50.1
> 

