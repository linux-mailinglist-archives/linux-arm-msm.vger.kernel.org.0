Return-Path: <linux-arm-msm+bounces-44998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1543A104F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4F0160D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C85D1ADC98;
	Tue, 14 Jan 2025 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbDp95s6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4965E2253F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852615; cv=none; b=VCz36CHMWR7Xh9UOgWfOVYtT7BoHSfJNfY3ZTuHXrbAVBzHK8duC/2MwoFkWiYUjCB0oemzOFLciIclNy5yhIsTXDYsYOcPsaqXUW//HNAWLQbAA1shTeUFEZ+7pnL7oYpICe/1jwwLU8NMOIa+8dMDge98TAyZM/byR9LyTRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852615; c=relaxed/simple;
	bh=/QsVWeZBMvIFz1+4vDzA3jWVp4+wiTnGRb3RRnDIETE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lckdrliVipmQFk+q6zfAkHItY0/m3ijc+xjAYcdvldweHEVXbkFIXIGXKNF+CigEy/8aTqDqAFeXG2vn3Rvo7cX6IuYOZka8q4rr4R1WflYTsnv4d0EU8JvrdiEGHS0w92UfCQ1qj12VVWOE+x3heTD0pKCpDlThvBP724+EKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbDp95s6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000fso4553443e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852611; x=1737457411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KAoihcB+8hKrD4skZP3aZcpRI2AH2qYTz1/q47OBqc=;
        b=JbDp95s6o7PtpCMpIOdUpw8MC9rWWGt9E9qCqUk4440XtCrYvL8FRNOZ+I3UaNMmux
         XcXEkB6VxB7R55M4zQKE8/E87i9Q4rm9q8qKKV3PwBGrqaCbfSwupO64U2oLv4CB/VXN
         /KIX8r+zfpajwVrt5++WvNlVW1/X3imVDJBMzNbo2dQLN8AQbQJ2+TOH5JwtfPjH0JGM
         hp+Ebqu69ZD2PAh+kf0vYE9+EbrbeIQziAyWMNeceL1yAf8PS69EbkmnqGflPel6SHup
         1LbBkLmYQ+Et5hdDp7ckzgjOhiDQGtR5/VkTJxlrqUdKi4BXMc5Ux3qasOM4YY7B1bHT
         YY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852611; x=1737457411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KAoihcB+8hKrD4skZP3aZcpRI2AH2qYTz1/q47OBqc=;
        b=LIr1D/oXAtMozqVfKF4gRpoj0uTBcgQqh2UJDgBSv5tpuTeV17wvK3YIRfPZjKjo0O
         S6rNdNtVkoC/HZxgPniqf7FoNp73Jn2jsPEOIO+d+4+yy5ajRnlsY6yVxRB++Zab6xa9
         F6rLjwc5UaXMzBdwug4D6c3G7oDNlySgjAEGFvmbW+AWCycKFebIiRFKVEL/HvE2Xa6c
         Oqwz3tT1qLFdVGlo3uzgk+svQ9+awFq5UbKrgAw3Oy3Y7ID1DvztBvJEYjUnktBhDqp9
         2zIC1taUe5NPFMN5DhwmpfjAFvNeW9W6mUK64+kLKId8OqU2rNasUwKDtoY1VJvkjtzC
         Fq8g==
X-Forwarded-Encrypted: i=1; AJvYcCVYKSu1EiM0Z1/OhsS6ydQFmWUpViff8/a4r83+jugqxD/mULLvro9xSGw5Nnn7YobRTXeASbQM1ARocK02@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfmdCfQxnXKmBnk47wilAYTnE2dNUZlpW2PJz+HgY+8/awbl3
	JktB6HAPIpmvsVk6CTAvhLOD3cqYFJXdBibHmLakT/E3kyso8LLK8s1KBOzlQDs=
X-Gm-Gg: ASbGncs1GhLEvzLlv0Mif1eM2c2tvI0MvU5DCno5Krj9UPqzSAUf+ngchcittSrX2ZY
	NdXhV/yFHNk4uzJdNvFIIFSTDfQbzjwTZhf80kau+q8w3qtt/EElKxLTowx0cuVZFOYiHtvrPdS
	nPZQ/ZGrsP2dAlUG26Ekq2d2mLAVLbtZvR0h+XbRr3O61yFEUcaDGwAfFrp89ifB8lZq/hVtMt5
	vMlGx1lCLIyhO7LZbZ4y95XeXu0rRCBWzCbjDv0opUTvUBaKml5ZTPaMlsqM+DdehfZHNcsd+Le
	lDHw+9m2oxsOI6op2EM/Qt4bTrJF/r3FW2Qf
X-Google-Smtp-Source: AGHT+IFdzhwJY8BTG4K7UzqPbdvFGJ2Gkn1eQ1Snwq8k9w6rlfWN65V04BSDt5YRzqbq7c5z7EWz2w==
X-Received: by 2002:ac2:5684:0:b0:542:98bb:566d with SMTP id 2adb3069b0e04-54298bb588emr4578532e87.15.1736852611496;
        Tue, 14 Jan 2025 03:03:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be540efsm1682619e87.75.2025.01.14.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:03:30 -0800 (PST)
Date: Tue, 14 Jan 2025 13:03:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add PMIC glink nodes for SM8750
 MTP and QRD
Message-ID: <oicehjhl2igfajihgcot4tbcstfdopl5l53c7vshnlkzmcdg3m@3fdudfe5asdp>
References: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
 <20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com>

On Mon, Jan 13, 2025 at 01:22:23PM -0800, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Add the PMIC glink node with connectors for SM8750 MTP and QRD.

Move to the USB patchset, add necessary graph links.

> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 34 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 34 +++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..0bca1f9acdedfe1852293b72862979e42fdd6241 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -81,6 +81,40 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8750-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					pmic_glink_hs_in: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					pmic_glink_ss_in: endpoint {
> +					};
> +				};

SBU?

> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index f77efab0aef9bab751a947173bcdcc27df7295a8..c53c08fc7d0d759aab921c76550bf98c2a308d49 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -80,6 +80,40 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8750-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					pmic_glink_hs_in: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					pmic_glink_ss_in: endpoint {
> +					};
> +				};

SBU?

> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

