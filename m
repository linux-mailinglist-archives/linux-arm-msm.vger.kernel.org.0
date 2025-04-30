Return-Path: <linux-arm-msm+bounces-56199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805CAA432B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35956179859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2471E8338;
	Wed, 30 Apr 2025 06:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffmELrSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB11E503D;
	Wed, 30 Apr 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994843; cv=none; b=gKWuOK2Js20ei8wYYkcdU+Le97CnLWAPZYfmiDBKPAGpaW+mCeHcWNzp9aSxvHsISNyQx6eYwMH7PhlkDk4oGtLwez6Wm+Ksg2WjdGjr9EIquDKtnYqpTDHJRHPdbFuirqOqT0QAhO9F0u5BgtjH0EGrqTEmjNYljrdrkMOe1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994843; c=relaxed/simple;
	bh=IyHB6uFWCj9O2ik4uLLUV3YzmH1JqtPLDd77B+UQYN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1MWBTRUSLxDIdYiDcLLo+D7YjJl3bWodnS8TxqubJ49zvJ+iiNgRQ96jMG+i+xRwYWA/QyIUc/bup97K5+QtDKo+dMUFI/Qp1XDroILHbFV1wBLog26IIghGdfagGQqOGYGyRHbD5N2P+wu/3fRze3Ub1MO0u5vRqO11s0YYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffmELrSS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACF4C4CEE9;
	Wed, 30 Apr 2025 06:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745994842;
	bh=IyHB6uFWCj9O2ik4uLLUV3YzmH1JqtPLDd77B+UQYN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffmELrSSn2yHjyD6oPPn8UMvaOpXb+C4hNIWiHRbZFIdEYaLtdOV3NAYvTrY8/Xik
	 5iBLd1wJBfblbGzmi187EQorFBmoLRX8egIbK7QJ/rRi/mAmVCuCWWJKvIKEWerzTU
	 bCGX6hG+E75ePJtp28zypeEgi6QEAdBrFNroQHpth2KJ8S/anDJCYdDl4Yt/8m7Oab
	 /HxUrwnJsK+V7EQJgCn/ZGp5Wv9MLQ0DfJRsi163W+22F/8ESsxBV7D0D1uvsqyAY/
	 uqcrEbi+sK9Hcf/q74pUnWEeOvLTQGAoHOSLlk3pF1TBq9q1qvIeYeEvb+bZINew7Z
	 oLCQHVOFk2Ccg==
Date: Wed, 30 Apr 2025 08:33:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <20250430-enlightened-enchanted-jellyfish-7049d0@kuoka>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
 <20250429054906.113317-2-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429054906.113317-2-quic_wasimn@quicinc.com>

On Tue, Apr 29, 2025 at 11:19:01AM GMT, Wasim Nazir wrote:
> QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> QCS9075M SOM is based on QCS9075 SOC and also it has PMICs, DDR
> along with memory-map updates.
> 
> qcs9075-iq-9075-evk board is based on QCS9075M SOM.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


