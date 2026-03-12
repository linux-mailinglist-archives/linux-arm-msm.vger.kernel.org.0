Return-Path: <linux-arm-msm+bounces-97127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CSrgFmVFsml/KwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:47:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263826D32A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B4C4302299A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBBB3451AB;
	Thu, 12 Mar 2026 04:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VnyGzRoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E9258EC2;
	Thu, 12 Mar 2026 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290845; cv=none; b=uFtaH0gaA2a2xasa16XkCaIg6d9ZHojCubSoGLy/Y84sTW4DHR+sw9Iw3wx+XcF4P0QzenCi19q6LIWX8wO1x047xWjC9SB/qYlZpArEufVwptzG/Od0WyXMyPMlVdx5Zm45v+byveiDJfSCdPWy1vLr/IUimhAqqVAlHSM4rS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290845; c=relaxed/simple;
	bh=Gp54JLvaaOIECrVsI9+uHuFT4IiNN9InE0F4T3empxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlZ1MvD82XOGl6+aJ0bHEgxUqygOpR0ZJO9jNM1DTjeCQujMEwtZT7FpXADXKO7d0waPzYueMby1WnhxWSnur+WgvzwKqaxu1h2LEBDcVRjv33qwcjmeQ0J3/zmakK1MWnfR5pzv0wY5/Qw1DXfLtsbdrb2jzd34tIgtQFjhPrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VnyGzRoG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=A2SvhJ+b53Uvh0SW06/h2KPYmtALDs9kOKOYcwwDLA0=; b=VnyGzRoGzkd8sAAvVV3Y/W6ZN0
	tKjKqCKmOocvgGs2WMlfWDZKSsXB8ZVZckIdwVxx+isq7qvFLGieQAcdQINeeSI0U5lmzoeckjN1P
	fpOlTWJ9/v6707emE9rHLMZBDNwcmeIh42L5g3RJRUZ5PluWGXtKUDSp+15rNVwAY6n28KPynzvip
	8M+n2m480sEjG8LOTrXHMf9kL4AvUVoAinWEFH2hdIxCwt12t7vNVuvMadKGy49cneNMRZ86dUuvn
	kKk0L70BiK14w69z6fOhbwVFm7woPVZnv9og0y56U9VuASYMSZf/o5lXdue2UIhgTKAlsYSpxvMcM
	lBafm1tw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Xwo-0000000DI74-3YB5;
	Thu, 12 Mar 2026 04:47:00 +0000
Message-ID: <e398475e-4db2-40ed-baeb-89c2bbf6a0d5@infradead.org>
Date: Wed, 11 Mar 2026 21:46:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/25] kernel: Introduce meminspect
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-1-f91cedc6f99e@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260311-minidump-v2-v2-1-f91cedc6f99e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97127-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: 1263826D32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/26 1:15 PM, Mukesh Ojha wrote:
> diff --git a/Documentation/dev-tools/meminspect.rst b/Documentation/dev-tools/meminspect.rst
> new file mode 100644
> index 000000000000..d0c7222bdcd7
> --- /dev/null
> +++ b/Documentation/dev-tools/meminspect.rst
> @@ -0,0 +1,144 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==========
> +meminspect
> +==========
> +
> +This document provides information about the meminspect feature.
> +
> +Overview
> +========
> +
> +meminspect is a mechanism that allows the kernel to register a chunk of
> +memory into a table, to be used at a later time for a specific
> +inspection purpose like debugging, memory dumping or statistics.
> +
> +meminspect allows drivers to traverse the inspection table on demand,
> +or to register a notifier to be called whenever a new entry is being added

  preferably...                                                is added

> +or removed.
> +
> +The reasoning for meminspect is also to minimize the required information
> +in case of a kernel problem. For example a traditional debug method involves
> +dumping the whole kernel memory and then inspecting it. Meminspect allows the
> +users to select which memory is of interest, in order to help this specific
> +use case in production, where memory and connectivity are limited.
> +
> +Although the kernel has multiple internal mechanisms, meminspect fits
> +a particular model which is not covered by the others.
> +
> +meminspect Internals
> +====================
> +
> +API
> +---
> +
> +Static memory can be registered at compile time, by instructing the compiler
> +to create a separate section with annotation info.
> +For each such annotated memory (variables usually), a dedicated struct
> +is being created with the required information.

   is created

