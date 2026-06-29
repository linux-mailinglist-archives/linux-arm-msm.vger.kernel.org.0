Return-Path: <linux-arm-msm+bounces-115189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P6LFIzmRQmqB9wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:37:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E06DCC6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:37:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b=KEUq9Jrs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=smankusors.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 410DA30747AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9613F3BB12D;
	Mon, 29 Jun 2026 15:22:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7C54266A2;
	Mon, 29 Jun 2026 15:22:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746533; cv=none; b=QDLGFuu9nGQDarjyFzMfvKnuJpIO5SAuhn4le4fyP9Uk3wyylRq2sO+OqzGRaelKU7uqoek53o4KyEM0kAvENpD4IbqZYGk97/F6ts0z3egRjhyj+xox52MRF7Lv5fp2xpwx0YT3WJatf564dpZUSOLZWTYGJIBjTYL1nj9GcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746533; c=relaxed/simple;
	bh=+Dy9WY0nfnbOTEnfWeHJIktf95DixIQgH5f/eVTdGpQ=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=QuR5GlxzliAku9zGPOzEaFJxPNovWodGxxQhqD6f7C1KrSanwTUMoAt2F7RoEtd4x7jXftteBDMD4C6ibaBXuFIl4OxnNLuh2WhsNFHCgK7hUPoJunSwlwqMl6HF5NEC8FbSZGtjjebUlT8hijTQUYTPKKuQnPPuH0obQow+huY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=KEUq9Jrs; arc=none smtp.client-ip=23.83.209.14
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C32AB42F47;
	Mon, 29 Jun 2026 15:14:12 +0000 (UTC)
Received: from fr-int-smtpout23.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.98.255.9])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BA8A24308A;
	Mon, 29 Jun 2026 15:14:09 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Trouble: 7049e7a50e329c89_1782746052543_1762689129
X-MC-Loop-Signature: 1782746052543:2609547043
X-MC-Ingress-Time: 1782746052543
Received: from fr-int-smtpout23.hostinger.io (fr-int-smtpout23.hostinger.io
 [148.222.54.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.255.9 (trex/7.1.5);
	Mon, 29 Jun 2026 15:14:12 +0000
Received: from [IPV6:2001:448a:c030:3ec5:354f:5fbd:f4fe:4abf] (unknown [IPv6:2001:448a:c030:3ec5:354f:5fbd:f4fe:4abf])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gpqYn0h1Pz1y2x;
	Mon, 29 Jun 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1782746048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mH+H0EAnTvotIPpxr2juGNq83wr4Zi/DMW5McbEQOVc=;
	b=KEUq9JrsvsnogFlSuOqQdPRLZD3IAvwoxX5Y+CLRO8yeOIQ9sQ48H2L5VYyQCkXFKyH9b2
	WTBZhKV0YL1O4b4GW3ko56eAZOOrDj2TCVBGlUJ8jEFTpVmNUGy7h2cRp3VDnp+THPFblf
	/Oua5f6l1Agn+K/4XepzYBakOq8UE9bIgMraTgdXuHAVNIgjZAgh/ZWSTMmWeiBygong//
	JWg9YT+nivxvzgKLYpW0JoXWL4+lfWpjdiyNZVf1w6vnNqI9johcNGa6BlKgadVzYNa5de
	tzPjuULcVlSnlg1kSmA3DV2+iZ26rnZ4LZQE3QCuOaoBOa8XHu2xzqEg2t26mA==
Message-ID: <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
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
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 29 Jun 2026 15:14:04 +0000 (UTC)
X-CM-Envelope: MS4xfOJv4uwastBmsPyfT+bDdqPIyTlyzMMJosipCf68eYwsftw9vM6gnqeEElAC0WPKnsSRTBDLF/sd3t6cFAWm1e3EtsKFmJMHsRlGLcCYYygB8qQVhx2Z eUfjVzez5ebDQE3Tk+kRTsGCtj2gDUh58LkMttHTBCOy+RRgpUqtI5IHoEIOHZ6w1rrXURBJIDFC9m2eTdoogStnYmLElub+nzFWkN3jkOmPdfIg+u4rXiAP BPC1DLt3yJe7i9s2ZNgJ94NuFTRGvTTXVVZv/TqdxVGBZCuCbwK0EODByWxu8kH+5r5FzFJacas8G21ToKRL7l1tRkcMlsA3RhJh76N9FDKWNAI9YPe/he9V Xp46cy+1P776X0d3ecNDw3TB2/9ByTB/NJgNu93PMujkx6zL3nJejCC6Y01BjDgJJ5GgRlRhrW89M4l4LJEG2GEpDdU2jqil3A5G2T77D4EC27j5Zb8hylz5 pOhoEABOxI2y+lvF57VBv79TMF8Ecg2ylpdsMLw/fRkfKeeSl81XcY1jmE9dreG57C28AL5hTxuBJEwzT2UE2TaQrpb6vb319WlWKDUz0uz1ZFIKYaOqwUZa ZaW/YqOM1vFxQaADq1n2rZ7t476RyvQuPjY4Hkl3CsZFtnPbV7obSPMUYjpzGKUFL/Pg2EoJP6TDXSCmcjKKs7ff
X-CM-Analysis: v=2.4 cv=BvrPwpX5 c=1 sm=1 tr=0 ts=6a428bbf a=w1GBRM/3DoNZU4Dpj/menA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=0BFf4t5RkbpkQngwbF0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115189-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:mid,smankusors.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 163E06DCC6F

On 6/29/2026 4:15 PM, Konrad Dybcio wrote:
> On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
>> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>>> as the locked state.
>>>>>>
>>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>>
>>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>>> ---
>>>>>
>>>>> This looks good on the surface..
>>>>>
>>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>>
>>>>> Konrad
>>>>
>>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>>> Krait era, is that correct?
>>>
>>> Seems that way - cpu, L2, and GPU, maybe others
>>
>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
> 
> [...]
> 
>> [    2.679716] L2 @ Undefined rate. Forcing new rate
> 
> This seems odd. What's the reported rate there?

if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.

without Pengpeng Hou's patch, the kernel continues with the
following logs:

[    2.442850] ledtrig-cpu: registered to indicate activity on CPUs
[    2.516664] L2 @ Undefined rate. Forcing new rate.
[    2.516870] L2 @ 391500 KHz
[    2.527751] CPU0 @ 918000 KHz
[    2.527813] CPU1 @ Undefined rate. Forcing new rate.
[    2.529921] CPU1 @ 391500 KHz
[    2.613351] gsbi 1a000000.gsbi: GSBI port protocol: 6 crci: 0

-- 
Thanks,
Antony K. S.

