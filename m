Return-Path: <linux-arm-msm+bounces-117544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hNNoDSsETmrTBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:02:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F2722EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H9YaHWQr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117544-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117544-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BACA315DA11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28E33F9A04;
	Wed,  8 Jul 2026 07:53:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424643E9C32;
	Wed,  8 Jul 2026 07:53:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497189; cv=none; b=XAO7S/VzY74ZfgWyGiUecEG2FE5SvELNW2nCSBpvgoLZf0QJIFpihaGHg48UMlOxzJDJIGr6ZQCro1FnxzFPhUlxo8Ud1Xes0vjfpTvcGWafxZ+s+kPBE6EH2bkmIrWckvjeF/gLA+G/JuKlmqtfj89EGrxAMnyfkGLLzM1deDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497189; c=relaxed/simple;
	bh=yjnhgMqlOKyC034wTGb4EUcTXAvQiWaWYjtwkXwBg00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4Sq6uGeJft/kHmseQntOUpw9oXZor80T8tFcBIYRSolOyFLgz9yFBWplAuBjzgvE8AgU5GqGeA6tRIu1ufTJs7Ikjw2VI7gVDtc2glKLPTWy/aak5yxJQKa2TiQIzVz2UPHLCF0jR76UVWwoocnvKSRZqvEFhnvj1PN6UfhMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9YaHWQr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFF11F00A3D;
	Wed,  8 Jul 2026 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783497177;
	bh=7K4NCcrN3IVlK9BJtN3q7S9JVAIiJu4qBDxqNODXPvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H9YaHWQrK1YujDYyV6crTr6KbOYfjzzQIBWVR7KE/419stnNd4ED/M5LA5tCOsCDB
	 36pgz7R6/0Zf0am5FTTAZXpKWlctvMKmZ7IhwGjLLqXMEVSXpZhmILwnH4MEgyImci
	 xzlIxy3qsNMJBRt4Oq1ZJrXCytH2i2dTNpcM4K5lcVbdc0zu9bAvOnVZCCZG+e2SLU
	 9DOmhcPONM14BRhrGKxlKlMgTPA2Xm+rELQNHcsW+T2I5NJtH02mPB/JjN9IUBlicR
	 lL7B298F3VYVAPUZiBiv1DGsnNqp2PefONaDjlqtIKu6Fyr1mMHbRtPn8CKsuiTBVI
	 FvJ1smPFQdcEg==
Date: Wed, 8 Jul 2026 08:52:36 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Eugen Hristev <ehristev@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Message-ID: <ak4A3u9VfmDZA4-i@lucifer>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117544-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel
 .org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 895F2722EA9

NAK.

You're exporting internal mm stuff to drivers, in no world are you going to
do that, sorry.

On Wed, Jul 08, 2026 at 11:01:53AM +0530, Mukesh Ojha wrote:
> From: Eugen Hristev <ehristev@kernel.org>
>
> Annotate vital static information into inspection table:
>  - init_mm
>  - swapper_pg_dir
>  - _sinittext
>  - _einittext
>  - _end
>  - _text
>  - _stext
>  - _etext
>
> Information on these variables is stored into dedicated meminspect
> section.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  mm/init-mm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 3e792aad7626..cf53058410b1 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -7,6 +7,8 @@
>  #include <linux/cpumask.h>
>  #include <linux/mman.h>
>  #include <linux/pgtable.h>
> +#include <linux/meminspect.h>

Hate the idea of a very specific inspection mechanism hooking into core mm
initialisation in general.

If you thing needs to do this, your thing is broken IMO.

> +#include <asm/sections.h>

Err sections? So now this file is now a dumping ground for meminspect ELF
section declarations?

>
>  #include <linux/atomic.h>
>  #include <linux/user_namespace.h>
> @@ -19,6 +21,13 @@
>
>  const struct vm_operations_struct vma_dummy_vm_ops;
>
> +MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));

Is this just a weird way of getting ELF symbols?

> +
>  /*
>   * For dynamically allocated mm_structs, there is a dynamically sized cpumask
>   * at the end of the structure, the size of which depends on the maximum CPU
> @@ -50,6 +59,9 @@ struct mm_struct init_mm = {
>  	INIT_MM_CONTEXT(init_mm)
>  };
>
> +MEMINSPECT_SIMPLE_ENTRY(init_mm);
> +MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));

Absolutely, positively not, this is totally insane and COMPLETELY violates
separation between drivers and mm.

We already let drivers access FAR too much.

Exporting core mm internals would be like giving up on any semblence of
separation of concerns.

> +
>  void setup_initial_init_mm(void *start_code, void *end_code,
>  			   void *end_data, void *brk)
>  {
>
> --
> 2.53.0
>

Thanks, Lorenzo

