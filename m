Return-Path: <linux-arm-msm+bounces-86051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215ACD35A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 19:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 483D7300E162
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9DB310631;
	Sat, 20 Dec 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6Gq+klr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVaxbtM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828B2D3737
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256781; cv=none; b=K5kzmV4FliFEyH3pNzDOXczOL9tsLCo/biZBlRvGw8GcVtfBT1SON6D8n4TDFs1nMAkVaxT8jzw30G6Ey629kfvvj39WDo+eCGepGtS6CdQ3yVSIuE2SVGUmMSY7AgRe4bW9iodi7lJQDzLKR58zprRF4wG8IL4XkHdjapeYWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256781; c=relaxed/simple;
	bh=DLI5SF8nmC38+B/zbzyrlh9lxTdYLTkxvckAaxwnlLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D63Adf8U3KU93PIrskGqTKN+liylVn+tXjKOqKbeiwWTPwNrKRc3vY2fmGsXxeXgf5+2QS9WfmFcL+qHs2+0alUfFOlzgOymZDexI+N2DtP6mRGQeMzHrRz1mYgJoOWugREAav+EMnV1cbynafKLBSFqtDwmYvkE9HiLE8JH4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6Gq+klr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVaxbtM1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOqb7243945
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fC0xIQ0vC/k5ZPKJM+W05poz
	PL3wqK8ScqL5Y5zF8JQ=; b=I6Gq+klrc2xpL6HT+9KxeaW+f0dzhI+9dUWD9F1q
	7QXdyYWtv2FFqMzqaZi8/Cyx42ZbAL+dA2Sbeb9Rd+0d0EL1BMGzN3A6RYfcfqUU
	zbOJgeMYkLutySl9i56+j8V7vlxGKTV6AU7taUwDG5JGydnSGLocyGk/K9uwR+mW
	08JfEc5mok55GFWTfZKfSQxxZmwOmayDMvchEI1nr1E9ay3vghOR0LL7s3orF63t
	s3q6UNOz3hQo2gBvKD3Tg2jIfPuqO5IjBaq8/jQdZ4Sj8iVXA24yBmVEEIBNGLyT
	jRhD6bkd9pZtOdXEHf76if0sOByPzbCiK8GxcbW+I6ytOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubh4kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:52:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1dea13d34so58816111cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766256777; x=1766861577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fC0xIQ0vC/k5ZPKJM+W05pozPL3wqK8ScqL5Y5zF8JQ=;
        b=TVaxbtM1l7vhjPNp5t/DeHRslI41I9qi52324d55Z4ynRCt++6N5FExiVebRHuzJ8a
         Tg/FVXMqVseAOWtFEUs+/Se4uhcxy42fO9ABniM9+X3GhdeBVdzVsrZhlFFWKPK5t9bW
         +3YWRjKHBz2zsfjjOUJ6N8rzgrT91iP5H96ljmKFxAopvK1TjLIm/pCoflJCLpVeoN1w
         fp4RaNOT1dw16L2CNMIoQWoSeQQfb/8wLVeA8oqBz1t3gwcoVJLXo6Z48ndm3z4uWLcC
         lHmlUY+Yzml6CNiEWv1/XQhEI5QyMB+D6aMEQregfan8rKkS31L3ZdvV01wxQJvApsDQ
         Zm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256777; x=1766861577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fC0xIQ0vC/k5ZPKJM+W05pozPL3wqK8ScqL5Y5zF8JQ=;
        b=IpP/3WByjCKIi60AE8DO2MOrA7v6aWrBDg10jZUOikm4+ttsHIuIkCdyNPqsKhTcln
         BnVoNyh2W7jAgkhwLQH4lH6z6qT+ZS2yPqnBEYu+tJb5DtYug1Y1r/wGJVV9LXvP+brW
         2zKa4DNzBikxR8Wb5tkiwRl0cDiPlRNmOXIVFhR3DSsGtHtCHKCno0WPJ1WmkEO3OcNi
         gJZmeJ3lE0xOrUNUXfCLVFSIjcq0BGv+eE4t+T+cZHYiQnJPVlegPNmhZx4eCCfkB+8s
         /38fVrWdmpDxM1u2g/fhxI6DNs5HKefmgoFDzI8i53enEEQn7DL68SHnUugP2Qz0qugE
         cZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWsYGyYhbyKI7ruw+FGH6g+L8/Ciz27YG/N6J+OhsTI/MpdfeRQ3+U0P7poxONq4Ayd4c1YNfbwqTFoK7Z4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhdyl5uBYaG8u0ZDXbG3A8dff22ZCldceuGKE70XN7iHjmy9Ry
	A8KC8R14wAY2py64Sn4okr3NuCF8Ci1Hm4e1iazdSLCSYZfJBGeh5TaXiNZTg3WgxYbldtJsHg4
	lCCW97lL//meOdXNg6cFk12rOB1rl0R7Evhsse4ehFeM2MDKO+HtfBrdlKqdij16IKcJiSSQc7R
	cu
