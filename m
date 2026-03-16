Return-Path: <linux-arm-msm+bounces-97788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMSnJsNqt2kYRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:28:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042A294067
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47DCA3001FC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F22C30C630;
	Mon, 16 Mar 2026 02:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyHsh3Kb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E53263C9F;
	Mon, 16 Mar 2026 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627889; cv=none; b=khreQE6ZRbPfs4eZk7FdBB8asTYk1ZprCFX/Pvy4WBF7sg7TCimmX1JNxxwFTfDubbtSQKp4tsTk+3Y5H6R8WdANPnBt9e4rgphsOZLF/yODqOMij3HAbmlBDf+LQhsBMOgmTYyku3/GunZXX3Xvj7CwAioFs5UVVaL+K22fue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627889; c=relaxed/simple;
	bh=nWchieyJQyv4iGmUtwJpOTMtAWI6VO07iwWkdnvOYvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgyXV8rIqYOfnFpi2+ModLCy88EMVI4AgiJPkW7FfWZQDsI5TGAwpVXoBweti/YZiAV7r0abcRtcAN/Wg7Zo+lfN8p5V4Uds4cKtqmembEVv3O7m5se79qVp36t2hjNx/uyMMZ3IYnf7jIpiCAoTLtsIrgY29QSOYIK+qFeu73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyHsh3Kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B971CC4CEF7;
	Mon, 16 Mar 2026 02:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773627889;
	bh=nWchieyJQyv4iGmUtwJpOTMtAWI6VO07iwWkdnvOYvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyHsh3KbXGNDm8683ULRzsRz4/+1zlmZE4RynJYWJlCqKxlKbOCAnIk6tz1L4E8+w
	 j+SNpBpF/eeo/uXaUpZEmdPl3eSIc/JcowgPiHFA38grTv+QcAiaMiC9hnhwgEISvm
	 iAnUjBVh8iVgcdPgl8Qan/966hvUhVy45uXoQsFh7WZLWYnIudbgX5xxLYgvXW55G9
	 aNG2pgSJyR4hJ2YNaYXWSNYg1hZtOgFr6RA6Qo4zMa1uQqFJ8cZUMGE6jX/AgcRsJu
	 y1IS8qj4zA/kLfTyfmIH5jWGl4WDRT78RpcI6AgjxS/IZLs8SRAXQjDLpJVnMvkUuX
	 daqgQLJ6oe4qw==
Date: Sun, 15 Mar 2026 21:24:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
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
	Sergey Senozhatsky <senozhatsky@chromium.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/25] Introduce meminspect
