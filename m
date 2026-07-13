Return-Path: <linux-arm-msm+bounces-118665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hbPnOmuYVGoooAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182E748598
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZAmHdgLZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118665-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118665-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6833044111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A559B38E8C6;
	Mon, 13 Jul 2026 07:43:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775C3911D5;
	Mon, 13 Jul 2026 07:43:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928622; cv=none; b=USh7lDDWJa3h/wkPfBGQxgroNnKZ2Hg0mfTuRf4Z2PGbBMQgBWqyJM7+u4Fg2lBR/1NaqqBrR07EFgBjucH9o8B9KKYLst0VMHj8yByM7/jVQYKFR+AwTuA3Mrd1x5AeWAfSwS7DOp8fZ+iuxYTVG9FsNwzfyaHlrg4k7z8B7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928622; c=relaxed/simple;
	bh=rqEN8xqY8g3jdyRT6vNq8bViYzuVgfgOjRX3IiLzytM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ+B1xQq0LNiseLsfgppnxetOVITHMMz7fW4g4lC1ztwHSkA/XV5kCWew8nZi+wSwJY2jZeqDew+DRjcbQpALXysM5qPLif+TqRVIss3WwtTMZt059206nRPzyJOYYtt6ocPNe6w9f2wYZrd7XNzY1f12yYeGDcGAsWClhBGu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAmHdgLZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4520A1F000E9;
	Mon, 13 Jul 2026 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928620;
	bh=29uBqTvSP+iWBK7NSnWfm06MM3dG9i81/H55CHSTzZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAmHdgLZ+4rk2DKO+qqI/cHQo8NO1NQHBn/evF/zyqRrgId2pIoYe16aq4n4FK5Gn
	 /HsRHAHzPhsJqpCFe5+8VTf7zMr1RDlgAXpn95UYLaqw9sn2wb//mmpPUOg5uJRuRv
	 xrx4jM5qwB8W21wfSRaVc6VdxKi7726G7EZNi6owhXxm1PRq0/FkBzB7P2Ki8TByDk
	 arySrrR+XyUR6+JXsbtI6enPaBeyqk0QpBknbjQM8pmRnEY6SpJTW3yPPtj6BxZYMW
	 EdwxOoYNz9yw8wbG/aVC1QqZ2NwVb7kDL97yrPZRpRgrEHZ6MNf/4pP5oVglESr+Nb
	 b0uw9476PFCKA==
Date: Mon, 13 Jul 2026 09:43:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Message-ID: <20260713-blue-guillemot-of-ampleness-acaeec@quoll>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711184934.55701-3-oleksiionchul@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksiionchul@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-118665-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6182E748598

On Sat, Jul 11, 2026 at 08:49:34PM +0200, Oleksii Onchul wrote:
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&fsa4480_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cdsp_secure_heap_mem: cdsp_secure_heap@81800000 {

Underscores in node names are not allowed. Please switch to DTS coding
style (see docs).

Everywhere.


Best regards,
Krzysztof