> +To achieve this goal, some basic APIs are available:
> +
> +* MEMINSPECT_ENTRY(idx, sym, sz)
> +  is the basic macro that takes an ID, the symbol, and a size.
> +
> +To make it easier, some wrappers are also defined
> +
> +* MEMINSPECT_SIMPLE_ENTRY(sym)
> +  will use the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof(sym)

     uses the dedicated

> +
> +* MEMINSPECT_NAMED_ENTRY(name, sym)
> +  will be a simple entry that has an id that cannot be derived from the sym,

     is a simple entry that

> +  so a name has to be provided
> +
> +* MEMINSPECT_AREA_ENTRY(sym, sz)
> +  this will register sym, but with the size given as sz, useful for e.g.

     registers sym, but with

> +  arrays which do not have a fixed size at compile time.
> +
> +For dynamically allocated memory, or for other cases, the following APIs
> +are being defined::

   are defined::

> +
> +  meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
> +                            size_t size, unsigned int type);
> +
> +which takes the ID and the physical address.
> +
> +Similarly there are variations:
> +
> + * meminspect_register_pa() omits the ID
> + * meminspect_register_id_va() requires the ID but takes a virtual address
> + * meminspect_register_va() omits the ID and requires a virtual address
> +
> +If the ID is not given, the next avialable dynamic ID is allocated.

                                    available

> +
> +To unregister a dynamic entry, some APIs are being defined:

                                            are defined:

> + * meminspect_unregister_pa(phys_addr_t zone, size_t size);
> + * meminspect_unregister_id(enum meminspect_uid id);
> + * meminspect_unregister_va(va, size);
> +
> +All of the above have a lock variant that ensures the lock on the table
> +is taken.
> +
> +
> +meminspect drivers
> +------------------
> +
> +Drivers are free to traverse the table by using a dedicated function::
> +
> + meminspect_traverse(void *priv, MEMINSPECT_ITERATOR_CB cb)
> +
> +The callback will be called for each entry in the table.

maybe           is called

> +
> +Drivers can also register a notifier with meminspect_notifier_register()
> +and unregister with meminspect_notifier_unregister() to be called when a new
> +entry is being added or removed.

         is added or removed.

> +
> +Data structures
> +---------------
> +
> +The regions are being stored in a simple fixed size array. It avoids

               are stored

> +memory allocation overhead. This is not performance critical nor does
> +allocating a few hundred entries create a memory consumption problem.
> +
> +The static variables registered into meminspect are being annotated into

                                                   are annotated into

> +a dedicated .inspect_table memory section. This is then walked by meminspect> +at a later time and each variable is then copied to the whole inspect table.
> +
> +meminspect Initialization
> +-------------------------
> +
> +At any time, meminspect will be ready to accept region registration

                meminspect is ready

> +from any part of the kernel. The table does not require any initialization.
> +In case CONFIG_CRASH_DUMP is enabled, meminspect will create an ELF header

                                         meminspect creates an ELF header

> +corresponding to a core dump image, in which each region is added as a
> +program header. In this scenario, the first region is this ELF header, and
> +the second region is the vmcoreinfo ELF note.
> +By using this mechanism, all the meminspect table, if dumped, can be
> +concatenated to obtain a core image that is loadable with the `crash` tool.
> +
> +meminspect example
> +==================
> +
> +A simple scenario for meminspect is the following:
> +The kernel registers the linux_banner variable into meminspect with
> +a simple annotation like::
> +
> +  MEMINSPECT_SIMPLE_ENTRY(linux_banner);
> +
> +The meminspect late initcall will parse the compilation time created table

maybe...                                       compile-time

> +and copy the entry information into the inspection table.
> +At a later point, any interested driver can call the traverse function to
> +find out all entries in the table.
> +A specific driver will then note into a specific table the address of the
> +banner and the size of it.
> +The specific table is then written to a shared memory area that can be
> +read by upper level firmware.
> +When the kernel freezes (hypothetically), the kernel will no longer feed
> +the watchdog. The watchdog will trigger a higher exception level interrupt
> +which will be handled by the upper level firmware. This firmware will then
> +read the shared memory table and find an entry with the start and size of
> +the banner. It will then copy it for debugging purpose. The upper level
> +firmware will then be able to provide useful debugging information,
> +like in this example, the banner.
> +
> +As seen here, meminspect facilitates the interaction between the kernel
> +and a specific firmware.


-- 
~Randy


