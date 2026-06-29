Return-Path: <linux-arm-msm+bounces-115043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECACD4llQmoP6QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:31:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F956DA380
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=amzMk8Db;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94585302ADB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6DB407569;
	Mon, 29 Jun 2026 12:24:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD34071F1;
	Mon, 29 Jun 2026 12:24:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735864; cv=none; b=bk2U3nTdDcScMyfTBNMsDZ4UmB/Sj/N3zpimB/S3TlCUQMYGHISuqVmIW2BKbFDoh1bPTFgLGtr/g0mdtESn0WFoZL6mH1dggKIV3pBMKNhG+eXCgkuvCqSzV9kMOYpYIZ0YOveIIeK2xIlLTR8OpshuuzGX7j4ZxbZHq4mLqzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735864; c=relaxed/simple;
	bh=pEZqblnGSYnmH4ybXBxmE4xnyvvzNOU6BOcuRiNqJps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGmdpuNCC1kpkqoijSc5h10vyxbztI2s0uZ8ZgJInsi+GdUaJZS8dvZXU8gaOxP3/umIMEMeZHCq7uwSOr+EmtZZz3YLQ3bEwW7g2WS6nVswO2+/5F16cB705vPj2/E015A1xczezUqGRqWeqe7wzU+BBFlcuHUo6Y5mxB+2vf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amzMk8Db; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76661F00A3E;
	Mon, 29 Jun 2026 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735862;
	bh=hQBhrlaFFzk+ZEcRGFKtVXitFg8rNyhgcTwmw17Dzcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=amzMk8DbKDuhgmPjwVqU/huK5Y97Ptitr13OYucPMSAAlWOHQvBHeXwZN7m0Ph+Zb
	 Ca1QkgMNan2TxDbZWvZpyUwEVUbZLHWqIVfGpqGQglbKIoNYZL2pcronT9GkzAH0N2
	 5cKYzCylPojC/iT2hsGojmuNj79gUpL5+pB7oMEnNyCFEbCXgDNHBy3SJw7hcGfnHc
	 gj6B1qSn3JpSNWFuCvaBtt5VRADfwN+d96UGq+BzM+1t7AWWvABsgM2yoOQ7n3hdTT
	 w+S/iYqLwhYHF2tsFEBg9XjF3mJ+84R1mbn80AICmXJyLgGmsLEgOo+kNBOzFiY+3w
	 AKqrjMBIO2IoQ==
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
Subject: [PATCH 09/30] mm/rmap: parameterise anon_vma_interval_tree_*() by anon_vma
Date: Mon, 29 Jun 2026 13:23:20 +0100
Message-ID: <1c1df7b905ef340cbf2effef769a4e770a8e0eb1.1782735110.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,siemens-energy.com,HansenPartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TAGGED_FROM(0.00)[bounces-115043-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62F956DA380

Similar to what we did with mapping_interval_tree*(), let's declare
anon_vma_interval_tree*() in terms of anon_vma rather than rb_root_cached.

In each case the rb tree referenced is &anon_vma->rb_root, so just pass
anon_vma and the functions can figure this out themselves.

Additionally, rename 'node' to 'avc', 'index' to 'pgoff_start', and 'last'
to 'pgoff_last' to make clear what is being passed.

Finally express page offsets in terms of pgoff_t to be consistent.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mm.h                | 27 +++++++++++---------
 mm/interval_tree.c                | 41 ++++++++++++++++---------------
 mm/ksm.c                          |  7 ++----
 mm/memory-failure.c               |  3 +--
 mm/rmap.c                         | 11 ++++-----
 mm/vma.c                          |  4 +--
 tools/testing/vma/include/stubs.h |  4 +--
 7 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 703e07ff7d12..cf2d42747064 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4081,22 +4081,25 @@ mapping_interval_tree_iter_next(struct vm_area_struct *vma,
 	     vma; vma = mapping_interval_tree_iter_next(vma, pgoff_start,    \
 							pgoff_last))
 
-void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
-				   struct rb_root_cached *root);
-void anon_vma_interval_tree_remove(struct anon_vma_chain *node,
-				   struct rb_root_cached *root);
+void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
+				   struct anon_vma *anon_vma);
+void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
+				   struct anon_vma *anon_vma);
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_first(struct rb_root_cached *root,
-				  unsigned long start, unsigned long last);
-struct anon_vma_chain *anon_vma_interval_tree_iter_next(
-	struct anon_vma_chain *node, unsigned long start, unsigned long last);
+anon_vma_interval_tree_iter_first(struct anon_vma *anon_vma,
+				  pgoff_t pgoff_start, pgoff_t pgoff_last);
+struct anon_vma_chain *
+anon_vma_interval_tree_iter_next(struct anon_vma_chain *avc,
+				 pgoff_t pgoff_start, pgoff_t pgoff_last);
 #ifdef CONFIG_DEBUG_VM_RB
