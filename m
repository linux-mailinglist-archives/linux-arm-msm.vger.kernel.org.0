Return-Path: <linux-arm-msm+bounces-114187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yqhWOP5uOmrI8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D457A6B6BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=ozHrpuCk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114187-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114187-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lunn.ch;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16DC3300699F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281E3370AEE;
	Tue, 23 Jun 2026 11:33:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0E2772D;
	Tue, 23 Jun 2026 11:33:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214394; cv=none; b=jcgFIXhizK3GLt/PPQjI+64b3Q0hv3YQt9HskzqxfAdQypTwlTwdIRVDLkxxycKcPWeVOZ87OEHe80ADW+sCpdXoPPFAB4hMa3Nf0qdax+6WTCMR6QpJIpu/l3ZbU5Mqx6609d6KtdVLvqNE4+IKb6LXXTOFLzHiKQJuyKNriEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214394; c=relaxed/simple;
	bh=+BCocolzNbPqVls/vOUaBRdhKMlP7Yt6GUBic0kLLgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9ObwR6NttbZ0TzO8awbY4KFP7M+Fyv327NzT4optn8HnibGj5tPZyukiJQmfaQSI25+zUKqaHmVDtHKatw0MxTyCftPPQ727fbQHk/YusAjkncR5FJdNLtiY3kenxiCQJuOOaxrjgLXDIB0JevT2FBOzcf01SZGm/fjBHZnfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ozHrpuCk; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XdA/MiW6laQIoTxSswqnH73r0TTTKiMzVB16q8vAsp4=; b=ozHrpuCk16GLXUg2AHUYBiZOoy
	O2QaDSL4QCJwvwRop5dzcyG5PoGDUjI5toV3TLK6urV6ILbglITQTVncITWEEq+V71tcBTSYez+bo
	KL9AfPMuNmEB5QPQ/MZULnvo5bP3E8/ik/341LOSG2xpjB1I3e8n8KWu2s6buZTjUxUE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wbzNJ-008whw-9V; Tue, 23 Jun 2026 13:33:05 +0200
Date: Tue, 23 Jun 2026 13:33:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
Message-ID: <0c1be662-3c6a-41be-bc19-081d0299ceae@lunn.ch>
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
 <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114187-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:jie.luo@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lunn.ch:dkim,lunn.ch:mid,lunn.ch:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D457A6B6BE3

> If address did not work for half a year, I really doubt that you commit
> to above.

I tend to agree. Maybe we should set it to Orphaned, and then decide
in 6 months time if it can be set back to Maintained?

   Andrew

