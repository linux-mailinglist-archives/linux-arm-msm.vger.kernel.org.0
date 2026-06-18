Return-Path: <linux-arm-msm+bounces-113718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RK1TCDvEM2roFwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:11:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358069F253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:11:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oXhOQ4Fj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFD6304C2DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B5319851;
	Thu, 18 Jun 2026 10:06:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982A3A16AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:06:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777173; cv=none; b=RO5vaIdg834Q9JI7fNBvH9TcGPcGoOWsJDtghRauWUsskr15Ry0YKRCRBj5X87kRqU6eBzsixCSXe92juTarzK7qqNqP6mtBbEUQ84O8BDq/C43P9ywsDA4YGHK73DeUr64N4x7iHdCXAYbd4aoFdkplS3h/FtOwcwtWoYKu9Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777173; c=relaxed/simple;
	bh=TitDFJ22rWTu69eIL7namB++1FBWVFkpWQbRoRpbMQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vtfr/PIHH5WelhHFri8LtoQ61NtkAU4XnPAOAV67NoxA+EF2WKOClhgm4Y0JvFSy/0fkRLvoDs/HClZ7+7qF4AbZO+jY1rZWalL02t4HvQop6zsDa6GueVLMCVX/RPLSiMVA2hrOGAMIMME+Nm1ANGvOMCQs27hBxQpfAH6WcNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXhOQ4Fj; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad53c8d4dfso167153e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781777171; x=1782381971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ic2yPlu9WxxvvZRxBvrLjmMOjFkWCzZQ9ebOBQNrJ8=;
        b=oXhOQ4FjZSfjDsuJTMRzE4drYOiraqWt0fpy+F6BxUWd9BwmvBZDEbh0nHZVKJORAR
         y+tZH0lsBsNWG3dl80PBzbjAqgGdFrUT3uEWNbN/uinanAYfSAtFKVc/Z2+Qa5HonamH
         yEn/EEYewMNzdjT6uKThPP37snDLGGIJ0ccrs9idlw3QJI7XKYo5nU+u7HG/buQWUPt0
         A1yHFh893DnxkgeZuAn3z1dTqlwFsaH/c6kxxZ0RRjJUQvcnIHFs0DM+jykx0Jr3B39k
         ssQ5Ji16Z1URfskG8qYJJAipfqEqsa/IZfFffypZKO7obH/pVcr+e0KelyxYnDlb8hwI
         gdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777171; x=1782381971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ic2yPlu9WxxvvZRxBvrLjmMOjFkWCzZQ9ebOBQNrJ8=;
        b=tWKzlp2ueedTgK67pUtCbrxmVhOcs4GCXnxeBLN/vrTJCH+mPCwfD47PKDBqpBVo3a
         neLXQk3zzDIYrw3VgY8bdYzAeUyYZgYcpc1akjtNJU8mXsjnSoJtRkGdN0lQlJi2FVgu
         T/+pqzVO0QGY6aldbp1ByHnCUiL/JiHXKRR8iaozoZAwB254vWn0BJwrnmxC2j9KBwvO
         wwNOgn91FR52dgCFkC0QLNwiJxWLrynFGcDJfxavbk0PzEv81yg5SGs16xjNO2Roe6zN
         E4ORvIff0fkKuyx0lk3Ax7KDnkgNqPJOL76zHWloYdN2UNEouTsEhtksJbgfxXK6X27q
         E0FA==
X-Forwarded-Encrypted: i=1; AFNElJ9nDnwFT7MduPYBge6DyOCo/9nVB5v4/sm6koIaetDL+hAZZ4cT6Za121TKpmn4WbwAiNAR1HyaRt3BCJzE@vger.kernel.org
X-Gm-Message-State: AOJu0YzosGYDB5WEnKGoA2sWvpSxyqRFvFsnrgA64nFOQhtT5pXmNwtc
	MYZ2wHfys5HLzaFhbe6gJ7A95uNViR086YvSZ8DQLKXyhUpmapI/WuF0
X-Gm-Gg: AfdE7cmVuuTbzxCfxZlvGE4MrdxVHAWq8khMC+6pedZUhehlCxKuYxeOKd2bVWRZBIy
	ykp4ZrgctTwKGYVWIMQbQnN4uUjoE51kMRBTvOfDHDhL71TfvYIrMzDzaWi27CaXqJX4aHjeUoD
	126dX+C0AjfwJcM5TPE3HKpWBhJXYw4hi+wx+qKPDzbp+SOpSUp10OLs+EIJ/fJt8ge3AYX/rLZ
	V+VSIT9MjWSQx6sbhRUiWD/h9TsiQa0niQS9BsAfg2dzRVKiz6xpcIi2/+eKQXyCccoWeU2d13P
	j9ezNuNq0p9ltn65gWXI37LyYyrQUUGvBNHNO8SeuDZKuyOYdaAuh1DDhJ3aOUP6clyGhkoNdJT
	LsvL8rX1cZtVmYUX6zlO65+vSOhykcRuTKYrc+GEIp03Hwbny6lOnr1LFktbO/C59PvjnXVcQZj
	bI1zyomVM1E9Jln0C4lhPer+vW93Ra0bO9PKSTHA==
