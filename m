Return-Path: <linux-arm-msm+bounces-119065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +cT4BIVeVmrX4AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F82756CCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:06:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=PTY6zM2l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119065-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119065-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D32D30A9EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C2D4A139F;
	Tue, 14 Jul 2026 16:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112114A3406;
	Tue, 14 Jul 2026 16:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044976; cv=none; b=AzLpTQjEqgOxmOSmOovidAorPnrydP6noTOa/DNOBlpJ70hqqP211aUjSPWY7vIZEVE4mRFQsVzNfqSUm4v6Zgg91a3n0VGepz0KAaZSyAdnCHwJfJaRC48x/uSbXf/sa9Q6hKN6q4MT1m2ZPqCu7FKajhmUq0yyvLW9hIDSqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044976; c=relaxed/simple;
	bh=RPQzbFp42095DqTzHnLdLEMCluqFcqhtfKiJYRSTEG4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q07mPITMV0b2mlcfpWwZ0n0yN4H9vNXRv1g99pAsLAf7oWvVAyAfACM6NdFDBErpEKl1hBKnDEeXOe0YRF62nAij9Jgl95xYYyo3wYjTZ2jQtzg3QIAjLBGupTkHlhKWwFCTPLR9RkcJK4A4NNERNYfZwJ1SbkEdbvuRUZDASok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PTY6zM2l; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7nN5GbMz2pX/C2hqinG3iHem3CBL/RHh2Lj+bj6Coew=; b=PTY6zM2li9KkBPMrSYiKyWNbWj
	kvAsWzD0rektMS0X5iCsA0g/X26qkFG6ZAlgaZlbDNDbrYsFaNiUW7f8Wmthu2UvQYNnTAPeOXw+L
	CxeUxqISVuHLANcdeRIdJY/mEiq4AvIJZBAdXGomw0/LmDS+R3CcRJ0mo1t6WJ6OSPqs/7NWAZ2eI
	YwtssM+36WqlioZv+yRv9ha94b3zkktdjbcaCB8x+selLQx8Rh4JvJ1ZuGbbBqOedx+gDpb4/4Q/W
	sIASCrpibEAl08bmqyBusPFhiF/uSJb40XbSErP4ZvoDBs796dKCnLGS4/W1B/E2alO5iuQxz2wi+
	uVsjLdMw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfar-0000000CcJ4-1tsW;
	Tue, 14 Jul 2026 16:02:49 +0000
Message-ID: <4bafe3da-893a-4888-8194-b588ac899cec@infradead.org>
Date: Tue, 14 Jul 2026 09:02:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc
 format
From: Randy Dunlap <rdunlap@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-2-rdunlap@infradead.org>
 <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
 <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Content-Language: en-US
In-Reply-To: <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119065-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79F82756CCB



On 7/14/26 8:57 AM, Randy Dunlap wrote:
> 
> 
> On 7/14/26 3:20 AM, Mark Brown wrote:
>> On Mon, Jul 13, 2026 at 06:44:32PM -0700, Randy Dunlap wrote:
>>> Don't use "/**" for a non-kernel-doc comment.
>>> Use kernel-doc notation to document the parameters and return value of
>>> ntpfw_load().
>>
>> As mentioned in submitting-patches.rst when submitting a patch series
>> you should supply a cover letter for that patch series which describes
>> the overall content of the series.  This helps people understand what
>> they are looking at and how things fit together.
> 
> Are you saying that my cover letter was insufficient?
> 
> https://lore.kernel.org/all/20260714014445.569992-1-rdunlap@infradead.org/
> 

Ah, somehow I missing sending that one directly to you. My bad.

Should I resend the series?

thanks.

-- 
~Randy


