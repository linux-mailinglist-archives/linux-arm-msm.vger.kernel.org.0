Return-Path: <linux-arm-msm+bounces-117550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f7nHJz8FTmooBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:07:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB2722F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:07:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=flVw3qAh;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117550-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117550-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B01773004D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6759E34D38B;
	Wed,  8 Jul 2026 08:07:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B736837B413;
	Wed,  8 Jul 2026 08:07:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498044; cv=none; b=Llvv7loApgy8L55bcmtjAo+gZS5kn77vFBPw5l0fQZD2cuct1Em2FuC8bFQUMWG+xJheJzqZ5yFaAEyD9ug967OThlOqKBkDsE6UBYB8e6QbWo7tVh7rU4tbqeVK52LssOuBdmpWxxCU7fVNaCtUOds6MKG72Ns4wB6Yr/sw1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498044; c=relaxed/simple;
	bh=X2l21CxO40liE0vtBuCa34UuYtJiZaNbW2I/DA4lTfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXESFzOWFVIrg4p/ENKOavBRkeW0ERvgaslpZNletDviPI2N7CtxMSCHT2d++vcLJww/UN8u9GdsTJIfIo34UQ7EwvUvQ4fe4lEzc0nGxPa7aGjCXnaW/PNmS+Km/CrCBA4VGnto299vRqRvvqywbD196EK/XlDU9KaABEq9uA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flVw3qAh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B7C1F000E9;
	Wed,  8 Jul 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498039;
	bh=eey33vCwR2TDg/L/7ImDVaFgtxdBYVYOOW3e0Hzed1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flVw3qAh6hNuSMs/jQ8WX9sgUiBwvxP3Ah3MtOh+v89sSULzfJkDqVDC424Q0Y5jh
	 P3kK3AKqV6dUJvPIGHbGPjmZjI0mR4s0cuOFp63O9iNuB7pNgxb8/NvkAP/qeyXH6l
	 0nmHlEgYdvyDtwSKmbDMsA9JAkFppmUGrLvd5SnrAa2d4aaiXGWhWH+y1RZ16LRQlO
	 mCgx8xerhgXKUC6O6KR1rj3CrfX2UTR0bHeBtFPC9TMI3v6cN64oP3iau+gOLlIg+j
	 VcoPp+Cqei0kj2IbhK3HLvMiczZxO2AaGvEjL094Q9kcLHOeU4Ib0hbRjAk1sR5Kxz
	 wLNu+X43UaeHw==
