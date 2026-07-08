Return-Path: <linux-arm-msm+bounces-117551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KgsSL/wHTmrZBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:19:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5FD72312E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GhRuNHGm;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117551-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117551-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BECD3009889
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194940149E;
	Wed,  8 Jul 2026 08:19:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958393FCB2F;
	Wed,  8 Jul 2026 08:18:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498741; cv=none; b=WC8I56WfYTXdk3UBla1uPLMi4Ab4mcwAfplb5eTB318YwzJ+cs0SoiDmUxdt5M8ZTVL2p9IhWw7LWM/XLJ7ZnTAsOmiypyXdV5lroO8jv/DlJLn559Ht7QR0igoZaczBV0ymxmuT01CEuEIq8/iPEed37vsdWnH32RT7bWc9XrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498741; c=relaxed/simple;
	bh=y6Hp29RpTVcGuANEQQMQA+RtwNXjTgz8dNqZv+OIIKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ak11b0C0AaaGDnk2Ag12wIEE37Dwloa4qktTyZRQKQUY9l91QZ5BIAOhVGZlrEueu7QjijQS932C/323o88g0vB24qhHkZsPJk9vBhE0hYGuXX8CNM1dQ2jpsYYUShVpBW3dCLrtTnMh3lPScgEBuBW6CgD2OjMBac2Ux+uTRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhRuNHGm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A3C1F000E9;
	Wed,  8 Jul 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498737;
	bh=kuvPJDg57KKndr9Xq6tNIULAQeUis/xBF1ZkfD0nu5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GhRuNHGm1KV98/xY+/SraNiVzgD1O3OOzCK1/aZWvwgYTkSgmKn5FSZD8suGgHvq6
	 KUXoVpCassy4+4Uy6rS3fzXUyPgZtzWDIrBZGbJizFnyiLRBAHgqcWr/LWYzq8SfJh
	 ixfAlWJNGM9M5MuTNel5702GAHaybOnPMBJwWJLKfRSD5CajRE95S0WHjYNrokzcPU
	 E36AQZX/wQ89KkGjT7mgv6XxfVcgdYzygJDi793qQ0s1B5ffRCYmig598JkIAKi4GW
	 qq21hIweduWoy/Km37AEIWZse1vh2FMCDFRd5OakP+jJy+i0LiyTjGRPvYBjJnMdAX
	 oMRp0E4V6Wd8A==
