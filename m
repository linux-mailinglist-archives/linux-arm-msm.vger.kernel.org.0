Return-Path: <linux-arm-msm+bounces-118005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VCh4IxCjT2rklQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:33:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBCD7319AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:33:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Wzua9qWw;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9410C31016A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CD12874E1;
	Thu,  9 Jul 2026 13:25:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9FF279903
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:24:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603501; cv=none; b=AvLHlvcZtB6GKY6QfePWve4zIdZLuUgbE1Sf7p4YCo+r5VviwS3NKmCEmfPedDunhZUuqr2N1ffB1Evzme/FiYYiYX5miHazn5Mkie6GeNBCeeJccI8NfZLBfpfawiYTN6YgjikQoFcoXtC+nRH6HAgi2JIT6YqklM/+lv3IehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603501; c=relaxed/simple;
	bh=7ISU5xPOy74bICjanRZFVU/MoFoShesRb4zQUg2TqBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7wlv5qKFZG8jVXsi/TsgQKkGRrynHkxfWhS9hifVGuIgApNGq5CJ2OtZ8hl9wXElltqkDsnykZnz6/Jc7ETZQKFPC9rNMCds2dWbVudjUyzEBRLdM/hllfzI0nHacM4V68cMlQH6/VrQWFq3rfCBQKlOWXsTA9yVZShLX2pWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wzua9qWw; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1122860f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783603498; x=1784208298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+2+l0R7RX9cCzxaoR4qreoVsEJbp9qB9SwPbos71OM=;
        b=Wzua9qWwbN16wpcMUQD2HQzqjaIDt6s5Xiotl7GUM94PxCcWlXR4WcgNkvzvyR9DIw
         hBSyh/HJq7PwgDGmo/yy/Mvfoty27OK7ID/UU+ZnthIiD5GWAFLBy08oRXOeiMiQPbJb
         OSriVOtOJB6Aw/BO9ERxVhefDLYl2A0tXehA08EaZYT9NLREIBQQJMVQvm7f8ZqRf+jS
         j0frJ8WDFLUS8d13Vov48HJF0Hvr8Bv/kx3hKo16I+L6ke/ZLQjcPCkicGV0JiKerxWL
         hiVVKxlyudOBr2gcfKTV+72TpMSBrQdoSsTWD2fFF2O6oU+o9M11FoEpVIHzZ/aC8SoQ
         4Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603498; x=1784208298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+2+l0R7RX9cCzxaoR4qreoVsEJbp9qB9SwPbos71OM=;
        b=KKJS17k0jYs2SjHaKqjvMBn2qKEUI+BsoJvNhLXYmDz/UXwb0oGbbEBK8L41/Z2CKQ
         Cmr6xK354C041TepdlOYILb9ytBRQyPYcdDNppH/4CiZ1gxG42dqLO3tWJoEGHS/4Gkd
         gHG5BzxgCtwda8/2NxzELoHY5IF+LqneEkePzzmuJk2YFsuP6hbmjGjrs8rI8sEXtMst
         In1pJC5dGXfWiZ/f8b6EIegw/ZdPh6VPgb98iOukajU541ybmw5SSnLAKG0R/aEraDjZ
         Y4mYtt02pxsqX0E7Q/VDqUsMSm3zY4p3NMzZDg7IgMk4VE23KXla5ZOu6KfDd7jFcfkB
         3wEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKbSXZ2YDMqolZHTDn32gCcgff0bjXBXmzyeNM5SDkJbl1jQdUmcsmFxg076TMVRxM9wB5NSJi8TNTkNg7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxer4isWkWlSy8hMJ8WuPEkzLjdYow4h2oz5xFZCVpNTzaV2fZm
	HW0HZgcW9TOYfSRNl3Oo3LmAusOs5jFOzIbpf07Oc2rS8YR8gu7UWFBiDvltaHSVqVE=
X-Gm-Gg: AfdE7ckJwc07aUhtjTNIj7SMb+6URwbJpY5o9RrT2Jhx8nJ59LhdxtpNyHZ0eYHO6Rg
	N48cxWIDlpgUztkGFM4dAhtdSzADIhWb0fPGCkmwpZjN9ZdVZIn/KTRCE/JURR0g77dS4RtH+x3
	eocvfhidnGwjkkCnsBRlhmp46ZqM3ezBI+/8EnYU/bXY2Mr+/aE+PBtOj5s8mjR25p3EvOtINvl
	c4DgiTlmhsf7F/5oABQpMRZW19yO4FYWosKfVqQnWUQdhPiL0pwEWbmOrpe+5i+A0iG8w07wxeK
	d1IFZ1LlzKtoRvRD/zUkP8MzYpVb9+LjO1Fi+YKTclQyfq3ebPlSuHtJE4Yattv0WMa/HnxJHeE
	K2hzFCHOGwiuSrwWumaJXqOI9u91P2gp8+q4iNrkoGpdlJZNgPrqtT196kodtYWw8bm5uOFS9C+
	Oy9FG/b870TziPnew6iC8DIQz9RBw1BdkiQTw4mb303m5r
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr7512557f8f.47.1783603497728;
        Thu, 09 Jul 2026 06:24:57 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm47212857f8f.31.2026.07.09.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:24:57 -0700 (PDT)