Date: Wed, 8 Jul 2026 09:06:52 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, 
	andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org, conor+dt@kernel.org, 
	david@kernel.org, dennis@kernel.org, devicetree@vger.kernel.org, 
	ehristev@kernel.org, frederic@kernel.org, mingo@redhat.com, jstultz@google.com, 
	corbet@lwn.net, juri.lelli@redhat.com, kasong@tencent.com, kees@kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org, 
	peterz@infradead.org, pmladek@suse.com, robh@kernel.org, saravanak@kernel.org, 
	tj@kernel.org, tglx@kernel.org, vincent.guittot@linaro.org, 
	workflows@vger.kernel.org, atomlin@atomlin.com, ast@kernel.org, aliceryhl@google.com, 
	linux.amoon@gmail.com, ardb@kernel.org, baoquan.he@linux.dev, baohua@kernel.org, 
	bsegall@google.com, jackmanb@google.com, leitao@debian.org, brauner@kernel.org, 
	coxu@redhat.com, dietmar.eggemann@arm.com, dianders@chromium.org, 
	ebiggers@kernel.org, feng.tang@linux.alibaba.com, yangfeng@kylinos.cn, 
	gary@garyguo.net, guohanjun@huawei.com, jack@suse.cz, wangjinchao600@gmail.com, 
	joel.granados@kernel.org, hannes@cmpxchg.org, john.ogness@linutronix.de, 
	jpoimboe@kernel.org, shikemeng@huaweicloud.com, kas@kernel.org, 
	kprateek.nayak@amd.com, liam@infradead.org, elver@google.com, mgorman@suse.de, 
	mhocko@suse.com, ojeda@kernel.org, rppt@kernel.org, namcao@linutronix.de, 
	nathan@kernel.org, nphamcs@gmail.com, n.schier@fritz.com, pasha.tatashin@soleen.com, 
	petr.pavlu@suse.com, pnina.feder@mobileye.com, rdunlap@infradead.org, 
	rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org, skhan@linuxfoundation.org, 
	sboyd@kernel.org, rostedt@goodmis.org, surenb@google.com, 
	thomas.weissschuh@linutronix.de, vschneid@redhat.com, vbabka@kernel.org, youngjun.park@lge.com, 
	zhengyejian@huaweicloud.com, ziy@nvidia.com, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Message-ID: <ak4DqBta0boElPak@lucifer>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117550-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:akpm@linux-foundation.org,m:anna-maria@linutronix.de,m:arnd@arndb.de,m:andersson@kernel.org,m:chrisl@kernel.org,m:cl@gentwo.org,m:conor+dt@kernel.org,m:david@kernel.org,m:dennis@kernel.org,m:devicetree@vger.kernel.org,m:ehristev@kernel.org,m:frederic@kernel.org,m:mingo@redhat.com,m:jstultz@google.com,m:corbet@lwn.net,m:juri.lelli@redhat.com,m:kasong@tencent.com,m:kees@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arch@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:peterz@infradead.org,m:pmladek@suse.com,m:robh@kernel.org,m:saravanak@kernel.org,m:tj@kernel.org,m:tglx@kernel.org,m:vincent.guittot@linaro.org,m:workflows@vger.kernel.org,m:atomlin@atomlin.com,m:ast@kernel.org,m:aliceryhl@google.com,m:linux.amoon@gmail.com,m:ardb@kernel.org,m:baoquan.he@linux.dev,m:baoh
 ua@kernel.org,m:bsegall@google.com,m:jackmanb@google.com,m:leitao@debian.org,m:brauner@kernel.org,m:coxu@redhat.com,m:dietmar.eggemann@arm.com,m:dianders@chromium.org,m:ebiggers@kernel.org,m:feng.tang@linux.alibaba.com,m:yangfeng@kylinos.cn,m:gary@garyguo.net,m:guohanjun@huawei.com,m:jack@suse.cz,m:wangjinchao600@gmail.com,m:joel.granados@kernel.org,m:hannes@cmpxchg.org,m:john.ogness@linutronix.de,m:jpoimboe@kernel.org,m:shikemeng@huaweicloud.com,m:kas@kernel.org,m:kprateek.nayak@amd.com,m:liam@infradead.org,m:elver@google.com,m:mgorman@suse.de,m:mhocko@suse.com,m:ojeda@kernel.org,m:rppt@kernel.org,m:namcao@linutronix.de,m:nathan@kernel.org,m:nphamcs@gmail.com,m:n.schier@fritz.com,m:pasha.tatashin@soleen.com,m:petr.pavlu@suse.com,m:pnina.feder@mobileye.com,m:rdunlap@infradead.org,m:rioo.tsukatsukii@gmail.com,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:rostedt@goodmis.org,m:surenb@google.com,m:thomas.weissschuh@linutronix.de,m:vschneid@redhat.com,m:vba
 bka@kernel.org,m:youngjun.park@lge.com,m:zhengyejian@huaweicloud.com,m:ziy@nvidia.com,m:eugen.hristev@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linutronix.de,arndb.de,kernel.org,gentwo.org,vger.kernel.org,redhat.com,google.com,lwn.net,tencent.com,kvack.org,linaro.org,infradead.org,suse.com,atomlin.com,gmail.com,linux.dev,debian.org,arm.com,chromium.org,linux.alibaba.com,kylinos.cn,garyguo.net,huawei.com,suse.cz,cmpxchg.org,huaweicloud.com,amd.com,suse.de,fritz.com,soleen.com,mobileye.com,linuxfoundation.org,goodmis.org,lge.com,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[91];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AAB2722F92

On Wed, Jul 08, 2026 at 12:38:09PM +0530, Mukesh Ojha wrote:
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

Hang on, this is a driver that exposes internal kernel symbol information in a
shared memory region for anybody who wants to access it?

This doesn't really seem sane?

Looking through the code it seems you are only exposing things that are already
otherwise exposed, so maybe it's not so bad, but it seems as if a registered
meminfo driver could in any case get access to things they shouldn't?

