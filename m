Return-Path: <linux-arm-msm+bounces-33010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3398ED97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 13:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E54331F2312D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 11:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579871537C9;
	Thu,  3 Oct 2024 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAzcmurs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B15D1514F8;
	Thu,  3 Oct 2024 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727953638; cv=none; b=CYgCkEQ2Z5SmENgKRXMmfTOslwsLPeaO0WLg5BSA1gjozYIdBLkLT9kgcY+trhhQOo7SQ9RWJqCX0Qr4K1tyRnRIYVVXqEFnV5F6Zk+ebdbwuMv+DFh3iugOQxe1FKeN6/tyrE3OX4AlD+J3ja+ZlBAXFfanDIumjS0igWvTNyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727953638; c=relaxed/simple;
	bh=H0tqyKVyS8d9VvNGf2HV0FLQtDRwtSl9qI8LZamkcGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM6ScF7ya9GSxXdPjd2VVebMmrBVEDQVYB5sbSO2O3KBwt9ixR9EM6ETRwkKsZ0vi5dj6qdiQBdENWuznw6S8mEzBwPIZLNlHp56fL0DX8zRtvQV1aD9dbYO3pAxCCkBtsCYmNXhv+bBoRKxoCMkA58opS3mZI+Q6yM5dEM7hh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAzcmurs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09DAC4CEC5;
	Thu,  3 Oct 2024 11:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953637;
	bh=H0tqyKVyS8d9VvNGf2HV0FLQtDRwtSl9qI8LZamkcGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAzcmursO5VejK7HRotzHu/Zs3ciXYORGY9Z1YOhv0vUEXlOzABqeyjEWFeSTnx9i
	 4xwF9A4Ffc4eckfx1hjiqyicSdNdEm+2zmsEBLl6K4vn3CSXhqjwRpKZoohU0aK2Vf
	 t5wEm6f9JpIX9EYfKRTuwZCAAwR6S2BY4VxgODM9ce1D/GLKy6dYqTvsxvcVUPZBjl
	 KAocAYWRWANgouesw9QthFoyKwtXwuNDFFjyUOuQPHhFO0orWapZUfhEYQUDO+XWln
	 +0H6eQXI8maWwf8oUFujyn4n73g8OJdzLJoYlryG0LY7kY5Lg3x7YNrTL5GtK7bh3k
	 plFZlqQj6LN0g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1swJfy-000000003za-1zto;
	Thu, 03 Oct 2024 13:07:19 +0200
Date: Thu, 3 Oct 2024 13:07:18 +0200
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
	Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
Message-ID: <Zv565olMDDGHyYVt@hovoldconsulting.com>
References: <20240930103041.49229-1-brgl@bgdev.pl>
 <20240930103041.49229-4-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930103041.49229-4-brgl@bgdev.pl>

On Mon, Sep 30, 2024 at 12:30:39PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
> 
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Without this patch I'm seeing an indefinite probe deferral with
6.12-rc1:

	platform 1c00000.pcie:pcie@0:wifi@0: deferred probe pending: pci-pwrctl-pwrseq: Failed to get the power sequencer

Can you please look into that and make sure that the existing DT
continues to work without such warnings.

> ---
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 100 +++++++++++++++---
>  1 file changed, 86 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 6a28cab97189..7230d5420199 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -400,6 +400,67 @@ usb1_sbu_mux: endpoint {
>  			};
>  		};
>  	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;

> @@ -1258,20 +1327,16 @@ &uart2 {
>  	bluetooth {
>  		compatible = "qcom,wcn6855-bt";
>  
> -		vddio-supply = <&vreg_s10b>;
> -		vddbtcxmx-supply = <&vreg_s12b>;
> -		vddrfacmn-supply = <&vreg_s12b>;
> -		vddrfa0p8-supply = <&vreg_s12b>;
> -		vddrfa1p2-supply = <&vreg_s11b>;
> -		vddrfa1p7-supply = <&vreg_s1c>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>  
>  		max-speed = <3200000>;
> -
> -		enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> -		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;

What about swctrl? You're just removing this pin from DT now without any
comment on why you think that is the right thing to do.

Should this one also be an input to the PMU block?

> -
> -		pinctrl-0 = <&bt_default>;
> -		pinctrl-names = "default";
>  	};
>  };
>  
> @@ -1761,4 +1826,11 @@ reset-pins {
>  			bias-disable;
>  		};
>  	};
> +
> +	wlan_en: wlan-en-state {
> +		pins = "gpio134";
> +		function = "gpio";
> +		drive-strength = <8>;

Yet another drive strength? Also from fw config?

> +		bias-pull-down;
> +	};
>  };

Johan

