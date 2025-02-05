Return-Path: <linux-arm-msm+bounces-46932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E4A28781
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC4C3A7B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD10C22E3E7;
	Wed,  5 Feb 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SknuGw8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956022B8A0;
	Wed,  5 Feb 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749983; cv=none; b=ezgo70LVuEwUYsiXZLGXSi4kDOE6kayc5b6SXVLj3s7z/9641ciHRubAXZMj/24JO7qSs2Wy7Pdw/WDwfah3Fr5NepCfXh8oEdjedj99hVABfFbLbbjMnolZyKBjZHm9v9ONuWymku+brTYXGNnGLx5twjQVpu0TcCAQGkPjCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749983; c=relaxed/simple;
	bh=xydcuhIIgDpdVxy+ffJwelTXPHmUbPvOcxb5Zn8Ku6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiVqogGrZJryNIgss4+NpWxG+kV12E/NhUJXSPcbBfqvR6h0b6fXW4v2Yagp6FaICee6LfXpGEYn2bdbWbAka6fRZs+JnGRc+Hi2x8E+5pa1RR2NGA7UdsiZq37zMGI7sXW2+Do+KIGtFtQ9rkWBDwMLDNwrozlB82RAt4k+cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SknuGw8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB690C4CEE3;
	Wed,  5 Feb 2025 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749983;
	bh=xydcuhIIgDpdVxy+ffJwelTXPHmUbPvOcxb5Zn8Ku6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SknuGw8yos3o86s1k+IMQ9+z6lVrxRWX1vLmInZfaPjeIzMaexJpzePuA14+NyoGj
	 64PXDpjAPeHrhjb00NiRjzhH+2OM6eeMvlvD8DMJ/BppfvJjlW8PM/aTNGr+9VdYa/
	 RDrxdG1JPFVXcPJHbMM1m9o+vvwev9wMuqGscAJzQDA66PEkHcqDeUQshQnQLvk0Zg
	 WfckE7mCj6/zgXHJjcOscqZkKoBsBwNHPzR5vvQvS9YygNeobzqscMKbR6OBZoPLO5
	 obyFyZtp0qLoshc3NUFWaWWB65JgwQKmkCJh1oNp/MWKm+5sWzP+VdxreBZIS4APuC
	 fxBnbfJfzClmQ==
Date: Wed, 5 Feb 2025 11:06:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all
 properties are defined
Message-ID: <20250205-voracious-tacky-penguin-facbf0@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>

On Mon, Feb 03, 2025 at 03:29:16PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> mc-peripheral-props.yaml which has the additional properties used, and
> fix this constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Please ack and I'll take the series.
> ---
>  Documentation/devicetree/bindings/net/smsc,lan9115.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


