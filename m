Return-Path: <linux-arm-msm+bounces-38422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63F9D3534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1233F28322A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 08:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35906166F07;
	Wed, 20 Nov 2024 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBzxmEB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D715443D;
	Wed, 20 Nov 2024 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732090639; cv=none; b=HIlnCtIrk81vypIUfXpN4FJo4WLly1kYM6j9ZTfg1V4E/UdB1mSg5hPP7p/4KKO9CzWiWHZJvSZ16q9Em4S1LK4UH0yAWrQEbWbkalRFI01ssFiW3Nk+Db9gCqZknWpRX/Luvc6so2tBZS5io9Cou/qfVRsn9ZL6JcATEJqm01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732090639; c=relaxed/simple;
	bh=Pb1H3FL3YCJc3xpPQDsDWo6MJxmL9Kac9E2LA7abj8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KW9OcA8xk+mm2u3z+Sf66DVZ1jcaZ+wbujGDhwxSM/VLCJTmOzfsAEL0V2ELIeiH3UOd8+JP7bno5IbiOGOf4w2AdO4bOhKUa8h0/9Vv5AFkN2mKkH0E/njrMMSXgsaa5J8jASWL63nYtfcZLgpdbsi7GssoZ2ye+Bj3gEoBByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBzxmEB1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97EEC4CECD;
	Wed, 20 Nov 2024 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732090637;
	bh=Pb1H3FL3YCJc3xpPQDsDWo6MJxmL9Kac9E2LA7abj8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBzxmEB10YlUWMTE+X4WTXDbwsaBiSLfbhqrK1XU5dxJj9tJXtjHCu8ZsXsMX2LD5
	 rjXJR9YRxjkO3UeRGTGrj/asuOiyjV4tdrPuHEwGHp3vCb68Xowf7wryjw5tNU7PkB
	 aUJZWc0tpIBMDGcoQauEAZIxtsRsQmkPk8EaXSgXtrRWfdIn15S8URfxk2OYg3LSEz
	 zlyFponVaLznFDpJyqol+Am76vhEsf6WrP0FTEciH9NVCG/6gpjlgkxeffMh03wXUe
	 5hLE0uZ3NkALhOsiWMlyA9sQK+bvvydhiy22c6/J+YiJTHD5ZeR0lm96WbvEyzVvuC
	 af8jmM3mxMzTQ==
Date: Wed, 20 Nov 2024 09:17:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom: Add SM8750 GCC
Message-ID: <vzu23hoou5rbcucrsnauq4ygxmqzuonyvxvnarsgxycc7wrnro@vpxauk6zmq36>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-5-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112002807.2804021-5-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:04PM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add bindings documentation for the SM8750 General Clock Controller.

Subject prefix - use proper file prefix:
dt-bindings: clock: qcom,sm8650-gcc:

> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/clock/qcom,sm8650-gcc.yaml       |   8 +-
>  include/dt-bindings/clock/qcom,sm8750-gcc.h   | 226 ++++++++++++++++++
>  2 files changed, 232 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> index 976f29cce809..e50b5f1cad75 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> @@ -13,11 +13,15 @@ description: |
>    Qualcomm global clock control module provides the clocks, resets and power
>    domains on SM8650
>  
> -  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
> +  See also: include/dt-bindings/clock/qcom,sm8650-gcc.h
> +            include/dt-bindings/reset/qcom,sm8750-gcc.h
>  
>  properties:
>    compatible:
> -    const: qcom,sm8650-gcc
> +    items:

No need for items, simpler is just enum.

> +      - enum:
> +          - qcom,sm8650-gcc
> +          - qcom,sm8750-gcc

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


