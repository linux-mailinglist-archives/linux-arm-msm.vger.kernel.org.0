Return-Path: <linux-arm-msm+bounces-71504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A26B3F5D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0263E485B44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABBE2E542B;
	Tue,  2 Sep 2025 06:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X17aZkJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EC2E3B03;
	Tue,  2 Sep 2025 06:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795557; cv=none; b=N8b9UebHIuOydfYqLG/MVAd3jmypQkjY300DOaw6X+1pjVODR/dCqrrL1PXt20f1F0YIXHrDH9CFZxMowcReEsM4cNq22etxcAA5tq/ZFnrF8K8T17UJMS6FW4EAa3EAsAH/c1CNijXIjxh+W+JDp59fDrizC4iZZ/AZb+CwNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795557; c=relaxed/simple;
	bh=pFmMbA7jyp9fnkPLORjV67rqIGevW9y5XwI5ILh6A5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4hKr3KBAv+QGJ3q+OMA5Ba1kSEewnocx0Q2Ie43AaRbByZVCGpk+9AlqBeUMPf0HTkX1GDCgYPUeeTHu0cyOkkc7IKQywO6M77fL1FkD3hoLIGthNdisNcDBP2NmPfJQo8ltWa8ADUpZ8fpxEaI2Ifx/ECS46c69GnGoiJ0nPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X17aZkJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B524C4CEF5;
	Tue,  2 Sep 2025 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756795557;
	bh=pFmMbA7jyp9fnkPLORjV67rqIGevW9y5XwI5ILh6A5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X17aZkJfraXk23e27vgK4zFo2NNXGuGkHRRt8/iaNUUg7wh8t25dlQgNDO5ZKnEwu
	 hGpVsKdjtNS/DpIx0Nfw+dub6ej7R/rPpPJHvbTVY7zHKvY77ceP+LLndLRrcHLCOC
	 GNwdqu9XCC7x7zLRwpTirjNoF6MMwTAZ6r3XSUjJenflXaLBQUme8N2G/GZ6E/E4je
	 zi2IbTjdlqyV3Uc53rShFHeWiiKGO9M6A/bnr4xUJVbYuXAaPTg82tTFaBBybT209N
	 SZLWqnmGhGY3kh0SVfILIpOVhGJf5OlTgH6lzprpdjr5RuW9auHAx19UJHOcIWaSpL
	 4CR+DdQGlRleg==
Date: Tue, 2 Sep 2025 08:45:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
Message-ID: <20250902-fair-outgoing-axolotl-f5aebb@kuoka>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
 <20250825-glymur-clock-controller-v5-v5-6-01b8c8681bcd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-6-01b8c8681bcd@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 11:49:13PM +0530, Taniya Das wrote:
> Add device tree bindings for global clock controller on Glymur SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,glymur-gcc.yaml | 121 +++++
>  include/dt-bindings/clock/qcom,glymur-gcc.h        | 578 +++++++++++++++++++++
>  2 files changed, 699 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


