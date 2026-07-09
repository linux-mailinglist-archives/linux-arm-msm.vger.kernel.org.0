Return-Path: <linux-arm-msm+bounces-118043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bfKfFqu2T2qnnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:56:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD7732883
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:56:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E4N+VKkF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6715D3018D03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47094382F28;
	Thu,  9 Jul 2026 14:54:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ACE2D594F;
	Thu,  9 Jul 2026 14:54:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608846; cv=none; b=Ye7VOvSgQStQQb+pEbRs7rDetx+jnPedMbhwmzr2LodnNW/UZlg0Ysrv/n8Yz00agCQ2khyhSPXkxTODH8TnFu5wThyndvQM1DiO4so52cvCUKD61koZDrrO0hswxMC+Muy83u9KAbcbfljmoXjP8sSPyAc3W+igs5QNUKsue9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608846; c=relaxed/simple;
	bh=KsqiLd+WP/dEzp/JtdS1jz3UBoP38vUKUrL26WhPsAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un2erJjttmYaKYN5oFeGuApKcoTM/4BwHLmK7acop0OexvAdGdiMde6viErTfkpT3iGY5Zbylw5o5oGOrYPV0qvRq4HWvooqqD0vfx9nBMPXTeuRdpIGoZg9kyI9n6ZskOptIb6QlNvk93tItzawKZ8pKV9hF73sPiL+mekzx78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4N+VKkF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C441F000E9;
	Thu,  9 Jul 2026 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608844;
	bh=u454d5mIhB0nOu1CqQBC0ybTPHcXpjed1DznN7MFSXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4N+VKkFWWOS8bapsV8QXmtj6E1a5IrfEPvBLUpZDbV3x2oCUCv2sI3ZXTqzmOOoq
	 p5Gnaz1AqvXrVp+DnTRXeqVHQuLv9w6hfPeLILoVV0TYOV+9fOTbkKRZF8papECTFy
	 QxKzh4b1DYXzWcqj/9goODU1sXsYaHiHGox43v/ujz8IE2UB+sLm56ryHziFZKNSos
	 JAq6u1/25pk6PvAxDpXFxLwnIJ3mOWHZSfFueyHLoWBjJhOZc539HlZfE4Ox2vrH2T
	 lVVXs1dIygIi/6lnNTUq9jjv/12423Mv4WCXoAVQoZc2b50WK+jhDLrR6DY85v8yQs
	 o15o3Gni1rTZg==
Date: Thu, 9 Jul 2026 15:53:44 +0100
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
Subject: Re: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Message-ID: <ak-1HujOABoQ9wR_@lucifer>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4AgXqMnkn8rVGE@lucifer>
 <20260708190535.fhqaddicljho44eq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708190535.fhqaddicljho44eq@hu-mojha-hyd.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118043-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFDD7732883

On Thu, Jul 09, 2026 at 12:35:35AM +0530, Mukesh Ojha wrote:
> On Wed, Jul 08, 2026 at 08:47:51AM +0100, Lorenzo Stoakes wrote:
> > On Wed, Jul 08, 2026 at 11:01:50AM +0530, Mukesh Ojha wrote:
> > > From: Eugen Hristev <ehristev@kernel.org>
> > >
> > > Annotate vital static information into inspection table:
> > >  - nr_swapfiles
> > >
> > > Information on these variables is stored in a dedicated meminspect
> > > section.
> > >
> > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  mm/swapfile.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > > index a602e5820513..d480727e4987 100644
> > > --- a/mm/swapfile.c
> > > +++ b/mm/swapfile.c
> > > @@ -42,6 +42,7 @@
> > >  #include <linux/suspend.h>
> > >  #include <linux/zswap.h>
> > >  #include <linux/plist.h>
> > > +#include <linux/meminspect.h>
> > >
> > >  #include <asm/tlbflush.h>
> > >  #include <linux/leafops.h>
> > > @@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
> > >   */
> > >  static DEFINE_SPINLOCK(swap_lock);
> > >  static unsigned int nr_swapfiles;
> > > +MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
> >
> > Now the EXPORT_SYMBOL_GPL() is an EXPORT_SYMBOL() in effect no?
>
> The whole reason we had to tag most of the MM symbols is that
> the crash tool looks for this information while launching itself.

You're missing the point.

EXPORT_SYMBOL_GPL() != EXPORT_SYMBOL().

We cannot and will not allow symbols that are GPL-only to be exported by the
back door to non-GPL modules.

Meminspect seems to ignore all of this and just exports symbols another way
overriding kernel mechanisms which is just not acceptable...

I also don't really understand what you're saying here either, what has what
crash looks up on startup got to do with anything?

>
> e.g.,
>
> ./crash --no_modules --no_panic --no_kmem_cache --zero_excluded ./vmlinux  ./minidump.elf
>
>
> >
> > >  atomic_long_t nr_swap_pages;
> > >  /*
> > >   * Some modules use swappable objects and may try to swap them out under
> > >
> > > --
> > > 2.53.0
> > >
>
> --
> -Mukesh Ojha

