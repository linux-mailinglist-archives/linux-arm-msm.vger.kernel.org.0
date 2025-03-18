Return-Path: <linux-arm-msm+bounces-51846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A69A67F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 23:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4500388608C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B2421423C;
	Tue, 18 Mar 2025 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHXjZ8rD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50041214232;
	Tue, 18 Mar 2025 22:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742335727; cv=none; b=ZE15MPOB30jm9oyIuX3DGs4cM7eWPTjmZOMNSTFA72aVxyLRhq7ndcG3/i3DFhbIOSTnDbkYjGJGtMZ5IDfVwkxZkKFo4TNSskVlge+iC03u8zqi2WK6lJYy7gXnclJUwSpfwxHhN7i7GJTAlcnNyiI5dtisMg9GoeIyipLwgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742335727; c=relaxed/simple;
	bh=VwiaJKGleDeR3HUOc7jX0OWD+YM44alMiTDoR9aobG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrH9spb9pn5L28eeBknhk6Fievzh8kqgT3uSr5KJhEDHsSKbDpcERRUWRwtszYOSnBerynl0hh1V78a/gWv4ocU0FybxNB7XYCbBj2hASK6exh3rCLZlKowRLiaGB0iOz+JaegPSMOD23rF0n5/6TOJrZlrSMPiIMTzBFVeThYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHXjZ8rD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F257C4CEDD;
	Tue, 18 Mar 2025 22:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742335725;
	bh=VwiaJKGleDeR3HUOc7jX0OWD+YM44alMiTDoR9aobG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHXjZ8rDEOH2+NLIz9u7XEym/yio1vVQc2EESVuQERjL4vviVBo2wFbyAnZUpUQMW
	 eI5XquxXAvwtP2cayK+kvua+H4NrTnnaIvq6ckpVWaMf7lPTvlNm6lH37/FbQFxYlK
	 1zJeIkLfFmNVJlr089PNtYJUboPa5p0qEplLTJvLxC/BMQYeK0hTh0ugvu5opzZ69d
	 s1tbm/l3BcSY/LvlHPudArwB7REBwDXBgFyIrm5q8m9vnNGFepiEZVfMCeSRT5klKC
	 cHNzXbHF4E+kCgRenXLj1z7FD56YsgdVgYcboXDRFDnXCQgzjke0k5wmw2TD7ksklX
	 prrJFJKBy9bBA==
Date: Tue, 18 Mar 2025 17:08:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	van Spriel <arend@broadcom.com>, Janne Grunau <j@jannau.net>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: wireless: silabs,wfx: Use
 wireless-controller.yaml
Message-ID: <174233572138.4033234.2164175732912672884.robh@kernel.org>
References: <20250318-dt-bindings-network-class-v3-0-4d8d04ddfb61@ixit.cz>
 <20250318-dt-bindings-network-class-v3-4-4d8d04ddfb61@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dt-bindings-network-class-v3-4-4d8d04ddfb61@ixit.cz>


On Tue, 18 Mar 2025 20:56:47 +0100, David Heidelberg wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Instead listing local-mac-address and mac-address properties, reference
> wireless-controller.yaml schema. The schema brings in constraints for the
> property checked during `make dtbs_check`.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