Message-ID: <abdnp90cC5PI9wyz@baldur>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97788-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,vger.kernel.org,kvack.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[calebs.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:url]
X-Rspamd-Queue-Id: 8042A294067
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 01:45:44AM +0530, Mukesh Ojha wrote:
> First of all, I want to thank Eugene for his excellent work on this
> series. What began as the Qualcomm Minidump driver from me has now
> evolved into meminspect. He also presented meminspect a few months ago
> at Linux Plumbers 2025.
> 
> Video of the recording is available here for anyone interested:
> https://www.youtube.com/watch?v=aDZv4-kOLSc
> 
> Introduction:
> 
> meminspect is a mechanism which allows the kernel to mark specific
> memory areas for memory dumping or specific inspection, statistics,
> usage.  Once regions are marked, meminspect keeps an internal list with
> the regions in a dedicated table.  Further, these regions can be
> accessed using specific API by any interested driver.  Regions being
> marked beforehand, when the system is up and running, there is no need
> nor dependency on a panic handler, or a working kernel that can dump the
> debug information.  meminspect can be primarily used for debugging. The
> approach is feasible to work when pstore, kdump, or another mechanism do
> not.  Pstore relies on persistent storage, a dedicated RAM area or
> flash, which has the disadvantage of having the memory reserved all the
> time, or another specific non volatile memory. Some devices cannot keep
> the RAM contents on reboot so ramoops does not work. Some devices do not
> allow kexec to run another kernel to debug the crashed one.  For such
> devices, that have another mechanism to help debugging, like firmware,
> kmemdump is a viable solution.
> 
> meminspect can create a core image, similar with /proc/vmcore, with only
> the registered regions included. This can be loaded into crash tool/gdb
> and analyzed. This happens if CRASH_DUMP=y.  To have this working,
> specific information from the kernel is registered, and this is done at
> meminspect init time, no need for the meminspect users to do anything.
> 
> This version of the meminspect patch series includes two drivers that
> make use of it: one is the Qualcomm Minidump, and the other one is the
> Debug Kinfo backend for Android devices, reworked from this source here:
> https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
> written originally by Jone Chou <jonechou@google.com>
> 
> *** History, motivation and available online resources ***
> 
> The patch series is based on both minidump and kmemdump previous implementations.
> 
> After the three RFC kmemdump versions, considering the ML discussions, it was decided to
> move this into kernel/ directory and rework it into naming it meminspect, as Thomas Gleixner
> suggested.
> 
> Initial version of kmemdump and discussion is available here:
> https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> 
> Kmemdump has been presented and discussed at Linaro Connect 2025,
> including motivation, scope, usability and feasability.
> Video of the recording is available here for anyone interested:
> https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14
> 
> Linaro blog on kmemdump can be found here:
> https://www.linaro.org/blog/introduction-to-kmemdump/
> 
> Linaro blog on kmemdump step by stem using minidump backend is available here:
> https://www.linaro.org/blog/kmemdump-step-by-step-on-qualcomm-automotive-platform/
> 
> The implementation is based on the initial Pstore/directly mapped zones
> published as an RFC here:
> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
> 
> The back-end implementation for qcom_minidump is based on the minidump
> patch series and driver written by Mukesh Ojha, thanks:
> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
> 
> The RFC v2 version with .section creation and macro annotation kmemdump
> is available here:
> https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> 
> The RFC v3 version with making everything static, which was pretty much rejected due to
> all reasons discussed on the public ML:
> https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/
> 
> *** How to use meminspect with minidump backend on Qualcomm platform guide ***
> 
> Prerequisites:
> Crash tool compiled with target=ARM64 and minor changes required for
> usual crash mode (minimal mode works without the patch) **A patch can be
> applied from here https://p.calebs.dev/1687bc ** This patch will be
> eventually sent in a reworked way to crash tool.
> 

That patch was written 8 months ago, what's the timeline for landing
this?

It's not feasible to have every users rebuild crash from source and
maintain this copy in order to use the tool.

> Target kernel must be built with : CONFIG_DEBUG_INFO_REDUCED=n ; this
> will have vmlinux include all the debugging information needed for crash
> tool.
> 
> Also, the kernel requires these as well: CONFIG_MEMINSPECT,
> CONFIG_CRASH_DUMP and the driver CONFIG_QCOM_MINIDUMP
> 
> Kernel arguments: Kernel firmware must be set to mode 'mini' by kernel
> module parameter like this : qcom_scm.download_mode=mini
> 
> After the kernel boots, and minidump module is loaded, everything is
> ready for a possible crash.
> 
> Once the crash happens, the firmware will kick in and you will see on
> the console the message saying Sahara init, etc, that the firmware is
> waiting in download mode. (this is subject to firmware supporting this
> mode, I am using sa8775p-ride board)
> 
> Example of log on the console:
> "
> [...]
> B -   1096414 - usb: init start
> B -   1100287 - usb: qusb_dci_platform , 0x19
> B -   1105686 - usb: usb3phy: PRIM success: lane_A , 0x60
> B -   1107455 - usb: usb2phy: PRIM success , 0x4
> B -   1112670 - usb: dci, chgr_type_det_err
> B -   1117154 - usb: ID:0x260, value: 0x4
> B -   1121942 - usb: ID:0x108, value: 0x1d90
> B -   1124992 - usb: timer_start , 0x4c4b40
> B -   1129140 - usb: vbus_det_pm_unavail
> B -   1133136 - usb: ID:0x252, value: 0x4
> B -   1148874 - usb: SUPER , 0x900e
> B -   1275510 - usb: SUPER , 0x900e
> B -   1388970 - usb: ID:0x20d, value: 0x0
> B -   1411113 - usb: ENUM success
> B -   1411113 - Sahara Init
> B -   1414285 - Sahara Open
> "

This doesn't add any specific value, it's just "Device entered ramdump
mode".

> 
> Once the board is in download mode, you can use the qdl tool (I
> personally use edl , have not tried qdl yet)

Is this your or Eugen's comment? Why haven't you tested qdl yet?

>, to get all the regions as
> separate files.  The tool from the host computer will list the regions
> in the order they were downloaded.
> 
> Once you have all the files simply use `cat` to put them all together,
> in the order of the indexes.  For my kernel config and setup, here is my
> cat command : (you can use a script or something, I haven't done that so
> far):

