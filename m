Return-Path: <linux-arm-msm+bounces-52730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB68A74511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDDD73BAFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C29212D8D;
	Fri, 28 Mar 2025 08:07:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B4212D67;
	Fri, 28 Mar 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149277; cv=none; b=ZLNCNczeZzie7QoRKoJ06XrotWTTFM2t7KkW96MP788X+WyeXqN/b0tpiRe3kqCkzKrib/eY6zRoZKhfuZ/UwMkw6y1ntgznIffMfT0Hq+tnGvHKCPl7ElDcAErqrt1jScaIK2dXd9YYXCMvlt5Q4EnAET+/2feuqpN2ZeWV8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149277; c=relaxed/simple;
	bh=3xUZXpN8D1lX2nEy3t/qnZ5UZ74iZPzdr+7+jYDYfG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2scn03sDRbXHNnUKeOiIV2Byr9HTrGUZLg+8iTrXqupswGcqgFHlJ+YGiNyo3afN8etjx/I9a0zSVIUmbeMEcxb/e1xz0i1McCMeQhQD4wEs0EaMqsSlKGlBGIYpPECXxmzXkj6N9w3tF82Q1rIajBuErfmKBzyAo601WB5rFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76459C4CEE4;
	Fri, 28 Mar 2025 08:07:56 +0000 (UTC)
Date: Fri, 28 Mar 2025 09:07:53 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <20250328-nifty-oriole-of-admiration-d20b05@krzk-bin>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>

On Thu, Mar 27, 2025 at 03:22:22PM +0530, Jagadeesh Kona wrote:
> Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -17,12 +17,14 @@ description: |
>    See also:
>      include/dt-bindings/clock/qcom,qcs8300-camcc.h
>      include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>  
>  properties:
>    compatible:
>      enum:
>        - qcom,qcs8300-camcc
>        - qcom,sa8775p-camcc
> +      - qcom,sc8280xp-camcc

That's not equivalent. You miss required-opps.

Best regards,
Krzysztof


