Return-Path: <linux-arm-msm+bounces-84530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFFCA9E30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD06E301356B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC121885A;
	Sat,  6 Dec 2025 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvIysLLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrdCpjLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED7C1E0B86
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986986; cv=none; b=DWZfjRo3J9BGWsogVfKVu9HxSkZkTicp+O5oN4vJyl6ktuShwIb5vBs5DF5CcGkaIDHLOED2u691rFgL3xVIRK0Jf5XEqIV3N1uyV9/rEW5pSKW6iA+FhcJqh+anTno1i6z1I5viznHNvyhccgqkzZeYrI2t6feeKDNJsvlRxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986986; c=relaxed/simple;
	bh=X2AxqvaiKco3eVtL/7cd6xh4H+ydSodFgp97N1NLT8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyddESHSAbm5RmqoFkLuZTk9n0qOluPyPTA8hQ/jzHHMDGvYFnnmviJZn/B9f+g3N3QWbbalKaqYE0lub8vBPIr+c/zrdLOIKdTLz2+s2Amo8YmaDPk3TKCXBpxDq51veOuhDM5Sjq5jvz9mOWXI0AVPxqrR9lUc/0fOLss4MJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvIysLLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrdCpjLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKxT4177172
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wBjDcRm8AWQxoXh1lQ0ooLMx
	3oOAtlTuUPKtvzrTSOA=; b=jvIysLLX1crJJUEI4GCs93i+sMqMi9D1z3l7BL73
	LAv0p/L0wIzzZ4abQheIG85K0a8EOMz8zlr3NPIEjhw1Z38K9A4dGSvK7TBElqqn
	Bf/9LcO7DF1T5cuG27awNXUFbdiUp1h/IZ+pDW4O3mO/JBSWwWdb+I1qYMzF6CH/
	od2F+jay1WeI4Ug0M/fVBPgZYSBNJ0Dk4OAXQXm7EDI79kpOzc42/mtPbjuN7B1J
	WjIha3WWJACT3/eLD+Dy06hI/6cXKY94+z7AsoaWYd9/bbcmaY7gsS5Gd8NtPx6q
	cP/rv0ZhgXXKleLLtsul3pzpOlPDVExgzllt71zz80LhMg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm5a9vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:09:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880441e0f93so74492766d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764986983; x=1765591783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBjDcRm8AWQxoXh1lQ0ooLMx3oOAtlTuUPKtvzrTSOA=;
        b=KrdCpjLg4h8mcjundANFU3gke3hmdszJyu+0N5rqPIo5pOHADpsSaEwuI/lyUCw0j7
         pQbJnorg0BsO01NsxUIH4587QLXKgd2rbxySKeKzR3vU5A1WIF3u0tHLkGsnWub6ifS2
         jrOrYbsrf2bUl6LGEfHogdanGy5ansVIc3t2O/mlUQeRnYJnJ/BTqJYqq6qXMwpu1NTZ
         4vdrQQEI8MEhQufUvRGwFSMXCmaXzaKzgh6PrG1i3cA+yizD7NkJGjBx47HT8sF10IuU
         6EJq0wEP++9RDJipbuyMLZvNe0vzP6SxUPf2kEq+di6niE2uUqqrl2s5PSKYU2JNEZ1A
         6f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764986983; x=1765591783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBjDcRm8AWQxoXh1lQ0ooLMx3oOAtlTuUPKtvzrTSOA=;
        b=fZWRV6AukiJgkWU8wqVhDAkfiBZo1mnA7Xc+8iMWnRy+OR4ADvvuddKHjzBcllxXUw
         srM+2Kz22SIYUxWWVZVkf4NiUbjlAAdf9ukhFsJKlkg44/qlQ6pW11OXzPLpbyP3ayV9
         ZkxVC3LH8Hlk8MIKO8OLi+C+FtMd+atVk+p2f3M+HSI0Z6Kk28GzBYAPHe3Zj4SkmIdZ
         5fT6+kvoy53YUUsxZg7sRRjUIUm7547TVfHdcZ4A7HfckutvR8VYnQCgD9U0f5bRI2vS
         +EMFFebKbrgDTpV3yxiREvK83LqAE07c+SjwR6CIUG4YP57tq3TCc/1JHcuTzmzHEvdW
         kc1w==
X-Forwarded-Encrypted: i=1; AJvYcCXJOCF6GQ/cdFLXtuUadd6jCqxxFh9RIWiBlmROR2owLy8ysPlA2uyWcoUdGVo+maeAG2+3mOaFMaxAS0wW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+uL7Iqy6Y0GOpwGkl/5hUbHvHui4pq8Fdu66sUwgNyiS/Pbe
	tf1cITjPEgV/AY++JFNIld7ySv6x+77FOBZxpF/4910NKw90uRTqo8U6la8DvhRONC+NakYcOwD
	hzFuqPJkH2KvECU0me1xyI8o3KRirGFXiOgz1dOvOPmrAu+mjmZkZUombqxGIfD5F3+uR
