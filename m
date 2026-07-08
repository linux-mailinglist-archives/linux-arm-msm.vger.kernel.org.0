Return-Path: <linux-arm-msm+bounces-117745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPu2KEtqTmoGMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA9727E31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="enguU/9n";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117745-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117745-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E97D431AD848
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060CA437123;
	Wed,  8 Jul 2026 14:57:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8E49218C;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522676; cv=none; b=iQLJHrqTIJvFVl4pCzOA5Y/zc4BOTnlof47MaHjNmhg2ojNGY80MX2+FJ1rBtDZPevd86/hoh6DQsB3Gjhls8gurHkoh+wOe47cRE54Uxtf3/IIsn26ewt+dLqN4fo0/Nwa7TCdoNU3Ma9vDGX6cARc7mjowksaTecYgiq0PBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522676; c=relaxed/simple;
	bh=WEzZkvJXxM3nGSJKeR6SCi1fHH11JDLpL+1IYT2YMUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yh27/jRd2pBFLNXvnuFPcaRwCorLAWR1bAJRW4mLSpcUYsg5IKJNyK5sBXrQy0gbTrXdIh9sb2lyIu3PPOkAUoJhGU7SZ2vGdHZ03i/jz6ci6oqHy1TD2BhJt14YwMVitSLCLIsiYSKgLb0JXXF9mC7CX3VZbImVK05YMjJFOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enguU/9n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EC41F000E9;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522675;
	bh=N3xqkpimVRy54peMWlpoAGI4ntIhVMRt/V2o1OmxrJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enguU/9n4LE49KOnVy90+hoh2CuKC9U2b8h7QAUxw9erj6a7AuiWjKnIxiRSsplmy
	 l9PtCFY5se+JNMY8tcbk0sGnrZQuif7QDqq3eJfNJa4zY8yd9v7ZHH54HmtBksnsmf
	 jyQ0PRyZ8fOb/Dfap0xeHyAuk3oXjzA7FFxXQ1f4mN2BcTbtucCqNtrI9zhU10vwL2
	 5hpKmuhOImf7oiIIiRh6ot4eDuMqcMqps48FY8pAcuEntxJH3vZkWolKlGhcnrEUk5
	 ycktgOihBISq7V32iBso9+WjJ4e/oD2LbwBM9nllyzntqJ3OjKSVGw9IkOp6wc2JWg
	 Da/wE5Up3SXGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
Date: Wed,  8 Jul 2026 09:56:57 -0500
Message-ID: <178352261627.2235436.5422094904444622236.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:webgeek1234@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45BA9727E31


On Fri, 05 Jun 2026 17:49:39 -0500, Aaron Kling wrote:
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add UART15
      commit: 50c0854e2703b4e446f83680d7eb0dc0bd5bb34d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

