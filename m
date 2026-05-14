Return-Path: <linux-arm-msm+bounces-107582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FoyCCBq+BWpLawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:20:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB7F54185B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C85E301C113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6F43C1F37;
	Thu, 14 May 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaOusny+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0338A715;
	Thu, 14 May 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761239; cv=none; b=XBd6dVJhjtR0JjHiIILzu359kslxzt53p5Zv1/j/HY0rK2TCtsKy7CH48wVQ52dzqmCxFqhW8A8qeypukS5UOdy+A8r79zo71WuC0uMjHvsTEORDbRhIc5s408IdYL1rnHqhEzYja/r2qTN3gIkYUW+qOWm2a+k17vyrc4F6pQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761239; c=relaxed/simple;
	bh=IbTNOhq3+JGJrRBK3S3BqU51FTc5CP4V6aEDy37QsuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd7gpHyoW8UdHX+HSEwPZpuGmqLQDWkS9DJ6jMvUfA0BIt7Q42L/CZTpATUVwnVHEeBrX7HJL+yJNYqehKqtEuJSA7nRdNDaC6+LNssZdTG5UnTT/USROApmuAwcQeyDM8DU9gqMVQizctHNxNLYmgi4LneLYhhk5h0H9Hoy3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaOusny+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BA4C2BCB3;
	Thu, 14 May 2026 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761239;
	bh=IbTNOhq3+JGJrRBK3S3BqU51FTc5CP4V6aEDy37QsuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaOusny+HTlYYKcwcQ7uaViYslQMQxSG25pjHG+wfaggMuETmlHpFlqmDPOSddwdZ
	 1fZZ8HWNeOb3XSSpyhQ6kpywd7ObGX+3gJgTFz7m7eEzzElToiDvdRXUzPAZ1/4R+7
	 4+ECrs4EWBm9P3IG9skx4P6t2mjY+lL923cuh36yrGer3G6ipy0u8LeEvmlj0KUB/v
	 LbtHPjTKCE0acdrwHMglqB4kfYBJ/CZT3iSZvOzi+ku/aIOYWV8ltsyJJU1UOH/e0e
	 Xw06lsT2bLKYp8qtmCeqASgScrWyudDdmhUGOAzk9xn+9z7ajpmepYnNdFOj2LJ3qK
	 g4JR3jkhjICDg==
Date: Thu, 14 May 2026 14:20:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: document the Ayaneo
 Pocket DS
Message-ID: <20260514-electric-industrious-zebra-7818ba@quoll>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
X-Rspamd-Queue-Id: 6DB7F54185B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107582-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:33:53PM +0700, Alexandre Hamamdjian wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>

That's pretty messed DOC chain. I also wonder what was co-developed
exactly in this trivial binding...

Best regards,
Krzysztof


