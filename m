Return-Path: <linux-arm-msm+bounces-80530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C5C39846
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9EA3BACC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3604B3002D1;
	Thu,  6 Nov 2025 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2x9KvRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6422253F2;
	Thu,  6 Nov 2025 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416511; cv=none; b=axHedFoNQc4w05urTw7aG2cbyu6smVvL17RZduy6NLF4AsAHurz5mSiTtZkhrCdGWLJXsl/0yKfRJFJ92LiUIFGC/cUanVzEHnMJgds8Y1ui5YvRMDV9njTZG4E0z/RnvgBNwVbtHbjBznb/Uazwl/W29zwN6xkixMmMPeEfJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416511; c=relaxed/simple;
	bh=w0M9A2NncSddLvs5Kxagx3Vtm92cHZObBfIEs7nJX8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQnBC57/GkNCxcuFAMF7bdJD3xkE7qPoZzvUqPFXmPx7UKpfJ++H94r3cAkfChwTyxjFGKpcSY0q6j/joEsZ4I14lEx/+/K32ZNWWq5NiMDXvwWMk/8tWGKwqVSnuD+oyCw8KZWrkqgg07PwlNUqKq+9I1QpOvsXuDsQ/pUf0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2x9KvRt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477ACC4CEF7;
	Thu,  6 Nov 2025 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416510;
	bh=w0M9A2NncSddLvs5Kxagx3Vtm92cHZObBfIEs7nJX8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2x9KvRtTbpR5iFyEYcANr+9QrdGK+MT6L4Qx+RWHwSBYW7iNLfvDUl4TJqoT9Juh
	 SsIoEhzr+xnB2tWoJUDEp6FPHKre5O99//qBpKHAPV3rSbEDOLCF9gisCURDxcwEDn
	 tmzGeoOn41CktdZao1/mgMaN6dlSvpHKpayS8PB8zdiCut7BnqwmqgbXxNtV73ZTAN
	 QlKIMubPNflhIPb/Y8GjIoksl0gcl9mqsKn9l2NBCQZGN+bs0tNW604GilfI2IT2Cl
	 OQoKLUOLSisIZgS+5M/WLzlRrKw1hw9lOWJGv5PFNydOPuDlaItLzfYT4/fpKMW3LA
	 XUbD3Bd0CzVVA==
Date: Thu, 6 Nov 2025 09:08:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 4/7] dt-bindings: vendor-prefixes: Add prefix for
 TUXEDO Computers GmbH
Message-ID: <20251106-calculating-gainful-cuttlefish-2ff391@kuoka>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-5-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105154107.148187-5-ggo@tuxedocomputers.com>

On Wed, Nov 05, 2025 at 04:41:04PM +0100, Georg Gottleuber wrote:
> TUXEDO Computers GmbH is a german supplier for computers.
> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


