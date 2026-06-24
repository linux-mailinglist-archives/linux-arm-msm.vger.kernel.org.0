Return-Path: <linux-arm-msm+bounces-114267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CCKPGsE5O2oCTggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:58:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4B6BADA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b=jhhRmfgs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=smankusors.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C12B1308AA9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 01:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9F8277818;
	Wed, 24 Jun 2026 01:57:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272227587D;
	Wed, 24 Jun 2026 01:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782266277; cv=none; b=ouRQrmAQRUb3qQq7V1z5bSQ87F8EQJQg8o4JhbeL32PRZQqMzilJFXu7O3z8Wx9A6U8QH7XzTcf1LKtXmfjfVfMIOLYSh7WS7lViLOrvsyKflOiuDCfTJLBWVNHllylgMFoUIm3z2t8+U5QmxcyyAZNL3odiT7qhFonK0PiZZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782266277; c=relaxed/simple;
	bh=iba7NmPHAdUNsherrWymXiobu0tuKdu/VKZxh56ffCM=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=Zoc3SCyIGgej+u2t6kYW7p0VxscvnAG0iKRB3encln/wI/XqANwC7oWdIIgTNwSCwA22AFuhOCONYPkbnPJ3Ex9DOIBHtIMQV0NcAHbJB1f73QGubbyl7SogMaXiNyPZLF9OQGS7IMZLBBEZt4wIvsZcishbD+Zmc7F0Kaz47RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=jhhRmfgs; arc=none smtp.client-ip=23.83.209.14
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7EF4F3E208D;
	Wed, 24 Jun 2026 01:57:49 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-96-8-20.trex-nlb.outbound.svc.cluster.local [100.96.8.20])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id CCEDB3E1EE4;
	Wed, 24 Jun 2026 01:57:46 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Abaft-Eyes: 4d03c4980dd6d59d_1782266269097_2955076911
X-MC-Loop-Signature: 1782266269097:1914449800
X-MC-Ingress-Time: 1782266269097
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.8.20 (trex/7.1.5);
	Wed, 24 Jun 2026 01:57:49 +0000
Received: from [IPV6:2001:448a:c020:7ad:1083:9244:171a:4093] (unknown [IPv6:2001:448a:c020:7ad:1083:9244:171a:4093])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4glQ6y3ylZz41T8;
	Wed, 24 Jun 2026 01:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1782266253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8lw0wB1gav+5jD9VS0zq4XX1UeWjm6plfNwyDSSlRU=;
	b=jhhRmfgsc3UIMQRTSm6x4lzCNtZ+FqmYrRIhVuRqyydBVx+2rBAmiNaMSekRKdSZk7Eib4
	4aSR4tkU/mJR4Byiilco4Je78ryAPKCrpCouWmhWD6AA0wN8gWqAm6uMOaUSZzsgsl1B71
	2ODgYMwmJSydHWK0iAzAxoDy/V05uZmzKEcubaQoTO8+66lSoiN069WVZamiKwL0ZfZy+I
	LyOBxwe0pff8nd42OKU3zKqgbAi0Fv7kIQVs6QFaskFkvUliLhDmu/FxcSyFrQSA35ozy/
	EXr7cONoRnlq5zrabyz6Ug16pVidCF2iGNG73+/hzDJm0wzr8TriY2Fr2XT0HQ==
Message-ID: <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 24 Jun 2026 01:57:29 +0000 (UTC)
X-CM-Envelope: MS4xfHVpCM49oSa/jhdUW9Sc2rO3GVbTkfYQzshCHkKHiKaMz1W5getDrS46X5EQQ4NtJA1jZGQOuAMT+exm4Lc/DeQTMybNuKx04IF3WWbgFgoqiY1LYKUU 0iLcXVdPdOd6ErhYXMpLbXHSpH/wflzn8fr4cwmm1lBXGk++vOQEukaFF30+0aClbC8WyqgMZw6fkFzmI+ycJJeRVj0ERJxrPt6Q1th+NQnjsIVSDcr5vC+/ vte0uJUrpa5mvhp3ovMHWgPr0fMQcVw7rvhpmIV9GpxiBxRqvGXgco7TveCcErJuTw0/4GiS4MLYaMMeltIcIAg6oQ9+x7t+HeNBHMHyWSdNdAqNBksXPrjc pqJ4ZETVCot1FQfLridnGb4WsZk0EAznkLj+B0d5KRajFmKoK1Q/AlL/ND+7iF+fgyDGEmZN/nlqFvxKNmy1/zNzgZh+MMhjb0CIlVClRmW3CIO4C2y+rkSY Vryu2NXhUiaKNSgr5s2h4EUVnsxVBQtTMmscdp46c13uu4bCY+hBsEWt0BQ0oV4xWtZY2m44cZsKu9pvvSxkaGkIYaRlHDzSuRJc3a/gbqfjXDetGdZxRb55 pFxia7PN1wUdxmhM8ufJxHA8HA0pckc6gJEiq8oEi/Z2SrgnIs/ku8LbBIhDCEUZtPw+uWjkR8rBTxGkh8PgXXV9
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=6a3b398d a=ner5Rnm/N87odTmz6FGazA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EBJuqMV3QWurEbtjHp4A:9 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114267-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2F4B6BADA5

On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>> The HFPLL enable helper waits for the lock bit but ignores the
>> regmap_read_poll_timeout() result. The polling condition is also
>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>> as the locked state.
>>
>> Wait for the lock bit to become set, return timeout errors from the
>> helper, and propagate those errors through clk_hfpll_enable() and
>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>> ---
> 
> This looks good on the surface..
> 
> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
> 
> Konrad

Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
Krait era, is that correct?

I could try this over the weekend on top of Rudraksha Gupta's cpufreq
patch for msm8960 [1]. We don't have a gpu patch for msm8960 on LKML
yet...

(also my name doesn't have an "h" :D )

[1] 
https://lore.kernel.org/all/20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com/

-- 
Thanks,
Antony K. S.

