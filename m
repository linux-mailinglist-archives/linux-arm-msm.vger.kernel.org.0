Return-Path: <linux-arm-msm+bounces-76039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE51BBDA76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240D83B72B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835A5223DF6;
	Mon,  6 Oct 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxSwDEyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1461DF970
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745813; cv=none; b=UzfPZp79lStNGUXrkfZTBtuzzu7VqP8jx0CaMMiPlrW0eSdOd+sUsrSzKubWFRu7UzELWS5HXOwXxW0TKkpqpyeE2iE4l9vz/TClRlHxhWSE2+5XD3ztAgA8df6JRCs3QAOTPGI4bwOy/lOrPwGtuzHyr0WkU+3+HRVxTdaFJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745813; c=relaxed/simple;
	bh=dHsRpna2WjuerhFzdpSOc05iE7uPDXkdOmgTTjoMk+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMfbgu+XvHrKAAIhavDzshWgah2elQ/uGYGys8lzoe8SI8nEWGeICrV0ol2+WNYuiwTtEqk9rOPgVTgt3x5Zj35W2IC2hCa7XB1M3S2HWoT1GBE9WPmdT4UzEY0MJfBOTCCnZyvMLV9miT321EPCPWdYI+8YM6lvhx7vdPMXS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxSwDEyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595N0RJb026536
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J7xKo6sf5t7NdPV3xuhArRC2
	khe1y/xdABGS5JQwT04=; b=YxSwDEyTZlRrodNvH1t6uC5oJH86m2/EVQwMYsfv
	n27o62Vut+x4pjB+Kun2xvYIuy24JNSP9PZC8BfZGJYhtvwQHrQqUO+FJ04dVxxq
	iOrK3gj/lOAgWi8nKMctCa6Ja95boX/yLoLxS1NMVM27nbVhl+LKHbH65PX4w3qL
	72XtUxcCeJh7vXwtTViNOch3oUWIR7SUUnX0d6wkJb+SxfgqE/TY++urd6XxxyeD
	sCxWYUE7LUCkLglzCv9gO2R8bhTuT3brYSiqisqsFVsCCx7XT/OolT3szJstyIxq
	bjSzNRGGm1KH1Q9QY3BFWiTaQkmXNKlo2qV1OGowNheDDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkmvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:16:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0e7caf22eso127484811cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745810; x=1760350610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7xKo6sf5t7NdPV3xuhArRC2khe1y/xdABGS5JQwT04=;
        b=L1LlouBC+pzwbhS34Nc6656ZOfomUencad7f5RvARvm0evnsrAHP0ttais5UjzAIPb
         LpvMn+7JtkAM6mYttumRsyxSeXMqOqMTx1xZOv+ml03qmSXue/9rVC9whtlepIDmZXjZ
         BY8ReUQCUm92FXaGJQmkDR2GI90y7RBABSX+HvItnQvafI/NUaeLuqDTDXVuP/6PGqbx
         5ImQye6ty4gTHAEJRoDdl3w/SUJqFIwaC1p+xA+l5QQfzqQccxqtR/811MoGHm5pzd8y
         Nt/nmenE0hA9/EQEZmDqNITODbZ+448dry7yjzZth66zil4UGk4HyZUT8dbrbY+BD4QF
         iCkQ==
X-Gm-Message-State: AOJu0YzhFgnG38bLEKVIxorL27j2eTNwkpH43vW9FMNIIoOXqTAxuWGP
	ZFWXoKNVX/N9pt3YvVs4mWHJsqAXPiG7QTWwdkCOBHJsvSXjEfoCIJS5RlWNEd0Rbn9FVriFKxl
	eiYYrE5xeWXMo+hMRsEoqG083Drjy12v9ncXAHKn4Z12pJKjLVVclQQxEw2zamVGKUHd8
X-Gm-Gg: ASbGnctDuNmFGJyUwlQPWc++/jVcySKklKhTmIgMXvddUMZhHqy8EJpNKm0Lnjiy+vS
	6qHvXhQ+EPW99WrrA6rwEof3o3YSqTmBUDu7b6CLpfuXuJSkoYIKWZhYZTura4kZVZhFTYhEvsq
	mPzM2OBFV6FLgc4dPeM/i6l3tfpUqw0TI0qzWHn7KUi+4C/EtdonYdF49gWb7IG6ll47ZtHCLgL
	k9NzVVsTsZdBb8Xs4annfybFOTDA7j+Vn0ZdSle5J1KcOWRGOT2P/s54XUPXASmCYTgGzMNPfVP
	MlDRi5i5rtfmYfniRv+Uwm2GU11Jya2WzKW72tH7y4gNwpPRcUgBW5ShKo7M4Q8C0h51xlYRY9m
	XNTs++9DxV+DQXoLsSpoK1IIt91ez3WD3JaDbgqWKiq+BkZDLsoi+FUbAyQ==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4e576a7bb1emr149923461cf.23.1759745809562;
        Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdVkkz0Bvskg+SlQ4eiYj13Kfc4CHPGeJdiuBJRRdTSxJrU6Luy1zywIhFRnGiP29t5s4x8g==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4e576a7bb1emr149923121cf.23.1759745809020;
        Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d863sm4893943e87.70.2025.10.06.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:16:48 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:16:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-8-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX2aVbMmX32kMK
 ECSHwoodHmPb1b9ENkN3fFboZ3BBLEcAfGr64kpCEf1d8OJCBCrfs8zs/lwvf2yIl/shTqPCVMR
 yky4hc6GKGStfLNMCkRFetuWWuTlC+ffEWWYqvfLValL5ca3hEw6nxtph8AZ78Lsl6+M9wwq3Uo
 b/jOpqaeummgIp18GWzunvotAKSm2CB4STFGWUu3xHvPYbx6pSeM2BKsyNHMeVw7/0nXqM0Uojz
 cD4qQok8WiWVJ78ILIEVYs/EkoiIZUY0aMT43inFPFV+Xs94ZW0hNZeck8wXa1NujT1Nw8QtM92
 6gdl1FS8IwurjMMDV+5g4iAqxXLEugANZfnqRo3URjHK/Taryf/32kck6c4tjBeCCjMBsJ2K85S
 nQAGt3lCCDOfj/S+HOpSXyHmt+2yZA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e39712 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0vFitCv-P-mLjvDJNjQA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6tguhw3wFSnqbWQqxCUu-mcBXz5DP6oU
X-Proofpoint-ORIG-GUID: 6tguhw3wFSnqbWQqxCUu-mcBXz5DP6oU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 891e49602c97..5d4040376857 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,64 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_12p0: vreg-12p0-regulator {

Why are these nodes not in a correct place? Also, why are they named
differently from all other regulators in this board file?

> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vreg_5p0: vreg-5p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_5P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
> +	vreg_1p8: vreg-1p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		vin-supply = <&vreg_5p0>;
> +	};
> +
> +	vreg_1p0: vreg-1p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1000000>;
> +		regulator-max-microvolt = <1000000>;
> +
> +		vin-supply = <&vreg_1p8>;
> +	};
> +
> +	vreg_3p0: vreg-3p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
>  	dp0-connector {
>  		compatible = "dp-connector";
>  		label = "DP0";
> @@ -36,6 +94,18 @@ dp0_connector_in: endpoint {
>  		};
>  	};
>  
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge_out>;
> +			};
> +		};
> +	};
> +
>  	regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "USB2_VBUS";
> @@ -316,6 +386,70 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs8300/a623_zap.mbn";
>  };
>  
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;

compatible
reg

#address-cells
#size-cells


> +

-- 
With best wishes
Dmitry

