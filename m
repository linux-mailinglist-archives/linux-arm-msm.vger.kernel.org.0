Return-Path: <linux-arm-msm+bounces-20639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35BD8D08B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 18:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866681F21EC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 16:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED17D61FF4;
	Mon, 27 May 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJPYjlpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC40E61FE1;
	Mon, 27 May 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827638; cv=none; b=ajjWKDP+Yl0fwIw4HgXJq6bvOk0RoM3eSkYrkK+pXaNpYcGJ72j9kSEFfLsAS8kpxA7oJlPY7iCuNB0pKEuR8lQwd+zsGKBc2ETqJ+a4hv14+dR9ELMLf/XQMdmyeFDiG7FAfbcxVwQoo8jCebNdyyrHsykLfh7pHzCMa3ELBRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827638; c=relaxed/simple;
	bh=FqwLRmZq7+sdJul6dGAtnX2DgoqP9PXXAfeDCFAU9F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0FAx6hA+6Gj+TWrxtIvuKZ1w7IyUMxJYREa0afsuxo70LXe4hOZkN9DAl0nNiSvUmaDoOsNyO9P3rlXOLFcdxNgQnHDbjQla7vqB6+VyxXRtS8Z8c81rHacCDjWYy/s6b+2twqaChtB8+t3F0nBlq+U9s7JNMHEx1sBI6/U/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJPYjlpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CD7C2BBFC;
	Mon, 27 May 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827638;
	bh=FqwLRmZq7+sdJul6dGAtnX2DgoqP9PXXAfeDCFAU9F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJPYjlpfQfU1/Omo2Hf+yu0gJGY/UyDbMlGw+tPR1grvIwXGPv8YVJxVIZ7Mymkoj
	 pio6+HfD+hWdU4TwlPSe9XtlJnM8Ix5kRh8jSUPFgUFjtrZZ2YtItH2N95gou//KtY
	 CKL397Fvt5D8QtnkIxu3091HHRFzaC+gmxv+bTipNF91tZP1p02LnL9y3/1PFbcwE9
	 z6/aoDbAYv1m4QiCykYoWjFEumHi6X8QkdWyxeatpOnj7h9KT5JxJtR/J6atyzw+Xi
	 wgUchisEMjGRqxgNyDO5EBwueCVglI/nkflD5NdS04iUC9GNWh0yx7AGujlBg0hp2J
	 rXVOEsBIuEanw==
Date: Mon, 27 May 2024 11:33:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm450: add Lenovo Smart Tab M10
 DTS
Message-ID: <r243r56bz7nrp2guaqj2n26exdv6y5jyjtoytmceutd3cqbaao@r5xk3qlspwsi>
References: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
 <20240523-topic-sdm450-upstream-tbx605f-v1-3-e52b89133226@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523-topic-sdm450-upstream-tbx605f-v1-3-e52b89133226@linaro.org>

On Thu, May 23, 2024 at 09:59:35AM GMT, Neil Armstrong wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
[..]
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-pm8953-regulators";
[..]
> +		pm8953_l8: l8 {
> +			regulator-min-microvolt = <2900000>;
> +			regulator-max-microvolt = <2900000>;
> +		};
[..]
> +		pm8953_l11: l11 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
[..]
> +	};
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8953_l8>;

JFYI. Not ensuring that the vmmc-supply is in HPM mode bitten us
multiple times in the past. 

Regards,
Bjorn

