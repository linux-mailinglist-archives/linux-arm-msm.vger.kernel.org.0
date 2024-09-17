Return-Path: <linux-arm-msm+bounces-31914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7F97B0D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56D4CB29921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8674D188584;
	Tue, 17 Sep 2024 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMhRPGKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31703188A2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726580333; cv=none; b=CrQFq1jneSxvzZ0lK8mFNJknHO5uFii7dOPZmVEGu5xW+FoZG4TBjfOyuQ9TimNh79EtsU/b5w1KaBEhlzmoaragjUdHxFyQZWSHnkeDB8MvbhV/+FqnIHaNNUJEPqGSPjghm7dSHO8gx2VoWUJor5zkPa9PBdV4+y6iAAA59m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726580333; c=relaxed/simple;
	bh=ZG1vxeD3EgoOOwm9exxEQewT3p4f8/J4YXV48auODqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYI7nxyGuDp+C5OOnSOgHA8SDJQDZnK/WVf6j4l8XhES94qqHWKC5N7PQN3Eqf2Suwm46tUJvbhXAmyzOkgXhkGTxapb/7SSWne3zfgnhKuf9ng3abbsOQ8NDdw9FGeEnSVWQw4OZLoZWzYbmJsgs8Zu/y4PWqugd6UsNN6PL9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMhRPGKG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f762de00fbso59943611fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726580303; x=1727185103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oEZwCbDIQ8F+t4Rs5Bvaf5j4IlFxDz2ZFbzuElzFFQ=;
        b=iMhRPGKGN1Rod39srcMpq7d9KknSbl06Wa8LgN01LnEX8o21jlNpURD/MmHqadr5ce
         8WOJe2CRnV7nYhajsphNI+6Fkhh+jwYjP+2gTHzabrqcXZyLzBHQ53gHGDjwOtx3v0y+
         1pWXT1BJd2LM0uoDoLhU6AUGaRaGMYF0mgszFvC6jxkBa5ygrjbauPHl8b+HBsrtDlm8
         ClJynL7ANSIlpjxCfhql+RJZRhEG2MAoEf5LxDf9FAqiTP5/MSW5sWOK1TBNYa0tsbNk
         7z931rNADc+rNOYwYtAxnhxiC6/UBoQdEekOcTA8/huLFHkOctGW64I3aAgPMLZpoWLN
         O8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726580303; x=1727185103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oEZwCbDIQ8F+t4Rs5Bvaf5j4IlFxDz2ZFbzuElzFFQ=;
        b=rA2tj3E//FAwh9/NcMWbdXvlLm1PIU3iEfVxulkl/HVlgHnomNfY2AJ25kxZPPVze4
         Dh8bizjwWlMBYYb/yCf4gpDoSC3VGcHlqxggktoc3jhKpwMucszSgEssIgNAOGKc/GUi
         azaeAu2n3qr8kicxsgboa+BWAR387X8xeejgP+LeGSB86R9jv+XDM5aPqJ1Byi7XeDEa
         qN2FPWfmKxL5IYDb3KkUx/bmYO8OBDkV+O4MS9Pp4siKnk9ElUO0vHdgFEwiSds90vVi
         eH4Kqg8a8WtGWfvLV6AUPmywmih4CveXuYbaSflzrKZjuS2lG0Tg3OM9y7Rja4itk1sw
         EfNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/DNYCKKaE0kAwHalDFa13uDUZyNWuGJZ+W88bUP0YKWiBE9YadSE2XKWxwygoyFYWMPqutkzgBUufiKmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7aVHkzYLHBj4Cd8wgvV4YmPglKj8zESHuFi3un81f3/g7DVa
	nxOOnUxr0AThX4wo2mqg0XtzGvYJiRmv70jAlbV6vpdXvel/EISyj2atU55k8YsBcjoo+YHRHec
	Fhtw=
X-Google-Smtp-Source: AGHT+IGjeiZlF4mZL1r/PNyz6+OKRKX0/62xZ9kMPvlixKz4htlJC6nn+3BuxQ2/JVRsRDBmL4KaIA==
X-Received: by 2002:a2e:b8c2:0:b0:2f4:5d9:e8e3 with SMTP id 38308e7fff4ca-2f787dad4c0mr109899051fa.7.1726580302686;
        Tue, 17 Sep 2024 06:38:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d30175fsm10821131fa.53.2024.09.17.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:38:21 -0700 (PDT)
Date: Tue, 17 Sep 2024 16:38:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_mapa@quicinc.com, quic_narepall@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Message-ID: <gyasvmb5q3e4pgmfpj7njovclydwhsvsxt4ayfxzbh5njwgwsq@zfhlm6lqfirl>
References: <20240917090630.1025-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917090630.1025-1-quic_sachgupt@quicinc.com>

On Tue, Sep 17, 2024 at 02:36:30PM GMT, Sachin Gupta wrote:
> Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.

Consider adding mmc0 or mmc2 alias for the sdhc_2 node.

> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0d45662b8028..5df3167651ca 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -716,9 +716,42 @@
>  	status = "okay";
>  };
>  
> +&sdc2_clk {
> +	bias-disable;
> +	drive-strength = <16>;
> +};

Please move all pinctrl-related nodes below the PINCTRL comment.

> +
> +&sdc2_cmd {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&sdc2_data {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> +
> +	sd_cd: sd-cd-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		bias-pull-up;
> +	};

There is also a special PINCRTL_related TLMM imstance down the file,
move it to that node.

>  };
>  
>  &uart5 {
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

