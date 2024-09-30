Return-Path: <linux-arm-msm+bounces-32725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A848198995A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 05:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9AB280E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A525A2A1DC;
	Mon, 30 Sep 2024 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9Z/Eo/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DB79EA;
	Mon, 30 Sep 2024 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727665828; cv=none; b=Ng5BrVOk0iC4PRHIJxH2EdvWwqVzWG9BhYDWiJmLEPpwIjaD3tBnVGTjmHQbRZqM+5uCS79JxiEugbrBaQ4Ze4JLiJPXZT0ivmHeSVpZHanT+ZcweCg66ByWjYqxzOoHSTuVfqDv3fEDtIFsoGS5Fq2rnICp/7FTxPdWEp1J98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727665828; c=relaxed/simple;
	bh=zZAvJDZgcoH9zkeQvxQPiQLAzljOGnYi0l/Pq/arwCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7dAKUnB3qepgCOmTVqlvE+NaA6AtmJktOWxmwSy9Bukoeh6FHMjQV9hArZSc3o2BkzY36mlxcjp05lEPBYwKC57Cgqr6XX7o3KloX7i7asaV4Nn0rfObtJDax7jQukWxvwuGNJWec8mDQUZTqq7ATCW3mZKTDm490LIUt6nI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9Z/Eo/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E6CC4CEC5;
	Mon, 30 Sep 2024 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727665828;
	bh=zZAvJDZgcoH9zkeQvxQPiQLAzljOGnYi0l/Pq/arwCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9Z/Eo/ciODZy+azJRUWaErJoEEXLoT6Q0NPq+g4tN8SrzumNZfxUl19E3o8y9rf3
	 wmCIwJbntW4GFNSOEmrOVjuTPDv8y7nvkYt7+ho67f50jIzYIKVcKmRnm2rlgfiCHT
	 aZq4j4sbUcp6M3l29qXEkRGNxTFZiFX1j5ySeyQG51Vsy+xWDuATRDHV4X6AIypzmL
	 zvTH6IbJd9YWWsOhqZ8rxm2Ud0tOpZjSDQ7DIXTSButJRLa9Gwahm6psAiV4gdsu6R
	 KI1vZXw0g7LjqPnnOLjYuoG2+M4DQztG5tR3JztPJKFhucfMc5rQJnbz1nkhhkaWbL
	 UmMfgoAVczfZQ==
Date: Sun, 29 Sep 2024 22:10:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add EC to Lenovo Yoga Slim 7x
Message-ID: <kwycsu5vkauxsmojdzl2tu2zs5rvmiycqpmgkwredcw76tgkz4@ldwfi2zzvh2k>
References: <20240927185345.3680-1-maccraft123mc@gmail.com>
 <20240927185345.3680-3-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927185345.3680-3-maccraft123mc@gmail.com>

On Fri, Sep 27, 2024 at 08:53:42PM GMT, Maya Matuszczyk wrote:
> This device has an EC on i2c5 bus at address 0x76, driver for the EC was
> added in a previous patch.
> 

No concerns with this patch, but please Cc: at least all the mailing
lists on each patch, so that I get all the patches in the series.

Or better yet, take a look at
https://b4.docs.kernel.org/en/latest/contributor/overview.html which
magically handles this for you (b4 prep --auto-to-cc).

Regards,
Bjorn

> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index 3c13331a9ef4..63b627f60ec7 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -536,6 +536,22 @@ keyboard@3a {
>  	};
>  };
>  
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "lenovo,yoga-slim7x-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>  &i2c8 {
>  	clock-frequency = <400000>;
>  
> @@ -794,6 +810,12 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> -- 
> 2.45.2
> 