X-Received: by 2002:a05:6512:61d8:10b0:5aa:628b:5892 with SMTP id 2adb3069b0e04-5ad4d4577cemr623663e87.5.1781777169449;
        Thu, 18 Jun 2026 03:06:09 -0700 (PDT)
Received: from pc636 (host-95-203-2-134.mobileonline.telia.com. [95.203.2.134])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm5216940e87.63.2026.06.18.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:06:09 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 18 Jun 2026 12:06:06 +0200
To: Matthew Wilcox <willy@infradead.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>,
	Shuah Khan <shuah@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Brendan Jackman <jackmanb@google.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Santosh Shukla <santosh.shukla@amd.com>,
	Wyes Karny <wkarny@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH RFC 00/12] mm/vmalloc: migrate vmap_area indexing from
 rb-tree to maple-tree
Message-ID: <ajPDDkV7yqWlhPIh@pc636>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
 <ai3kkIpaR0aT_6q5@casper.infradead.org>
 <ai_LVreyRWx-RDEd@pc636>
 <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:urezki@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[urezki@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux-foundation.org,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[urezki@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,pc636:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7358069F253

On Tue, Jun 16, 2026 at 07:07:57PM +0100, Matthew Wilcox wrote:
> On Mon, Jun 15, 2026 at 11:52:22AM +0200, Uladzislau Rezki wrote:
> > On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
> > > What I don't understand is why you maintain a separate "free" tree.
> > > It should not be necessary any more, but maybe you tried removing it
> > > already and found a performance problem?
> >
> > We maintain it in order to split several entities. That prevents
> > interfering between allocated data and vmap-free-space manager.
> > So in that case one context can easily access allocated data, for
> > example vread iterator, etc., whereas another can do an allocation.
> > 
> > So by splitting parts i minimize lock-contention.
> 
> Sure, but there are many ways to reduce lock contention.  One is to not
> take locks at all; the maple tree is RCU-safe, so you can read the tree
> holding only the RCU read lock, as long as you obey the RCU rules.
> 
> Specifically:
>  - Write side has to RCU-free the objects that are stored in the tree
>  - Read side has to trylock the objects it finds (and retry the walk
>    if the trylock fails)
>  - Read side can see a mixture of objects if the tree is changed while
>    it is reading, but for any given index in the tree it is guaranteed
>    to see one of the objects which has been referred to by that index.
>    That is, if the write side overwrites an index that referred to
>    object A with object B, the reader will see either object A or B.
>    It will not see NULL and it will not see any other object.
>  - If the write side stores both object C and object D in the tree,
>    the read side may see neither, both, only C or only D.
>
Some thoughts about it.

Having the tree which is RCU safe is good for sure. We can benefit from
at least in the: vmallocinfo scanning/dumping, possibly in the vread_iter()
when access to /proc/kcore and other places(which i need to check carefully).
But this is for read-only traversal.

Switching to gap-based approach requires quite a bit of refactoring and it
should be a full switch without any hybrid schemes or mixes. I expect that
we remove more code then adding because of some parts will become hidden
like lookups/reserving range/erase, etc which is good.

- replacing free_vmap_area to maple-tree gap based approach;
- rewriting pcpu-allocator which lives in the end of vmalloc space;
- refactoring per-cpu allocator which is also part of vmalloc space;
- vread iterator;
- vmalloc dump path;
- vmap_node logic(use gap-reserve to minimize contention);
- and more...

To me such rewrite makes sense if we end up in something structural not
just because maple tree exists. The criteria i would go with are: at least
same performance level, remove more then add, the design stays at least in
same good shape.

There are some drawback i am thinking of. One of them is maple insert path,
mas_store_gfp()? First we need to find an empty area, then set-range and do
mas_store_gfp() that uses gfp flag for its internal allocation. If we are
under spin-lock sleeping is not possible, using NOWAIT or ATOMIC is not a
case thus we should somehow pre-allocate outside the lock and store the range
without any allocation.

The allocator operation:
 - finds an empty range;
 - publishes VA that blocks that range.

those two have to be serialized among other writes. Otherwise two CPUs can use
same empty range and both try to reserve them. If preallocate outside the lock,
the "alloc" side has to validate that a selected range is still empty and only
then store VA to block the range.

I think it is worth to prototype something to see how it would go. I may be
missing something for sure.

Thank you for your input!

--
Uladzislau Rezki

