Return-Path: <linux-arm-msm+bounces-668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0A7EBD71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21480B20CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E552E856;
	Wed, 15 Nov 2023 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7UTwy6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4163C4;
	Wed, 15 Nov 2023 07:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38327C433CB;
	Wed, 15 Nov 2023 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700032557;
	bh=MqgzQQOu8k3naqWebde+daNwOSL9eli/d3myBSRtR24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7UTwy6SU73judLJIIm68X2W3qJppWcb4CM6fOQeLWa1Gt5Ev0KQk9ojN9NCJtKjR
	 Hw7u1aLwf0STckZ98EOd1CAnDPmo9QR1Xv4a2HnsKxOny5Kg/vwIphr17srpvZuqtF
	 e9471oeN9SFLWOSE8IFejUUd2O//US+rmSWJISf+XCGKfDv6t2254rKR0TCoE02qNb
	 tSpGvM0FrlP4Bi14MHQvSrOAZgvkmYprfwnWA0PGqYgQU0QmEYUd43Ls8pguP/Y8G4
	 URBRg8WM/i+kl+dzhGJyMkZqY5LqzW39fq+kB0e7NlixQ5LiAvAq6dNtBqvcPYyWle
	 8ZB3rR7YqE/DQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3A7t-0007rg-2A;
	Wed, 15 Nov 2023 08:15:53 +0100
Date: Wed, 15 Nov 2023 08:15:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Document sm8450 pcie phys as having 4
 clocks
Message-ID: <ZVRwKaUTDBaYsnQS@hovoldconsulting.com>
References: <20231103230339.966792-1-quic_eberman@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103230339.966792-1-quic_eberman@quicinc.com>

On Fri, Nov 03, 2023 at 04:03:38PM -0700, Elliot Berman wrote:
> I noticed while running make dtbs_check that
> qcom,sm8450-qmp-gen3x1-pcie-phy and qcom,sm8450-qmp-gen4x2-pcie-phy have
> 4 clocks, not 5. There was also a typo for the 8450 bindings:
> s/gen3x2/gen4x2/.
> 
> Update the bindings to reflect the correct number of required clocks.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 505fb2541678 ("dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml")
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 2c3d6553a7ba..1768f2016a9f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -128,6 +128,20 @@ allOf:
>          reg:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8450-qmp-gen3x1-pcie-phy
> +              - qcom,sm8450-qmp-gen4x2-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +

I'm not sure which tree you think you're looking at but this is clearly
not correct.

The phy nodes in arch/arm64/boot/dts/qcom/sm8450.dtsi have five clocks
defined.

Johan

