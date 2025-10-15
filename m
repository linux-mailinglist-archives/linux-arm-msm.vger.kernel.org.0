Return-Path: <linux-arm-msm+bounces-77314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D49BDD082
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4753A1893437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4082B3148DC;
	Wed, 15 Oct 2025 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Yi1lhYnk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XPg/0moG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48162320A3B;
	Wed, 15 Oct 2025 07:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512845; cv=none; b=CXzyRWR898JO2CrFgOLw4j2FipjnYhvN3MdOxjpt5g0uhHuPy9HPzLFjfLASxDDoD47qzw3RNFkrmkE/uOMHjzNQPQjzwr+u/cl/6CYKaiHKB0u9PLTdi89uZ6u2Dw7lQ98PrSpkX9uXX1/X2mOUsvcFnqzG84qRzN35/9US168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512845; c=relaxed/simple;
	bh=Iv/2c9X//uhFKrkBwyFpEPD8LyWcLsCSOdb7T489PaU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cvyQyWAFM1tN64pMX+kkWWlu4085cF/sPKSg4/fLCH4+oBR9csFGCxw7LDQU4hFwoNYmTHNK4KlmvFP3HoxCTuJXlK5dRwYQQUtcqtkEY/7tb2DwC+GChIH/EwptSErjRTzBlFC8n+SjtmHCgnJhSZh6q/QfIEQOooN9dVGiAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Yi1lhYnk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XPg/0moG; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2D97D7A01CB;
	Wed, 15 Oct 2025 03:20:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 03:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760512842;
	 x=1760599242; bh=T4gOLrFNweQSAIwupU0R34Icl/z9uGUaiPDM8SH/jc0=; b=
	Yi1lhYnkwsX27u2WT4dpLUciPfWLdK2bmsuZE29v2XLkDsCBqp5Eezavnm8RQ+xU
	dq6ItZY4QmdpbDDHeNWw+w72M9w/svOczvuf2WINrRhIKwQ7NbH+8RF6HSG/E74W
	3gCW9yW6GLAW4HGgAUfQLC5ut54i/jzSa1iPf+smQHUdjXdtTye7XhmARNpOQ+wj
	Ag3T3guq/Sf1w8h+2SBKdAOHJALk+dGGwFG+kYBDo/yTgwr5UEQHWw7ur4eLCqaK
	2Fz8f7sEVrrQ7A5QlDSawPtJU6M6URWMoxMyXSKYY7vbmWnNmq6y9Cr9iflBT7ST
	bfAROgsQ1Kt00TSGPVHcGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760512842; x=
	1760599242; bh=T4gOLrFNweQSAIwupU0R34Icl/z9uGUaiPDM8SH/jc0=; b=X
	Pg/0moGZy7ws0Wdh0oCsTRu4Lp1t+4rfYmZxAKPzde9L7a/cXYRCu98344cZSKiN
	gnfbCFQC311ocnZa9kExKcFhAQEJImHoCsUGm5v8Dn9Qs9rs/kN/nNvhfzzamWdW
	QXdKiRoM2gniWctdWc6LB8AzNyKqoamfatDV4FVXEwtilQ3r9zadOW8XeT4EekOw
	kRBFJrNbS3fOCp/txqLp5qHuMj64pF1qIWnp3Z3XMsVNZsdESw2pkLmCEJF4r5UN
	tZhrSgUpeWp+hKfNOewwlpkd6zVK1wu0bl74oQA4GMtYZrn9ky5/zDiKCJ+8U48P
	vV+rHAsfZAVd+CrjomkLw==
X-ME-Sender: <xms:SUvvaJQpjn4wU1C1KrGun98TCLLlJ_BtmKwUDWfHjQQp5YuFA-b6Tw>
    <xme:SUvvaNl_4SNh0J2L1bIKAQVPQGxyQBEOqPp6lmw52wHbrfD5cOlnllmfNCUYmILlT
    n-HrpCyzwhhss4v3uYxbKlpk1JewYjAO2B4Pjnppaus1v5swGW3QF5N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrh
    gvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhi
    qdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoh
    eprghiqhhunhdrhihusehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegv
    khgrnhhshhdrghhuphhtrgesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoh
    epjhhinhhghihirdifrghnghesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthht
    ohepkhhumhgrrhhirdhprghllhgrvhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
    gtphhtthhopegrmhgrhhgvshhhsehqthhirdhquhgrlhgtohhmmhdrtghomhdprhgtphht
    thhopehkphgrlhhlrghvihesqhhtihdrqhhurghltghomhhmrdgtohhm
