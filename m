Return-Path: <linux-arm-msm+bounces-118405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mk8LDCRXUWorCwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:33:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3473E5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:33:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="HN/nTgeK";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118405-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118405-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 592C63067820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14533A48F7;
	Fri, 10 Jul 2026 20:29:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A8239A4C5;
	Fri, 10 Jul 2026 20:29:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715348; cv=none; b=qX05KKtdkApkRYVo0s7iRMmac+CfPhvKTIAl0eut5Wm08b3XZ21Yd3/8ehtD40UGRC/vQC7pr6KpLInhOiBo8lGmHRqA+/nv0EfnFyoqctSals8Ea6h2pXg0FxUdxlJmN+1ADC0BOe/YvxG/h6j1Tvd/1MJMv4MYLnsbeois1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715348; c=relaxed/simple;
	bh=shpFTR/kYRzffTsm0zlgjzVGjq2PyyHz+kDqenhzfis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOEsNpYAxNaweG/0wBrHwDpUCbup2b7dNUoCByzWqqIAr+QpSd6MnO9IhAcbQDvY3Qy731v+eL/h/NGYxcJKv8s77dSreqESqcNLprJqRlxy1CJHVq26AdZwWvpCYI38N7S3PBmovNIOYxN5HWgtHvNCq/2wrgZqc0qby61t0Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN/nTgeK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563BD1F00A3D;
	Fri, 10 Jul 2026 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715347;
	bh=1ql8pfD2dLkZ3j2ZLRgwxtlbsXGEbzU77QdgKu6+RW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HN/nTgeKq3AnMjIs0u7JOFWgL8V6dcLlJmk9ikJ8fDUbMBlZLUk6KpsqhTpY6f4Rk
	 cqc+QtS61rJvVT+Ieot26FX4QBYJX2NWdolyKNWZN+OpJv8b6VLbVV1oQSiHVnosL+
	 el9kwv9KVuOaHbau8QAS8wvLAfNTYvAb4ZJWcc07ARv1rGWx3AiJuSs2p6HMNHxhrr
	 yNxDfm62mwI2vkLsGoWHpLP8BEUXJ7q8pRDCBdgChs4OndWDlfPdmsS0BndIlw9ftX
	 kdZHMOwRHnn1aHsvYqf0OdH7AS7sYRrsyWJy4u0ytikVJxADHfDwEbDXZMERb/f5Qq
	 9Tw8VKMmYGVQg==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:11 +0100
Subject: [PATCH v2 30/33] mm/vma: correct incorrect vma.h inclusion
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-30-2a5aa403d977@kernel.org>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Xu Xin <xu.xin16@zte.com.cn>, 
 Chengming Zhou <chengming.zhou@linux.dev>, SJ Park <sj@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, 
 Peter Xu <peterx@redhat.com>, Kees Cook <kees@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yishai Hadas <yishaih@nvidia.com>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
 Alex Williamson <alex@shazbot.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Usama Arif <usama.arif@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev, 
 iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536; i=ljs@kernel.org;
 h=from:subject:message-id; bh=shpFTR/kYRzffTsm0zlgjzVGjq2PyyHz+kDqenhzfis=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg201dv0WDPnXKfD02fVrd2xmnJGosao9+KtYLrPMT
 ee3uOTFjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAExk6htGhutMvdsKbROmGXpe
 9bRozf2k9WX9ovWH62umFivq6Py9+pCRoftC5fGIB3Fbpepc7q+dFC6dVurt13dkg9IG04qXXkn
 b+AA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118405-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:lance.yang@linux.dev,m:pfalcato@suse.de,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:djbw@kernel.org,m:willy@infradead.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:mhiramat@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:linmiaohe@huawei.com,m:nao.horiguchi@gma
 il.com,m:xu.xin16@zte.com.cn,m:chengming.zhou@linux.dev,m:sj@kernel.org,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:hughd@google.com,m:peterx@redhat.com,m:kees@kernel.org,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen
 @ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:jgg@ziepe.ca,m:yishaih@nvidia.com,m:skolothumtho@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,HansenPartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,gourry.net,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,mev.co.uk,visionengravers.com,pengutronix.de,ffwll.ch,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,amd.com,ziepe.ca,shazbot.org];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[122];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gourry.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7D3473E5FF