-void anon_vma_interval_tree_verify(struct anon_vma_chain *node);
+void anon_vma_interval_tree_verify(struct anon_vma_chain *avc);
 #endif
 
-#define anon_vma_interval_tree_foreach(avc, root, start, last)		 \
-	for (avc = anon_vma_interval_tree_iter_first(root, start, last); \
-	     avc; avc = anon_vma_interval_tree_iter_next(avc, start, last))
+#define anon_vma_interval_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last) \
+	for (avc = anon_vma_interval_tree_iter_first(anon_vma, pgoff_start,    \
+						     pgoff_last);	       \
+	     avc; avc = anon_vma_interval_tree_iter_next(avc, pgoff_start,     \
+							 pgoff_last))
 
 /* mmap.c */
 extern int __vm_enough_memory(const struct mm_struct *mm, long pages, int cap_sys_admin);
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index cbd3038e46a9..d90e962b28f7 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -81,54 +81,55 @@ mapping_interval_tree_iter_next(struct vm_area_struct *vma,
 
 /* Anonymous interval tree (anon_vma->rb_root) */
 
-static unsigned long avc_start_pgoff(struct anon_vma_chain *avc)
+static pgoff_t avc_start_pgoff(struct anon_vma_chain *avc)
 {
 	return vma_start_pgoff(avc->vma);
 }
 
-static unsigned long avc_last_pgoff(struct anon_vma_chain *avc)
+static pgoff_t avc_last_pgoff(struct anon_vma_chain *avc)
 {
 	return vma_last_pgoff(avc->vma);
 }
 
-INTERVAL_TREE_DEFINE(struct anon_vma_chain, rb, unsigned long, rb_subtree_last,
+INTERVAL_TREE_DEFINE(struct anon_vma_chain, rb, pgoff_t, rb_subtree_last,
 		     avc_start_pgoff, avc_last_pgoff,
 		     static, __anon_vma_interval_tree)
 
-void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
-				   struct rb_root_cached *root)
+void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
+				   struct anon_vma *anon_vma)
 {
 #ifdef CONFIG_DEBUG_VM_RB
-	node->cached_vma_start = avc_start_pgoff(node);
-	node->cached_vma_last = avc_last_pgoff(node);
+	avc->cached_vma_start = avc_start_pgoff(avc);
+	avc->cached_vma_last = avc_last_pgoff(avc);
 #endif
-	__anon_vma_interval_tree_insert(node, root);
+	__anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
 }
 
-void anon_vma_interval_tree_remove(struct anon_vma_chain *node,
-				   struct rb_root_cached *root)
+void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
+				   struct anon_vma *anon_vma)
 {
-	__anon_vma_interval_tree_remove(node, root);
+	__anon_vma_interval_tree_remove(avc, &anon_vma->rb_root);
 }
 
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_first(struct rb_root_cached *root,
-				  unsigned long first, unsigned long last)
+anon_vma_interval_tree_iter_first(struct anon_vma *anon_vma,
+				  pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __anon_vma_interval_tree_iter_first(root, first, last);
+	return __anon_vma_interval_tree_iter_first(&anon_vma->rb_root,
+						   pgoff_start, pgoff_last);
 }
 
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_next(struct anon_vma_chain *node,
-				 unsigned long first, unsigned long last)
+anon_vma_interval_tree_iter_next(struct anon_vma_chain *avc,
+				 pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __anon_vma_interval_tree_iter_next(node, first, last);
+	return __anon_vma_interval_tree_iter_next(avc, pgoff_start, pgoff_last);
 }
 
 #ifdef CONFIG_DEBUG_VM_RB
-void anon_vma_interval_tree_verify(struct anon_vma_chain *node)
+void anon_vma_interval_tree_verify(struct anon_vma_chain *avc)
 {
-	WARN_ON_ONCE(node->cached_vma_start != avc_start_pgoff(node));
-	WARN_ON_ONCE(node->cached_vma_last != avc_last_pgoff(node));
+	WARN_ON_ONCE(avc->cached_vma_start != avc_start_pgoff(avc));
+	WARN_ON_ONCE(avc->cached_vma_last != avc_last_pgoff(avc));
 }
 #endif
diff --git a/mm/ksm.c b/mm/ksm.c
index 7d5b76478f0b..c6a6e1ef581d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3186,8 +3186,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
 			anon_vma_lock_read(anon_vma);
 		}
 
-		anon_vma_interval_tree_foreach(vmac, &anon_vma->rb_root,
-					       0, ULONG_MAX) {
+		anon_vma_interval_tree_foreach(vmac, anon_vma, 0, ULONG_MAX) {
 
 			cond_resched();
 			vma = vmac->vma;
@@ -3248,9 +3247,7 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
 				task_early_kill(tsk, force_early);
 			if (!t)
 				continue;
-			anon_vma_interval_tree_foreach(vmac, &av->rb_root, 0,
-						       ULONG_MAX)
-			{
+			anon_vma_interval_tree_foreach(vmac, av, 0, ULONG_MAX) {
 				vma = vmac->vma;
 				if (vma->vm_mm == t->mm) {
 					addr = rmap_item->address & PAGE_MASK;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 5b97d26ee9b6..cbdec52b6d23 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -552,8 +552,7 @@ static void collect_procs_anon(const struct folio *folio,
 
 		if (!t)
 			continue;
-		anon_vma_interval_tree_foreach(vmac, &av->rb_root,
-					       pgoff, pgoff) {
+		anon_vma_interval_tree_foreach(vmac, av, pgoff, pgoff) {
 			vma = vmac->vma;
 			if (vma->vm_mm != t->mm)
 				continue;
diff --git a/mm/rmap.c b/mm/rmap.c
index 567e46799c64..183603813255 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -211,7 +211,7 @@ int __anon_vma_prepare(struct vm_area_struct *vma)
 	if (likely(!vma->anon_vma)) {
 		vma->anon_vma = anon_vma;
 		anon_vma_chain_assign(vma, avc, anon_vma);
-		anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
+		anon_vma_interval_tree_insert(avc, anon_vma);
 		anon_vma->num_active_vmas++;
 		allocated = NULL;
 		avc = NULL;
@@ -354,7 +354,7 @@ int anon_vma_clone(struct vm_area_struct *dst, struct vm_area_struct *src,
 	list_for_each_entry_reverse(avc, &dst->anon_vma_chain, same_vma) {
 		struct anon_vma *anon_vma = avc->anon_vma;
 
-		anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
+		anon_vma_interval_tree_insert(avc, anon_vma);
 		if (operation == VMA_OP_FORK)
 			maybe_reuse_anon_vma(dst, anon_vma);
 	}
@@ -434,7 +434,7 @@ int anon_vma_fork(struct vm_area_struct *vma, struct vm_area_struct *pvma)
 	anon_vma_chain_assign(vma, avc, anon_vma);
 	/* Now let rmap see it. */
 	anon_vma_lock_write(anon_vma);
-	anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
+	anon_vma_interval_tree_insert(avc, anon_vma);
 	anon_vma->parent->num_children++;
 	anon_vma_unlock_write(anon_vma);
 
@@ -499,7 +499,7 @@ void unlink_anon_vmas(struct vm_area_struct *vma)
 	list_for_each_entry_safe(avc, next, &vma->anon_vma_chain, same_vma) {
 		struct anon_vma *anon_vma = avc->anon_vma;
 
-		anon_vma_interval_tree_remove(avc, &anon_vma->rb_root);
+		anon_vma_interval_tree_remove(avc, anon_vma);
 
 		/*
 		 * Leave empty anon_vmas on the list - we'll need
@@ -2986,8 +2986,7 @@ static void rmap_walk_anon(struct folio *folio,
 
 	pgoff_start = folio_pgoff(folio);
 	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
-	anon_vma_interval_tree_foreach(avc, &anon_vma->rb_root,
-			pgoff_start, pgoff_end) {
+	anon_vma_interval_tree_foreach(avc, anon_vma, pgoff_start, pgoff_end) {
 		struct vm_area_struct *vma = avc->vma;
 		unsigned long address = vma_address(vma, pgoff_start,
 				folio_nr_pages(folio));
diff --git a/mm/vma.c b/mm/vma.c
index 7dc9d087c2c7..2be0dbd7bb7b 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -272,7 +272,7 @@ anon_vma_interval_tree_pre_update_vma(struct vm_area_struct *vma)
 	struct anon_vma_chain *avc;
 
 	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_vma_interval_tree_remove(avc, &avc->anon_vma->rb_root);
+		anon_vma_interval_tree_remove(avc, avc->anon_vma);
 }
 
 static void
@@ -281,7 +281,7 @@ anon_vma_interval_tree_post_update_vma(struct vm_area_struct *vma)
 	struct anon_vma_chain *avc;
 
 	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_vma_interval_tree_insert(avc, &avc->anon_vma->rb_root);
+		anon_vma_interval_tree_insert(avc, avc->anon_vma);
 }
 
 /*
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 9c151b860f36..51d03e9c23c5 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -272,12 +272,12 @@ static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
 }
 
 static inline void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
-						 struct rb_root_cached *rb)
+						 struct anon_vma *anon_vma)
 {
 }
 
 static inline void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
-						 struct rb_root_cached *rb)
+						 struct anon_vma *anon_vma)
 {
 }
 
-- 
2.54.0


