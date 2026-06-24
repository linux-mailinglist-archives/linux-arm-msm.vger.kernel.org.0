Return-Path: <linux-arm-msm+bounces-114289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q2qcC7qIO2p2ZQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:35:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2B6BC33D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Hr5jEiw0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7903014C06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502341E7C03;
	Wed, 24 Jun 2026 07:32:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F2225413;
	Wed, 24 Jun 2026 07:32:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286329; cv=none; b=jhlV2KK0A8kzG6TMtmapI+m/eWR839HGGSgWfBOfr9GugjFRLthGCI8rOP04OrAowhZncLN84uOVN1Bi37MBWlAh24OPGlsdLo6UTPVikEPw5rE/kBbjs3ZFuanO7PF3o1/9ZzBsZEGzk37suONb8Gi7ehJ8lv9n//ParKQ4xE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286329; c=relaxed/simple;
	bh=FtQZIWp0q/zeCUvDzvaVfsov0+8rSgPY7mzahEwg/Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIaBP47jHn3gXOtaW5KcO42DqS9H5AToswM0SZGYij2K1XHnDNETbCHuuUSws2+D9K9g9Q/bNFrDy4ObEmfx/fUkV9tKSgha+6dF88Na0axeFrpaZy/xgB6q4HlC0wFkdbBKkVi/Dn72mmuK07tpGcB5w+r3aDBEzJA/wXvCMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr5jEiw0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D571F000E9;
	Wed, 24 Jun 2026 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286322;
	bh=mWviE1yMvHLhkB5BCuKaIarIxybmd6mECKtXviPVDVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr5jEiw0IxQOcSzhu7R9Gc18bkc1txlnW6lTh5h9COJPIAI+cu9wR2ySRTHd5exfS
	 ODNGGEihd2k2221+eLgXQc8i/vjqrhFfvT8y9M6amgVKfhfHlk109lOfPPcl4NDMDD
	 ejrP8nBVjGIOvBdBF4vKnYVKf7Zr3lerFMLYKfVUXnNzSk3rZyohWk5cVLQaVG5AEC
	 M6ut9csUuCQTZTBhLo6qkpGtAW+bJfMwFJqebh4HcYAP4lXKQPc+IYCYhqWuE8yRZP
	 C1GlUdNvKQz5Xv4ipL0M54c2SakMn1JkwMcOtcpFvtO7N6yvu3a+kZBLEgAfFhxB6A
	 BZvo2Tveiw39A==
Date: Wed, 24 Jun 2026 09:31:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Message-ID: <20260624-crafty-wildcat-of-protection-4f6cee@quoll>
References: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:barnabas.czeman@mainlining.org,m:tomasz.figa@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:tomaszfiga@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114289-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,redhat.com,samsung.com,linaro.org,mainlining.org,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid,samsung.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70E2B6BC33D

On Tue, Jun 23, 2026 at 09:30:51AM +0200, Krzysztof Kozlowski wrote:
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
> Kodali.  There are no new messages from them via other email addresses,
> so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
> clocks, because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I missed here:
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>

Best regards,
Krzysztof


