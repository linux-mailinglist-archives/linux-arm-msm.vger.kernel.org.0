Return-Path: <linux-arm-msm+bounces-35481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BE9AB988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF42C2840E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 22:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78221CC14D;
	Tue, 22 Oct 2024 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgEcW7FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BC18DF6B;
	Tue, 22 Oct 2024 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729636383; cv=none; b=fsJY4M52W4R3r/EtciaGRHssilVJCS3Ohiwza63zZ8Nx/kQ4Vq28vN0CpPIf65jMv6At2vUC6Mjn/ARph1AkHoISs7nIBm2pg0Tm/JTtDZq2VsMw4iHdulGI7sJXDcjSnVSBNjOsEHpiKO4/9XRmPzKBqPEWNNJ5xVoJos4gIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729636383; c=relaxed/simple;
	bh=nwHwS13CHRAlNM6XMu3I9UZM5dggMy94PVrhXxHEbvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgdXc864P+nfxI4+htDwZvOA0WCASbehbwoGSGErmdVhB5BPN3XhqnHgmoSySHHPU4XwJb/H0NkLlMsXrYP2/SjP9xTH4uxb+PwmI0U9cLLZ4rKKPOjYhj9D/An0p2/UGXXixUrNAKBC9iAwv78KoW1TStKFNaONwOavNm5Qvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgEcW7FC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B699C4CEC3;
	Tue, 22 Oct 2024 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729636383;
	bh=nwHwS13CHRAlNM6XMu3I9UZM5dggMy94PVrhXxHEbvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgEcW7FC1wlRraWBLbRk0VS7khqmUxckRyL4IjHWkZl0VqT6hsYIF8xdz/nfGkV+5
	 ghCG+xRIUusTxiXQgZaOt0IuXRK29keRVbHasi1uVuZdfADlBKTHawMJSGXpoZhImW
	 9128od5vVsrlUv/K4hA5Qr6z3tAqVMry3W7K5B5OICN85wsQRw0fVhG3HzPn/B8Tls
	 KhvWsyMYg8Qlr9UZMaYaY21y1Xx/NDNQvVzAHWdZe9r2jwP22YHK4nYJXpaIk1H352
	 rSOdZDfXIv4kPcSp+KRBoaXrKm22zQWBv4wpAr8rb63uqe7k1qjjtEuevo6TH7WzKT
	 GPk7NICFGWhIg==
Date: Tue, 22 Oct 2024 17:33:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] arm64: dts: qcom: Add support for multimedia
 clock controllers
Message-ID: <m26rnkivudsbvhb3ocofizwpoq3erndnt6jdhrwa6kurxjkr3d@mrocbpeniuqk>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
 <20241011-sa8775p-mm-v4-resend-patches-v5-8-4a9f17dc683a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-8-4a9f17dc683a@quicinc.com>

On Fri, Oct 11, 2024 at 12:28:38AM GMT, Taniya Das wrote:
> Add support for video, camera, display0 and display1 clock
> controllers on SA8775P platform.
> 

Patch subject doesn't match expectations and for some reason commit
message is wrapped at 60 characters. Please fix.

Also please mention why dispcc1 is disabled (I'm not questioning the
fact that it is, I just want you to document your decision)

Regards,
Bjorn

> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index e8dbc8d820a64f45c62edebca7ce4583a5c716e0..e56a725128e5ec228133a1b008ac2114a4682bef 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3254,6 +3254,47 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		videocc: clock-controller@abf0000 {
> +			compatible = "qcom,sa8775p-videocc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sa8775p-camcc";
> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		dispcc0: clock-controller@af00000 {
> +			compatible = "qcom,sa8775p-dispcc0";
> +			reg = <0x0 0x0af00000 0x0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
> @@ -3876,6 +3917,22 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  			};
>  		};
>  
> +		dispcc1: clock-controller@22100000 {
> +			compatible = "qcom,sa8775p-dispcc1";
> +			reg = <0x0 0x22100000 0x0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		ethernet1: ethernet@23000000 {
>  			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23000000 0x0 0x10000>,
> 
> -- 
> 2.45.2
> 

