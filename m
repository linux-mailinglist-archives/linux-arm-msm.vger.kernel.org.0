Return-Path: <linux-arm-msm+bounces-7878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A18838669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 05:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360951C23E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 04:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D071FA5;
	Tue, 23 Jan 2024 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oagS0n7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC6C4400;
	Tue, 23 Jan 2024 04:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705985220; cv=none; b=H6LbZbQQDZ/i/JEkSl1qh6UyPC69Kegm3o8J4W17h8SoezxuCfLpDWzbdfTS9sEgVq2PAKQFTBK43J4ggu34D1hz+tS5N4CRKUsewPmfyI0UxayEXD03L2cobn1jNUGZNob72BpGvytg5HVVBAxuKWVq1Z13N/uge882YZdoA7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705985220; c=relaxed/simple;
	bh=K85h1uIVAI2yS1PUV8EPwIVpnUVo14WfZ2GVpIaRSx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR+JBcil+9CWivNvuGc1HXst+dpgVyRkdCZ9s8L4MyKozCyqMfxdOyw1+9psBNSOv9caDG4LBS6tsg4MEQZ+CalcUWthfCH2zZl0tnXmrem+1EJ9Yg9gR709wiy+dzzFJPi8vwXM86RtrumNtGHgwR19/rLHX60YXSAF0uFx5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oagS0n7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A3AC433F1;
	Tue, 23 Jan 2024 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705985219;
	bh=K85h1uIVAI2yS1PUV8EPwIVpnUVo14WfZ2GVpIaRSx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oagS0n7uvpLTWhnxg1wIncNlNwSerWJDfFgQt7HXv8+dICMLDLo6Duj4IeujOGwzR
	 4XBH3KTN49MgfLM5sr8iIbLJkW0N7St3Xi2GGqiSS40hwxJ35+jUteEOcWc8XgXLam
	 Y/G8xAZJOQM03FZbgzj3Uca84+VAZotwcawlM6OpG7HalgEhKKDpf7RLElPAdgf6/m
	 1ZwQPmDypYO0CRGggkZl03K3Qkky7IPUII00wmBZ5ApPjXbeJA3F8j4y3D2FE+wjFT
	 YOiZ77zOC6OBMaX0dZGLlzG2AVvZjM9JIPP0HI3ok1S+IOQI8bcXhUTZ9w1o/5ZI2m
	 /2Wwox/ufHV/A==
Date: Mon, 22 Jan 2024 22:46:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
Message-ID: <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
References: <20240122182158.69183-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122182158.69183-1-brgl@bgdev.pl>

On Mon, Jan 22, 2024 at 07:21:58PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> I'm limiting the audience of this compared to the PCI power sequencing
> series as I wanted to run the DT part by the maintainers before I commit
> to a doomed effort.
> 

With linux-arm-msm and deviectree in there, you have a fairly big
limited audience... I think if anything, your proposal is doomed by the
lack of a proper commit message describing what this is.

Below you'll find some questions/feedback based on our previous
discussions on the topic, although I'm not able to understand the
motivations behind what you propose - or even fully what it is that
you're proposing.

> Here is the DT representation of the QCA6390's PMU with its inputs and
> outputs. If I were to implement the pwrseq framework that would be able
> to assign the relevant pwrseq data to the consumer based on the actual
> regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> that fly with you?
> 

Why do you need to make up this intermediate/fake "PMU" thing? The
regulators are reference counted already.

> We'd need to deprecate the existing BT bindings but unfortunately they
> are already described as consuming the host PMIC regulators in bindings.
> 

I was under the impression that the supplies in the bluetooth binding
are the supply pads of the chip. Where the power to those pads come from
is not a property of the binding.

So what you need to do is describe why the pads suddenly changed.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
>  2 files changed, 128 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index cd0db4f31d4a..c9b1600c57ef 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
>  		regulator-always-on;
>  	};
>  
> +	qca6390_pmu: pmu@0 {

This is not a thing.

> +		compatible = "qcom,qca6390-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +
> +		vddaon-supply = <&vreg_s6a_0p95>;
> +		vddpmu-supply = <&vreg_s2f_0p95>;
> +		vddrfa1-supply = <&vreg_s2f_0p95>;
> +		vddrfa2-supply = <&vreg_s8c_1p3>;
> +		vddrfa3-supply = <&vreg_s5a_1p9>;
> +		vddpcie1-supply = <&vreg_s8c_1p3>;
> +		vddpcie2-supply = <&vreg_s5a_1p9>;
> +		vddio-supply = <&vreg_s4a_1p8>;
> +
> +		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +		wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;

Are these collected here because we still have convinced ourselves that
they need to be handled from a common place, or did you actually find
some documentation you can point to that shows this is necessary?

> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +				regulator-min-microvolt = <760000>;
> +				regulator-max-microvolt = <840000>;

These limits should be applied to &vreg_s2f_0p95 (although I'm just
guessing how this maps to the upstream supply...

> +			};
[..]
> @@ -734,6 +816,24 @@ &pcie0_phy {
>  	vdda-pll-supply = <&vreg_l9a_1p2>;
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";

Does this compatible somehow bind to a entity that knows what to do with
the regulators below?

> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +		vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};

Regards,
Bjorn

