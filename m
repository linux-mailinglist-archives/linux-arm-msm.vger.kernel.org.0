Return-Path: <linux-arm-msm+bounces-20580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384118CFCD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB43A280A74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5CC13A26F;
	Mon, 27 May 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCOcdCJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0649139D1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802001; cv=none; b=odpfRYi5FYKdpqFf5uqYAKmqIBXZMFBDcoex2jdH1V37LxY2UhJanse2SA/gfWvtAR++OOA4wrVkNzcfvyrj4cs1BoKIUDfcDn2GkoJVqG+sCSeiZw8cy0G17/lQiRbLzKFA87o6GoTEgPfVt6tGBbIaAU4SX+n6OAnggdN/CWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802001; c=relaxed/simple;
	bh=DGxHrrgHhYai0N2daSd1UGb+KKSqPFjkxRo0Dluke6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdEU+llxz0JZ3V0Gnf7wB17aZ3J34CLlbV8ExlDGzsxnHJbga1/vtk0xg/zLy0tlFDhb84PvuF2Q999T6NVrKZ/ofaeKlLApR74hsBGpjZEnxivzjUrCOuLIPZ6Y7EypNHV9dRZcjwMyD109ua87Qi3a0NnN0HldVbv3CTMWxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LCOcdCJR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-529682e013dso3066892e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801998; x=1717406798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jmNjC58UAWsrwXzwM2Fn0FgE946HqXq8JLs+H9s+h8=;
        b=LCOcdCJRdWdtm6lBRVgb2JIjari3jlqqJReHkaZxudx+X5JT/p2sYVmKr7K+ip7pux
         zRpILkhxVq/Ps3drcgYRkL2hIk9B5/6oO/qjnxDyCSABi0+AcgCav3U+Rh2Yl01qH3Ls
         xihxwzpCu9PnhLOoeHqKeqQSSXuht6hMFIeAS0Yic5fdho8iVjAS7YIPX8A8wa6ka2Ah
         Mpg0sm0ZpCbsZp75qakvuKh4+b2yeMg/Y5R77t4Pi2qJIl7puL2DpcrGH5AUag2O5IwM
         nEJPhrUmI/3HBnag8ZzOJY2lCmnzNy9A9cncTcjbskxnjdvtQ4Vx3VsXqUJKZNXOpKXU
         sn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801998; x=1717406798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jmNjC58UAWsrwXzwM2Fn0FgE946HqXq8JLs+H9s+h8=;
        b=LdPd4kkHUIKltP1IQsQKwOmbdcHCfYZk34QdXB0KRuze9CI6PegS5p9BaJ0yklE/9+
         Z5jQqj7MCjUsJevcU1xwQ/5cCkoqGyRmp9QQzch9tcj4NmxfayHVfdSKGH1EKHr+vCXL
         nZrJ3V0pR4g8ch7LwJ7lL9WB/Kbgp+SU9YQhbAvTjmFN+D8sRAf/yfQ9T6uekCfyEut5
         V0DNsXQ3Ju77kfPF+qvK5e9ctukSEPZAW9x7c7t47d85ZfAOi307hePA3YNZsKTHJPSE
         dqQ3D+4SYH0smHPDTHXRo4I1ic+CheGxCYLNlXHbE/EytIkKV27Th5zTPG1c9j7DAAhk
         1DaA==
X-Forwarded-Encrypted: i=1; AJvYcCXbbbn4bpRJALRBry2JUfIUtLDZOK6ZibiTlb0IDKVlk4HUT17BO8ZmZu2Mq3T1XpgRAqrYaK7WB5QvAJpAmsbJq34VyEJKzji4QHx9/A==
X-Gm-Message-State: AOJu0YxxOh6ru21PNEtgtlf/z4eMvTTf6RDr2j0a3KopY9gJMsS9SURh
	QPDnn8U2dXsZToMHTVlzfJGOvykayu17tFOYe/rVt/dgKTpzF/bAzQWd2Dk3CPM=
X-Google-Smtp-Source: AGHT+IGXbo23AoDOvpoVJig+SaNExvQo5Qosda9tFG7q7WP0xeYJkr/vdoubpjwLXasIU10WVbWhtw==
X-Received: by 2002:a05:6512:3241:b0:51c:df1f:2edc with SMTP id 2adb3069b0e04-529644ebe8cmr4942441e87.2.1716801997919;
        Mon, 27 May 2024 02:26:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e885c9asm494864e87.33.2024.05.27.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:26:37 -0700 (PDT)
Date: Mon, 27 May 2024 12:26:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add pmic-glink node
 with all 3 connectors
Message-ID: <xqrlvvucbdbp7qvs7gupd3ns24efkavpx3ul3gtl6tixf5t5cm@zddgoiwqg4bi>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-3-7ea5c8eb4d2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-x1e80100-dts-pmic-glink-v1-3-7ea5c8eb4d2b@linaro.org>

On Mon, May 27, 2024 at 11:07:29AM +0300, Abel Vesa wrote:
> Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> for USB only, for now. The DP port will come at a later stage since it
> uses a mux.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 143 ++++++++++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 2061fbe7b75a..a7eecf84b6d6 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -23,6 +23,101 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";

Same question as for the previous patch.

> +

-- 
With best wishes
Dmitry

