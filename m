Return-Path: <linux-arm-msm+bounces-21618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13168FB64A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A500E287C23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E1D13957E;
	Tue,  4 Jun 2024 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdaPpWP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0012C528
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512923; cv=none; b=OLfUy9dZ81KZBChKkOZcQXvyVPrCuYGRxfyEi+GInOWzE/jLFtANRL6DRDzqs9W6YtjkFbV82Trb8xhc7Qu5prC9AmJLZA3KOoX2MDBTBlXUdxNt3ORv1AltF6sgH7Yq5vmq/PluRqYy+bsmsreTRY2uy3syrWjvDKXZJfOKcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512923; c=relaxed/simple;
	bh=8xaZLloQYqQtknTDovx04HPDGACoZTE8AbPDGau6vV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WetKpBlE4uy9/rsQKRR/APxYi1xXjbykjjmTqOqasquTwjBG4oejejd0Xn19NvxQMeCwrPCn+zWYbRwzsljPlqW22TDVi4IJyd14rHJmSeyJF9Mt2SutmYs3VncjiHkLu1DtrfMrb3cfVuAqQhhUMxnHPcPbX2rhRHVdz7DRprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdaPpWP/; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaafda3b90so29706101fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717512920; x=1718117720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLNdPFPac+SFgbJFTdkAXzLcUkAub2hF475OhZIL36Y=;
        b=pdaPpWP/pR7zppEOz+GmDjGwZoFxaaegajlJaH6YXguycMcr/dOIUvMoABQtRDO4UB
         B6tTchUDqlR5YP/+Dd86KMQ7WDQA+ZVQB+WvQAQzjN0V4yTaqVpsz7f7LxR5RWsf2gNX
         84JcXX75ENwjo32E9WlM35c3Sjgtqqmujo1znn4D4aj7Kl53v9CMEzznfEz4XGkjaGSY
         xYhmP1pc8mcdIdwK2PgLF3biapHl+a4/KW8Qp9KfhnfJjGUldADKk9C/h2uLgH5Td6dm
         ME9PvRf54VhMf8vuWFU/l638ZMzPN9BxXsvI715jHbqZ0VB27T18ZT2pFaKs70AMitdi
         pLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512920; x=1718117720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLNdPFPac+SFgbJFTdkAXzLcUkAub2hF475OhZIL36Y=;
        b=F+/TfYTKZVGe1ucOUL9ryR7ncOHnSud+MqD1hE3lHsL294tR1MHgGGccMHLtPLVhqH
         wimbnw8mPBQIqUM3vSPQHyJ5nEKguj+NgmhvyyKe0LCRtMQNC+0gh9MqxyF92asOWjUo
         feEZ7SSGSDOHU8nhh/1cCfjzKS1w95gKU1V/WVjz+kksJ3YL0lPKxWq0KIZpygRjKAn9
         Plg9hIvTTXJv37/BhFtQ9L2QlTqc/qNcui0rKdvhl38thQGnUw99ksttba3XCX9E3tVP
         qe9Q2RL5AqPW/bt5pzsuRH2HuuNYwiRiGI6LE6tbx/UZ2jVd4kg3ViWb5KVghGyGEU9/
         TWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnpvybDT1J8iCySo7hcAqbzuuSeVPxiAi6w/ZWFfEfHZXuiXi1dN5g0pUwDPw6O5xqcv+e+iZnrWr524agHCoyAQ3+7t3lomznl6SgSQ==
X-Gm-Message-State: AOJu0YxcWIUST2hmM9Q3l0PnuYHmJR0q/ywl3txVmZ7tX4td57TIazyZ
	SAMxaRSVzi9vY3ezeS3MRb/xFoMnI+03hNLwOGUA7YraXAJ/aRTQxC8hbYeprqg=
X-Google-Smtp-Source: AGHT+IGXupYnnuI77gfzxZuWZkyquJcBGxUXKKVzbJwEgcxiyALsDg39Ld+RBwQFb78sIGEYFACIAA==
X-Received: by 2002:ac2:598b:0:b0:52b:aa4c:49e4 with SMTP id 2adb3069b0e04-52baa4c4ac0mr161821e87.7.1717512919778;
        Tue, 04 Jun 2024 07:55:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d347d8sm1540431e87.29.2024.06.04.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:55:19 -0700 (PDT)
Date: Tue, 4 Jun 2024 17:55:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
Message-ID: <6zbddkrd5wp73le7tvhtrzp2uyehrpwlmltmrbhsxhh7q3frpw@njhdsgnbrh64>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <648b2798-9302-4c6e-9ef2-e4318066d28f@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <648b2798-9302-4c6e-9ef2-e4318066d28f@freebox.fr>

On Tue, Jun 04, 2024 at 03:49:24PM +0200, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Port device nodes from vendor code.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index ba5e873f0f35f..f65a76da61ea8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
>  				 <&mdss_dsi0_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
> -				 <0>,
> +				 <&hdmi_phy 0>,
>  				 <0>,
>  				 <0>,
>  				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
> @@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf3_out: endpoint {
> +							remote-endpoint = <&hdmi_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
>  
>  				status = "disabled";
>  			};
> +
> +			hdmi: hdmi-tx@c9a0000 {
> +				compatible = "qcom,hdmi-tx-8998";
> +				reg =	<0x0c9a0000 0x50c>,
> +					<0x00780000 0x6220>,
> +					<0x0c9e0000 0x2c>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical",
> +					    "hdcp_physical";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MNOC_AHB_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MISC_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>;
> +				clock-names =
> +					"mdp_core",

Nit: usually there is no line wrap here, but it's fine from my POV.

> +					"mnoc",
> +					"iface",
> +					"bus",
> +					"iface_mmss",
> +					"core",
> +					"alt_iface",
> +					"extp";
> +


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

