Return-Path: <linux-arm-msm+bounces-45804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E02A1908F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 12:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545D9167261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3092101AD;
	Wed, 22 Jan 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rU6R9uBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A83156F2B;
	Wed, 22 Jan 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545180; cv=none; b=IW6wGUlLo0XU1MYGGIUFdsKhF0pAPOfETgHN0nLcLhKHXEfkElcUuMC1vlFcomKoiuDhLGAAy7o36haimYf6P1HTc89kRjzsWd6Fy0RIoyMDpIB2GrDgebkxUPo7tpZGa3o7wBSe1IAR3r0Ld+iDnQNLS2bbBjm60ONjzUDXsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545180; c=relaxed/simple;
	bh=lKzMilVdbZHvBenGRQF3MsI1g7/CdomXUYYJySm5a/M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eeZ+kjq8kONzPySyipHS5Iag31OPOxfEIVs/w6CqC9Fq9dZg33K8DWkR5jOhfWFqPvx4wouEsSwMsDTIzG10dtSdom1t03aNLlP0qRB4mmbU59cWLCBegBLRLaHl3F56TkjAD+DEJeEkfIqT2Wxm9MFGju4Y+lNIt+Zm8Dzifn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rU6R9uBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D175AC4CED6;
	Wed, 22 Jan 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737545180;
	bh=lKzMilVdbZHvBenGRQF3MsI1g7/CdomXUYYJySm5a/M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rU6R9uBPGRutxliDfwe/SqrT8elk512k3yaFL2IKojG/CtZgt0B1FgsE3DHJPy7oc
	 lkVXJDYn2qs0xTFQDqSSLHgDM2vauxh+fW2hgbA2GeatC5snMIX1Wt4psMQUfF0Ah2
	 Fq8xPDl/Kfp2vkdpq9sjWhj+7Yh016xeKS/e2iPe0i77W1EdbBpAuC5FbclI6C5LVx
	 /+LlzcagKzsjkcinPkMMlkr+iH0CoWQ4tzlLso1uDYNABrn3sDG5/vJ4p8oQg2Bsqy
	 xSuYRslBximhvDoBhay+AJfD3sgr4eFlak+iH0gw0GXC245JPwur+4wIzLQYUrNokx
	 ay+hUNQYOpZcA==
Date: Wed, 22 Jan 2025 05:26:18 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: quic_cang@quicinc.com, quic_rampraka@quicinc.com, 
 quic_sartgarg@quicinc.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 devicetree@vger.kernel.org, quic_narepall@quicinc.com, 
 quic_nitirawa@quicinc.com, Adrian Hunter <adrian.hunter@intel.com>, 
 linux-mmc@vger.kernel.org, quic_bhaskarv@quicinc.com, 
 quic_nguyenb@quicinc.com, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, quic_mapa@quicinc.com, 
 Ulf Hansson <ulf.hansson@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <20250122094707.24859-2-quic_sachgupt@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
Message-Id: <173754517865.540478.12441609839143444772.robh@kernel.org>
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400
 and HS200 modes


On Wed, 22 Jan 2025 15:17:04 +0530, Sachin Gupta wrote:
> Document the 'dll-hsr-list' property for MMC device tree bindings.
> The 'dll-hsr-list' property defines the DLL configurations for HS400
> and HS200 modes.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml: properties:qcom,dll-hsr-list:maxItems: False schema does not allow 10
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250122094707.24859-2-quic_sachgupt@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


