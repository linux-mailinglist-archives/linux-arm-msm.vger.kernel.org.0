Return-Path: <linux-arm-msm+bounces-46929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8578A2874D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D35162E4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2059227B98;
	Wed,  5 Feb 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFRPfzpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89521A945;
	Wed,  5 Feb 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749891; cv=none; b=krvIL+W30uvQbjWzB6b+hyCkZhfw//ZqZkgl5kOAtIZFK6QTLRfpXwyCLn6lG3IpE1yo9YuU9G/x6WG6tTbI3IJI8Z4q7BRN4B8dTqfXmhSuli0bl6FVzvM1nuNULzgGSyFw27i8wv6W1hKqLYeG55NNfYgqNVNB5kO2HUH8NM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749891; c=relaxed/simple;
	bh=wiFPSU9Nu6XcNSSf48rTUunTbB1K/IA9ZU1/GaPkPSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExWoNjfkSTrnZKlRdKb4tSHSUTE/i9zowwhc105++QJ3z4zDjaOMhgmKXN1X4VISYx9UeHQZvQlQ5RJlcAJCU60e8Jdyhk6vHgmf/GCbCKCDeS2Qtpf3hvXdK8r23ya8WY2Q7bTcVUCq85/9FCU0uDloTTXGAJpvNTqZqn8YXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFRPfzpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04202C4CED1;
	Wed,  5 Feb 2025 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749891;
	bh=wiFPSU9Nu6XcNSSf48rTUunTbB1K/IA9ZU1/GaPkPSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFRPfzpZCD9spWSDgrws1wfBDubGn65XxXY3D8WfJTWj36wGmqEBcAc9WlkpzAPZ1
	 BLcoIIF7AXFaF8qRAfZ6rDG8r71B2YtRJxIh9/Y9nljwHDqooLnaItuJ90LqvRYNqK
	 oW/zEv19bgrZM/LhhZsLS/wKJCd2kmOxoBDdRlDyHi88w5Yp4wmJ4jBPqt1WEZb2bz
	 rOVhQQufGSpmD9lBfDsNA6tASQeRys4TyqVRStfSt25temHkKj/IA+1BXNY9zSeSAv
	 8bZ6G2/rTgIu6UG6OMMp4Fu38uvoJBWJF5mz3tyIB8zS3h8tqpaIllDhoSLvNwGgLT
	 RTjMB7s1wE3Cg==
Date: Wed, 5 Feb 2025 11:04:47 +0100
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
Subject: Re: [PATCH 1/4] dt-bindings: memory-controllers: Move qcom,ebi2 from
 bindings/bus/
Message-ID: <20250205-nippy-spiritual-tortoise-b0a68b@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>

On Mon, Feb 03, 2025 at 03:29:13PM -0600, Rob Herring (Arm) wrote:
> The preferred location for external parallel/memory buses is in
> memory-controllers. 'bus' is generally for internal chip buses.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/{bus => memory-controllers}/qcom,ebi2.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


