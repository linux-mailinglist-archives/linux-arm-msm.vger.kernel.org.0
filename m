Return-Path: <linux-arm-msm+bounces-38931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CA9D6A5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3393D2819C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D074E12FF70;
	Sat, 23 Nov 2024 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LS4waRiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F14EB50
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732380804; cv=none; b=PbasdKju8fu/LnlKLOl7H+QEnouj1jDPSgIcyFMdjYy6Mi8tVoI0xnqHmWuT/lmbGL6/C5GvnE91b3GI6IiKKhPkEyhowAuFg4N8siuJUhuW57yQPTbCdgJjRqfrj8kKzcn+93P4MkucYDCiDoHVpm7x7n2/DJeMO6Ujb/5+dA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732380804; c=relaxed/simple;
	bh=oE1UNWnRJLDgrfpDEYKtdU5g1wT00XORVegg1fcWagc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STkpA9+a4M3LBe3mS7pjspu3834BuPEKj8mMSZLAOt6x6NT7HkIFzxaRjl7hyYhNRd2E4/HRQEGPIB2GJlW9bNfktkVTSYGOvP8/ksvqsobJ2E1u4qmT6KereUdY6XDnw/MGGiCcL1XVr5eJXxNH+1+4ciwP4vc9r9+KWN3LGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LS4waRiq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so1955784e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732380801; x=1732985601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGUPwF57lUpDM+09PDJEdBkBeZ3TV2DKEpTu1KqQPqA=;
        b=LS4waRiqc/dchuG6ygENbql2Yah+Kg4Ln68jU1t8k2fFJ9FOg40zfBzTHvYfpd2liq
         A2E/W2G7ta/DqqQjyn4IDr//y+FRncNbB+tBzfLKLs77C3Pp3A6BCJPrjM8OkRD3UQpN
         ybDjm0Frba2AJzLwP/iTZX8xIIxZtJm3Ca3jCunnMBNTWKEATQhSm3xcNCZ334BSdESg
         O+wQXVQwNIkwJ+8zzQ6HImrd6l5HHr66E+gI+ClGTH9MHpXHvQKlJMTQgte7k9IFdqs+
         Wuje1f52qDU8LIu3FDjtwAy+SVgBqBvFMxnabPgDTQ2HUjQ5lSgkYCwzePvdIP7eEV5K
         fIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732380801; x=1732985601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGUPwF57lUpDM+09PDJEdBkBeZ3TV2DKEpTu1KqQPqA=;
        b=SK3QXSD7LYZuGc5W9cr3RP4V/N9K5ZfRLxb09od+MM/69nmsNr2En4QYPY9uY4CcRN
         /kQhnekwrehu5RAHftjAO7okx8HhwJNgE4TcXtgUAq5g0Q1a2b2jx3lxdvk4pq/qANjC
         ftrNaZ3jfrAEthEZS7cKhjKfQLgnz+59T06GRl4NcAnnDVZPgR+9XEq+Qmbv/slvaJfd
         ZXf0WXWUFMQnZwuTG0BYulhBWZHzuLoS/PHr4ZS3GBgrsZXbRyqGVIGM6WWSpj0oGBWY
         OWFcdiwT4LzJ3N+fhUUvGZCtn+IYzrdnfE8b80cGHRd1iMgesUGJvy+/RkIOEXVIZcAJ
         5AIw==
X-Forwarded-Encrypted: i=1; AJvYcCWM3KY/4zRt941qDyZFzLSAeN8n2WH+EBwpuvX0WLfzjo94JG1/nvga5Bo8rtJa8DgSUYZmu/mUp0rfu/VG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWGDdYXkDJKfSr+1HzvtdiAYK28vWZmsDiOd+5f0qUA8Bg0Zh
	Y6on3Cppu9ttxf6i1w+iUL5EhlKS84nVTv6ESQR/LygaYTDV6Z8Sw+NHmJbUoNY=
X-Gm-Gg: ASbGnct6I3bqMaDPpRBPbrH+x+ZtFZ6zdukePe+z2VwkZvU9DycTwoBwIc9oLBM0Kru
	Yl36cfXllatGWVcK0rvKgtpDTuYeK7LMj+KKeSanvs3+6361cy8fJQH7hMNH6y5niAVtrgNr4pR
	BfiLNx85ofKg1WbH+od9tajYWRqYXk01e8/tE6zQGMetgCSDp6rPkCL5Uv35uAWU9BblDsOuPdI
	YnV2AlqZws/MwqPns3rEVuUzEVwDunPIn4k+JcWkZSVLAUhtxGk/W1x35jhY9PJMBXuuXCqhSwU
	OWOATHBNnLa8oE08XMR6E1DFQg/Qcw==
X-Google-Smtp-Source: AGHT+IEGUEUW/qjW1XWol/fb/+AKJJnBh0CubV0b0MiwHenTkb70vpQEXvskpJZN/kj1uuxbzT7hnA==
X-Received: by 2002:a05:6512:308b:b0:53d:de12:f344 with SMTP id 2adb3069b0e04-53dde12f5acmr825645e87.9.1732380801124;
        Sat, 23 Nov 2024 08:53:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481424sm982082e87.133.2024.11.23.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 08:53:19 -0800 (PST)
Date: Sat, 23 Nov 2024 18:53:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: maud_spierings@hotmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <si5njacaffc3iajhjqwtdfsouj4vrhzvdicp2tu4t32ra5d6xj@gsppoxpxw2xh>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>

On Sat, Nov 23, 2024 at 01:58:56PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index d0bee4b6fc0be6fe40d335f4d50dde495853b315..caf7509692db84c69ad375b5dd07054ac0adcb52 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -18,6 +18,11 @@ / {
>  	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-0 = <&hall_int_n_default>;
> @@ -545,6 +550,14 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
>  
> +	bt_en_default: bt-en-sleep {
> +		pins = "gpio116";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <16>;
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> @@ -624,6 +637,17 @@ tpad_default: tpad-default-state {
>  	};
>  };
>  
> +&uart14 {
> +	status = "okay";
> +	bluetooth: bt_wcn7850 {
> +		compatible = "qcom,wcn7850-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3200000>;

Please describe the PMU as per the qualcomm-bluetooth.yaml

> +	};
> +};
> +
>  &usb_1_ss0_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;
> 
> -- 
> 2.47.0
> 
> 

-- 
With best wishes
Dmitry

