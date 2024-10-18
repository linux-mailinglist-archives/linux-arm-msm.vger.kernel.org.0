Return-Path: <linux-arm-msm+bounces-34864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323A9A3625
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E82C2814C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B762917B41F;
	Fri, 18 Oct 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELggh48y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621417E472;
	Fri, 18 Oct 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234293; cv=none; b=XwiP+bA7HSTsX0xGgFGDrlWHb37qyw/4+bvo0q/iVbw9TujFXFBAXkLeVcrHbK2+eHgmPkdaRzXaRJgf+8fVNHsuXFOm+Lp/r0sXUW8+niMlpXSxwKe19sUs/YJ56kKON42OvXQibJNqnMufXfFdJA+80HfpvK4qqkIVWeO7OFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234293; c=relaxed/simple;
	bh=sUuiyWXodwKVBm9kq9rKKI8q25ACU7MeeBUloNr5nAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO64tfSjsuaANGPfvRNk9J3Tccv2iXbcSRhBo+bKb/5Yw+0fDlzRhuCVNwxliHZ4PxxTtbzVqJehWethozBGJFU5KAvGbwysglrL/mY9u6hQ+4yHQJ0victQX7mZJDb9rtrjaaaKkfCHMm165a3TbEFXZzLmFIX2ycCvyxBwkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELggh48y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F21C4CEC3;
	Fri, 18 Oct 2024 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729234293;
	bh=sUuiyWXodwKVBm9kq9rKKI8q25ACU7MeeBUloNr5nAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELggh48y8E9Ei3tWaihiUZUk5ZoPWhvwG4dLdFR9zncmhSJlUPsOwOj720vXuluT4
	 gryCpk4ME1PcJKdLj2HM3BsuwkUpVZv7T0rvU0PTwwR4RE0FbYWoC22nQxQR6VRdWD
	 JyTrFanTJuiq5Cvx5HG+V+ThVveRs4x9hkqHBk1fZudt8W0a4GJJMfUoguXGcXOIrQ
	 28N/MlvCDISE1ZOJ41EzdFQvRStDgXlHGBBlWB7ZgOeetjMAJ876yzJdu4BcgswySo
	 O1Kwtt/5X8igDutbRj+19qOISP1K6nUoWsTmvCbqFH/XEKMyqnYZwNQB8X5WzWHgNS
	 7LtitnDGvHzQw==
Date: Fri, 18 Oct 2024 08:51:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Message-ID: <npyk6vwcznx3iwm3a3qxeu4dn5nnkprown6iax73rbpzghnt3n@zfxvwvll4pl5>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-5-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-5-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:55PM +0300, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Expand qcom,sm8450-gpucc bindings to include SAR2130P.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 ++
>  include/dt-bindings/clock/qcom,sar2130p-gpucc.h    | 33 ++++++++++++++++++++++
>  include/dt-bindings/reset/qcom,sar2130p-gpucc.h    | 14 +++++++++
>  3 files changed, 49 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


