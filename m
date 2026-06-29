Return-Path: <linux-arm-msm+bounces-115040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BKxSEnJkQmq16AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:26:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2D6DA24B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="RJg+us/S";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 636C5301F4B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB624028D7;
	Mon, 29 Jun 2026 12:24:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1A40587D;
	Mon, 29 Jun 2026 12:24:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735856; cv=none; b=hk7jPYyVpT5Rs0LljNAUsaogY8BlYhqxl6vAOh2sN3HIzj9lHBMN/6Zh7Y4Tr/eJLtXO6M5mJXS8W4lr2ea2b/qw4Kn0i68K6FqKoAyW/RAamDnIiiGefVYSWMl/RlEljwtSHzt5CC+kjW5zLpskSocpEiBvc3Zu1C+y8zXNjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735856; c=relaxed/simple;
	bh=Faza1xvMYiaQgP50tZZtSm694CvUuBqeMZcYnodrklI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qzq7VLeYdAHoGLEZQdML0Csir7mMbHiL4+19vmpNxG3CwuUMAnQuSwGV9wMOgxLqhZXG53LYtx31FO/0g9m6ZmZnad8vhnjP8Eq08rfH240kPlo1bBa8AtY1YgLlnKKwgEqdAw3LndtBMp9s1HDIumFPRDc702nEiLGbOh7xjWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJg+us/S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22B91F00A3D;
	Mon, 29 Jun 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735853;
	bh=3nPd85K/PKl95JwMlsnWtpK/46tOZR3B1poqhuEzpXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RJg+us/SbcSato5R7/D528Wu7uvkBHeOuV9nfZ4B17LV/FsE7e8H//SZcm88icvqH
	 VCNFFyjohv2ogw1FUAsj0BpzWD5SnE0CDeqlLzNYb3vwFVFJQ/HGPnKuzWqatHX8vr
	 tJEQdbGmyZ9NAeE4TxnKvBTWi/qJmkXXGlhIP0CgIBeZwycaAtmPcAwJrYpicH0m5r
	 wiELN4xm2gU6buCgnjKFd9xobBAqxZOWi4Tiay1NeTah5LvHFbEnFXpg3Lm1Cf5app
	 gC88jGPChjgkEegk2dmP8ctoPBmZoby5incfZJKo6RqLXcyLfER1IIwl+LLTn9MUaw
	 Jinz7LeUHmA9Q==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-mm@kvack.org,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	damon@lists.linux.dev,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH 06/30] mm/rmap: parameterise vma_interval_tree_*() by address_space
