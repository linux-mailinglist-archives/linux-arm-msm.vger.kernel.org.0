Return-Path: <linux-arm-msm+bounces-103446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sUokNT/+4GkQoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:20:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1A4108C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0520230CE131
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABFD3E2760;
	Thu, 16 Apr 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="lEv7agIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979393A0B2B;
	Thu, 16 Apr 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352634; cv=pass; b=g149Jd5yMRgvihS/vSHGF3lx9CHzRZmVzZSTPEncw3kUGEmdKf6Qi/yxOFxgSewrXj+1NULqyZF1XTIxU5ZyLIGS+O3YX3ihlvEnbRKgdqreAmyTGsllJKaclkoQYKLpf7/ZWZnLGF41AdfytFl5SObEuhwopRDNak2m/SKgRs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352634; c=relaxed/simple;
	bh=k5MUKGOVrCVrBWwmnXvVxw9XxdH4Lvc7kPSIVFfh5KY=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=gJ/7PUphhflRlDS3VvXWolNrZTZLyz1Hxnb/KlM69tFZmLcofNxLki/c74wwqsoJV0WR5q8Tg9HG0oWSdRoXw4PgqVSPfboangTC+QOnx4tuaGxqiWKoiFwH02DDV8aSlqqSxEJr5Er3OcARlgg2zv1mNQBr9NraYu5NGljfmlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=lEv7agIW; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 11E3B62972;
	Thu, 16 Apr 2026 14:18:18 +0000 (UTC)
Received: from fr-int-smtpout11.hostinger.io (100-104-232-135.trex-nlb.outbound.svc.cluster.local [100.104.232.135])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 65E1562156;
	Thu, 16 Apr 2026 14:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776349097;
	b=KkrIPuYuIa1s626KFZrMp4kd+TG40trShL9RHkBCAyCCFCvSCyvDSddm0yyP+xylp1YkCT
	vJVp0bde4utCUhFfLbzB9c5kPoFNfIWPcooGb7RCbURlujStBoeSv8o5wbg96FzfoDHHxj
	wfEjJr02KIOdWcBPJN1Pn/Xc3bFGN01ZMfillqrhxFNotezXeKm63AiukhqIVKo7AabdpS
	Mdd/NgO1poTRBYZ1lAv/06ryg+q9t3aZ7KfIox+ECjtK66H1iGJ3u9rwm1ulDgmR4HcZVx
	QueAX5e5iDqoFyNEP3/Uh37fqw3qau09JLMVQSXoOdogaiCyjU+ajqmb2G0BXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776349097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Hn6SBBKIBqaGEQumTEmlP67MmqncRnqILDOCk7wtFDs=;
	b=3FD/HUIHpOhQpipCg/YCIwraGX409AcFy0DQMsPNpRo5Jui8Os9LwEMliX6maPCJksspRV
	wuecWR2CHA+WUYQuDaPcQySHiVmLXcnlWg16bnGNDzSF1EZCBt2bD7FnnaISdIksZJ3bzf
	yLkHX24Ik4Dg9aoCQxzQ1KxB75j5TK17wfg01W25BluPlPcPEVkBhzCt458iLkrMY+Ru7i
	j32hdqXyg6uD4/xLSgm6yPKaliesHsgMGSKe+bQ4RJEu7efvj2WVRZvgPMPEpJDxSPLnk7
	NDDePxyNGtDkL8rH/EWEpZ1n68wiYf1Z4GomVAIs8SeiVVwLuUp/+ivWDG13jg==
ARC-Authentication-Results: i=1;
	rspamd-6c65dd77f-lfrr8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Soft-Squirrel: 4a053fd44af3bbf4_1776349097333_988753514
