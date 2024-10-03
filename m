Return-Path: <linux-arm-msm+bounces-33009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D054998ED75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 12:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5235F1F237C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F281527B1;
	Thu,  3 Oct 2024 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjXlP06E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96526150981;
	Thu,  3 Oct 2024 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727953140; cv=none; b=XTYe0H+VxneAfoKSUK2xkaZUO7Owq6XHP0kIqyS/w/z3ZNfnPrr+M1sgNUkf+PbkO2vodrexBpOHBUzcOw94uP8aDB+WiDBn1CUPUiOxyMJdCErhdpMlzF8PO/WNZBZj+RdKXFoRDAFDLygispb+A/uMUf5a3hzDiRHKH/axPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727953140; c=relaxed/simple;
	bh=NYQpbVuWi535GIQjlI54qCBfzcPdzFiPnQ3VayPfGUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+iXiTnxe0ibNjgx48QDGxKE+h8i6+BcXYslCbbXihFlxGbQHaEnQkZMI8vcoMzhtkMO0XwSZoXXfc7+R2LJJboMkbFYZ3lNn4KG+2YGdKeQgDQd2j2Y1HAkhQxctciCh8hJphqPQ0Qpoh9uRvjkZu6U4dOOXH9P8p8S8qdDsFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjXlP06E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4C2C4CEC5;
	Thu,  3 Oct 2024 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953140;
	bh=NYQpbVuWi535GIQjlI54qCBfzcPdzFiPnQ3VayPfGUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjXlP06EcLcNQAyY6Vao2IcoZKxwbxQcYHHN7Jpb2V1CJ+eQ/OeiOhyEjmbLR6eHQ
	 QMZ/DmhMhGyU+frb0UEsmwRRJ7zHMEarKC6kfaubrpMWHoSYdxl8dY4JmtqFLTpNf2
	 qxGdAm+iU5qYK1yAJnzJS3tVi6VjdZB/sxfP0qFm9NyH5ADRHqmxT/Q6PwLwgrco9Z
	 8raJmbtCyporpxVBVfP/KlZlZqX0FlFT+yzTxdVYDCV5cVaMSIA6zCMYw5VCFBZGfB
	 vCB6eqjKINdGT9MHsDIS+/CooMZgWgO/NJeKxw8gtHGBEGTxuadcF7aZojZru24egX
	 +vkCGLZr3Ypcg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1swJXx-000000003sX-2Uzq;
	Thu, 03 Oct 2024 12:59:01 +0200
Date: Thu, 3 Oct 2024 12:59:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sc8280xp-crd: enable bluetooth
Message-ID: <Zv549R8j7SRoA3uS@hovoldconsulting.com>
References: <20240930103041.49229-1-brgl@bgdev.pl>
 <20240930103041.49229-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930103041.49229-3-brgl@bgdev.pl>

On Mon, Sep 30, 2024 at 12:30:38PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the bluetooth node for sc8280xp-crd and make it consume the outputs
> from the PMU as per the new DT bindings contract.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> +&uart2 {
> +	pinctrl-0 = <&uart2_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn6855-bt";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +	};
> +};
> +
> +

nit: stray newline

>  &uart17 {
>  	compatible = "qcom,geni-debug-uart";
>  
> @@ -892,6 +915,13 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>  	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>  
> +	bt_en: bt-en-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <16>;

Why increase the drive strength? 

I see the bootfw has configured the wlan_en this way (as we discussed
before) even if it should not be needed.

Please add back the drive strength in the previous patch as well even if
you want to configure it the same way as the fw did for now.

> +		bias-disable;
> +	};

Johan

