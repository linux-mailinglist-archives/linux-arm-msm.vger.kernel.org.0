Return-Path: <linux-arm-msm+bounces-97883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHJHAz3Qt2n0VgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:41:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D2297310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A4E13008A5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83239388E7B;
	Mon, 16 Mar 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RGW/SC4M";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QGIR75ZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B9C37BE6A;
	Mon, 16 Mar 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653952; cv=none; b=Hdb3NKt3sA05QAf/p2J+Itigtf7+8SWt7P0tipfb/sgSciONbQCWCxaJF206NIQiwazC3hLqDMfZVQpc70CS7z2IAnpSA7UXRBGnO2fOBSysuDHTFiqViKI3WuWuVdDoqivsMSsIv3GlX5fYkz5CDtYMcYmyuB2Eu9F3HHf9+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653952; c=relaxed/simple;
	bh=OL6AhR5XAWCLAFO1ZFhQa7oUctDayRZhVu71HIg1Otc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JSQtd6iFiZEeZ+un0FFngYtGqDzks6TKA1WgUHVUuiiqjwXwX2nE5MerBdP3ijIrx9ZavL8ySXJQbJpcM15mZBEMSDqBc2vYlGT1Qy9A7jUXBjvp0GEdyrgQzQmXT59Xe48Br2Ecue2XsdDQCqISgKllVNmj9wPZLTN0SZWnP80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RGW/SC4M; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QGIR75ZP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773653948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yXXr7UYzVmKZqbUDqTRxeSr99PDOjbUs7jkHvsTHQc=;
	b=RGW/SC4MMA/M4YgLuQp6J+nCgqUPKuzJkjfow4kMcP+Ja54NkGd+Iqxcg0INU5BTQJaqbd
	zWuxfRRBwiYqp1zn+ygW2r9mucciJZQfAESPJPEVNCw0VFTSF2q5jqNKXze15EE/2LUqgs
	7tBkXd3YwUwloSiTyIIjO2b3BZA4XAkvszc02Wytj120zLFKlqdZ3lc4ozLwb0uXovN+hS
	zpPZPoCg+QW3Ip+nzLaHWLmdk+psjF1q/GdABgeoje1reSUDEUlS94ig22Rd/SWyObLkBQ
	UVGOB0uvxkkbuO6RBzCm7k94ZLRQqqdVogqowh+uurx+9xqS/e59L4ZyOvGVDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773653948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yXXr7UYzVmKZqbUDqTRxeSr99PDOjbUs7jkHvsTHQc=;
	b=QGIR75ZP1H0QscPuRjVvpUiSFT4GWZluKBzuY8RFXIJ9I/8MYYYcOktCRI31IQE1Zl+P0h
	QgSBF55PD4+EkVCw==
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Eugen Hristev
 <eugen.hristev@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Dennis Zhou
 <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas
 Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, Brendan
 Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi
 Yan <ziy@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song
 <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Petr Mladek
 <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 20/25] printk: Register information into meminspect
In-Reply-To: <20260311-minidump-v2-v2-20-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-20-f91cedc6f99e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:06 +0106
Message-ID: <87pl54f70l.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97883-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jogness.linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,qualcomm.com:email,linaro.org:email,suse.com:email]
X-Rspamd-Queue-Id: A11D2297310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-11, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> Annotate vital static, dynamic information into meminspect for debugging
>
> Static:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - printk_rb_static
>  - printk_rb_dynamic

FYI: vmcore also exports the symbol "clear_seq". It is not required if
you are interested in reading _everything_ in the buffer. But it may be
interesting if you want to mirror vmcore tool features.

> Dynamic:
>  - new_descs
>  - new_infos
>  - new_log_buf
>
> meminspect uses a different API to annotate variables for inspection,
> and information about these variables is stored in the inspection table.
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

