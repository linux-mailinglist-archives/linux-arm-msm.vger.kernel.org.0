Return-Path: <linux-arm-msm+bounces-115507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yzWK6XtQ2rDlgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C622F6E6687
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bp88J+lh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jBVZJHTz;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ypAxO1gK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tO9woAdD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DE4730230F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2AA4779A4;
	Tue, 30 Jun 2026 16:19:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DE4657FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:19:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836366; cv=none; b=Z0+OF7TY2Un0DagKwpNf2SavGgGHtMEAl3ath3frzsZBpQfYM+OFPChiuVoqqCcHftaIPY1oKphjxy7Xo6bbGt7cGODl+RTrjdj2hgSe8LY5aGScax5uAgZ+Jf7cHIjmcIURz+7EyieTpJpLmPgnHdEVhrKkDYNPNGy+T+4XPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836366; c=relaxed/simple;
	bh=V2N96sQErKbtUp0KcJAK4KWJX5TxdrLO1CRaaZhwIi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCGEsiY1ytmFoaZQfgB8dIAQiKxA97UyJdMEXeQtvVk6tszq5W9NqygKu6y4YhTgSNxJwKdWPf8QGFiuoPoFWKD3lj/DmcTLT42bBAZh35UrV7Exc2BsTfE15JRT1BbChAHRDv7AFElQ3fNAzj1hLHARstzjdA19iPOg/Dyjj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bp88J+lh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jBVZJHTz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ypAxO1gK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tO9woAdD; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E282F73698;
	Tue, 30 Jun 2026 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782836363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IwxxOysWKobPD5UlF8mjIU0+j6+KU4KiqW7uzYDC/ek=;
	b=bp88J+lh4Ld94QLb/FgxSc78EMcIhQAsR8PDfC2OkzpEPkYI12ZSgnttOpJkZGY73S0x/Y
	+7bgS2BZHogPBH5J1FJpmwzYjtavfVf6uelEie7YrbKOXGK3LSeBHpJY5h07tuDudJDiWu
	jh98BikBWca7bsCsXuf3A7wH5JsyjM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782836363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IwxxOysWKobPD5UlF8mjIU0+j6+KU4KiqW7uzYDC/ek=;
	b=jBVZJHTzVzoE0M2g+PcL1BZzDdNmv+XSGT2v6Wu9el0LCF815lqezYdA5vJfGmUyjSnQid
	W06sQywmqiDF22Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782836362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IwxxOysWKobPD5UlF8mjIU0+j6+KU4KiqW7uzYDC/ek=;
	b=ypAxO1gKMdIHQ8+ywHHuDwYNcjoy9rSDILpeGDU1FomJu6ky3ZQGryK4UvLVW1g9pfP1Au
	L/5zy9jUtBQg1Dfz9gtdqXOt+qSlZgJ3kOyrpuB2VvuSo+Vcxb8rewchUhOO4ShufwgYYo
	7+BE+yEMVAdC5umL8fl/GyJn6nE+y48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782836362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IwxxOysWKobPD5UlF8mjIU0+j6+KU4KiqW7uzYDC/ek=;
	b=tO9woAdDVgqM8KEyW+ULw4DreASg4B0YhphL0oz7tBKd3s5SUtC4zeWGlkFFQsRsvp058J
	YqK5R1Lt3StFr7Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 539FA779A8;
	Tue, 30 Jun 2026 16:19:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pVf+EIbsQ2rzbQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 30 Jun 2026 16:19:18 +0000
Date: Tue, 30 Jun 2026 17:19:16 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Lucas Stach <l.stach@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, kvm@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, damon@lists.linux.dev, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 06/30] mm/rmap: parameterise vma_interval_tree_*() by
 address_space
Message-ID: <akPsGrmaOd3JMlC2@pedro-suse.lan>
References: <cover.1782735110.git.ljs@kernel.org>
 <43050b10b53cdfc3627440e6b14ae2a9730b2a5c.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43050b10b53cdfc3627440e6b14ae2a9730b2a5c.1782735110.git.ljs@kernel.org>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TAGGED_FROM(0.00)[bounces-115507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C622F6E6687

On Mon, Jun 29, 2026 at 01:23:17PM +0100, Lorenzo Stoakes wrote:
> The file-backed mapping interval tree functions vma_interval_tree_*()
> accept a raw rb_root_cached pointer to determine the tree in which they are
> operating.
> 
> However, in each case, this is always associated with an address_space data
> type.
> 
> So simply pass a pointer to that instead to simplify the code, and more
> clearly differentiate between these operations and those concerning
> anonymous mappings.
> 
> While we're here, make the generated interval tree functions static as they
> do not need to be used externally (any previously existing external users
> have now been removed).
> 
> We also rename VMA parameters from 'node' to 'vma' as calling this a node
> is simply confusing, update the input index types to pgoff_t since they
> reference page offsets and rename the parameters to pgoff_start and
> pgoff_last.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

1) This is fantastic
2) I need to rebase my local work :)

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro

