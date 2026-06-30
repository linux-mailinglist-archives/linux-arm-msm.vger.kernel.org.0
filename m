Return-Path: <linux-arm-msm+bounces-115523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hn/bBpECRGr1nAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:53:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F56E70A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:53:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lGuXhfP3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D32E3017517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807D43DEFF0;
	Tue, 30 Jun 2026 17:53:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78D3A7F5D;
	Tue, 30 Jun 2026 17:53:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841997; cv=none; b=dQHdgtjpbo/cbvu17vT8qfGjp3pXIqQiX9aSR3aSWP66VnkS9jykFodZbjFYUAObp6pVLW+rwEs5m3uGebkicVA+n3HO9NQnlmiCVaNp2E/RngEOxohr1669ZZur58Sg1YJ02VmvCpIEP5QLEyA4a1tVlrJvB9OusL06/udXbLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841997; c=relaxed/simple;
	bh=SuWU/DemszK/oLGWlCJ/Dp0AseJ85PCdrgIPDTnNegg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab7NZesK3Gn0C9jSSdmguMX36XKsXmlepyj/mSDvTPpy4c4vh3ftLI4Jzde0wMxnrpequIMOLm0gdis2WiE9LCV1wCnOP5Gy+IOivC0u7+aRbNOI9y0lNLUDjTO/7xBh027kxUI2eWVFhswpvxS4O1cCA0tapRjue8SOco4Qmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGuXhfP3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC551F000E9;
	Tue, 30 Jun 2026 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841995;
	bh=EDIm728+MZA+8oMM6niIdGNqoPV8BW9eVvdf71Q0sQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lGuXhfP3Yt4U7r05HOLf5FRtpaS1Mo7diQ+raRcott5k/oIlf2mQICiKQ0cwJIHZh
	 u0EiRv8VKXB8K091MTHbxctYsZekZJIpg7TlGBnz6R973tLxF19AGL7XyYCkpNEqw6
	 9L8rAj86j4kcgUVJlzsK63eM4UaYBF2UXR56GeK0TSjQVmhwJfcFhv0b7BUNDz6NKA
	 L301kknOolAVyMKcj0UcOyJul+K+xzRw9t5mqYw8mQJOhQTXkQLMjU8O1wEOQu+Vu3
	 rFcSgH6S1LNsMsKPG/QoV/vTkSQaLeJGR0uNswKIzCTx8KqZZ9TsZJkgPgxD7vRsCX
	 4GNfrrVqpxvyw==
Date: Tue, 30 Jun 2026 12:53:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, trilok.soni@oss.qualcomm.com,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, yijie.yang@oss.qualcomm.com,
	aiqun.yu@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm Maili
 watchdog
Message-ID: <178284199444.4137488.1292741710954214785.robh@kernel.org>
References: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115523-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:wim@linux-watchdog.org,m:trilok.soni@oss.qualcomm.com,m:conor+dt@kernel.org,m:quic_rjendra@quicinc.com,m:linux@roeck-us.net,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:yijie.yang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 739F56E70A3


On Mon, 29 Jun 2026 00:09:05 -0700, Jingyi Wang wrote:
> Add devicetree binding for watchdog present on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - patch resend
> - Link to v1: https://lore.kernel.org/r/20260524-maili-watchdog-v1-1-f7efef781701@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