> ---
>  MAINTAINERS                |   1 +
>  drivers/of/platform.c      |   1 +
>  kernel/meminspect/Kconfig  |  11 ++
>  kernel/meminspect/Makefile |   1 +
>  kernel/meminspect/kinfo.c  | 257 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 271 insertions(+)
>  create mode 100644 kernel/meminspect/kinfo.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2d816d783024..d805ff9fedac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16906,6 +16906,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
>  M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
> +F:	kernel/meminspect/kinfo.c
>
>  MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
>  M:	Mike Rapoport <rppt@kernel.org>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 53bca8c6f781..f80bd25fc481 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -494,6 +494,7 @@ static const struct of_device_id reserved_mem_matches[] = {
>  	{ .compatible = "qcom,smem" },
>  	{ .compatible = "ramoops" },
>  	{ .compatible = "nvmem-rmem" },
> +	{ .compatible = "google,debug-kinfo" },
>  	{ .compatible = "google,open-dice" },
>  	{}
>  };
> diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
> index 18ff511ad4cf..7f6436c3344b 100644
> --- a/kernel/meminspect/Kconfig
> +++ b/kernel/meminspect/Kconfig
> @@ -16,3 +16,14 @@ config MEMINSPECT
>
>  	  Note that modules using this feature must be rebuilt if this
>  	  option changes.
> +
> +config MEMINSPECT_KINFO
> +	tristate "Shared memory KInfo compatible driver"
> +	depends on MEMINSPECT
> +	help
> +	  Say y here to enable the Shared memory KInfo compatible driver.
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
> index 000000000000..7451c13bc316
> --- /dev/null
> +++ b/kernel/meminspect/kinfo.c
> @@ -0,0 +1,257 @@
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
> +static void __maybe_unused register_kinfo_region(void *priv,
> +						 const struct inspect_entry *e)
> +{
> +	struct debug_kinfo *kinfo = priv;
> +	struct kernel_all_info *all_info = kinfo->all_info_addr;
> +	struct kernel_info *info = &all_info->info;
> +	struct uts_namespace *uts;
> +	u64 paddr;
> +
> +	if (e->pa)
> +		paddr = e->pa;
> +	else
> +		paddr = __pa(e->va);
> +
> +	switch (e->id) {
> +	case MEMINSPECT_ID__sinittext:
> +		info->_sinittext_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID__einittext:
> +		info->_einittext_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID__end:
> +		info->_end_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID__text:
> +		info->_text_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID__stext:
> +		info->_stext_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID__etext:
> +		info->_etext_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_num_syms:
> +		info->num_syms = *(__u32 *)e->va;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_offsets:
> +		info->_offsets_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_names:
> +		info->_names_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_token_table:
> +		info->_token_table_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_token_index:
> +		info->_token_index_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_markers:
> +		info->_markers_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_kallsyms_seqs_of_names:
> +		info->_seqs_of_names_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_swapper_pg_dir:
> +		info->swapper_pg_dir_pa = paddr;
> +		break;
> +	case MEMINSPECT_ID_init_uts_ns:
> +		if (!e->va)
> +			return;
> +		uts = e->va;
> +		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
> +		break;
> +	default:
> +		break;
> +	};
> +
> +	update_kernel_all_info(all_info);
> +}
> +
> +static int kinfo_notifier_cb(struct notifier_block *nb,
> +			     unsigned long code, void *entry)
> +{
> +	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
> +
> +	if (code == MEMINSPECT_NOTIFIER_ADD)
> +		register_kinfo_region(kinfo, entry);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int debug_kinfo_probe(struct platform_device *pdev)
> +{
> +	struct kernel_all_info *all_info;
> +	struct device *dev = &pdev->dev;
> +	struct reserved_mem *rmem;
> +	struct debug_kinfo *kinfo;
> +	struct kernel_info *info;
> +
> +	rmem = of_reserved_mem_lookup(dev->of_node);
> +	if (!rmem)
> +		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
> +			      dev->of_node->name);
> +
> +	/* Need to wait for reserved memory to be mapped */
> +	if (!rmem->priv)
> +		return -EPROBE_DEFER;
> +
> +	if (!rmem->base || !rmem->size)
> +		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
> +
> +	if (rmem->size < sizeof(struct kernel_all_info))
> +		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
> +
> +	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
> +	if (!kinfo)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, kinfo);
> +
> +	kinfo->dev = dev;
> +	kinfo->all_info_addr = rmem->priv;
> +	kinfo->all_info_size = rmem->size;
> +
> +	all_info = kinfo->all_info_addr;
> +
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
> +		.of_match_table = debug_kinfo_of_match,
> +	},
> +};
> +module_platform_driver(debug_kinfo_driver);
> +
> +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
> +MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
> +MODULE_DESCRIPTION("meminspect Kinfo Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.53.0
>

