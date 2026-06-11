Return-Path: <linux-arm-msm+bounces-112653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HEq/Nlt4KmpnqAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:56:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 355CB670134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=c1bxvP5j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB0C432B2524
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E232D3BA244;
	Thu, 11 Jun 2026 08:53:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7452A36212D;
	Thu, 11 Jun 2026 08:53:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168027; cv=none; b=qJAT0IiF2ZEeKHgvX375uBtKbk8ZTPrRBN8iHTW9Kmtp578MRFafNTHee9lzsWFY6yAUChW0NV0Q4ZboWPbZozLRn872MVHRFGgC4MGaQ71uBMYucWJLQR5BY82YnQ6jUjVWcfkRqNlSRWGhTTkDToCRW5XnZfLgWreJ9013t3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168027; c=relaxed/simple;
	bh=jBEkwGT0OVZPgOGXE98t5kMgDSiyjc/PBxqdhP1GYsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi96V1fTmRxVxsLBF6pc/s03fJDL9Xdsjals3gGPLb+YYVSM14TF1f0AgE+gzyLBjJVe5DDsY0Z3yyjfhxZ/xZ8agvkdYTknC7IuwMAkmOr67iwuzYt62/E6tiGzc7Io5oHlPwGksLvfqvBX6yZ3y05yg7dPchonzr8YfWq5jzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=c1bxvP5j; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=kf6pvYnNiHlI9RfaXR6uXvxpuZeaNojFoeb5Pt/WyrI=; 
	b=c1bxvP5jUq7GUznMrTlLwzAnV6ow37jJlmUYiYB7a1ovArr0+88ywetzZSu2ctE+qnJY+joO50b
	fv3bTHawhhu4VmYUg9DZrOxMND/99E5XG2g9UW5k12dnWtgHcy8cYgjlN6KbIMH/aeBd871HA5iYq
	n4GUOwUsjDOPjnoggxZv/CCasqlQuQU3EMPmSBe9RFaISusx3E5uLo3m1kLsD24ACdLi+B8q6TssJ
	AXU0Rw2BTVbN0PVxMtecktDFiwAcRnsgc1hW2brlFeCNhhtIkKkqsm8ReJXADTdGS2LTzLWttz8tI
	oHO/75KDdr2654/xgadDWODOXzq5VIbY6jXg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXbAS-00000004XbK-3Bp6;
	Thu, 11 Jun 2026 16:53:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 16:53:40 +0800
Date: Thu, 11 Jun 2026 16:53:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Demi Marie Obenour <devnull+demiobenour.gmail.com@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH] MAINTAINERS: make myself the maintainer of the Qualcomm
 QCE driver
Message-ID: <aip3lGs0Ka8flKnk@gondor.apana.org.au>
References: <20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:devnull+demiobenour.gmail.com@kernel.org,m:davem@davemloft.net,m:thara.gopinath@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux@armlinux.org.uk,m:ebiggers@kernel.org,m:ardb@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:devnull@kernel.org,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,gmail.com,armlinux.org.uk,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,demiobenour.gmail.com,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gondor.apana.org.au:dkim,gondor.apana.org.au:mid,gondor.apana.org.au:from_mime,apana.org.au:url,apana.org.au:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 355CB670134

On Tue, Jun 02, 2026 at 02:46:56PM +0200, Bartosz Golaszewski wrote:
> Qualcomm wants to keep supporting and extending the crypto engine driver.
> Thara has not been active for many months, so change the maintainer to
> myself and upgrade the driver to Supported.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've considered also marking the driver as BROKEN but decided not to.
> Next week I plan to address the failing self tests as well as go through
> all the ciphers it provides and remove ones that are known to be weak or
> deprecated.
> 
> Regarding the series that proposed to remove this[1], let this be the
> official objection. Qualcomm's clients use this IP, we have support for
> new features planned and intend to refactor it significantly.
> 
> [1] https://lore.kernel.org/all/20260523-delete-qce-v1-0-86105cd7f406@gmail.com/
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

