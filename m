Return-Path: <linux-arm-msm+bounces-108492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEwBLg9ZDGodfwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:35:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23557EC7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E037F3072192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1CA330D29;
	Tue, 19 May 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VZJ846qK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ED94DB54E;
	Tue, 19 May 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193315; cv=none; b=IdnhaI1mXhk6k3i6kF1dHpM8edIdgtnqaVGwTGaWhizoE785EFzy2y4306NfgD8POPDz2+IPVM9FkAFmTcHqAqDpaUxeaUVBgc0DFI6R1IRrY9whKXysAxDM62aJ3pTqabtEfenKot+AHAG1VUl79GdMh2f10OtZ1Z2RUHKIZeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193315; c=relaxed/simple;
	bh=yEq+2AUx1iOyJ+ggeki2srnGk+8QDGUdyumUhEhu2W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSmgnFh93c5IeTOp7ldAIIcga+519liiJAENlBmiG0/sturkms9hBFXShHWbbB1dTSlgiAKmXIdQmXe66eOxIZw4Y++IOhZhlYtHyI5I7xODaKESmptjh2O85HGGKRkL399Lrh6Nzf4k3aKcBEYS1AmGAwrI0S/lqFYsbDw147w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VZJ846qK; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Pkn43UvNGw6BE5zjZWg8ESNySvNLqNay7t6miFcYPts=;
	b=VZJ846qKlOsYHg/yLUb/3dNMvHg/l6AMwX3W5afN0zcb6T+X8AzIT8Uzux4xuA
	t4M/R5ZfEDpEhmaaYS/QmOz4GZGMbGcQFcD96QI1EEQRRlOWQKJ4uru0xHpoYEde
	MUxt/Cx8o9V9zZvTeqhqTQievT6yp52uUdEcnmbtVo/t4=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHJy+cVQxqHS7ODw--.243S2;
	Tue, 19 May 2026 20:20:47 +0800 (CST)
Message-ID: <941b93d9-2251-4222-8914-73bb7d4e6ac7@163.com>
Date: Tue, 19 May 2026 20:20:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield
 operations
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260430164545.49637-1-18255117159@163.com>
 <agxAvl02rcPoEHaq@willie-the-truck>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <agxAvl02rcPoEHaq@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgDHJy+cVQxqHS7ODw--.243S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UKF1xZr15GF43ZFykAFb_yoWkKFg_Xr
	18Ja1kXr15JFyakr4fCF1fZrnxt39rJFy2v390qay7JasxZFW5JFZ3CF95C3W7Wws2kFy7
	KFZ8ZwsYqFy29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRUGYtUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wAbvmoMVaBgwwAA3+
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108492-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[163.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CC23557EC7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 18:51, Will Deacon wrote:
> On Fri, May 01, 2026 at 12:45:43AM +0800, Hans Zhang wrote:
>> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
>> macro. This improves code readability and adds type/range checking without
>> functional changes.
> 
> Does it _really_ improve the readability? '&=' and '|=' patterns are
> pretty idiomatic C code, if you ask me.
> 
>> FIELD_MODIFY() internally performs the same mask-clear + set operation but
>> eliminates repetitive boilerplate.
>>
>> ---
>> Hi, If the Maintainers think it's not necessary, please ignore it.
> 
> I don't really mind the code either way, so I think I'd prefer to leave
> it as-is unless somebody wants to convince me otherwise...
> 
> Will

Hi Will,

It's not like that. Please take a look at the accepted patch below.



https://lore.kernel.org/linux-pci/20260505165436.GA737933@bhelgaas/

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=42ec65b46a4fc7565d48daa42bf025fdc67800eb

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5fd6f2154734f447e83b6de9a08d16848605191e


Best regards,
Hans



