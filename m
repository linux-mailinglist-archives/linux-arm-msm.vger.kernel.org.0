Return-Path: <linux-arm-msm+bounces-59749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CADAC73E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 00:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390373A3F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 22:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42B5220F59;
	Wed, 28 May 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDhpQTBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A61D7E5C;
	Wed, 28 May 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470858; cv=none; b=nGORx3p2U37cyR/B3gY7sdDnxvw9Ln0OCe9JN3Ere9BfzryijY3psKDs2GiP50QCRHrfty9dkjQ6L28sCNr518eUFi0Icz/mimwzYlDqY+KwzeP7h+6ePUeJW4LVo+iJFhmUncpzcH/JXdhu+uFFfGGnphxJwbLyQtF1JsbXcvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470858; c=relaxed/simple;
	bh=mrZD+ggODWE5aBnY1HFD+0E0/1nnc9vpSv6Kg2CDvgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgwpjgUkPtF0nDsDR4pjjqcNe18xZhoS0VmfYO7A80scwmiLCKRw+IjPAQ6xSy9BTmZihxyblqg0fEbVaZ1Opk4o0+E0Sz+1LO2wgNmzbhQ0/IPO8fqfw47p3yDE9PWjb54lZq+Ynsx6C4ecIV8KdG6G0zdSKhzD5xh3qq9e8v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDhpQTBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EECC4CEE3;
	Wed, 28 May 2025 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470858;
	bh=mrZD+ggODWE5aBnY1HFD+0E0/1nnc9vpSv6Kg2CDvgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDhpQTBK4P/pHtteF26cck/zqEwuGm3zguNMfD0TQ/fjfuk+fSCpEd/4El9fO9ARa
	 8EI1fRl2gmQ8mWQpFUm2xSPcYIREC2L6yMxJvTM+9w88SbvjrwQe43RBhBuldbWnbo
	 IckgYir2uWAWF1IrHBe4Img2LBLTxVQiuzw0B7FK/xAh+I5l9M7Uo7tf9TAnU1tGgv
	 jTpFVZN4mKXuDqGkQZKb8A2nU20F0RttjFG7UBzGE56nwY02AI735iELsu+LovF5gn
	 wTTSDJuFyb7dB27ZtbcbwHTt3xcAiF6edt6VS9pyuqMvYJT3Qkv2R44Ze+K/DaZ/fN
	 MywnkmyGoCejA==
Date: Wed, 28 May 2025 17:20:56 -0500
From: Rob Herring <robh@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v8 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <20250528222056.GA907125-robh@kernel.org>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
 <20250528122753.3623570-2-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528122753.3623570-2-quic_wasimn@quicinc.com>

On Wed, May 28, 2025 at 05:57:48PM +0530, Wasim Nazir wrote:
> QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> qcs9075-iq-9075-evk board is based on QCS9075 SOC.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>

This is missing Krzysztof's ack.

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 56f78f0f3803..3b2c60af12cd 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -58,6 +58,7 @@ description: |
>          qcs8550
>          qcm2290
>          qcm6490
> +        qcs9075
>          qcs9100
>          qdu1000
>          qrb2210
> @@ -961,6 +962,12 @@ properties:
>                - qcom,sa8775p-ride-r3
>            - const: qcom,sa8775p
> 
> +      - items:
> +          - enum:
> +              - qcom,qcs9075-iq-9075-evk
> +          - const: qcom,qcs9075
> +          - const: qcom,sa8775p
> +
>        - items:
>            - enum:
>                - qcom,qcs9100-ride
> --
> 2.49.0
> 