Date: Wed, 8 Jul 2026 09:18:36 +0100
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
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/26] Introduce meminspect
Message-ID: <ak4FRqV2oOEh0Qlk@lucifer>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <ak3vMSOcv1E6Smbn@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak3vMSOcv1E6Smbn@lucifer>
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
	TAGGED_FROM(0.00)[bounces-117551-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel
 .org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:jgg@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lucifer:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D5FD72312E

Having had a look through, thoughts:

I'm very concerned that this (whether intended or not) is a work around for
drivers to get access to symbols that are not exported.

In many cases you are adding meminspect instrumentation for stuff that's already
exported (fine). In some cases it's stuff that's only GPL-exported (not fine),
and in some cases you are exporting totally unexpected symbols (very very very
not fine).

A driver that hooks on to meminspect then gets the PA and VA for these and can
access these symbols as far as I can tell.

On that basis I really question the whole approach. It feels like you want to
have essentially richer symbol information here, so the approach should perhaps
be built on the existing mechanism for symbols rather than arbitrarily +
invasively stuck into core kernel logic?

I am also concerned that you're not accounting for memory lifecycle or things
like memory hotplug - you seem to just store PAs/VAs with assumption that the
ranges remain eternally mapped at the same ranges for both.

This is a concern because you also track dynamic ranges, and drivers might
register stuff they allocate this way, and it all seems like an easy way to get
UAF's.

I may have missed something here and happy to be corrected, though.

In general the series is far from being in upstreamable shape - you send a giant
1st patch which lumps together a whole bunch of stuff, then you send dozens of
2-5 line patches, and finally include some qualcomm driver specific stuff for
good measure.

The commit messages are generally awful and give little to no information, the
cover letter is deeply uncompelling and doesn't make the case for the feature at
all.

You make zero comments about key concerns with regards to stability, robustness,
security. There's no testing logic anywhere, and you even include a plea for
testing in the cover letter.

This is very much RFC stuff and I continue to not understand why you've taken
the RFC label off here.

And it all very much smacks of trying to solve an internal problem you've
encountered downstream by changing the core of the kernel, rather than you
sending a generally useful feature.

You need to address all of this and re-RFC the series. It instinctively feels
like trying to solve the problem in the wrong place, but in any case it would be
better to start with a SMALLER version of this first then look to extend it only
if the community supports it.

Thanks, Lorenzo

On Wed, Jul 08, 2026 at 08:11:52AM +0100, Lorenzo Stoakes wrote:
> +cc Jason as maybe he has thoughts on this...
>
> Overall - for this to be sensibly mainlined, we need to see a. a COMPELLING case
> made for this feature, b. some buy-in from others, and c. have confidence this
> will be properly maintained.
>
> I don't feel you've demonstrated any of these.
>
> And looking through the history of this (you've made it really hard with your
> changelog):
>
>     v2 - https://lore.kernel.org/lkml/20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com/
>     v1 - https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
> RFC v3 - (I literally can't find it...?)
> RFC v2 - https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> RFC v1 - https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
>
> I'm struggling to understand why on earth it came out of RFC?
>
> You really shouldn't drop the RFC tag unless you've got CLEAR signal that the
> community wants the feature and that there's buy-in.
>
> Instead you've got some specific technical feedback, some trivia, etc. which
> warrants RFC respins, but nothing to suggest buy-in.
>
> So please attach the RFC tag to any future respins. And I suggest you make the
> case for this a LOT clearer and seek to engage with others to confirm that there
> is anybody else who wants this.
>
> On Wed, Jul 08, 2026 at 11:01:39AM +0530, Mukesh Ojha wrote:
> > First of all, I want to thank Eugene for his excellent work on this
> > series. What began as the Qualcomm Minidump driver from me has now
> > evolved into meminspect. He also presented meminspect at Linux
> > Plumbers 2025.
> >
> > Video of the recording is available here for anyone interested:
> > https://www.youtube.com/watch?v=aDZv4-kOLSc
>
> It's iffy putting links like this in a commit message that'll end up as a commit
> (in mm we put the cover letter in). Links can die. Companies can change their
> minds about videos being available.
>
> Maybe better as something explicitly after the commit message.
>
> >
> > Introduction: Memory inspection mechanism
> >
> > meminspect is a mechanism which allows the kernel to mark specific
> > memory areas for memory dumping or specific inspection, statistics,
> > usage.  Once regions are marked, meminspect keeps an internal list with
> > the regions in a dedicated table.  Further, these regions can be
> > accessed using specific API by any interested driver.  Regions being
> > marked beforehand, when the system is up and running, there is no need
> > nor dependency on a panic handler, or a working kernel that can dump the
> > debug information.  meminspect can be primarily used for debugging. The
> > approach is feasible to work when pstore, kdump, or another mechanism do
> > not. Pstore relies on persistent storage, a dedicated RAM area or
> > flash, which has the disadvantage of having the memory reserved all the
> > time, or another specific non volatile memory. Some devices cannot keep
> > the RAM contents on reboot so ramoops does not work. Some devices do not
> > allow kexec to run another kernel to debug the crashed one.  For such
> > devices, that have another mechanism to help debugging, like firmware,
> > meminspect is a viable solution.
>
> Please use paragraphs, this is an unreadable wall of text and it just seems
> to be noise.
>
> Why would we want to mark specific areas a special way? What are the
> trade-offs, what does that actually do? How do you interact with it? Why
> can't other approaches be used?
>
> You should make it CLEAR what exactly the benefits are and why this is
> better than alternatives.
>
> >
> > meminspect can create a core image, similar with /proc/vmcore, with only
> > the registered regions included. This can be loaded into crash tool/gdb
> > and analyzed. This happens if CRASH_DUMP=y.  To have this working,
>
> What is CRASH_DUMP? Where is it defined? You mean CONFIG_CRASH_DUMP?
>
> > specific information from the kernel is registered, and this is done at
> > meminspect init time, no need for the meminspect users to do anything.
>
> Again this just doesn't really mean anything to me?
>
> >
> > This version of the meminspect patch series includes two drivers that
> > make use of it: one is the Qualcomm Minidump, and the other one is the
> > Debug Kinfo backend for Android devices, reworked from this source here:
> > https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
> > written originally by Jone Chou <jonechou@google.com>
>
> This feels rather like you've taken a specific use case you have, and
> worked backwards from it to changes to core, honestly.
>
> >
> > Tested on Qualcomm SA8775P (Lemans EVK) on next-20260707 with the
> > minidump backend: kernel crash dump regions correctly captured
> > via firmware.
>
> What is a minidump backend? There's no detail about the testing here
> either. Does anybody outside of Qualcomm care about this?
>
> >
> > This series introduces a new cross-subsystem framework and, to
> > avoid merge ordering issues, I suggest the entire series be taken
> > via the mm tree. Subsystem maintainers for touched files have
> > been CC'd; I request an Acked-by from them if the respective
> > patches look fine from their side.
>
> Don't put stuff about mechanics of merge in the middle of a cover letter
> that will go into the git log, put this and the stuff about the video in a
> block of text below the main text, you can tag it 'REVIEWERS NOTES' or
> similar.
>
> Not only A-b for touched files, but as this is ostensibly an mm feature
> you'll need tags from mm maintainers and acceptance of the feature overall
> for it to be accepted.
>
> >
> > Alternatively, the qcom backend patches (22-24) can be deferred
> > to Bjorn's qcom tree in a follow-on series once the core
> > meminspect framework lands.
>
> I think that would be better yes, you shouldn't be adding new driver
> changes in a core series like this, only touching stuff you have to touch
> as a result of the core change.
>
> Anything else should be saved for later series. You can express ordering
> requirements in the cover letter...
>
> >
> > *** How to use meminspect with minidump backend on Qualcomm platform guide ***
>
> Odd to put a specific qualcomm TODO in a cover letter for a mainline
> feature...
>
> Again this makes it feels like this is something you want for your driver,
> and the core changes are just a means of getting there, which is not an
> acceptable justification for core changes.
>
> You have to rework this entire cover letter to sell it as a GENERAL
> feature.
>
> I'm really not convinced we want to give drivers (which are great at doing
> exactly the wrong thing with mm APIs) the ability to do invasive things in
> mm.
>
> >
> > Prerequisites:
> > Crash tool compiled with target=ARM64.
> >
> > Target kernel must be built with: CONFIG_DEBUG_INFO_REDUCED=n;
> > this will have vmlinux include all the debugging information
> > needed for the crash tool and CONFIG_MEMINSPECT,
> > CONFIG_CRASH_DUMP, and the driver CONFIG_QCOM_MINIDUMP.
> > Kernel arguments: Kernel firmware must be set to mode 'mini' by kernel
> > module parameter like this : qcom_scm.download_mode=mini
> >
> > After the kernel boots and the minidump module is loaded,
> > everything is ready for a possible crash. Upon triggering a
> > forced kernel crash, the target board will wait in download mode,
> > where QDL (https://github.com/linux-msm/qdl) running on the host
> > connected to the target (here, Lemans EVK) can be used to collect
> > minidump.elf from the target device onto the host.
> >
> > Currently, --minimal mode is being used to get dmesg log from
> > crashed device.
> >
> > Without --minimal mode, the crash tool needs to be patched to
> > not crash on missing symbols and needs to be tuned, which I am
> > currently working on in parallel.
> >
> > crash> log
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x514f0014]
> > [    0.000000] Linux version 7.0.0-rc3-next-20260309-00028-g528b3c656121 (@21e3bca4168f) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026
> >
> > *** Debug Kinfo backend driver ***
> > I need help with the testing of this driver, Anyone who actually wants
>
> Err you're putting forward a non-RFC series to mainline and also saying
> essentially it's untested at least in one respect?
>
> This is signal that this should _remain_ RFC.
>
> > to test this, feel free to reply to the patch. we have also written a
> > simple DT binding for the driver.
> >
> > Thanks in advance for the review, and apologies if I missed addressing any comment.
> >
> > -Mukesh
> >
> > Changes in v3: https://lore.kernel.org/lkml/20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com/
>
> And again, ->v2 but you label it v3...!
>
> > - Addressed most of doc. comments and binding and 0-day kernel
> >   test robot warning.
> > - Add timekeeping: Register tk_data into meminspect
> > - fixed some of the bugs identified during testing.
> > - Fix missing return before dev_err_probe() in qcom_md_probe(); all
> >   three error paths (SMEM lookup, table validation, table init) now
> >   correctly abort probe on failure
> > - Fix meminspect_traverse() kernel-doc: @priv description corrected
> > - Fix meminspect.rst: replace stale MEMINSPECT_ITERATOR_CB type name
> >   with the actual meminspect_iter_cb_t typedef
> > - Add kernel-doc for meminspect_iter_cb_t typedef
> > - Lot of code formating and style change as per coding standard.
> >
> > Changes in v2: https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
>
> The link is to v1... what a mess!
>
> >  - Fixed doc warnings
> >  - Fixed kernel-test robot warnings.
> >  - Took Mike suggestion to remove mark inspect flag for dynamic memory.
> >  - Added R-b for printk patch.
> >  - Modified some commit messages for clarity.
> >  - corrected binding change for debug-kinfo as per Rob suggestion.
> >
> > Changelog for meminspect v1:
>
> You don't include a link to RFC v3 at all?
>
> > - rename to meminspect
> > - start on top of v2 actually, with the section and all.
> > - remove the backend thing, change the API to access the table
> > - move everything to kernel/
> > - add dependency to CRASH_DUMP instead of a separate knob
> > - move the minidump driver to soc/qcom
> > - integrate the meminspect better into memblock by using a new memblock flag
> > - minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
> > remove some useless code, etc.
> >
> > Changelog for RFC v3:
> > - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
>
> Same comment as below. Put links for changelogs with the version you're changing
> it's a total nightmare trying to follow this.
>
> And I literally cannot find RFC v3 on list, did you mislabel it?
>
> > - Removed the .section as requested by David Hildenbrand.
> > - Moved all kmemdump registration(when possible) to vmcoreinfo.
> > - Because of this, some of the variables that I was registering had to be non-static
> > so I had to modify this as per David Hildenbrand suggestion.
> > - Fixed minor things in the Kinfo driver: one field was broken, fixed some
> > compiler warnings, fixed the copyright and remove some useless includes.
> > - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
> > and it's now available in kernel hacking, as per Randy Dunlap review
> > - Reworked some of the Documentation as per review from Jon Corbet
> >
> > Changelog for RFC v2:
> > - V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
>
> Why are you linking the previous version here, it's strange.
>
> Just put RFC v1: with the link below, same goes for other cases.
>
> > - Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
> > This means new API, macros, new way to store the regions inside kmemdump
> > (ditched the IDR, moved to static allocation, have a static default backend, etc)
> > - Reworked qcom_minidump driver based on review from Bjorn Andersson
> > - Reworked printk log buffer registration based on review from Petr Mladek.
> >
> > ---
> > Eugen Hristev (21):
> >       kernel: Introduce meminspect
> >       init/version: Annotate static information into meminspect
> >       mm/percpu: Annotate static information into meminspect
> >       cpu: Annotate static information into meminspect
> >       genirq/irqdesc: Annotate static information into meminspect
> >       timers: Annotate static information into meminspect
> >       kernel/fork: Annotate static information into meminspect
> >       mm/page_alloc: Annotate static information into meminspect
> >       mm/show_mem: Annotate static information into meminspect
> >       mm/swapfile: Annotate static information into meminspect
> >       kernel/vmcore_info: Register dynamic information into meminspect
> >       kernel/configs: Register dynamic information into meminspect
> >       mm/init-mm: Annotate static information into meminspect
> >       panic: Annotate static information into meminspect
> >       kallsyms: Annotate static information into meminspect
> >       mm/mm_init: Annotate static information into meminspect
> >       sched/core: Annotate runqueues into meminspect
> >       remoteproc: qcom: Move minidump data structures into its own header
> >       soc: qcom: Add minidump backend driver
> >       soc: qcom: smem: Add minidump platform device
> >       meminspect: Add debug kinfo compatible driver
> >
> > Mukesh Ojha (5):
> >       timekeeping: Register tk_data into meminspect
> >       mm/numa: Register node data information into meminspect
> >       mm/sparse: Register information into meminspect
> >       printk: Register information into meminspect
> >       dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
> >
> >  Documentation/dev-tools/index.rst                  |   1 +
> >  Documentation/dev-tools/meminspect.rst             | 144 +++++++
> >  .../reserved-memory/google,debug-kinfo.yaml        |  48 +++
> >  MAINTAINERS                                        |  16 +
> >  drivers/of/platform.c                              |   1 +
> >  drivers/remoteproc/qcom_common.c                   |  55 +--
> >  drivers/soc/qcom/Kconfig                           |  13 +
> >  drivers/soc/qcom/Makefile                          |   1 +
> >  drivers/soc/qcom/minidump.c                        | 271 ++++++++++++
> >  drivers/soc/qcom/smem.c                            |  10 +
>
> Yeah I hate that you're adding a wholy unrelated driver feature as part of this.
>
> Let's not.
>
> >  include/asm-generic/vmlinux.lds.h                  |  13 +
> >  include/linux/meminspect.h                         | 271 ++++++++++++
> >  include/linux/soc/qcom/minidump.h                  |  70 +++
> >  init/Kconfig                                       |   1 +
> >  init/version-timestamp.c                           |   3 +
> >  init/version.c                                     |   3 +
> >  kernel/Makefile                                    |   1 +
> >  kernel/configs.c                                   |   6 +
> >  kernel/cpu.c                                       |   5 +
> >  kernel/fork.c                                      |   3 +
> >  kernel/irq/irqdesc.c                               |   2 +
> >  kernel/kallsyms.c                                  |   9 +
> >  kernel/meminspect/Kconfig                          |  29 ++
> >  kernel/meminspect/Makefile                         |   4 +
> >  kernel/meminspect/kinfo.c                          | 257 +++++++++++
> >  kernel/meminspect/meminspect.c                     | 474 +++++++++++++++++++++
> >  kernel/panic.c                                     |   4 +
> >  kernel/printk/printk.c                             |  12 +
> >  kernel/sched/core.c                                |   2 +
> >  kernel/time/timekeeping.c                          |   2 +
> >  kernel/time/timer.c                                |   2 +
> >  kernel/vmcore_info.c                               |   4 +
> >  mm/init-mm.c                                       |  12 +
> >  mm/mm_init.c                                       |   2 +
> >  mm/numa.c                                          |   2 +
> >  mm/page_alloc.c                                    |   2 +
> >  mm/percpu.c                                        |   5 +
> >  mm/show_mem.c                                      |   2 +
> >  mm/sparse.c                                        |   3 +
> >  mm/swapfile.c                                      |   2 +
> >  40 files changed, 1713 insertions(+), 54 deletions(-)
> > ---
> > base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
> > change-id: 20260708-meminspect-v3-76dd8166c4f1
> >
> > Best regards,
> > --
> > -Mukesh Ojha
> >
>
> Thanks, Lorenzo

