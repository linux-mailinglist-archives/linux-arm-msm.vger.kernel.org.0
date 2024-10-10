Return-Path: <linux-arm-msm+bounces-33776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B1997CED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052691C21FD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51878193070;
	Thu, 10 Oct 2024 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doX/zZTv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F3F29A2;
	Thu, 10 Oct 2024 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540957; cv=none; b=RqB7cPQgkbFZ5T3XuuIqEvzAW5bPumza12gYiS7o50/i1NFsMe2TuER0amvvv5ExHMPWuGvMU7EfCQlQV4bB6ZWW5VCQEzxq/bA6USvBjv/VvbV2BFBp5s9s5hgOi2zdX0NGfibdO/X0pYd3w84SNH5IDxXOSopwBZlz5BZMqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540957; c=relaxed/simple;
	bh=d6VHCc12/e+8/rsJ+7n8CqF7F9GlZjZTg11jZQMnNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKGtAvTVCfCCEoDuPS7YdyNwxWe+JQk7hGWWelJrg4aVhZ7k7KJiaz9nVKPGdrbjeMJvRTvPxUQaZnwn1KkoMEjrCcqb0OiTROoUakpBO9sMM6wfXEtXW2VA4N8ZKgPjNegtc0gFQJNXU+bOfr3+NSk7wRtOwYpuBupDFczaox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doX/zZTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CEBC4CEC5;
	Thu, 10 Oct 2024 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728540956;
	bh=d6VHCc12/e+8/rsJ+7n8CqF7F9GlZjZTg11jZQMnNUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doX/zZTvJ8IT6fezuGeTm4roX5dRaIoG36NhCGetLiAQnrObJvL2SRv4q7V6prrCz
	 Lsv38E7/N/TVVhqlsLx5kg19SCJcG6tEoNtetl5tAqI8dnl666iseE4nhgvh+ezKoE
	 vrSggOD3wiKY4vdsR1bR1NtZFb+j0TCFjhlU6J14P/3Zz4c9ecsYzgMtn06dZmWcjJ
	 aBafmcRM/wrAj8cjisWKlWKxR1y4wXaERDDE721Dp5oQc/wusnW2l21TQ73NOaC4Hg
	 fQ3hueyh/FVDTGfymni2QI3zjXq3vU9/7SeUShi9q9CxDkf0OabeMwMbELe9kOOulP
	 6UNu+1HzxPO0Q==
Date: Thu, 10 Oct 2024 08:15:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
Subject: Re: [PATCH 3/3] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
Message-ID: <da45vocnwnnnlo6nrxh6x4xwmnsgdp5axfvomzniw5vxlmerer@6ntl3ae4q2ci>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
 <20241010-schema-v1-3-98b2d0a2f7a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-schema-v1-3-98b2d0a2f7a2@quicinc.com>

On Thu, Oct 10, 2024 at 10:03:45AM +0800, Yijie Yang wrote:
> Add compatible for the MAC controller on qcs8300 platforms.
> Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
> compatible.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 8cf29493b822..3ee5367bdde1 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -23,6 +23,10 @@ properties:
>            - enum:
>                - qcom,qcs615-ethqos
>            - const: qcom,sm8150-ethqos
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ethqos
> +          - const: qcom,sa8775p-ethqos

This block should go before earlier qcs615, to keep order by fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


