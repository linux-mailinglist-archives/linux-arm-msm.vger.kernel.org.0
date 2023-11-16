Return-Path: <linux-arm-msm+bounces-762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C57EDB5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3479F280F13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 05:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9403DD2E4;
	Thu, 16 Nov 2023 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1Iqy3y7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F9D28C;
	Thu, 16 Nov 2023 05:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886BDC433C8;
	Thu, 16 Nov 2023 05:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700114342;
	bh=zIBoIMjkQLDuaFd4ozL0mTsfE2T9J5hDZSe6xZBhCJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1Iqy3y7jh6BFZb2lB98bTX699JnCUdr9D5+WAEDFYS/vICKSBwJbH1Gbm1dOtWFD
	 fK1d4RE9JV70ET68I4SHqnEEAU6Fhx5uwnYVi1hMUfGME8orECIb+8sGiOXRvLLZDH
	 IdGFqNDyyT30HPXPp0UlzzXOX+dPyRPYIninma6jyeoy5HgOQ8pol+UWdelrvnetJe
	 9l5RbraB2tTghn19QeBbmFCDo7YwkDCVJ8DvNeTUdq4H1MC3nUxihGeTmbFQ4wApVQ
	 JZb2OtyqqEKnEenTQ2smR3/Bp87yUoXGNLFFQ8at8F3XqpW/sY97sXLJYJ+5KV0X+x
	 J08UYLL5ARSwA==
Date: Thu, 16 Nov 2023 11:28:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: PCI: qcom: adjust iommu-map for
 different SoC
Message-ID: <20231116055847.GB3443@thinkpad>
References: <20231112184557.3801-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231112184557.3801-1-krzysztof.kozlowski@linaro.org>

On Sun, Nov 12, 2023 at 07:45:56PM +0100, Krzysztof Kozlowski wrote:
> The PCIe controller on SDX55 has five entries in its iommu-map, MSM8998
> has one and SDM845 has sixteen, so allow wider number of items to fix
> dtbs_check warnings like:
> 
>   qcom-sdx55-mtp.dtb: pcie@1c00000: iommu-map: [[0, 21, 512, 1], [256, 21, 513, 1],
>     [512, 21, 514, 1], [768, 21, 515, 1], [1024, 21, 516, 1]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 8bfae8eb79a3..14d25e8a18e4 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -62,7 +62,8 @@ properties:
>      maxItems: 8
>  
>    iommu-map:
> -    maxItems: 2
> +    minItems: 1
> +    maxItems: 16
>  
>    # Common definitions for clocks, clock-names and reset.
>    # Platform constraints are described later.
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

