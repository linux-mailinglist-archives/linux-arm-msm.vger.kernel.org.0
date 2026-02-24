Return-Path: <linux-arm-msm+bounces-94001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPghLVe2nWnURAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 15:31:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D63188619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 15:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8895D3125D60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C00339E6DC;
	Tue, 24 Feb 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="PLL2Q8o9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E82239C62B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943165; cv=none; b=tzQGPklF+wAMbvHgX9nf6Yxha96Mch5QDQDblifSvY8uGQ0bFfkk4npWEVnQQyX7xCYOz09INzBCgbLiW79WuGdm6AKiKv37Hjge5tKmRYvDJEmLhG1QwL+AgiAsoiT/u/pJwBQgdA+BjTdm3fnL9AcF1lzgKlbF0O616RP6Is0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943165; c=relaxed/simple;
	bh=yGF1SihMby5FoTVbeRkf4o0DTwBjNrt7ncyLUn6qLKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHtXdn13GQAsex/aN16TLueqXvFmuCYlzFCMAddGZ51thn9NNEosJ+kFhauwLbyYGnLCGBstSxsv9cVHr7pYVK3vTKq5R+C/x7/n7lt5p6JhIJ7XyeexsrtBh9cuABoLKisvC1kzmVnegQg8g7cjOQIvrPNPBQ++kSW/GVtr7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=PLL2Q8o9; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 132E7240027
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1771943163; bh=OqJgJP9gwGvLNHBkbuH7ShAGV/HSthFLMVtrCu4MZp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=PLL2Q8o9jYExfZ/eXVvBNEchQmAXE5clcUb9reZCPEc1JNXbXs1vV5v1m6W2x8eiw
	 KdEKnAnKmItyiJErydZ3k01nlO7TWwlKWmSlFUt3+bNgO8lQXskdUh8f0YbrucTfCJ
	 wNQnwwDW/wWad1CdlkGQYXw9Ietc5zzZ/CxBqE11TQTVsa4jj+y/LBKwI9kc23wGs6
	 ysbDNKQWA0mvcGx5d5g9r5g43nZtDwEBFWX2v0i+NsYMPjNMAjIIO4q+BO6vfBXKRz
	 X/GaZbSPPfwRibO4npyMvxKboABj0ppZFw1nyuAIwB9s1G9cIg6WdVRRtD65V1rTnn
	 IbJ9J4jRx63VQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fL0Q16jsfz6tvs;
	Tue, 24 Feb 2026 15:26:01 +0100 (CET)
Date: Tue, 24 Feb 2026 14:26:02 +0000
From: Paul Adam <adamp@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Message-ID: <aZ2040a0qgj28JCf@MyryksLaptop>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-1-6336b1b12389@posteo.de>
 <20260223-literate-flamingo-of-reading-4deaa5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-literate-flamingo-of-reading-4deaa5@quoll>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94001-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamp@posteo.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,wiko.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23D63188619
X-Rspamd-Action: no action

On 26/02/23 11:25, Krzysztof Kozlowski wrote:
> On Sat, Feb 21, 2026 at 09:55:39PM +0100, Paul Adam wrote:
> > Wiko is a french smartphone company: https://wiko.com
> 
> Everything in Chinese, so not that much French company. Also footer says
> after translation:
> 
> Copyright © Wuke Terminal Technology (Dongguan) Co., Ltd.
> The main body number of the record: Guangdong ICP No. 2022057930
> 
> so for sure not French.
> 
> Best regards,
> Krzysztof
> 

Whats quite confusing to me is that both "wikomobile" and "wiko" use the brand
name "Wiko" and sell the same phones. 

But since my phone is from the french company, I can change it back to
"wikomobile" and adjust the binding accordingly.

I just want to mention that the offical/legal company name is
"Wiko, société par actions simplifiée" (Wiko, french type of business entity)

Best regards,
Paul

