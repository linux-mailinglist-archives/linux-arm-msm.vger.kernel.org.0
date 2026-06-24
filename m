Return-Path: <linux-arm-msm+bounces-114299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aPXGGtqLO2pEZggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:48:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BEA6BC520
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:48:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F45hTVDM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114299-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114299-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A15301FF8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCA838C421;
	Wed, 24 Jun 2026 07:47:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C08346AF1;
	Wed, 24 Jun 2026 07:47:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287277; cv=none; b=sWolS5LqwxhLaIw8yrt+vczSW/+DdTMr3+sW2rpXw1KIA9oeKVHTRxF6aRpRF/3ZkaNS+aeLtbqdcjccxuHdoPVJVEe8wnguTtrTIMxnrqXblcELI2fi62OTfCDEy7TNpkKNYqX7oVV5kcqLpbJf+9YemJuOgAJBuEoHnu5dwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287277; c=relaxed/simple;
	bh=uRMY2S2mQvHK3hp/TGSGJTP2ES8ybud+FJ8Lowms9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGD4ZN/C+up9F/P8Zne2Mi4l3erEAdl0iWaq9TpcRkDwrvE8CVjmL/ubij4+9nt2H+SZG2rr9e0Wh6jSyomv+mPBzOXzQUW/d1OvrUnvo+XIi5UQ6/U4DElmSKXx+B+3IfLlYH7NBE/KiT0+1jLcQEbdW0N+LJoZa+OGi4eCt6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F45hTVDM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3062F1F000E9;
	Wed, 24 Jun 2026 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287276;
	bh=/uh5/nhoBNLmlwPugAXtFc8IZhUvOtUnsv8Lp+aiLiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F45hTVDMzmJlJCa97ySNZC25NCDj+Rgj9cal8azbsWoo8QL/IU7sGTGQ+JF4ClkOI
	 5Euss85a/xMvqiJ/kkVyPwn+cjcVM9m+g6aCOTPluDPkZIkTshCk/aRCFN5p2ScoNR
	 MiD9gw33HanW8TLGaiWiP3J0bWhfigOZ5L+ExUgvVWNqnmlRY02iZcxbeqQ/P8xSEP
	 WxbyLK9WCU29DN7Mh6GMo5lR/hypYwidvP85ASHpcqdp0MM4oasBbPNnkt2w210NQd
	 QmFc+Y37f0k4sPTSnEbbUo1S3aSRh7S5a5TduR1bXqqV8UNzzl2LGD//IsAx9UFPmR
	 xYwt5iLOKgInw==
Date: Wed, 24 Jun 2026 09:47:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Jie Luo <jie.luo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>, 
	Suruchi Agarwal <quic_suruchia@quicinc.com>, Pavithra R <quic_pavir@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
Message-ID: <20260624-eccentric-cordial-seal-c97cea@quoll>
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
 <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
 <0c1be662-3c6a-41be-bc19-081d0299ceae@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c1be662-3c6a-41be-bc19-081d0299ceae@lunn.ch>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:krzysztof.kozlowski@oss.qualcomm.com,m:jie.luo@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114299-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05BEA6BC520

On Tue, Jun 23, 2026 at 01:33:05PM +0200, Andrew Lunn wrote:
> > If address did not work for half a year, I really doubt that you commit
> > to above.
> 
> I tend to agree. Maybe we should set it to Orphaned, and then decide
> in 6 months time if it can be set back to Maintained?

That would be a bit stronger than I intended and actual responses from
Jie did happen, thus the driver actually might be maintained. I also
think that Qualcomm is committed to maintain it, I only doubt about
supported.

Best regards,
Krzysztof