Message-ID: <84ded2aa-397f-465b-b2e5-d2fa31fc807d@suse.com>
Date: Thu, 9 Jul 2026 15:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
 andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org, conor+dt@kernel.org,
 david@kernel.org, dennis@kernel.org, devicetree@vger.kernel.org,
 ehristev@kernel.org, frederic@kernel.org, mingo@redhat.com,
 jstultz@google.com, corbet@lwn.net, juri.lelli@redhat.com,
 kasong@tencent.com, kees@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arch@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
 peterz@infradead.org, pmladek@suse.com, robh@kernel.org,
 saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
 vincent.guittot@linaro.org, workflows@vger.kernel.org, atomlin@atomlin.com,
 ast@kernel.org, aliceryhl@google.com, linux.amoon@gmail.com,
 ardb@kernel.org, baoquan.he@linux.dev, baohua@kernel.org,
 bsegall@google.com, jackmanb@google.com, leitao@debian.org,
 brauner@kernel.org, coxu@redhat.com, dietmar.eggemann@arm.com,
 dianders@chromium.org, ebiggers@kernel.org, feng.tang@linux.alibaba.com,
 yangfeng@kylinos.cn, gary@garyguo.net, guohanjun@huawei.com, jack@suse.cz,
 wangjinchao600@gmail.com, joel.granados@kernel.org, hannes@cmpxchg.org,
 john.ogness@linutronix.de, jpoimboe@kernel.org, shikemeng@huaweicloud.com,
 kas@kernel.org, kprateek.nayak@amd.com, liam@infradead.org, ljs@kernel.org,
 elver@google.com, mgorman@suse.de, mhocko@suse.com, ojeda@kernel.org,
 rppt@kernel.org, namcao@linutronix.de, nathan@kernel.org, nphamcs@gmail.com,
 n.schier@fritz.com, pasha.tatashin@soleen.com, pnina.feder@mobileye.com,
 rdunlap@infradead.org, rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
 skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
 surenb@google.com, thomas.weissschuh@linutronix.de, vschneid@redhat.com,
 vbabka@kernel.org, youngjun.park@lge.com, zhengyejian@huaweicloud.com,
 ziy@nvidia.com, Eugen Hristev <eugen.hristev@linaro.org>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linutronix.de,arndb.de,kernel.org,gentwo.org,vger.kernel.org,redhat.com,google.com,lwn.net,tencent.com,kvack.org,linaro.org,infradead.org,suse.com,atomlin.com,gmail.com,linux.dev,debian.org,arm.com,chromium.org,linux.alibaba.com,kylinos.cn,garyguo.net,huawei.com,suse.cz,cmpxchg.org,huaweicloud.com,amd.com,suse.de,fritz.com,soleen.com,mobileye.com,linuxfoundation.org,goodmis.org,lge.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118005-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:akpm@linux-foundation.org,m:anna-maria@linutronix.de,m:arnd@arndb.de,m:andersson@kernel.org,m:chrisl@kernel.org,m:cl@gentwo.org,m:conor+dt@kernel.org,m:david@kernel.org,m:dennis@kernel.org,m:devicetree@vger.kernel.org,m:ehristev@kernel.org,m:frederic@kernel.org,m:mingo@redhat.com,m:jstultz@google.com,m:corbet@lwn.net,m:juri.lelli@redhat.com,m:kasong@tencent.com,m:kees@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arch@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:peterz@infradead.org,m:pmladek@suse.com,m:robh@kernel.org,m:saravanak@kernel.org,m:tj@kernel.org,m:tglx@kernel.org,m:vincent.guittot@linaro.org,m:workflows@vger.kernel.org,m:atomlin@atomlin.com,m:ast@kernel.org,m:aliceryhl@google.com,m:linux.amoon@gmail.com,m:ardb@kernel.org,m:baoquan.he@linux.dev,m:baoh
 ua@kernel.org,m:bsegall@google.com,m:jackmanb@google.com,m:leitao@debian.org,m:brauner@kernel.org,m:coxu@redhat.com,m:dietmar.eggemann@arm.com,m:dianders@chromium.org,m:ebiggers@kernel.org,m:feng.tang@linux.alibaba.com,m:yangfeng@kylinos.cn,m:gary@garyguo.net,m:guohanjun@huawei.com,m:jack@suse.cz,m:wangjinchao600@gmail.com,m:joel.granados@kernel.org,m:hannes@cmpxchg.org,m:john.ogness@linutronix.de,m:jpoimboe@kernel.org,m:shikemeng@huaweicloud.com,m:kas@kernel.org,m:kprateek.nayak@amd.com,m:liam@infradead.org,m:ljs@kernel.org,m:elver@google.com,m:mgorman@suse.de,m:mhocko@suse.com,m:ojeda@kernel.org,m:rppt@kernel.org,m:namcao@linutronix.de,m:nathan@kernel.org,m:nphamcs@gmail.com,m:n.schier@fritz.com,m:pasha.tatashin@soleen.com,m:pnina.feder@mobileye.com,m:rdunlap@infradead.org,m:rioo.tsukatsukii@gmail.com,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:rostedt@goodmis.org,m:surenb@google.com,m:thomas.weissschuh@linutronix.de,m:vschneid@redhat.com,m:vbabka@k
 ernel.org,m:youngjun.park@lge.com,m:zhengyejian@huaweicloud.com,m:ziy@nvidia.com,m:eugen.hristev@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[91];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlesource.com:url,vger.kernel.org:from_smtp,qualcomm.com:email,suse.com:from_mime,suse.com:dkim,suse.com:mid,rustcorp.com.au:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBBCD7319AB

On 7/8/26 9:08 AM, Mukesh Ojha wrote:
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
[...]
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

Is this kinfo format documented anywhere? I was only able to find
a reference to the equivalent downstream Android driver [1] in the cover
letter. However, I don't quite understand what it is or what the
associated bootloader component does with this information. In
particular, I'm unclear about the purpose of the following
module-related fields:

module_name_len
enabled_modules_tree_lookup
mod_mem_offset
mod_kallsyms_offset

These appear to be exposed for reading the internals of the module
loader. Be aware that this data is not stable.

[1] https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c

-- 
Thanks,
Petr