X-ME-Proxy: <xmx:SUvvaK0VtkDmpBQNc5n7_5OkyEiqG4AHwNLjuv3qEREMLwAnPJDczg>
    <xmx:SUvvaGf04ved3UIWu776Uu1O1w8-78YfsYSda6OUQqZ9zqaYiBHhaA>
    <xmx:SUvvaLbXKeRp-Z6QqLKfZJSWNFu0RrnGo9vQvB5kFgmeIcbzis9duw>
    <xmx:SUvvaLXanqlRrq3lJaFrY69Hf5kmrudw5Yc5dQa4cRHuqAYC63VFdw>
    <xmx:SkvvaLnlhSaSJvKKDHyzcUsJxKUiE9YAuq5ZrRr1B78LwPv8M924zhqa>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A85EF700054; Wed, 15 Oct 2025 03:20:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABoQxJ7uBpKc
Date: Wed, 15 Oct 2025 09:20:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kumari Pallavi" <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, "Srinivas Kandagatla" <srini@kernel.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Message-Id: <2e571b41-0006-4a37-9e3b-d333bf5eb7ed@app.fastmail.com>
In-Reply-To: <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 15, 2025, at 06:57, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.
>
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>

Thanks for the update!

>  				&src_perms, &perm, 1);
>  			if (err) {
> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx 
> size 0x%llx err %d\n",
> -						map->phys, map->len, err);
> +				dev_err(map->fl->sctx->dev, "Failed to assign memory dma_addr 
> 0x%llx size 0x%llx err %d\n",
> +						map->dma_addr, map->len, err);
>  				return;

Note that using %llx is not a portable way to print a dma_addr_t,
you should use %pad instead even if your method works on all
arm64 configurations.

%pad requires passing the dma_addr_t variable by reference though.

> @@ -783,10 +783,10 @@ static int fastrpc_map_attach(struct fastrpc_user 
> *fl, int fd,
>  	map->table = table;
> 
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
> -		map->phys = sg_phys(map->table->sgl);
> +		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {

This is technically still wrong, because sg_phys() returns
a phys_addr_t that is only the same as the dma_addr_t value
if there is no iommu or dma offset.

At the minimum, this requires a comment explaining what you
are doing here, and I would add a '(dma_addr_t)' cast as
well.

If possible, use sg_dma_address() instead of sg_phys() for
portability if they produce the same bit value.

> @@ -813,10 +813,10 @@ static int fastrpc_map_attach(struct fastrpc_user 
> *fl, int fd,
>  		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>  		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>  		map->attr = attr;
> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, 
> dst_perms, 2);
> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, 

This one has the reverse problem, as qcom_scm_assign_mem() takes
a phys_addr_t instead of a dma_addr_t, again relying on the
absence of an iommu.

> dst_perms, 2);
>  		if (err) {
> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 
> 0x%llx err %d\n",
> -					map->phys, map->len, err);
> +			dev_err(sess->dev, "Failed to assign memory with dma_addr 0x%llx 
> size 0x%llx err %d\n",
> +					map->dma_addr, map->len, err);
>  			goto map_err;

%pad

>  		}
>  	}
> @@ -1007,7 +1007,7 @@ static int fastrpc_get_args(u32 kernel, struct 
> fastrpc_invoke_ctx *ctx)
>  			struct vm_area_struct *vma = NULL;
> 
>  			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
> -			pages[i].addr = ctx->maps[i]->phys;
> +			pages[i].addr = ctx->maps[i]->dma_addr;
> 

pages[i].addr is declared as

      "u64 addr;               /* physical address */"

I guess the other side of this is the same CPU in a different
exception level instead of an external device, right? This
could also use a clarification.

        Arnd

