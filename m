Return-Path: <linux-arm-msm+bounces-117905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s5XMDEVaT2oZfAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DAD72E36A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BvFrVRoe;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A6FE305C3D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017F83EBF2F;
	Thu,  9 Jul 2026 08:16:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8233F390
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584979; cv=none; b=KlNTIJdO7ei7tu9ACsklpkPo9k9VBvBj9LU9ytqKvwrcnUwmk74//rZ6WJcQEblga/TMb0Hvpw6ip1UUD+QL4kPzUwu6mf3nquprCQLZXoDW+FX2yczn8ZRUNeT6hAcMYxCkrNcgshnLNbiRd48jfLTTnVtFSK9evjgqokkv8hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584979; c=relaxed/simple;
	bh=vMvzVDyhwRVZ9mU/uGek2iqLm5M9Oc3aOzpsUrM1kxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBneuLA8DOwefoUOmM1dHS2a1ZsZYUs30Tc6Uo1HU4R19dHfv7ww02jHNu2b/OsM9UAL3zOx5kSrZpelYEr1R16UsN7JwqsuP45Rn6TWXhAUsqGr5PPzF/F7UvDWeKun1CJXDm5VtnReo+fNNp8TffL+Vw23KIdKJ4kCOme2++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BvFrVRoe; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b77b150aso12226385e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783584976; x=1784189776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+CFlNGgVOBUKoyPjKhrOhvumBe76lgJlilpAZoLH+g=;
        b=BvFrVRoeLdX9K67kasMhrWS3/kUZ3sUPj+VTdiYOPJrmUJ2OVcYURmwa5PSTGOl80p
         EKMqIJlyhLMJIDKcjk/Uupo22TEgpkVnjJ3miA+2E6zuDJECj4soGqwzKsL0HzzQUH4c
         kmSzGWLSqlgnxW9Kig//yvcbRE58E7qwLWaM70bo6Y8pu6+BQMQtY6J1ytMSDWQIHRYk
         BhSVn9FzF8ZLqhxyoL+F20K+CvCwkYwbkpIRWa3zP6tf04lYKxrWcOk0koGiilHLjWyh
         0/xUZkcbeb1xgpVL7F6EvzAeQHxKAf+g5kby0g8tvIK6H0+8v+A32sHsdg2XmTJ6iuSL
         jnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584976; x=1784189776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+CFlNGgVOBUKoyPjKhrOhvumBe76lgJlilpAZoLH+g=;
        b=b56PEqyPVKk+zsrKhfch/BnWjazB1yaYFXfTew58GGsao3WzRK21mr7ttt8BN8hOnI
         goMNv7192icPVisXEaM9mhYumCQBN7wUR+ZqCrXwO1hmkf3D19LM5Ak3QgxpC5JF3mgE
         sKiqAhJJJzt9RTK8I7cw6ttjDUSqzqjLrui6ee7H7vz4jo/qR6GBesMjJeCVYEig3fTs
         IqFFjTDhWwkzWQ5m0pYuRJJhVEUkHKw2gAreVXiKpwleGk8RJTt64AuJ9ajsN4xGeEkZ
         1qkeeMADtcnNWPjeb9pyk5t4jri+BajBfKPXWX9UXCfLulMZrwGfoDXYxRB1RogeZxmH
         3PBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp7vOD/4ndlPb8lZqOSyvSUpUhs6KpEXmxCqE70WoD3Q3zhXlGmGxcNjvY52034e5LR5bP8CZwMi9QGhP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4aobnbdGYX75DLHyOEoz4ZWPihq7xS41P8+IgNiiwyBOnioTk
	JIPvEI3LZzOWjeHdXi/nU/FxmKMh88CvWmH6Qpb5UbXJaECPkS9myYimnE7mbjkRFoA=
X-Gm-Gg: AfdE7ckGvEKz3GypvOTa8nZlonGaavFDSr9/pLaIipA2B2JOvVvYAj+GhED0wB95L0q
	YQvyCNz0YZXPovdtgpFcqGwZVqz8LMlTxJ3AXptVu8Pq3rb2BkFCawWK3yrOE3VybTiqxp7UAB5
	/GWyHX36aeAVQC8cHw5kCv5U0heda+vPyaPSLgQug71QrA0Jnx3K6bLaXnkrtxeDe1x30eemp7k
	p4jarxINnnmZTVLr/5QCZWGxGWX4bPY9cEb3yrY2dUg5NxZb4bVf4/zb8Itep4kATyt1Lh4yBf0
	2jrH5kB7x5qPlViP+2Y7VdcUoXLkmr3At299BKQhBbiWcZb/YULspZQUFFk9NuqdHaidMR6dFg1
	IFWv93T7dSQGHWL13pQ9XnX0yrkwIjh4G2ONCF2L0wGiTqhRCTW2Ap+y+C2cX4TVO24cI7Vcs0H
	nAeM7IhZ/UphYzoBk=
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr56205565e9.23.1783584976164;
        Thu, 09 Jul 2026 01:16:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ee2bcac0sm20177645e9.0.2026.07.09.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:16:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:16:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 21/26] printk: Register information into meminspect
Message-ID: <ak9YzK_Puejpg_du@pathway.suse.cz>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4Cr5GEMdo8xWqu@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4Cr5GEMdo8xWqu@lucifer>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-117905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel.o
 rg,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:from_mime,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22DAD72E36A

On Wed 2026-07-08 08:59:26, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 11:02:00AM +0530, Mukesh Ojha wrote:
> > Annotate vital static, dynamic information into meminspect for debugging
> >
> > Static:
> >  - prb_descs
> >  - prb_infos
> >  - prb
> >  - prb_data
> >  - clear_seq
> >  - printk_rb_static
> >  - printk_rb_dynamic
> >
> > Dynamic:
> >  - new_descs
> >  - new_infos
> >  - new_log_buf
> >
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -49,6 +49,7 @@
> >  #include <linux/sched/debug.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/panic.h>
> > +#include <linux/meminspect.h>
> >
> >  #include <linux/uaccess.h>
> >  #include <asm/sections.h>
> > @@ -518,10 +519,17 @@ static u32 log_buf_len = __LOG_BUF_LEN;
> >  #endif
> >  _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
> >  		 PRB_AVGBITS, &__log_buf[0]);
> > +MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
> > +MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
> > +MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
> >
> >  static struct printk_ringbuffer printk_rb_dynamic;
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
> >
> >  struct printk_ringbuffer *prb = &printk_rb_static;
> > +MEMINSPECT_SIMPLE_ENTRY(prb);
> > +MEMINSPECT_SIMPLE_ENTRY(clear_seq);
> >
> >  /*
> >   * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
> > @@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
> >
> >  	local_irq_restore(flags);
> >
> > +	meminspect_lock_register_va(new_log_buf, new_log_buf_len);
> > +	meminspect_lock_register_va(new_descs, new_descs_size);
> > +	meminspect_lock_register_va(new_infos, new_infos_size);
> > +
> >  	/*
> >  	 * Copy any remaining messages that might have appeared from
> >  	 * NMI context after copying but before switching to the
> 
> Overall exposing live dynamic printk information to drivers seems unwise, but
> not quite as insane as some of the other stuff thus exposed...

I agree that we should be careful with exporting symbols.

Well, if I get it correctly then at least the printk-related symbols
are already exported a similar way using vmcore_info.h API,
see log_buf_vmcoreinfo_setup().

Best Regards,
Petr

