Return-Path: <linux-arm-msm+bounces-115836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SlcMb0JRmqUIAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:48:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049F6F3E73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="RJ3h/KPe";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69940301FFC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E563838E8B4;
	Thu,  2 Jul 2026 06:46:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D025E38E5FF;
	Thu,  2 Jul 2026 06:46:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974783; cv=none; b=mmxSgKQ7c4/UDTUY/LAoPXkeMoxaa6FzbC9NFIUGefxHiXKYdRDnQ657U1QNXB6ztHcyQPnN2Cj9l+de0BMSq5VA0vgXQHMnIBZLdnVXmLqRolvv6Tzwq3N7U8rNuTwnnN3ptdG9jtHxCdFzuyCUKe1dZbIKBeD+q81759YkMgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974783; c=relaxed/simple;
	bh=Ksx5JsEelRXaz7v2nCwiUP0K/C234Y0sMeDvSbokESw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BO4axZ3ZnhFiuUVKKTh+/gGjG6oVlVCv4bJOt6ap1JIgnRbsKn3gERILFc3/SPFAeQ4ynAUThH5g50me+X+43lD+CAcI4KCrNYJ86FQiPp2bVkTOiBspvM+MhdCBcRp1BjLEjvbGW82ezZK7fd2AdA98ebor4vpUKhQgefVh70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ3h/KPe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856DE1F000E9;
	Thu,  2 Jul 2026 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782974782;
	bh=AD8tasXyN/lhxwoWmvOAqfCV0TTermi5k/ZYYd4C0Og=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RJ3h/KPe9Ckf3zjaojadowu7ZZWn7KYNjLvHZePNlZZxzQdxndvZJLHX7PcH6vK9D
	 k5mL8KaqFhKqGxlzUMbmqj1fELpv3HAiUoVShP5BubHrtyLGYd2HI7CrQJgz1Vz7Y0
	 SSxrBaBFrhdrno6avLqnaUOPSieiFaUl1oAVdoF6FRT4q3bCZSYpUQzuUJt7PaYRGT
	 JkxlFXAOco5A6ahqlUVC0ZmzbgqAHm5ldIaP//sUjxzepiKKhI7BgvCj8ItO/m60xj
	 JoYLPA74Ne4aBudLHUwp7qbQ4EeEApqi45kcYmysn3d+km9NpiIq8FiOSwjFiV+MCZ
	 hO+Zlgs5TrqUg==
Message-ID: <51bad771-aa21-4394-8243-2fa7f275cb36@kernel.org>
Date: Thu, 2 Jul 2026 07:46:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Jianping Li <jianping.li@oss.qualcomm.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abelvesa@kernel.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, stable@kernel.org
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
 <20260609025938.457-4-jianping.li@oss.qualcomm.com>
 <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
 <a79182b2-2582-4c77-a859-b4d013b700f3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <a79182b2-2582-4c77-a859-b4d013b700f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:jianping.li@oss.qualcomm.com,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-115836-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7049F6F3E73



On 7/2/26 5:02 AM, Ekansh Gupta wrote:
>>> @@ -1409,8 +1395,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>  	args[1].length = inbuf.namelen;
>>>  	args[1].fd = -1;
>>>  
>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>> +	spin_lock_irqsave(&cctx->lock, flags);
>>> +	if (!cctx->audio_init_mem) {
>>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>>> +		pages[0].size = cctx->remote_heap->size;
>>> +		cctx->audio_init_mem = true;
>>> +		inbuf.pageslen = 1;
>>> +	} else {
>>> +		pages[0].addr = 0;
>>> +		pages[0].size = 0;
>> What is the expected behavoiur in this case?
> Audio daemon is expected to take the memory information to DSP audio PD
> only the first time it goes and attaches there.
> 
> This is the case where daemon was killed but audio PD session is still
> running. In such cases, daemon is not expected to take any memory
> information to audio PD as the earlier shared information is already
> there with audio PD which it is using irrespective of daemon state.>
Wow, this behavior is not documented or pl consider adding a comment
here, Can we not query the dsp before creating new audiopd service?


Does it make sense to attach instead of creating?

--srini

>>> +	}
>>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>>  
>>>  	args[2].ptr = (u64)(uintptr_t) pages;
>>>  	args[2].length = sizeof(*pages);


