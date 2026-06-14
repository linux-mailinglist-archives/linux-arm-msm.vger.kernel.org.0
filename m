Return-Path: <linux-arm-msm+bounces-113058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udY1A/gfL2o28AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:41:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72571682552
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:41:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ALgDrykr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 936C33009987
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBD5335064;
	Sun, 14 Jun 2026 21:40:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952230FC1E;
	Sun, 14 Jun 2026 21:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473247; cv=none; b=s4yLpNF8ecNnWlNkuiqRZWJJLHB+hwjA/lJY42ZAcV/unBs0N44aGpApRoa7jEL/gZkTkuhyC4AIAOKpA6dYrDnc0lmCXorXznHtjV6sHTI8vjI6g4hUBQBSKZ2kd2rOl4Vmhb+M0+ZypWgrpZmDYBqwKpPr038whO20jXpjSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473247; c=relaxed/simple;
	bh=tvIcH2A9NF4qn/ga+xBMPVhNFL6vZEZk/PxESwI2D6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jS9GotGDWxQdanJWJwcq6cAauwTph6av/eyUMtTzYI8PdFixQK0O7CVbBhvE7br2rXu/Cl8Y3GHyQV0rHh/xXyNL4ur/waNI+uFW+47T0KH7c/eZVCD+UlnEYiBrspyITLx4tCzOFo7VtK1L4egPxs2a8DPZMzSa5fThLVhRyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALgDrykr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCC11F000E9;
	Sun, 14 Jun 2026 21:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781473246;
	bh=qzBH7NVcopbzROtGgwuOfSe/kTlf5R/yQno8F4Ez4VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ALgDrykroPehKgsdlhvuLWObZanRS00mfmyRTKL4l1U2noYXn+P5jeMnuaixRkXLx
	 wW09XEb+oVnDfDVLXrWRBlXST4bMGSOcYA+OysUJSJCl4wvH1ZLVuQbwgJGqdHel4R
	 VPqJUYE/6FRyh0ZnAvJ44BiZ+T2Iste3ifbLg0y4ZAZSHDzQosZUYm8OJINxs6MnJw
	 bnnkTvL2BVuLfYqgsyoD4hr7F8qXFnPbRlclqzDwiqGU13Y6NIYr3bmGKSFwHTt8xG
	 JqVnJWCSNljGN+VccEceCnKkGCKRSwd270wQNt4Vu30dR8WniS3G8QAcDb1l103wx3
	 agSX+CHxW82gQ==
Message-ID: <7f94caa0-48ba-46f3-922e-f16e39fd22c9@kernel.org>
Date: Sun, 14 Jun 2026 22:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: David Heidelberg <david@ixit.cz>, Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113058-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,codeberg.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72571682552



On 6/14/26 8:26 AM, David Heidelberg wrote:
> On 14/06/2026 01:53, Mark Brown wrote:
>> On Sat, Jun 13, 2026 at 09:55:59PM +0200, David Heidelberg via B4
>> Relay wrote:
>>
>>> Currently this worked only because the cs35l36
>>> codec mapped both DSP_A and DSP_B to the same hardware register value
>>> (asp_fmt = 0), which is inherently DSP_A timing.
>>
>>> The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which
>>> produces DSP_A framing.
>>> The codec format should match what is actually on the wire.
>>
>>> So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.
>>
>> That sounds like both.  The Cirrus driver is definitely buggy if it's
>> mapping DSP A and B to the same register value, at least one of those is
>> wrong.
> 
> I need to clarify. The CS35L36 supports by default only DSP_A, but when
> extended to "take DSP_B", speaker just works.
> 
> This was done previously.
> 
> Since there isn't any different configuration on the codec side when
> added DSP_B into same codepath as DSP_A, I would assume QCOM ASoC send
> DSP_A, just marking it as DSP_B ?


		qcom,tdm-sync-mode = <0>;
		qcom,tdm-sync-src = <1>;
sets the short sync with 1 clk delay making it DSP_A.

for DSP_B you would need, no delay.

--srini
> 
> There isn't any other consumer to check against and I would assume
> incorrectly configured TDM slot would lead - at least - to disorted output.
> 
> The reference (which now works) is here [1].
> 
> David
> 
> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/pixel3-audio