So these need to be sorted in numerical order, by that number at the end
of the file name?

Do you manually punch these in? How do we make this user friendly?

Regards,
Bjorn

> 
> `cat md_KELF1.BIN md_Kvmcorein2.BIN md_Kconfig3.BIN \
> md_Ktotalram4.BIN md_Kcpu_poss5.BIN md_Kcpu_pres6.BIN \
> md_Kcpu_onli7.BIN md_Kcpu_acti8.BIN md_Kmem_sect9.BIN \
> md_Kjiffies10.BIN md_Klinux_ba11.BIN md_Knr_threa12.BIN \
> md_Knr_irqs13.BIN md_Ktainted_14.BIN md_Ktaint_fl15.BIN \
> md_Knode_sta16.BIN md_K__per_cp17.BIN md_Knr_swapf18.BIN \
> md_Kinit_uts19.BIN md_Kprintk_r20.BIN md_Kprintk_r21.BIN \
> md_Kprb22.BIN md_Kprb_desc23.BIN md_Kprb_info24.BIN \
> md_Kprb_data25.BIN  md_Khigh_mem26.BIN md_Kinit_mm27.BIN \
> md_Kunknown29.BIN md_Kunknown30.BIN md_Kunknown31.BIN \
> md_Kunknown32.BIN md_Kunknown33.BIN md_Kunknown34.BIN \
> md_Kunknown35.BIN md_Kunknown37.BIN \
> md_Kunknown38.BIN md_Kunknown39.BIN md_Kunknown40.BIN \
> md_Kunknown41.BIN md_Kunknown42.BIN md_Kunknown43.BIN \
> md_Kunknown44.BIN md_Kunknown45.BIN  md_Kunknown46.BIN \
> md_Kunknown47.BIN md_Kunknown48.BIN md_Kunknown49.BIN \
> md_Kunknown50.BIN md_Kunknown51.BIN md_Kunknown52.BIN \
> md_Kunknown53.BIN md_Kunknown54.BIN   > ./minidump_image`
> 
> Once you have the resulted file, use `crash` tool to load it, like this:
> `./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`
> 
> There is also a --minimal mode for ./crash that would work without any patch applied
> to crash tool, but you can't inspect symbols, etc.
> 
> Once you load crash you will see something like this :
>       KERNEL: minidump/20260310-235110/vmlinux  [TAINTED]
>     DUMPFILE: ./minidump/20260310-235110/minidump_image
>         CPUS: 8 [OFFLINE: 7]
>         DATE: Thu Jan  1 05:30:00 +0530 1970
>       UPTIME: 00:00:27
>        TASKS: 0
>     NODENAME: qemuarm64
>      RELEASE: 7.0.0-rc3-next-20260309-00028-g528b3c656121
>      VERSION: #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026
>      MACHINE: aarch64  (unknown Mhz)
>       MEMORY: 0
>        PANIC: "Kernel panic - not syncing: sysrq triggered crash"
> 
> crash> log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x514f0014]
> [    0.000000] Linux version 7.0.0-rc3-next-20260309-00028-g528b3c656121 (@21e3bca4168f) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026
> 
> *** Debug Kinfo backend driver ***
> I need help with the testing of this driver, Anyone who actually wants
> to test this, feel free to reply to the patch. we have also written a
> simple DT binding for the driver.
> 
> Thanks in advance for the review, and apologies if I missed addressing any comment.
> 
> -Mukesh 
> 
> Changes in v2: https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
>  - Fixed doc warnings
>  - Fixed kernel-test robot warnings.
>  - Took Mike suggestion to remove mark inspect flag for dynamic memory.
>  - Added R-b for printk patch.
>  - Modified some commit messages for clarity.
>  - corrected binding change for debug-kinfo as per Rob suggestion.
> 
> Changelog for meminspect v1:
> - rename to meminspect
> - start on top of v2 actually, with the section and all.
> - remove the backend thing, change the API to access the table
> - move everything to kernel/
> - add dependency to CRASH_DUMP instead of a separate knob
> - move the minidump driver to soc/qcom
> - integrate the meminspect better into memblock by using a new memblock flag
> - minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
> remove some useless code, etc.
> 
> Changelog for RFC v3:
> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> - Removed the .section as requested by David Hildenbrand.
> - Moved all kmemdump registration(when possible) to vmcoreinfo.
> - Because of this, some of the variables that I was registering had to be non-static
> so I had to modify this as per David Hildenbrand suggestion.
> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
> compiler warnings, fixed the copyright and remove some useless includes.
> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
> and it's now available in kernel hacking, as per Randy Dunlap review
> - Reworked some of the Documentation as per review from Jon Corbet
> 
> Changelog for RFC v2:
> - V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> - Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
> This means new API, macros, new way to store the regions inside kmemdump
> (ditched the IDR, moved to static allocation, have a static default backend, etc)
> - Reworked qcom_minidump driver based on review from Bjorn Andersson
> - Reworked printk log buffer registration based on review from Petr Mladek
> 
> I appologize if I missed any review comments.
> Patches are sent on top on next-20260309 tag
> 
> ---
> Eugen Hristev (21):
>       kernel: Introduce meminspect
>       init/version: Annotate static information into meminspect
>       mm/percpu: Annotate static information into meminspect
>       cpu: Annotate static information into meminspect
>       genirq/irqdesc: Annotate static information into meminspect
>       timers: Annotate static information into meminspect
>       kernel/fork: Annotate static information into meminspect
>       mm/page_alloc: Annotate static information into meminspect
>       mm/show_mem: Annotate static information into meminspect
>       mm/swapfile: Annotate static information into meminspect
>       kernel/vmcore_info: Register dynamic information into meminspect
>       kernel/configs: Register dynamic information into meminspect
>       mm/init-mm: Annotate static information into meminspect
>       panic: Annotate static information into meminspect
>       kallsyms: Annotate static information into meminspect
>       mm/mm_init: Annotate static information into meminspect
>       sched/core: Annotate runqueues into meminspect
>       remoteproc: qcom: Move minidump data structures into its own header
>       soc: qcom: Add minidump backend driver
>       soc: qcom: smem: Add minidump platform device
>       meminspect: Add debug kinfo compatible driver
> 
> Mukesh Ojha (4):
>       mm/numa: Register node data information into meminspect
>       mm/sparse: Register information into meminspect
>       printk: Register information into meminspect
>       dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
> 
>  Documentation/dev-tools/index.rst                  |   1 +
>  Documentation/dev-tools/meminspect.rst             | 144 +++++++
>  .../bindings/reserved-memory/google,kinfo.yaml     |  46 ++
>  MAINTAINERS                                        |  14 +
>  drivers/of/platform.c                              |   1 +
>  drivers/remoteproc/qcom_common.c                   |  56 +--
>  drivers/soc/qcom/Kconfig                           |  13 +
>  drivers/soc/qcom/Makefile                          |   1 +
>  drivers/soc/qcom/minidump.c                        | 272 ++++++++++++
>  drivers/soc/qcom/smem.c                            |  10 +
>  include/asm-generic/vmlinux.lds.h                  |  13 +
>  include/linux/meminspect.h                         | 263 ++++++++++++
>  include/linux/soc/qcom/minidump.h                  |  72 ++++
>  init/Kconfig                                       |   1 +
>  init/version-timestamp.c                           |   3 +
>  init/version.c                                     |   3 +
>  kernel/Makefile                                    |   1 +
>  kernel/configs.c                                   |   6 +
>  kernel/cpu.c                                       |   5 +
>  kernel/fork.c                                      |   3 +
>  kernel/irq/irqdesc.c                               |   2 +
>  kernel/kallsyms.c                                  |   9 +
>  kernel/meminspect/Kconfig                          |  30 ++
>  kernel/meminspect/Makefile                         |   4 +
>  kernel/meminspect/kinfo.c                          | 284 +++++++++++++
>  kernel/meminspect/meminspect.c                     | 471 +++++++++++++++++++++
>  kernel/panic.c                                     |   4 +
>  kernel/printk/printk.c                             |  11 +
>  kernel/sched/core.c                                |   2 +
>  kernel/time/timer.c                                |   2 +
>  kernel/vmcore_info.c                               |   4 +
>  mm/init-mm.c                                       |  11 +
>  mm/mm_init.c                                       |   2 +
>  mm/numa.c                                          |   2 +
>  mm/page_alloc.c                                    |   2 +
>  mm/percpu.c                                        |   2 +
>  mm/show_mem.c                                      |   2 +
>  mm/sparse.c                                        |   6 +
>  mm/swapfile.c                                      |   2 +
>  39 files changed, 1725 insertions(+), 55 deletions(-)
> ---
> base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
> change-id: 20260311-minidump-v2-eed8da647ce5
> 
> Best regards,
> -- 
> -Mukesh Ojha
> 