Date: Mon, 29 Jun 2026 13:23:17 +0100
Message-ID: <43050b10b53cdfc3627440e6b14ae2a9730b2a5c.1782735110.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782735110.git.ljs@kernel.org>
References: <cover.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,siemens-energy.com,HansenPartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TAGGED_FROM(0.00)[bounces-115040-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprowski@samsung.com,m
 :peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1B2D6DA24B

The file-backed mapping interval tree functions vma_interval_tree_*()
accept a raw rb_root_cached pointer to determine the tree in which they are
operating.

However, in each case, this is always associated with an address_space data
type.

So simply pass a pointer to that instead to simplify the code, and more
clearly differentiate between these operations and those concerning
anonymous mappings.

While we're here, make the generated interval tree functions static as they
do not need to be used externally (any previously existing external users
have now been removed).

We also rename VMA parameters from 'node' to 'vma' as calling this a node
is simply confusing, update the input index types to pgoff_t since they
reference page offsets and rename the parameters to pgoff_start and
pgoff_last.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c          |  2 +-
 arch/arm/mm/flush.c               |  2 +-
 arch/nios2/mm/cacheflush.c        |  2 +-
 arch/parisc/kernel/cache.c        |  2 +-
 fs/dax.c                          |  2 +-
 fs/hugetlbfs/inode.c              | 15 ++++----
 include/linux/mm.h                | 34 +++++++++---------
 kernel/events/uprobes.c           |  2 +-
 mm/hugetlb.c                      |  4 +--
 mm/interval_tree.c                | 58 +++++++++++++++++++++++--------
 mm/khugepaged.c                   |  4 +--
 mm/memory-failure.c               |  7 ++--
 mm/memory.c                       |  8 ++---
 mm/mmap.c                         |  3 +-
 mm/nommu.c                        |  8 ++---
 mm/pagewalk.c                     |  2 +-
 mm/rmap.c                         |  3 +-
 mm/vma.c                          | 14 ++++----
 tools/testing/vma/include/stubs.h |  4 +--
 19 files changed, 100 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 91e488767783..cd52cf7f8874 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -140,7 +140,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 * cache coherency.
 	 */
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(mpnt, mapping, pgoff, pgoff) {
 		/*
 		 * If we are using split PTE locks, then we need to take the pte
 		 * lock. Otherwise we are using shared mm->page_table_lock which
diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 4d7ef5cc36b6..8c593e9898ee 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -251,7 +251,7 @@ static void __flush_dcache_aliases(struct address_space *mapping, struct folio *
 	pgoff_end = pgoff + folio_nr_pages(folio) - 1;
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff_end) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff_end) {
 		unsigned long start, offset, pfn;
 		unsigned int nr;
 
diff --git a/arch/nios2/mm/cacheflush.c b/arch/nios2/mm/cacheflush.c
index 8321182eb927..42e3bf892316 100644
--- a/arch/nios2/mm/cacheflush.c
+++ b/arch/nios2/mm/cacheflush.c
@@ -82,7 +82,7 @@ static void flush_aliases(struct address_space *mapping, struct folio *folio)
 	pgoff = folio->index;
 
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff + nr - 1) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long start;
 
 		if (vma->vm_mm != mm)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 0170b69a21d3..f28aa7884cbf 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -503,7 +503,7 @@ void flush_dcache_folio(struct folio *folio)
 	 * on machines that support equivalent aliasing
 	 */
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff + nr - 1) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long offset = pgoff - vma->vm_pgoff;
 		unsigned long pfn = folio_pfn(folio);
 
diff --git a/fs/dax.c b/fs/dax.c
index 6d175cd47a99..2f0818a68a7f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1201,7 +1201,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 
 	/* Walk all mappings of a given index of a file and writeprotect them */
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, index, end) {
+	vma_interval_tree_foreach(vma, mapping, index, end) {
 		pfn_mkclean_range(pfn, count, index, vma);
 		cond_resched();
 	}
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 216e1a0dd0b2..4ea1798f1ffb 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -380,7 +380,6 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 					struct address_space *mapping,
 					struct folio *folio, pgoff_t index)
 {
-	struct rb_root_cached *root = &mapping->i_mmap;
 	struct hugetlb_vma_lock *vma_lock;
 	unsigned long pfn = folio_pfn(folio);
 	struct vm_area_struct *vma;
@@ -394,7 +393,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 	i_mmap_lock_write(mapping);
 retry:
 	vma_lock = NULL;
-	vma_interval_tree_foreach(vma, root, start, end - 1) {
+	vma_interval_tree_foreach(vma, mapping, start, end - 1) {
 		v_start = vma_offset_start(vma, start);
 		v_end = vma_offset_end(vma, end);
 
@@ -460,8 +459,8 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 }
 
 static void
-hugetlb_vmdelete_list(struct rb_root_cached *root, pgoff_t start, pgoff_t end,
-		      zap_flags_t zap_flags)
+hugetlb_vmdelete_list(struct address_space *mapping, pgoff_t start,
+		      pgoff_t end, zap_flags_t zap_flags)
 {
 	struct vm_area_struct *vma;
 
@@ -470,7 +469,8 @@ hugetlb_vmdelete_list(struct rb_root_cached *root, pgoff_t start, pgoff_t end,
 	 * unmapped.  Note, end is exclusive, whereas the interval tree takes
 	 * an inclusive "last".
 	 */
-	vma_interval_tree_foreach(vma, root, start, end ? end - 1 : ULONG_MAX) {
+	vma_interval_tree_foreach(vma, mapping, start,
+				  end ? end - 1 : ULONG_MAX) {
 		unsigned long v_start;
 		unsigned long v_end;
 
@@ -615,8 +615,7 @@ static void hugetlb_vmtruncate(struct inode *inode, loff_t offset)
 	i_size_write(inode, offset);
 	i_mmap_lock_write(mapping);
 	if (mapping_mapped(mapping))
-		hugetlb_vmdelete_list(&mapping->i_mmap, pgoff, 0,
-				      ZAP_FLAG_DROP_MARKER);
+		hugetlb_vmdelete_list(mapping, pgoff, 0, ZAP_FLAG_DROP_MARKER);
 	i_mmap_unlock_write(mapping);
 	remove_inode_hugepages(inode, offset, LLONG_MAX);
 }
@@ -676,7 +675,7 @@ static long hugetlbfs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	/* Unmap users of full pages in the hole. */
 	if (hole_end > hole_start) {
 		if (mapping_mapped(mapping))
-			hugetlb_vmdelete_list(&mapping->i_mmap,
+			hugetlb_vmdelete_list(mapping,
 					      hole_start >> PAGE_SHIFT,
 					      hole_end >> PAGE_SHIFT, 0);
 	}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e7ee315d5ba2..bdba25491b0e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4061,23 +4061,25 @@ extern atomic_long_t mmap_pages_allocated;
 extern int nommu_shrink_inode_mappings(struct inode *, size_t, size_t);
 
 /* interval_tree.c */
-void vma_interval_tree_insert(struct vm_area_struct *node,
-			      struct rb_root_cached *root);
-void vma_interval_tree_insert_after(struct vm_area_struct *node,
+void vma_interval_tree_insert(struct vm_area_struct *vma,
+			      struct address_space *mapping);
+void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
-				    struct rb_root_cached *root);
-void vma_interval_tree_remove(struct vm_area_struct *node,
-			      struct rb_root_cached *root);
-struct vm_area_struct *vma_interval_tree_subtree_search(struct vm_area_struct *node,
-				unsigned long start, unsigned long last);
-struct vm_area_struct *vma_interval_tree_iter_first(struct rb_root_cached *root,
-				unsigned long start, unsigned long last);
-struct vm_area_struct *vma_interval_tree_iter_next(struct vm_area_struct *node,
-				unsigned long start, unsigned long last);
-
-#define vma_interval_tree_foreach(vma, root, start, last)		\
-	for (vma = vma_interval_tree_iter_first(root, start, last);	\
-	     vma; vma = vma_interval_tree_iter_next(vma, start, last))
+				    struct address_space *mapping);
+void vma_interval_tree_remove(struct vm_area_struct *vma,
+			      struct address_space *mapping);
+struct vm_area_struct *
+vma_interval_tree_iter_first(struct address_space *mapping,
+			     pgoff_t pgoff_start, pgoff_t pgoff_last);
+struct vm_area_struct *
+vma_interval_tree_iter_next(struct vm_area_struct *vma,
+			    pgoff_t pgoff_start, pgoff_t pgoff_last);
+
+#define vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
+	for (vma = vma_interval_tree_iter_first(mapping, pgoff_start,	 \
+						pgoff_last);		 \
+	     vma; vma = vma_interval_tree_iter_next(vma, pgoff_start,	 \
+						    pgoff_last))
 
 void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
 				   struct rb_root_cached *root);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4084e926e284..50a96a4d812d 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1210,7 +1210,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
  again:
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		if (!valid_vma(vma, is_register))
 			continue;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 571212b80835..1e1fbf348c51 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5382,7 +5382,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * __unmap_hugepage_range() is called as the lock is already held
 	 */
 	i_mmap_lock_write(mapping);
-	vma_interval_tree_foreach(iter_vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
 		/* Do not unmap the current VMA */
 		if (iter_vma == vma)
 			continue;
@@ -6864,7 +6864,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	pte_t *pte;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(svma, &mapping->i_mmap, idx, idx) {
+	vma_interval_tree_foreach(svma, mapping, idx, idx) {
 		if (svma == vma)
 			continue;
 
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 2d50bc6228c4..ff36fd14ef37 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -14,19 +14,26 @@
 /* File-backed interval tree (address_space->i_mmap) */
 
 INTERVAL_TREE_DEFINE(struct vm_area_struct, shared.rb,
-		     unsigned long, shared.rb_subtree_last,
-		     vma_start_pgoff, vma_last_pgoff, /* empty */, vma_interval_tree)
+		     pgoff_t, shared.rb_subtree_last,
+		     vma_start_pgoff, vma_last_pgoff, static,
+		     __vma_interval_tree)
 
-/* Insert node immediately after prev in the interval tree */
-void vma_interval_tree_insert_after(struct vm_area_struct *node,
+void vma_interval_tree_insert(struct vm_area_struct *vma,
+			      struct address_space *mapping)
+{
+	__vma_interval_tree_insert(vma, &mapping->i_mmap);
+}
+
+/* Insert vma immediately after prev in the interval tree */
+void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
-				    struct rb_root_cached *root)
+				    struct address_space *mapping)
 {
 	struct rb_node **link;
 	struct vm_area_struct *parent;
-	unsigned long last = vma_last_pgoff(node);
+	const pgoff_t pgoff_last = vma_last_pgoff(vma);
 
-	VM_WARN_ON_ONCE_VMA(vma_start_pgoff(node) != vma_start_pgoff(prev), node);
+	VM_WARN_ON_ONCE_VMA(vma_start_pgoff(vma) != vma_start_pgoff(prev), vma);
 
 	if (!prev->shared.rb.rb_right) {
 		parent = prev;
@@ -34,21 +41,42 @@ void vma_interval_tree_insert_after(struct vm_area_struct *node,
 	} else {
 		parent = rb_entry(prev->shared.rb.rb_right,
 				  struct vm_area_struct, shared.rb);
-		if (parent->shared.rb_subtree_last < last)
-			parent->shared.rb_subtree_last = last;
+		if (parent->shared.rb_subtree_last < pgoff_last)
+			parent->shared.rb_subtree_last = pgoff_last;
 		while (parent->shared.rb.rb_left) {
 			parent = rb_entry(parent->shared.rb.rb_left,
 				struct vm_area_struct, shared.rb);
-			if (parent->shared.rb_subtree_last < last)
-				parent->shared.rb_subtree_last = last;
+			if (parent->shared.rb_subtree_last < pgoff_last)
+				parent->shared.rb_subtree_last = pgoff_last;
 		}
 		link = &parent->shared.rb.rb_left;
 	}
 
-	node->shared.rb_subtree_last = last;
-	rb_link_node(&node->shared.rb, &parent->shared.rb, link);
-	rb_insert_augmented(&node->shared.rb, &root->rb_root,
-			    &vma_interval_tree_augment);
+	vma->shared.rb_subtree_last = pgoff_last;
+	rb_link_node(&vma->shared.rb, &parent->shared.rb, link);
+	rb_insert_augmented(&vma->shared.rb, &mapping->i_mmap.rb_root,
+			    &__vma_interval_tree_augment);
+}
+
+void vma_interval_tree_remove(struct vm_area_struct *vma,
+			      struct address_space *mapping)
+{
+	__vma_interval_tree_remove(vma, &mapping->i_mmap);
+}
+
+struct vm_area_struct *
+vma_interval_tree_iter_first(struct address_space *mapping,
+			     pgoff_t pgoff_start, pgoff_t pgoff_last)
+{
+	return __vma_interval_tree_iter_first(&mapping->i_mmap,
+					      pgoff_start, pgoff_last);
+}
+
+struct vm_area_struct *
+vma_interval_tree_iter_next(struct vm_area_struct *vma,
+			    pgoff_t pgoff_start, pgoff_t pgoff_last)
+{
+	return __vma_interval_tree_iter_next(vma, pgoff_start, pgoff_last);
 }
 
 /* Anonymous interval tree (anon_vma->rb_root) */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 617bca76db49..9dcf38dc0f8c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2136,7 +2136,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 	struct vm_area_struct *vma;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
@@ -2568,7 +2568,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		 * not be able to observe any missing pages due to the
 		 * previously inserted retry entries.
 		 */
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, start, end) {
+		vma_interval_tree_foreach(vma, mapping, start, end) {
 			if (userfaultfd_missing(vma)) {
 				result = SCAN_EXCEED_NONE_PTE;
 				goto immap_locked;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 51508a55c405..3c842b472a75 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -586,8 +586,7 @@ static void collect_procs_file(const struct folio *folio,
 
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff,
-				      pgoff) {
+		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			/*
 			 * Send early kill signal to tasks where a vma covers
 			 * the page but the corrupted page is not necessarily
@@ -638,7 +637,7 @@ static void collect_procs_fsdax(const struct page *page,
 			t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			if (vma->vm_mm == t->mm)
 				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
 		}
@@ -2239,7 +2238,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 		t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, 0, ULONG_MAX) {
+		vma_interval_tree_foreach(vma, mapping, 0, ULONG_MAX) {
 			pgoff_t pgoff;
 
 			if (vma->vm_mm == t->mm &&
diff --git a/mm/memory.c b/mm/memory.c
index ff338c2abe92..1cf59041600c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4336,7 +4336,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	return wp_page_copy(vmf);
 }
 
-static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
+static inline void unmap_mapping_range_tree(struct address_space *mapping,
 					    pgoff_t first_index,
 					    pgoff_t last_index,
 					    struct zap_details *details)
@@ -4345,7 +4345,7 @@ static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
 	unsigned long start, size;
 	struct mmu_gather tlb;
 
-	vma_interval_tree_foreach(vma, root, first_index, last_index) {
+	vma_interval_tree_foreach(vma, mapping, first_index, last_index) {
 		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
 		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
 
@@ -4387,7 +4387,7 @@ void unmap_mapping_folio(struct folio *folio)
 
 	i_mmap_lock_read(mapping);
 	if (unlikely(mapping_mapped(mapping)))
-		unmap_mapping_range_tree(&mapping->i_mmap, first_index,
+		unmap_mapping_range_tree(mapping, first_index,
 					 last_index, &details);
 	i_mmap_unlock_read(mapping);
 }
@@ -4417,7 +4417,7 @@ void unmap_mapping_pages(struct address_space *mapping, pgoff_t start,
 
 	i_mmap_lock_read(mapping);
 	if (unlikely(mapping_mapped(mapping)))
-		unmap_mapping_range_tree(&mapping->i_mmap, first_index,
+		unmap_mapping_range_tree(mapping, first_index,
 					 last_index, &details);
 	i_mmap_unlock_read(mapping);
 }
diff --git a/mm/mmap.c b/mm/mmap.c
index 2311ae7c2ff4..2f22fb0d068d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1830,8 +1830,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 				mapping_allow_writable(mapping);
 			flush_dcache_mmap_lock(mapping);
 			/* insert tmp into the share list, just after mpnt */
-			vma_interval_tree_insert_after(tmp, mpnt,
-					&mapping->i_mmap);
+			vma_interval_tree_insert_after(tmp, mpnt, mapping);
 			flush_dcache_mmap_unlock(mapping);
 			i_mmap_unlock_write(mapping);
 		}
diff --git a/mm/nommu.c b/mm/nommu.c
index ed3934bc2de4..9a01b01ba8ed 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -569,7 +569,7 @@ static void setup_vma_to_mm(struct vm_area_struct *vma, struct mm_struct *mm)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_insert(vma, &mapping->i_mmap);
+		vma_interval_tree_insert(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -585,7 +585,7 @@ static void cleanup_vma_from_mm(struct vm_area_struct *vma)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_remove(vma, &mapping->i_mmap);
+		vma_interval_tree_remove(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -1816,7 +1816,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	i_mmap_lock_read(inode->i_mapping);
 
 	/* search for VMAs that fall within the dead zone */
-	vma_interval_tree_foreach(vma, &inode->i_mapping->i_mmap, low, high) {
+	vma_interval_tree_foreach(vma, inode->i_mapping, low, high) {
 		/* found one - only interested if it's shared out of the page
 		 * cache */
 		if (vma->vm_flags & VM_SHARED) {
@@ -1832,7 +1832,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	 * we don't check for any regions that start beyond the EOF as there
 	 * shouldn't be any
 	 */
-	vma_interval_tree_foreach(vma, &inode->i_mapping->i_mmap, 0, ULONG_MAX) {
+	vma_interval_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
 		if (!(vma->vm_flags & VM_SHARED))
 			continue;
 
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 3ae2586ff45b..490a14691660 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -810,7 +810,7 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
 		return -EINVAL;
 
 	lockdep_assert_held(&mapping->i_mmap_rwsem);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, first_index,
+	vma_interval_tree_foreach(vma, mapping, first_index,
 				  first_index + nr - 1) {
 		/* Clip to the vma */
 		vba = vma->vm_pgoff;
diff --git a/mm/rmap.c b/mm/rmap.c
index 1c77d5dc06e9..13ffa71bd20d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -3051,8 +3051,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
 		i_mmap_lock_read(mapping);
 	}
 lookup:
-	vma_interval_tree_foreach(vma, &mapping->i_mmap,
-			pgoff_start, pgoff_end) {
+	vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
 		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
diff --git a/mm/vma.c b/mm/vma.c
index 9eea2850818a..ce4ec4b71138 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -234,7 +234,7 @@ static void __vma_link_file(struct vm_area_struct *vma,
 		mapping_allow_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_insert(vma, &mapping->i_mmap);
+	vma_interval_tree_insert(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -248,7 +248,7 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
 		mapping_unmap_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_remove(vma, &mapping->i_mmap);
+	vma_interval_tree_remove(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -319,10 +319,9 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		vma_interval_tree_remove(vp->vma, &vp->mapping->i_mmap);
+		vma_interval_tree_remove(vp->vma, vp->mapping);
 		if (vp->adj_next)
-			vma_interval_tree_remove(vp->adj_next,
-						 &vp->mapping->i_mmap);
+			vma_interval_tree_remove(vp->adj_next, vp->mapping);
 	}
 
 }
@@ -340,9 +339,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 {
 	if (vp->file) {
 		if (vp->adj_next)
-			vma_interval_tree_insert(vp->adj_next,
-						 &vp->mapping->i_mmap);
-		vma_interval_tree_insert(vp->vma, &vp->mapping->i_mmap);
+			vma_interval_tree_insert(vp->adj_next, vp->mapping);
+		vma_interval_tree_insert(vp->vma, vp->mapping);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 64164e25658f..94442b29458d 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -258,12 +258,12 @@ static inline void vm_acct_memory(long pages)
 }
 
 static inline void vma_interval_tree_insert(struct vm_area_struct *vma,
-					    struct rb_root_cached *rb)
+					    struct address_space *mapping)
 {
 }
 
 static inline void vma_interval_tree_remove(struct vm_area_struct *vma,
-					    struct rb_root_cached *rb)
+					    struct address_space *mapping)
 {
 }
 
-- 
2.54.0