X-Gm-Gg: AY/fxX500xuhJQkG1VwcKGOOJX0x11WmnizNCarJ+aSKtiXTFLF3n8rlfJBNyu3qjEC
	TNVC09RYPXE71ryU6ndcbA7TijMKxbfcvvB7F9r1MKzBoOSzDqXlSYmXb3KqhR6AdJFL94d+ceU
	aPGXicPxzsHwYPuZWahcU2hlGZkaZM9AlbBkH+4QltYfrqfGgIEldWaRqTO4PCDcBwiAOkJCVcy
	Ycjqnmxb5o+VIdjot/1xn7eNxaRws8iJncmGbL1dwnx2pU2Gbvh6mDHGPPu2K5rFLiPoVK0Ltu5
	sRbSQ7rqjSpF83f8vKXZAjWg3gr8sp3ecKR0qIERyrmBUCMhAA6kalwy1/K5Km0RHhrg2dOlqbj
	Stn2VqQgXNJKlz2CbfUy5m9L0w0GmqPGjfgRkK0NPt1RzF9cEen3FkucbRMxpDS+y/QISq2AK0M
	TnaiLJ7JjjrJrnOdJ2X40+big=
X-Received: by 2002:a05:622a:244e:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4f4abd9704bmr92172361cf.57.1766256776986;
        Sat, 20 Dec 2025 10:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGknslBISCpG5MpYlgN/riz0Nv4ZWHD9zaVOxgyZyzD626t+kTcEME8/R7detFh7kQ7SBiOFw==
X-Received: by 2002:a05:622a:244e:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4f4abd9704bmr92172151cf.57.1766256776537;
        Sat, 20 Dec 2025 10:52:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122683ba1sm12444291fa.46.2025.12.20.10.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:52:55 -0800 (PST)
Date: Sat, 20 Dec 2025 20:52:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
Message-ID: <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NiBTYWx0ZWRfX7S33LAdD0fXR
 rWxbaPKS7ma4PzZrbRhfg4ATtqDiJ78jhw7NYI1prLMtAV3qtX3wAH46H9KygJxcheQ3OdZvFZ2
 eNwYs186HKzrvCracBpyqFk78zyL56zhHXlibTUmXCL9pZaqdkxcGEtX6WzzC8wyw1kCkd6jXKm
 C0qSNekYjEFNbAVacZtlZDJfrXQuKookCebkYNxDEw+Y/oruWwYLnRC3VMnyia3o9WPDAFoWPHh
 0HheGrXKRW5A04QhALdEiX4OqvaUe0I2O/w8KiZ3aaOW2fV1kHPEjtSujoO4BJMYyyK0LAi3bCW
 kXS4vc361aG+ZiV4xUASxusbIDvknsMo9T8KvLJDybn+Jv3FBDLXWWxixVvZqZtUwKYf2leJd5l
 q/XopF1AzEABsx8LtRpmHMQ8HFijgRurgGaSKjXQH2dP8TvHgNGaB0W9ym3GUMxbIbgVcQ3q/La
 qvO/OIhonY8TVzEkbgw==
X-Proofpoint-GUID: bdMwAhzMB8D_pbBxBu5LIwxZXoIEX3p6
X-Proofpoint-ORIG-GUID: bdMwAhzMB8D_pbBxBu5LIwxZXoIEX3p6
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=6946f08a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gxl3bz0cAAAA:8 a=9Su5i2PWBtevO9UuUcUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200166

On Sat, Dec 20, 2025 at 06:47:10PM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add TLMM 119 for hdmi bridge enable. AeoB has this gpio.

Whaat is AeoB? I don't see the GPIO being used in other place.

> In general this is the same setup as on the T14s. Since its using simple-bridge
> and also is Lenovo, we also use the same realtek,rtd2171 compatible.
> The real chip identity is not known yet. The bridge is wired with un-swapped
> lanes, though.

Is the chip marked anyhow?

> 
> As for gpio119 being used twice: It doesn't work if you don't, so it may be a case
> of TLMM multiplexing hpd for both ports.

What is the relationship between enable and HPD?

> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> index b505a4cbb4350a962bbf779ec788265c7583bf20..80172f3059a42c8656eb682682495194015d3bbc 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> @@ -78,6 +78,47 @@ camera {
>  		vdd-supply = <&vreg_cam_5p0>;
>  	};
>  
> +	hdmi-bridge {
> +		compatible = "realtek,rtd2171";
> +
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&hdmi_hpd_default>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hdmi_bridge_dp_in: endpoint {
> +					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_bridge_tmds_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> @@ -1038,6 +1079,14 @@ &mdss_dp1_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> @@ -1327,6 +1376,19 @@ hall_int_n_default: hall-int-n-state {
>  		bias-disable;
>  	};
>  
> +	hdmi_bridge_en: hdmi-bridge-en-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	hdmi_hpd_default: hdmi-hpd-default-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		pins = "gpio67";
>  		function = "gpio";
> @@ -1585,6 +1647,32 @@ &usb_1_ss2_hsphy {
>  	status = "okay";
>  };
>  
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&hdmi_bridge_dp_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &usb_2 {
>  	status = "okay";
>  };
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

