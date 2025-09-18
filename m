Return-Path: <linux-arm-msm+bounces-74103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D4B8670B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 20:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C157F1C25388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 18:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3912D3A6A;
	Thu, 18 Sep 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O9EVDpf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B71643B;
	Thu, 18 Sep 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221011; cv=none; b=V2lpnQ7pZ2YJ6aZYzE2p48494Urtcoocy0fRqoAPTnZX2IvMzN+sQngTIfWzNeYj3k17F621raY7dFU7EO5R7nqJwv1AmZ38DP1INnQi0BzuyeJBAa/ZSKxSpRQRNKH91Sy1cPvr3citZSc1Za++qm84KDSB0AIZU/VVYqm1usU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221011; c=relaxed/simple;
	bh=lOi4oPKaTPDoudyEXtbkS6QEa07mzTiiZ91A7/9u70E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhpKb2c7Nw2G19Ov2pBdS9/rB4ga6jjKK9ePJDt/bLmSxXHQBH/vs1ZDGDg+8c52qE6+Vw/FEGZ6zzgxzm8SOAc31NFQj9l6WiZFAGJIWWGJeNty8208xk93Oy/aP9Y5DscqY+9GgRYj1Bskw+LEpUUg+ea5pVtGDqyaCsjS6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O9EVDpf5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=liLJhgZknOFrb3ADlwKcsc/J07rUAwg/dZtDpx06Vic=; b=O9EVDpf5g7zgd/J126cLkxpokq
	67CZ2pUYtUpJvmRk+WYzJi4DRPy27TOexm3lqamKDUh9IAlUGC03Lo2+0dFCanLLcxE4Mq1PqYmfD
	zsG861c8Yr5xX5D52wzOhnO9imrDSEtHEzBeBr7ShxCDXCN7KUWzGlLz5OtEM/SgQI+7R701O6suA
	cqJ61q2nppVq1TNR9wmWEcUpWFM/p7f1YIhX+ZAp278XRRDKeWyKepe8MLKNd1KkIFXmrisE/qJNF
	AeU2q6OwccURPflquwzeQOYrJnhz8Z3QCRMH4kKvxK1qifV6WvifJnGULJgOXEDIPW+XnTMdlRxk4
	KPFtZ1jw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJbK-00000000t2F-3Pb9;
	Thu, 18 Sep 2025 18:43:26 +0000
Message-ID: <be6e146b-3429-4264-bf04-2ea15957f010@infradead.org>
Date: Thu, 18 Sep 2025 11:43:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, andersson@kernel.org, pmladek@suse.com, corbet@lwn.net,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
 <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com> <87jz1w88zq.ffs@tglx>
 <c3ab4a21-183f-495a-b3b5-cc74b392eebc@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c3ab4a21-183f-495a-b3b5-cc74b392eebc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/25 6:53 AM, Eugen Hristev wrote:
> 
> 
> So, one direction to follow from this discussion is to have the
> inspection entry and inspection table for all these entries.
> Now, one burning question open for debate, is, should this reside into mm ?
> mm/inspect.h would have to define the inspection entry struct, and some
> macros to help everyone add an inspection entry.
> E.g. INSPECTION_ENTRY(my ptr, my size);
> and this would be used all over the kernel wherever folks want to
> register something.
> Now the second part is, where to keep all the inspection drivers ?
> Would it make sense to have mm/inspection/inspection_helpers.h which
> would keep the table start/end, some macros to traverse the tables, and
> this would be included by the inspection drivers.
> inspection drivers would then probe via any mechanism, and tap into the
> inspection table.

Surely someone wants to inspect more than mm/ variables.
I prefer kernel/inspect/ etc.

> I am thinking that my model with a single backend can be enhanced by
> allowing any inspection driver to access it. And further on, each
> inspection driver would register a notifier to be called when an entry
> is being created or not. This would mean N possible drivers connected to
> the table at the same time. ( if that would make sense...)
> Would it make sense for pstore to have an inspection driver that would
> be connected here to get different kinds of stuff ?
> Would it make sense to have some debugfs driver that would just expose
> to user space different regions ? Perhaps something similar with
> /proc/kcore but not the whole kernel memory rather only the exposed
> inspection entries.
> Now, for the dynamic memory, e.g. memblock_alloc and friends ,
> would it be interesting to have a flag e.g. MEMBLOCK_INSPECT, that would
> be used when calling it, and in the background, this would request an
> inspection_entry being created ? Or it makes more sense to call some
> function like inspect_register as a different call directly at the
> allocation point ?
> 
> Feel free to throw your opinion at each of the above.
> Thanks for helping out !

In general I like the way that this is going.
Thanks to all of you for this discussion.

-- 
~Randy


