Return-Path: <linux-arm-msm+bounces-111401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJH5Cxi3ImpZcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F6647D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MtMXf4CU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111401-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111401-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EE3630156C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1494C043E;
	Fri,  5 Jun 2026 11:43:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA91F4176;
	Fri,  5 Jun 2026 11:43:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659809; cv=none; b=eISnQOcDIV1hIyHC/W5PTlj1EqmtXP6DlyFQT1FleVL+JfZl7lSRcPoVpYJVemU5jVamSMM9GZflmue5jyKK67hHz53X9VqYBbz6BEWqViCM0jmYg2wArUjh5FyswTzL8R+b0OQgRjj4RHZZJWX2SLgJ/zRX+Ddh3vIciOPdNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659809; c=relaxed/simple;
	bh=i0mhKma21T2991JozZ2ARY/gtfvlYLT4oMURRO3m5mk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uOGarU2opK3mZALe8dBe+LECcBp3qo0UIF/K3v08HE2vcJfg42H6JemoAgI1cUZTOLqncF57YmXvkQUnUrTjTD7sDzqstYnylXpZ7i06ZtPpVMtUM6uw3QymYCfimXYQJadikHzX7FAqVjF4MDzwXg4OyJ6QeYZWszN24zX1yUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtMXf4CU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BFD1F00893;
	Fri,  5 Jun 2026 11:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780659808;
	bh=Xyo2qoc32j4HmFbtK1fyQoxrG9EtNWQhwmPAQKd1g78=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=MtMXf4CUwE2SQfzoh1dJNllytF+jbiGTAlsX1YXQGEvnbquJn5GzzQS3rR3vYLRIK
	 9Z3ozz6vW1025gen1TexWgDdVT9BVDFDcQb9eiiwnVaSDqbXg758t1/zFWvhO834nJ
	 yVWF9hEUwHcgLboLmtpSX6y5rvX0vF3vqJ9LKIKeu+4H267AMfGejzbRsVFT7wg4Z5
	 xYl6A1gnmPTJ1vISPtjRpf+sVH4/PpeARYyz2htxV4NCW7qVrMOOvRNZota6DuhS8w
	 Hwr2WDeFWTLLROKrnvxkbzQYhhhvHBuw+U0UFlw7hO1hTbFqM7P9nV5NX97U66HUzZ
	 lINK4KeP0Xu3w==
Message-ID: <371781e9-6c5f-486f-a0ca-ef6e59b91a1e@kernel.org>
Date: Fri, 5 Jun 2026 12:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2 01/10] soundwire: Always wait for initialisation of
 unattached devices
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
 srini@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
 <20260605084810.1575539-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260605084810.1575539-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111401-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F5F6647D80

some minor typos in commit msg.

On 6/5/26 9:48 AM, Charles Keepax wrote:
> Currently in sdw_slave_wait_for_init() the waiting can be skipped
> if unattach_request is not set. Doing so was added in [1] likely
> because the core used to do a complete() on the completion so
> waiting in the case an unattach hadn't actually happened would
> block for the full timeout. However patch [2] updated the core to
> use complete_all() which means that the wait_for_completion() will
> now simply return if the device is already attached skipping the
> completion doesn't add much.
> 
> Additionally, unatttach_request is only set if the host initiates

 s/unatttach/unattach

> a bus reset. However, the host doing a bus reset is not the only
> reason a device may be unattached from the bus. Other options
> could include the driver probing before the device enumerates, a
> sync-loss, or the device itself powering down.
> 
> Removing the skip using unattached_request, doesn't cost much in
> terms of efficiency and allows the sdw_slave_wiat_for_init() helper
s/wiat/wait

> to be used outside of runtime resume.
> 
> [1] b2bd75f806c4 ("soundwire: sdw_slave: track unattach_request to handle all init sequences")
> [2] c40d6b3249b1 ("soundwire: fix enumeration completion")
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No change since v1.
> 
>  drivers/soundwire/bus.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index ea3a24f805c00..b7bdf19ebb42e 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1386,9 +1386,6 @@ int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
>  {
>  	unsigned long time;
>  
> -	if (!slave->unattach_request)
> -		return 0;
> -
>  	time = wait_for_completion_timeout(&slave->initialization_complete,
>  					   msecs_to_jiffies(timeout_ms));
>  	if (!time) {


