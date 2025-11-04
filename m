Return-Path: <linux-arm-msm+bounces-80202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D3C2F227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6CFB4F513D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C4D26ED3B;
	Tue,  4 Nov 2025 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tV2zmPgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681D26CE1E;
	Tue,  4 Nov 2025 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226047; cv=none; b=n/RXWUFzmugQ7VMyZymiqsAAlf5AJg0wMey7TkUEwpR9AEAxhY9/rw2I2LBm8/PjQXVuvQgxexKSCd1KYTBA5gVeIL65AHfdsGCU53ihL6h/60jQU7WVOBuc0h58BAraqcQ+2ovZ2es8z6pWm54aaooobytx6z8uyZiq+3T5A0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226047; c=relaxed/simple;
	bh=DZHl0ihOnYFAm39ypxruvP9nWML/cZJvezdTfGlkdTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7nLQNrrg55z0JVb8OppuwCu4fSTAoqjHvROzrzoSVAIbcoS/uJlXjYfLDDYCmr5o3jee18jeyGh/cadleu5mj7gl5L00jQk9kd4oEH9RvWctbEKF+gc1/CdTLYVUAN7kFEeh+NneVisYspcS8gvYqXwQAx+lAhUaX/YMN7jPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tV2zmPgx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19943C4CEFD;
	Tue,  4 Nov 2025 03:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762226047;
	bh=DZHl0ihOnYFAm39ypxruvP9nWML/cZJvezdTfGlkdTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV2zmPgxCUJA40QvtrbYs30bR0R5PHqo/F3aFnwmf/uTMS8nxwcZRuYYf+YAf7kOS
	 8qX0MZNmn65lqkNVYLeFftWGXGme+nxIxzQJq3ZeXX46ZIj2+1KS/Q2fA5o5tG59BS
	 97afXom9Tu1mnqweMcHxleVT4QlAimh4vYr/ZjaihEkEJLEmmAO+LO+lb4iyHYeC3E
	 ReBoXbo2OcpvIB7UD6DKkXYBlXoK6/7VeUteZ88tm03cp2F4ALx49dZvn3BcdOf2NB
	 Ztf0WCYRcYZufG0TLOC0UEbmbLb12G3VhpdkIx70FcpneOQrlNpbi5esZW+uPpqYed
	 xOAQSbmBDoUHA==
Date: Mon, 3 Nov 2025 21:17:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <5t6v2wn56v7i253pzm5ytgysma2s5szggh6y42gghnsbx6iap7@sbfvnhxsmgjs>
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>

On Sun, Nov 02, 2025 at 11:25:06PM -0800, Jingyi Wang wrote:
> Document qcom,kaanapali-imem compatible. Kaanapali IMEM is not a syscon or
> simple-mfd, also "reboot reason" is not required on Kaanapali like some
> other platforms. So define a common "qcom,imem" binding and fallback to it.
> Currently there is no requirement for any specific implementation for the
> "qcom,imem". Its child node "qcom,pil-reloc-info" has no implementation
> dependency on IMEM.

I think this could have captured the discussion leading up to this
result a bit better, and the fact that this isn't unique to Kaanapali.

But I won't insist on a rewrite.

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml        | 77 ++++++++++++----------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 6a627c57ae2f..09278b21acf4 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -15,42 +15,47 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,apq8064-imem
> -          - qcom,ipq5424-imem
> -          - qcom,msm8226-imem
> -          - qcom,msm8974-imem
> -          - qcom,msm8976-imem
> -          - qcom,qcs404-imem
> -          - qcom,qcs615-imem
> -          - qcom,qcs8300-imem
> -          - qcom,qdu1000-imem
> -          - qcom,sa8775p-imem
> -          - qcom,sar2130p-imem
> -          - qcom,sc7180-imem
> -          - qcom,sc7280-imem
> -          - qcom,sc8280xp-imem
> -          - qcom,sdm630-imem
> -          - qcom,sdm845-imem
> -          - qcom,sdx55-imem
> -          - qcom,sdx65-imem
> -          - qcom,sdx75-imem
> -          - qcom,sm6115-imem
> -          - qcom,sm6125-imem
> -          - qcom,sm6350-imem
> -          - qcom,sm6375-imem
> -          - qcom,sm7150-imem
> -          - qcom,sm8150-imem
> -          - qcom,sm8250-imem
> -          - qcom,sm8350-imem
> -          - qcom,sm8450-imem
> -          - qcom,sm8550-imem
> -          - qcom,sm8650-imem
> -          - qcom,sm8750-imem
> -          - qcom,x1e80100-imem
> -      - const: syscon
> -      - const: simple-mfd
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,apq8064-imem
> +              - qcom,ipq5424-imem
> +              - qcom,msm8226-imem
> +              - qcom,msm8974-imem
> +              - qcom,msm8976-imem
> +              - qcom,qcs404-imem
> +              - qcom,qcs615-imem
> +              - qcom,qcs8300-imem
> +              - qcom,qdu1000-imem
> +              - qcom,sa8775p-imem
> +              - qcom,sar2130p-imem
> +              - qcom,sc7180-imem
> +              - qcom,sc7280-imem
> +              - qcom,sc8280xp-imem
> +              - qcom,sdm630-imem
> +              - qcom,sdm845-imem
> +              - qcom,sdx55-imem
> +              - qcom,sdx65-imem
> +              - qcom,sdx75-imem
> +              - qcom,sm6115-imem
> +              - qcom,sm6125-imem
> +              - qcom,sm6350-imem
> +              - qcom,sm6375-imem
> +              - qcom,sm7150-imem
> +              - qcom,sm8150-imem
> +              - qcom,sm8250-imem
> +              - qcom,sm8350-imem
> +              - qcom,sm8450-imem
> +              - qcom,sm8550-imem
> +              - qcom,sm8650-imem
> +              - qcom,sm8750-imem
> +              - qcom,x1e80100-imem
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - qcom,kaanapali-imem
> +          - const: qcom,imem
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 

