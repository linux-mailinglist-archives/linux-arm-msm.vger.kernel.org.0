Return-Path: <linux-arm-msm+bounces-38820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581989D5D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E232832A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E821DE4EE;
	Fri, 22 Nov 2024 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4E8tg14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC21DE886
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270970; cv=none; b=a3bR9ZvtBOnfIKI3H22Z8N+h5DaxaM0ddRZZZJ/bTZNi1A86+a7AKFC5cqkbRAlfQoVKBy2gt0kquRXJyoN9DFzA/n75m0Okw82nNImilSNcvF+9PJbuWS7nlAZnPkLqObsD0uF6uxpu0l7rPKePRgmgrJgHC2pD6BOaiFsqSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270970; c=relaxed/simple;
	bh=FUMOsTI1XKBWnpseE8vk0dVqvDxYGIbH+QH+cNwOnAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAE/VkVAfTMPqitYcBf5N9IjIXjNMQkPIf1MCAWcDW+6xlXEhxl/OpYE9GeCAK0ciUdUMNjMtxQpwuyJxI24rcSBJqEbwwnLU4b7m1yiH0nP/aAqgM+fwTakZ5W9cjNY2Q3DuovVM/1D0mou1+7fjuKiEn9AUc6idT8e4TEpgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4E8tg14; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2130329e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270967; x=1732875767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
        b=E4E8tg14BnFU6aqnJV+wSX/8IlXVgoEozhcYuhOzWUIMXXj6U/X4Yq3ir0TPKLSvd6
         Vj9ly0Og7QiZTArctGx489cqOic4bxWpT9RA/u6c7tvyuOTKhUP+Q7tfHP75diBmXqT6
         F4XhTUWg3pJmwPown+9Ze3iAFllM96aVSgoUxDrKAgI02awf37iODbuoyJDxttorcOfJ
         TY1tom/SIFcGlG1uZSz8HFehAhi4QjG2IZPENCeoL7diEYheTj01EZMpOECijDP3I8Ov
         sKvGzOZyADvNQi5PP1xhVaYV/4Mgp29YQRrDTm51jMZVooXFjx4WhAmsyu/FpNbEwCja
         f7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270967; x=1732875767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
        b=kfEHfyR86DY5eHQ8kmOwcVE+vVt9cKFrXHDPnLvTcWqTJ9zCGan7W6M16hpntLYrOd
         hmoQRGF6zxhGYqNrUSqxjfoWqEwChwcRrYiGpgxXCudfiAFMK6qHS6LiPL4SX++kfIdo
         2N73jgz4KeejAYXM243rTF9aG4Sj6eAuynwuGgITLkOnVewki2d9s+mij7hxfLePZKym
         l0TKT7IXXQZidY5xUxirtgZomreanV95QwI9/PQg/rWKLJsTPk610DPxzpDHsyFjcx0k
         h2u83IGzu/Vp2ID3h0jZ+MkeaE1zBD2v8U3bUWF+upW3x9CQo/Y38uXH8DLxoXZRXUTI
         F4cA==
X-Forwarded-Encrypted: i=1; AJvYcCUn7XTN5XP37ojlEfB70AMmEU+loda0XiwrySFLIiBnm/Mtltdp3tRfyiWNMZpKVTP2xZEfn9RZueI0B3/f@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuqXQBpLBskRBK9zyYR6LWmqhiMrWisUSNgy4a359Lu3W/nYe
	qvJ/Q/J7ERMOC+bcR/c027mv162Ekjgc+aS2oOSFbwcanEYXeThRGxZfwViEgNM=
X-Gm-Gg: ASbGncvqr+F45cb6VRSTOYRtor6SjcrAqsH98KkHgoKFV32Vzu5unZi9uK+mL4GdcBn
	Jfjg/VD9tmOttCt9jZ9JEaCMan7E5A6gJNB+tH4WEzthuwqZ5dT6jU6yBTek16b5aNEKTzO+YUi
	2n1jK813mHb3q10czYGEysM25P6kFZnp7VMMfoXnG/yDeyzcad8nXv31anN760uk5k5wGB862/H
	UVbRAMJHBMNLu+5nV116vPecpYH1r/qLixYANq4jCI+HeHi7rk6bmBWbW5GOzESDF1e0DarclZR
	CMy2di5ArJ/jC/Xw+ivQ5dXIfuaYjg==
X-Google-Smtp-Source: AGHT+IFS7C183Wt8hN7C/INKvkL1qt9YbaPn5aBu73dBkn87fnUOLWLXeKl+x6xSQFdRyLKoKS4qmA==
X-Received: by 2002:ac2:51b5:0:b0:53d:d3ff:77f6 with SMTP id 2adb3069b0e04-53dd3ff77fdmr829792e87.46.1732270966827;
        Fri, 22 Nov 2024 02:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd88b54cbsm62838e87.214.2024.11.22.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:22:45 -0800 (PST)
Date: Fri, 22 Nov 2024 12:22:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,82 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	ioexp: gpio@3e {
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <58 0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		semtech,probe-reset;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			anx7625@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupt-parent = <&ioexp>;
> +				interrupts = <0 0>;
> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +				wakeup-source;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						anx_7625_in: endpoint {
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						anx_7625_out: endpoint {
> +						};

Where is it connected? Is it DP port? USB-C? eDP?

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&anx_7625_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

