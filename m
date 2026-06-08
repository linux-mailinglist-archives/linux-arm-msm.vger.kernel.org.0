Return-Path: <linux-arm-msm+bounces-111732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J7vCDdx7JmraXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:22:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0138653F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:22:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FnxDpAJ/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 496313066A8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983E7399377;
	Mon,  8 Jun 2026 08:04:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235B352009;
	Mon,  8 Jun 2026 08:04:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905863; cv=none; b=vCy3Eqb5ddfS2woTgmIc35NvqxbsE0I5mbBl2T/g9usevcD2PDdfInyhhMgjSIqUrtRlKd8H2yDXvlxvNR5tm9ERngju8EaEdOPTmHfcaoBu7qY2bX4KHHPet6j5Uaulv7pWJHnqDse1r4+DQQFWkRFxlWW0BGzo/w1Fmy8QbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905863; c=relaxed/simple;
	bh=AgtRFOGIviCgasKMqCBNwv1ZSVgJM+/Vmhc1Ou+YutE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSbxQiGaad+eaC6RlLxYjAl7E7kYlD9DjIoK1OpMsQb4GFf6gm0GTgCeWTe7kVUhW2hG1M9dtNJsILJ/C7GTn/NeBKEHI7HFIZYa9ct1RW6letyUAPGkZop32CrJ5l5Y21SrzTPjOt86WAowShqNoT7iORR2q5YvqatmYxxUj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnxDpAJ/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4772C1F00893;
	Mon,  8 Jun 2026 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905862;
	bh=KQutdxs5ADBqnbY26X9NSt2Xu29A9zHjMopO7CrzVvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnxDpAJ/fzH3vBmTSSmFSZW4zYebelDfI+A4HSSarhGjZYymI7KdNH1XWzoNx56zT
	 JC9bcRIe/E6AVk9vnGZLq7jzpBRAGgAW3e1UL3B2mpeKpdr8Nwl9mflyfm7KXpIV36
	 ZGe4IJubvicboOcu74Z71TzKOB6LA3wWjkvF30YP7Npzqn9jJdICkvLQseOb4qQpud
	 9RNakVBmWJqPF6kntd4nfXIF4o+eAhnu+K+qEF4W3JU4wdSsMF/HtDa2OXztfxWyyd
	 ZzQahvsdnp/IdTPiOI2WIFV/yXeu5FT4FYbyBajnwjHcffFKX2BK0Tq3R1HpYFosc/
	 pOetpQz/LZFKg==
Date: Mon, 8 Jun 2026 10:04:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <20260608-elite-dandelion-goshawk-bd5acc@quoll>
References: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yijie.yang@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0138653F95

On Tue, Jun 02, 2026 at 02:51:08PM +0800, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


