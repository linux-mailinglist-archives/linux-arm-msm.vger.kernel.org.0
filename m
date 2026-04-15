Return-Path: <linux-arm-msm+bounces-103245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPxkNwJI32mFRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:10:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF19401BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0EF330D3A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFB93A0E8E;
	Wed, 15 Apr 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa1RVf4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70C3932C9;
	Wed, 15 Apr 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240473; cv=none; b=Duj8JYthDCkf6rMXJDziV8k/1W868+qbwXWTOV1ddsmfeW7L7X9WTFuXR9POUNV+z5YUSged8iCxK11hmrPQZnN6cOzko8DqAmG+gsFm55o3Dumg3lnG59L1kUohlcG+YCRjEr0YBjjkmLxW2/E5Onj7dRF1S4FQTJeuB+kD2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240473; c=relaxed/simple;
	bh=RHlN0QMRXHtR8/1/0yo+MqI5T726vo8pxmIb3K0oTbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBiOsmryYixvu8PNHto+A+rKKZbjeKwY5V+x3+9wl/sQ+roc38y16iHnMgBAHd/RMexz8aX0kq007MWYPYJJ8HFvqP8CCgqRBFWhQac7xKwqvzNuwJlZKywT5s035/Wm3EumpeuhlSeGpC9PEFq70qTZLEjacOrO5FcagHIfWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa1RVf4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFF4C19424;
	Wed, 15 Apr 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240473;
	bh=RHlN0QMRXHtR8/1/0yo+MqI5T726vo8pxmIb3K0oTbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa1RVf4Fd7oSCt3agDC9Po7WXxxU+Gl8PPDCLQddTtcwFrbScDNDY3kskBKuGH2nn
	 OJy0oKm/vE48VNvuBzw1EqjO9pBBZU/wfgVr+xSr+LSRNM6Ec+f0IosOrPZofT13qf
	 xfcTuPOg0c8qhK5mtC9wGaaj3Wr4qu83XRMYxaDIXVeDCdXV838gYRH11PFw/OHS1I
	 P9bepX4jYNZ+S4SeCibE8hJgZBHtbeuCUUr+qMagsvj0eR2YGAY1VKC9UAQ1RUneAB
	 jki98kbSZCFGh5g4E/GBopj1kAdInQVzJanK/EUOSjTQVncX2o2deBYyK/hFEUampZ
	 C9KegWKz9s8Cw==
Date: Wed, 15 Apr 2026 10:07:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: qcom: Document panasonic,eluga-u2
Message-ID: <20260415-strong-diligent-limpet-ee132c@quoll>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-2-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414184429.168612-2-linmengbo06890@proton.me>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103245-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,proton.me:email]
X-Rspamd-Queue-Id: 3DF19401BF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 06:44:48PM +0000, Lin, Meng-Bo wrote:
> Document the new panasonic,eluga-u2 device tree bindings used in
> msm8916-panasonic-eluga-u2.
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