X-Gm-Gg: ASbGnctlj8vhNRjCnGKQDJ8Qh0GLnHMxTi+VBovB0DgyU4GZNUudhii4NBsL2Dkb0jP
	V02EAXiaAK/v3/O2bID56lqrS1C9p/GYv/pm0Z7QZFg8rENM/DtotuTIg5FRuJ7ivsSu8UgB02q
	5rjS1QpMyoC6sgqNfr4BmYnvey4EqfDofZduDbqgDeP668hlB0q6o8rIdbCUlPjP2JyR64B+arG
	tDzml2S3WRsU9qPg+kLoz3xGa3t81/BvgFDDLQbqYZsL6v9+JnEH/mVebpWnA86Pcw99UWA8Nky
	FnfFy5ApogD0YPx3GUyhZoyv7D2YgK5itc0jzdIjDbw9y6LeYzw2nJoikzm1sB4K0wojqpKDgoU
	dq49Tqc3DShzFJmS8W2mMt11p5lj+g28PZ5T9E12gyaxmD6vaEfbUEu3vXm5oCuD3O1ZYi3pS/r
	CY/HW+VZasbGuXLAHauUEbUdI=
X-Received: by 2002:a05:6214:dc6:b0:880:5883:4d24 with SMTP id 6a1803df08f44-8883ced9f16mr21832196d6.9.1764986982686;
        Fri, 05 Dec 2025 18:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnX5LHkP/rg2bYvj21olLIjxKJGEG5reSqObxwn9P80vOMoPc/ue0NZyAE02vyCjWEwdmhIg==
X-Received: by 2002:a05:6214:dc6:b0:880:5883:4d24 with SMTP id 6a1803df08f44-8883ced9f16mr21831976d6.9.1764986982227;
        Fri, 05 Dec 2025 18:09:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597dfc08b25sm425882e87.6.2025.12.05.18.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:09:40 -0800 (PST)
Date: Sat, 6 Dec 2025 04:09:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/12] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Message-ID: <w2gtfgvbx5ujyfbilhyqblhlwo4ewybpmsrdl2gyafcx5etbnl@apze5qpd4okw>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-5-80c1ffca8487@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-judyln-dts-v5-5-80c1ffca8487@postmarketos.org>
X-Proofpoint-GUID: GH3mGhirGopL-zQnJAI9l8rZGcTbczRW
X-Proofpoint-ORIG-GUID: GH3mGhirGopL-zQnJAI9l8rZGcTbczRW
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=69339067 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=uCEot8vDWxj3b5wlwVUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNCBTYWx0ZWRfX9zpmDvXxR270
 +kXFLdiWrFtui1yK8JIOGzbtDUHA3wPBPkcEf0rK6MCwkXHbpQTLhKGcY5rAWjAuYJHIhZqXpZp
 Hryp6ks9KY5Uf934WK8W5O2zWw63cYPkiDVMoWiiNeeLrBb7KDyTZzUykFonbmTqtAKCshWr91p
 40eh0u3REz9PadlhZrt2u/Gr8CxWXpauFSe9Uk4Vy1YboBTlmkkFr845WCE4daqVp0zalCX2JGo
 oaNc1jv47M6NnxVYYnpVJKFbuQLpbzK/kgQBcVc6H7RUBnOvOm4q63oHsvXphby5OphSoWno7+C
 DfoB4spYVWQT2E3Pw0kjbg3HK+nfCyACqiObK+PkONwFuqhQEcKPvb/RPBpu1KI8rWltvJaM5N4
 1w6QMrZH3CHHbxDUV/a/Ba9SoWULiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060014

On Wed, Dec 03, 2025 at 01:40:54AM -0800, Paul Sajna wrote:
> Also include other supporting msm drm nodes, including backlight
> 
> Co-developed-by: Amir Dahan <system64fumo@tuta.io>
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 75 +++++++++++++++++++++-----
>  2 files changed, 66 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 165523db4d49..50921af83a51 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -450,10 +450,6 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> -&dispcc {
> -	status = "disabled";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -517,6 +513,10 @@ led@5 {
>  	};
>  };
>  
> +&pmi8998_wled {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 55bfddab3afd..506e6fe8e798 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -13,19 +13,6 @@ / {
>  	model = "LG G7 ThinQ";
>  	compatible = "lg,judyln", "qcom,sdm845";
>  
> -	chosen {
> -		framebuffer@9d400000 {
> -			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> -			width = <1440>;
> -			height = <3120>;
> -			stride = <(1440 * 4)>;
> -			format = "a8r8g8b8";
> -			lab-supply = <&lab>;
> -			ibb-supply = <&ibb>;
> -		};
> -	};

I think, you can leave simple-fb in place. MSM driver should be able to
replace it once it is loaded.

> -
>  	/* Additional ThinQ key */
>  	gpio-keys {
>  		pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
> @@ -67,6 +54,47 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		compatible = "lg,sw49410-lh609qh1", "lg,sw49410";
> +
> +		backlight = <&pmi8998_wled>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +		width-mm = <65>;
> +		height-mm = <140>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
> +		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
>  &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
> @@ -85,4 +113,25 @@ thinq_key_default: thinq-key-default-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_sleep: sde-dsi-sleep-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active_sleep: sde-te-active-sleep-state {
> +		pins = "gpio10";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
>  };
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

