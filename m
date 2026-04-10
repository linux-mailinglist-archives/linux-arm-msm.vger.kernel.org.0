Return-Path: <linux-arm-msm+bounces-102610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LbzIAO22GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8A3D424E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA1B3037455
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAA93AA4E9;
	Fri, 10 Apr 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETa0meso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7ED37AA99;
	Fri, 10 Apr 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809623; cv=none; b=SlAVK4txVSRECYLnmyHyxsfI+KZQ8E2KMLZyQ+AHwLnbNK9j75MZ6nTQ9c0C4omTCxqlJOqx6k/dTwLlgDbxvPiwUn4cggx17+xws3FJ18OK+Eg7WkGGnOOo6UOTTJS5uu2mb007kRLmgUaZ/FBmMRYKzY20dWZj4SUeuz4mK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809623; c=relaxed/simple;
	bh=wiVpkLOHesaDxqsTty1+qn46GjmDPchZxN/XYbW0yVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sybdIX6wRWCu/LDB87V5CC/bL5q/ZilNhg4FvQ2+ZvNK93mGoaJYvXlNAJ/jnPGemIokGo1gc3LxVKonsaUZ433YJWtrj11i9wHp5p1NvV1WhnJA2JP/9q3J6CKVOO1Wl5OkVK0naW/dlWdAMaMLGGwBcQCiGcjMpoEV2VH0ZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETa0meso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EEEC19421;
	Fri, 10 Apr 2026 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775809622;
	bh=wiVpkLOHesaDxqsTty1+qn46GjmDPchZxN/XYbW0yVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ETa0mesoel9QguYJ8pV0cmtc3Cyt+G6JUpWibDvnx++QugKMurkEiMLxtwQDB5+4M
	 52/cbsopugbayzbSPnnyAbHWsP0AdFH67TlACy8kcfjh4JdG6u2Qq/LC1oH/Eiu4g6
	 bfyMNUg5cCwzSZz9MdhsqS4IWcLAKxeL5tYLwh3e6uu5BnTlKtyIR0LjeFSbDSstuK
	 fFnnYkgL415whPrxMxn28Q5jI5A2U/9LwBir5p2eofF6AYQid7qaJOIQ/pBC5aLcD5
	 osR7giAvoly013z7WULooyA3wUIaHOb5+eAjs96gtEyycEn74RadjM7s8MUn7+f7Vk
	 LV0Sgr7ATh/ZA==
Message-ID: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Date: Fri, 10 Apr 2026 09:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102610-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9C8A3D424E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 04:55, Taniya Das wrote:
>> Why do these two controllers have no power-domains ?
> Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

Shouldn't you at least have:

power-domains = <&rpmhpd RPMHPD_CX> ?

And even

power-domains = <&rpmhpd RPMHPD_MX>,
                 <&rpmhpd RPMHPD_CX>;
power-domain-names = "mx",
                      "cx";

Konrad's suggestion to me was that MXA should have a vote in my CSIPHY 
series I think he and Jagadeesh discussed it but I'm not sure if they 
_concluded_ what was the right thing to do.

Right now I'm representing the dependency. MXA is always on ... and 
there's nothing to do voting for it @ MX ?

---
bod

