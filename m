Return-Path: <linux-arm-msm+bounces-21449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47978D7DCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6053B284181
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25F25EE78;
	Mon,  3 Jun 2024 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUHoZvRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D93D551;
	Mon,  3 Jun 2024 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404500; cv=none; b=K/62TFicGr/D29YRvm+hg4DcefKRR8/9dYMtuB7LZseeijizLjgAIWJGnn4wiFR2XZTkoEQGb0lMr5FIwZwngo5PSR8HJfSlr1qNHj6zR8Liufm8Smf2Zw205YJ54KVEBtYuymoRNEIgX7AbCnhx3Pp1/s/9xXLL1EeBXqOt2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404500; c=relaxed/simple;
	bh=u56cQQyMmZ3JOBwf5RvEi1tVKT1f2xyCDIc7eW/pGqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsaVsUvG6v+ZXi8d8ub3ruqe6aS8I8Ubl8MBr6XGm1BhgXUcNyEOCOMWTZjcE4bhHUygSfYWe986nzalGUYRFk+n5v6T2RP+Rzos9x+Bj8QaP9bO/kLv2MZTeQt/yes6FWG9voWdtZs9AIFyCMmi5kyp8GOQIYNwQIFQxwjUTeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUHoZvRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEDFC2BD10;
	Mon,  3 Jun 2024 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717404500;
	bh=u56cQQyMmZ3JOBwf5RvEi1tVKT1f2xyCDIc7eW/pGqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUHoZvRgYkMgQFilzW1kNsTwulNMZ6G7id+p04gQc+4FfxaYqRGxYNAHaBmdHb7Sx
	 g0MDQH7PSRPgUH/3JthcwLhpImsFH1EdILhJ3dFBeU881CD0LCekAe1kNg0qeO+ARU
	 XzX60mvv+dqRhE405fxY6GlbFd6jCY2udGPzLlqACRtqwnSxXQpfw7nLIryj8R8UEA
	 F0gIWGG/lIGwaj0dIQ/+nLKUJOqLEhrtMjuPosLZhRlY3wmAd42CCkKLiDYH+aIVzq
	 +Om5/89OWCBM5Q5hDBSFOpnv6wuuhadpjvL3akvUqMBtTEQugDL7t8pwSV1iefAhUN
	 eBwvabFNDWHwA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE3MX-000000007TS-3GLQ;
	Mon, 03 Jun 2024 10:48:17 +0200
Date: Mon, 3 Jun 2024 10:48:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node
 with all 3 connectors
Message-ID: <Zl2DUXWUN0088-Af@hovoldconsulting.com>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>

On Mon, May 27, 2024 at 11:07:28AM +0300, Abel Vesa wrote:
> Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> for USB only, for now. The DP port will come at a later stage since it
> uses a retimer.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 143 ++++++++++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index c5c2895b37c7..2fcc994cbb89 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -49,6 +49,101 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;

With this series applied, I'm getting the following error on boot of the
CRD:

	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

Known issue? Do you need to enable some quirk in the UCSI driver?

Johan

