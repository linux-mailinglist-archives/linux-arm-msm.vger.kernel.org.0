Return-Path: <linux-arm-msm+bounces-110320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOWTMYDWGWqjzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:10:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386960715C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA5D23029AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E3439020C;
	Fri, 29 May 2026 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z310wI/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834038F624;
	Fri, 29 May 2026 17:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076359; cv=none; b=nZEqEKSOG79mVd2ouW6QAkh2e0+ly1mPq06zUgmtHLJe/1J58TF0m1tNNEoViVv6kj9t5HXU6SNGrJmPZgcbQQ3UwiwoxMtcn1F5KQcD9k4TXa7WpCV7QO5aHMx2lK4yT1+qU94ny279Ojd1UHsbpsKLpnXR5TD5tOlketigUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076359; c=relaxed/simple;
	bh=i9dmdrh8P0mPnuTykY7zBbJa2sOb/zd8oWALM/pZtig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL+OZcWSXpxtcrRxL9RJkEkkCpyg63R0jKFoYe6DFAyjwYbJSIk/hbAT2s0LCRzR+7VDt/0ZKDRbLolzkT+Iw/uLmhvDZfddg8HY8rYvk9d83RHZ7wsYZ4lJLCv2ThDR25+gcCe7Rw1jiBmYP4gUfxf4bDzY0T+HoBchS8SfhSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z310wI/J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C31F00893;
	Fri, 29 May 2026 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076358;
	bh=0WI4qQyv1EBpPKFRUbV0AQ8EnBM8UW7h22nNav4ht4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z310wI/JnTJ55UPI2NaUhuoQKsf2EhdkhQdN8jU3oDCtKPpmWt+FK14n2kUk9JHRF
	 j0m5swxjsiuXc7sIomdwRUXJAQKApd8tESOB2MaBefqP2BZ1HgZZP434x1eA9BEySw
	 pJFHz2nsjpLZWLfqlwcXBzgXGJVyvznOrcxDKoCyL6eKfilULbvurOgoADNF1SfYpx
	 ASmT5Ks5kF+CwQkdtb7304ywS0f6XQaUpdCaqZ1kOIYPV72AUOMbaQ9VfNiGV1jWf1
	 C3FWloTyFBPzluVScwSsbiQ0YfgNM3LKilJncymHrSsdRd9HTpdGbrQYPHzoaeC+Ao
	 Pb63skQKRLliA==
Date: Fri, 29 May 2026 19:39:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260529-jade-weasel-of-perspective-c2e0aa@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110320-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 4386960715C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:05PM +0530, Taniya Das wrote:
> Eliza camera clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza camera and camera BIST clock
> controller to the existing Milos camcc binding and add the
> dt-bindings header for Eliza.
> 
> The camera clock controller provides power domains, so 'power-domain-cells'
> must be present in the device tree node. Add this to required properties
> to enforce it in the binding schema.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