X-MC-Loop-Signature: 1776349097333:2263129882
X-MC-Ingress-Time: 1776349097333
Received: from fr-int-smtpout11.hostinger.io (fr-int-smtpout11.hostinger.io
 [148.222.54.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.232.135 (trex/7.1.5);
	Thu, 16 Apr 2026 14:18:17 +0000
Received: from [IPV6:2001:448a:c020:bc7:ac88:b14e:d67a:9dbd] (unknown [IPv6:2001:448a:c020:bc7:ac88:b14e:d67a:9dbd])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fxKqP3jdgzyZq;
	Thu, 16 Apr 2026 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776349092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hn6SBBKIBqaGEQumTEmlP67MmqncRnqILDOCk7wtFDs=;
	b=lEv7agIWouzZiTX/q3GviFd5zRkt3hLZEedCn9EgArxYRRzbOmMcCEMvJw0xVP1fn2lrh+
	32TwqbsRJ1q5p1r0gwucg57ZHqd3nRhawTxd8H6c+BYdBg2lvlKf9s62Zq2GJQ6QA2HL48
	tkRIh+qVzRpvnHZaJHH6Hj1ELtF/JMReu90N1lp7tCL6Ck/DcWs3Afeqa0jpXlYeKh6eOR
	ir8hm6HQzjOMDPDI497y1HFwdIhnBE/uGbG+HGaAZzGYRf7u4MyjpD72Zk3I3wbjgwFSOs
	El4s9gliFLNOqaGHADFF7n96uLNrcG4txqfvbnSVTih1h1GCVmtNXsqhlLWVrg==
Message-ID: <92c8ad93-8e7f-4714-91ea-ebdfa31a4ac0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
 <20260414-frisky-aloof-koala-4cbfdb@quoll>
 <b80727eb-6a7a-44fc-b6a2-56c4ee199b57@smankusors.com>
 <bac33524-1caa-4bff-be36-df909917cf3b@kernel.org>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <bac33524-1caa-4bff-be36-df909917cf3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Apr 2026 14:18:09 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69e0efa4 a=qlZgJvs7r4/QxD5CpBykdQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=nC9N5ERdtgYCITw5gnEA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfIJNXRkwk6UfT2R1d4BLhZd8iSaOBTVF8KQ1LY2UKWlxoF4S1yfNAIk0bCspaFT+wBZCapQ9ThGLYZgIg6WrmM0e0VdU2JG4LL4Lg8n7ghFuNdXqsabh lTBBeIl8Kf23ush2n294cAyp3dkDsKx/NjVjWL03b/paRb/REC1DubGf65J7UdRxw1F+9yMuQmEfn7WaskcUBQpy7GatV1w+4Vvq+rJC/aPF+ZCCc/ylkjgJ ykHjFCTpZOMoVKrR6KDILzLMfEJfSVWtjQpXhGxBlfqi88MqyeO8hsR0G3B9jlDZb+g2TdE7HEuDThahTrGKqJG7m7GGAKy5IgKI/NpnFvtL2PVRUjcwYEH2 aSCMo7cK14lVXCoDDkEszO2eUISDf0h4RlJt2SP55dFzve8AzpDF5n31Uz08qICfzSonG0vGFFA+A+6wL2k7aWgFMJd1j/WhH1qLaLiqYQn1HJmSfX3A3Til 04zcUAGg5I0JGNsb9iq++dcYBvq7fb/M8aOkswTPs5eMmgBQcgUgk2UJ20hwE6hEUgdSAfpCIzCO8s2xb2Q+54bGksxMvF8VjXalPkhiAO8PJumsBreLZ/5c IUbpOuEPj/vj5Iv44u7k5GdQe5BZDXfOkC+3Z7CZB1Zz8H9lcXITkVU9S6jh1d0nUYrYMdWGrfZogYPp+C+YRUt7t8VPhbzyL8Y38l6B8JRjKgH2t+e1gnrw UI+5UXfhCgOP/UfTNgqfyO9r7gMS7lVm5CUISqaBjhEVoHtSfWGrOw==
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103446-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3C1A4108C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/2026 1:51 PM, Krzysztof Kozlowski wrote:
> On 14/04/2026 20:34, Antony Kurniawan Soemardi wrote:
>> On 4/14/2026 2:19 PM, Krzysztof Kozlowski wrote:
>>> This was also sent. Where is the changelog and versioning? What changed
>>> here?
>> Sorry, the cover letter should have referenced the earlier dt-bindings
>> series [1] and explained about it.
>>
>> In this patch series, I combined the original 2 patches into a larger 10
>> patch series to make it more complete. Especially since earlier feedback
>> noted that the bindings were not used by any in-tree consumers. Since
>> the scope changed significantly from the original, I resent it as a new
>> series rather than a v2.
>>
>> Would you prefer splitting this series into separate series like before,
>> for example:
> 
> No, you need to keep versioning, changelogs and make clear how previous
> comments got resolved.

I see, thanks for the clarification.

To confirm my understanding, since this series already went out without
proper versioning, the next resend should be labeled v3, with a
changelog covering both what changed from the original dt-bindings
series (v1) and from this series (v2).

Is that correct?

-- 
Thanks,
Antony K. S.

