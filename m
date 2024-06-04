Return-Path: <linux-arm-msm+bounces-21670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632A8FBCF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6881AB2661D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 20:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D67714C586;
	Tue,  4 Jun 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhxrVaaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9214B061;
	Tue,  4 Jun 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717531412; cv=none; b=ZqZ1qFX4qDGlV2aHaZaIHzUP3LeF0i8y6HPaZ/TWGTApZ2sd1iXe6hbbb+vLL5poC66ZH7jNoTELaeXt+rJfDq8tFaDWBu6IbxGJXxha/GJuhyF6ui2AFJvUjmrWIWWMZZQ7qhd3QW9P/6D2Yuj4QmDVUOpSteuCKbjrnRj2XHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717531412; c=relaxed/simple;
	bh=VCLwUoI/i0JqcxtBWc9VZ9k+0Uwoi+MZSL/jW1yYI90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc3PWUlWOJJMsljP0ospvgPyy3du9vAu3XACNJXf/OcUx3kOC3FdHZxjK9gIHZ+bQfHRkxZ5hs4/JqoITPI+1LUSLPn3zY3pY9RpPpPta8fSo2a3XVQMQg/Q7T+lVqIMr+3krKQLkhKUN2oQoz+9c4xsec743RkAmaaQsnj8dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhxrVaaA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E991BC2BBFC;
	Tue,  4 Jun 2024 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717531412;
	bh=VCLwUoI/i0JqcxtBWc9VZ9k+0Uwoi+MZSL/jW1yYI90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhxrVaaAL/SQLCbWCV8L5NlB9hKWEbEPzK2/sW4rxlhIq+KMW24Bx9K9uvgt7huId
	 6VSh4oqp3UPYMb6mPQaGu8Sm3M9Ztcw7zuy8Px9HOFUvqEyQnntFm572ywlf8Q8Awy
	 iDOkZdtSbfD1y3ViXbAA+9w3bdVlNsvrwwHPpn22EgRMM/nkhdFap6U6pHBnsNeRSc
	 +YuFTeFyYQfH1BKjObU1PuywCfHXzaQ344ey/pEl4+kX1YZy9iYTCWYj7Mxkuz6Ac6
	 JospFPvxH+bFjKN4lmumpwOxsdbhi2hNc8QToF+UbnKD8XEBevjEKq0SKLKqWAJWSG
	 b0+M7zQx/rMFg==
Date: Tue, 4 Jun 2024 15:03:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Message-ID: <20240604200329.GA1295824-robh@kernel.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>

On Fri, May 31, 2024 at 03:52:18PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
> applicable.  Several existing bindings for these display/GPU/CAM clock
> controllers already do it.
> 
> No external dependencies, this CAN be applied independently, but require
> power-domain-cells in each binding, just like Dmitry's new set is doing.
> 
> https://lore.kernel.org/all/20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (16):
>       dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

