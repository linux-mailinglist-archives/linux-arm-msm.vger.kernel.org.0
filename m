Return-Path: <linux-arm-msm+bounces-86360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E186CD994F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2049F30A8145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 14:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C4E314A61;
	Tue, 23 Dec 2025 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COTZoMHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA826B756;
	Tue, 23 Dec 2025 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499103; cv=none; b=ZtK4h/X15aUypTFwtotq9amlU6g+o2CmtLt3vIBcHqnSBMb+sFOHOtx16ZiyOAmbzynfIVQWMR1Fh0CMzwU45M0aYbPwMipnx5OmC1f0iDj3GOad3/VFNuT2LUrYPWCCqYtUHhhujBPiLcFUO0ThZ+GW4GY85U6a3vWUR7LyhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499103; c=relaxed/simple;
	bh=Vw4UJqL7y/2PtSO5nV/40KPKfyv41JdcmkxSU6VQWyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE6cOIs0ZrsEhGMUoEivGYgUxZ353EEEUFf5OkFsUesjgjkgyFQ8sW+Qbt6O92JN4EhSvn12UJDDO9puARyj8utmTFtBP8d5RcPrnv/J7gbHkdw2x/pt5BLUjHZv5oVdW+Jc0FiD39DWRad+Co7zRyMlFX5sb8PxHHWIVhGb8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COTZoMHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20F1C116D0;
	Tue, 23 Dec 2025 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499103;
	bh=Vw4UJqL7y/2PtSO5nV/40KPKfyv41JdcmkxSU6VQWyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COTZoMHkd7UnTEW3K0Q5PVYnNoN2Bfb5vf6ciwxI2YSsZeMvGsPVHFf0FznDj0uGj
	 LCyUgoX5c867zFlG83MywOBG4nylJhIo7BN8bSWuCfI7Edhe5tP9r2peRf8HG0Tagc
	 v/lFbocYFOXbPdOGx4jXQsTAQTK7dRU93QhvpLjX/LP1rDdoSZB8RXuVw1+Ar99FuV
	 FhYVH3o46EfMhIDGhf0NyCjIIQkQPzF3r0rVEG8df+LWNr/r+j1LRzXBmfX9E8htDR
	 6XOsV90czI0oNL0ISSgzIUd75js9kyXfBajVxPLZUZOculwWLvFcUP9fslCWBxnQLA
	 WvJY//iEXLEGw==
Date: Tue, 23 Dec 2025 19:41:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
Message-ID: <aUqjG4pVXWN3H88N@vaman>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>

On 19-12-25, 23:01, Krishna Kurapati wrote:
> Add squelch detect parameter update for synopsys eusb2 repeater. The
> values (indicated in basis-points) depict a percentage change with
> respect to the nominal value.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> index 5bf0d6c9c025..f2afcf0e986a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> @@ -59,6 +59,14 @@ properties:
>      minimum: 0
>      maximum: 7
>  
> +  qcom,squelch-detector-bp:
> +    description:
> +      This adjusts the voltage level for the threshold used to detect valid
> +      high-speed data.
> +    minimum: -6000

6000Volts, mV, can you please document the units?

> +    maximum: 1000
> +    multipleOf: 1000
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1

-- 
~Vinod