The only files which should be including vma.h are the implementation files
for the core VMA logic - vma.c, vma_init.c, and vma_exec.c.

This is in order to allow for userland testing of core VMA logic. In this
cases, vma_internal.h and vma.h are included, providing both the
dependencies upon which the core VMA logic requires and its declarations.

Userland testable VMA logic is achieved by having separate vma_internal.h
implementations for userland and kernel.

Callers other than the core VMA implementation should include internal.h
instead. This header does not need to include vma_internal.h as it only
contains the vma.h declarations, for which the includes already present
suffice.

Update code to reflect this, update comments to reflect the fact there are
3 VMA implementation files and document things more clearly.

While we're here, slightly improve the language of the comment describing
vma_exec.c.

No functional change intended.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmu_notifier.c | 2 +-
 mm/nommu.c        | 1 -
 mm/vma.c          | 4 ++++
 mm/vma.h          | 9 ++++++++-
 mm/vma_exec.c     | 8 ++++++--
 mm/vma_init.c     | 4 ++++
 mm/vma_internal.h | 4 ++--
 7 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 245b74f39f91..df69ba6e797f 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -19,7 +19,7 @@
 #include <linux/sched/mm.h>
 #include <linux/slab.h>
 
-#include "vma.h"
+#include "internal.h"
 
 /* global SRCU for all MMs */
 DEFINE_STATIC_SRCU(srcu);
diff --git a/mm/nommu.c b/mm/nommu.c
index 21cbe8b093fc..adc0b0ca906b 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -41,7 +41,6 @@
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
 #include "internal.h"
-#include "vma.h"
 
 unsigned long highest_memmap_pfn;
 int heap_stack_gap = 0;
diff --git a/mm/vma.c b/mm/vma.c
index 7c75dd78edef..737f0d692e6b 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -4,6 +4,10 @@
  * VMA-specific functions.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma.h b/mm/vma.h
index 58f48609ce22..adb7a0ba1192 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -2,7 +2,14 @@
 /*
  * vma.h
  *
- * Core VMA manipulation API implemented in vma.c.
+ * Core VMA manipulation API implemented in vma.c, vma_init.c and vma_exec.c.
+ *
+ * Note that, in order for VMA logic to be userland testable, this header
+ * intentionally includes no dependencies.
+ *
+ * This is specifically scoped to mm-only. Users of this functionality (other
+ * than the core VMA implementation itself) should not include this header
+ * directly, but rather include internal.h.
  */
 #ifndef __MM_VMA_H
 #define __MM_VMA_H
diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index 13a05e041195..ef1fa2b161f3 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -1,10 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /*
- * Functions explicitly implemented for exec functionality which however are
- * explicitly VMA-only logic.
+ * Functions provided for exec functionality which however are
+ * specifically VMA-only logic.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma_init.c b/mm/vma_init.c
index a459669a1654..715feee283f0 100644
--- a/mm/vma_init.c
+++ b/mm/vma_init.c
@@ -5,6 +5,10 @@
  * between CONFIG_MMU and non-CONFIG_MMU kernel configurations.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma_internal.h b/mm/vma_internal.h
index 2da6d224c1a8..4d300e7bbaf4 100644
--- a/mm/vma_internal.h
+++ b/mm/vma_internal.h
@@ -2,8 +2,8 @@
 /*
  * vma_internal.h
  *
- * Headers required by vma.c, which can be substituted accordingly when testing
- * VMA functionality.
+ * Headers required by vma.c, vma_init.c and vma_exec.c, which can be
+ * substituted accordingly when testing VMA functionality.
  */
 
 #ifndef __MM_VMA_INTERNAL_H

-- 
2.55.0


