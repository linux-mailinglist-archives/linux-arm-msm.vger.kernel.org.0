Return-Path: <linux-arm-msm+bounces-68990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59403B24AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA09885437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DBE2EAB6C;
	Wed, 13 Aug 2025 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKdJqjnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46C2EA74B;
	Wed, 13 Aug 2025 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092425; cv=none; b=AOjnU63NkmD/DOfbGneM5drdDwj4LqBm5JTmlbHW8kXDQ3nYwO0LPtshj9F+Y58nd/fDnBvw2sZ8csag0mMdeAYr3BpQ4IsxQZZtI/y7KK8nwKERjXm2oPOFgVHSKuArVc9IX6JiTe7SV0VYwZW5pEKbTw+KGqDAB/JMePnIujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092425; c=relaxed/simple;
	bh=ABkUOWC9dO33/kmvZXFne3hwNpt57QUxop/u2rKx5No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jD2m0/tlgifzd72ay5jF6f0CUF+oDD4K35rwjTs7Og8+AbK2cy69B7Zec7V49rDenLbpNZSdGW9YzIJZm12fhjyFF5n0A6X8p3DegsFDrnC8KhsGCbg6Qk0oT0X5NUdemocVspIOujUFN6/FGhk5/QzAxVOKZ5HG85Q0b/XDQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKdJqjnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9234CC4CEEB;
	Wed, 13 Aug 2025 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755092424;
	bh=ABkUOWC9dO33/kmvZXFne3hwNpt57QUxop/u2rKx5No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKdJqjnwYAKslBfUceq8onLF4jjachPiy4mmNcgq3HWu1XGDi2k1DP3hLd9f8W9id
	 GGuMAsU/MiK6w5+fY9EZVG1Ywh/d5gdPiS16rFsdKAACKk23B7OE35APtKfLzWyzLd
	 FhR1pmm7yE0G70DmX46s9f0AYJa9PzkVEOaW7IyzhAbTrg0dOmfvZmlPCSdPgw5dyG
	 ndYVkSXO6QGPVpuzgyQuFA7OToXs2ksLxxoJONhLz9KWpeNbDBcGZ9oYlX9iMt3dJT
	 F2fWcZXr+GqOpFCS6ylEW0HuLX48mX/MDnO3mlFOSWCG/2NP8gL8VpWJ9KnRxhch8B
	 l2E+MmtA/0wSA==
Date: Wed, 13 Aug 2025 08:40:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Message-ID: <y4g3xj3i6hpnetoxiq6uh2altlxjdnrff3wv5c4tk42uh52jn7@ymb4qhehvy4n>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 01:25:17PM +0530, Taniya Das wrote:
> Add bindings and update documentation compatible for RPMh clock
> controller on Glymur SoC.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index a4414ba0b287b23e69a913d10befa5d7368ff08b..78fa0572668578c17474e84250fed18b48b93b68 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-rpmh-clk
>        - qcom,milos-rpmh-clk
>        - qcom,qcs615-rpmh-clk
>        - qcom,qdu1000-rpmh-clk
> 
> -- 
> 2.34.1
> 

