Return-Path: <linux-arm-msm+bounces-54976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF0A975B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 21:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10193B0FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790C11624E1;
	Tue, 22 Apr 2025 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaVlGwIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130B22F3AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745350996; cv=none; b=ta8obkb0j9DxeCdnS0dsqmzvWYUgIfgt9rLAElnRR0ohrHR5x8P5Ym32kTYH913gG24J1ITqLz/mJi0+RGipiokU4sAfef7zE4dR174tUCMBroNrejRtx2D0L/TG1avRDJVsGLMmOA7QFrZ/P3ha81lD9pj1WHFsEVPlo026PcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745350996; c=relaxed/simple;
	bh=5Mvjqdjiw+ktY/PbZ6cN5SoX2JQMrR7l0YeCFcmYx8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU8VAcdiqhP873LeK3VtR11UbkY3wBACBV5YAw8BjMD3J7WdBhfw2AFsBY4DtWfa1nULFKShdY0kFxnk6JKHpEeIa6oBj/Y68gZxIeSV0mXtja1J3M+rVGKI59QRIVef++jSemLzFU5TtP/CjjjW5HBmWUNjuRrP+nfLBTRZlLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaVlGwIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6oST020843
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AgFaXl+2ehY/97PQUi3w6RvRtLNkPWJ+KAm3dvH/HQ=; b=AaVlGwIopaz2xhut
	angw5OZXI41lMRKgRV11qToPpWnWeGxYTy5BQ9lMUhYpE+f0n+a3DiAWiipo863E
	3n5wMDU6+xBsfe5dvTXPOejg7vneFl9hDux8wifHcWcluKulHE/WA6BVZ22hdkWU
	z1CCoY6pD6JBAbn2EGetYIWt/9ASPXjOBj3HCbf+p8HDEK+dgEb8yTlucv3pP/Td
	8mTQsYMndWHQRzJnkcIfejvikp/E9T/Ed7VcfG7yJCDGxnD0TNanHSwoLYZ7/pMp
	Mxgnwl2VhyXkIIlCxeUu4OmhgThtqw5NGL9DJJcx1sVDg/7Vct1kJKfeyjpl24Zh
	fpsDvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644790vdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:43:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so45000385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 12:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745350992; x=1745955792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AgFaXl+2ehY/97PQUi3w6RvRtLNkPWJ+KAm3dvH/HQ=;
        b=VH45ALiB0d1CUXZnHShe05S5Zp81WlcFx6sg+zKTMgx3z8Qmh4Q8J+6zwXrRu+XuM3
         Xus1/7P5ciiob0+mYp8qrZzNIgiVFIZlBCpk09c4faMRReLawq7b8tMhOIK1NUPLNkeQ
         VXPaaWT70kcRtosLhA2gg8EqUw7sB3o8uG01ACagFvYMYE4ASBZTpUIFEm7BI2Go9X0S
         Bi77cFR3OscvoMMk3cWJT46DgisnYf95Kw24EoBpmJ3PEVdkVhscpS1qRT0QAWsgYk1n
         9IoeKoBfii3l58oukiUCG6J4HsgHCVNMJEBpnKFvRfA/vLOsu8FGhk34JD5aznEXARKQ
         gE3g==
X-Gm-Message-State: AOJu0YysHwre+oPl5dC2Pg7ziRuQJlz17PNY9VV3JSDQnQK6TuplTT6a
	TQ15UqptTBD9EF8d1ODfOiXjODEgT1g8TOGoV22VsL+tr0wZxDIwl8JUxAYoi5QLG6CjwztuNX8
	WGq1HUUYmfrNd20xy1PM6MqUnma4F7cCIDOLxDoBJBYGw7YC/jm1VRlcT6RrhX/tc
X-Gm-Gg: ASbGncuGkiSVghUyHxmAFbUw6TBvYJu+4HlbodNgw6wR2trPgWVX6hPCS7CYV2F4WMq
	7SvbEBpBxrV7ZAo/LPklr+H/W2huV2AIHgNCTvIGyLljLnvMYascj6d57bXx1q20Rqe4FzRe+UT
	EjSotdl8S6YbI9rELpRr5SaqXykkKJeqU0oYWkAmk2S/ywYjmCu+r28tHi9xX9tdzpvj1cnq6Lb
	lklcZo+IieEUqrQ3KVKRApHjHFW7yxk83nbh/nx47m33gOj8VmEfzAjcm9B9U0KAnyaTr4dpbKg
	Fpvz9dwasc/81Q1eXDSXFbCXl5aorT2PDo779hPc5jktLQs514aUiLIXPhUt2pSsYLA=
X-Received: by 2002:a05:620a:1a83:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c94d34013emr34615285a.14.1745350992626;
        Tue, 22 Apr 2025 12:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuxL8/Ssxzm8EqO1Q6GrG/lBVltg0zWb+k/ByIXFSXpZq8RK82vMmqLLP8pAl8zTzD0ZAstg==
X-Received: by 2002:a05:620a:1a83:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c94d34013emr34612685a.14.1745350992165;
        Tue, 22 Apr 2025 12:43:12 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625833be4sm6552008a12.50.2025.04.22.12.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 12:43:11 -0700 (PDT)
Message-ID: <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 21:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -rCN6gFn3hZnbaXOeiXLbJ8OfG5IJJ3E
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=6807f151 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=PRE00VkVQkv7n3oGKTUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: -rCN6gFn3hZnbaXOeiXLbJ8OfG5IJJ3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220148

On 4/19/25 11:08 AM, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> ---
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> index 903bb4d125135771504281df50aa11c9b6576a28..17d3e319941b8fd0363af600d93fc10127e4ab21 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> @@ -50,6 +50,34 @@ key-volume-up {
>  		};
>  	};
>  
> +	i2c-gpio-touchkey {

'i2c'?

> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 95 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 96 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +		pinctrl-0 = <&i2c_touchkey_pins>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		touchkey@20 {
> +			compatible = "cypress,midas-touchkey";
> +			reg = <0x20>;
> +
> +			interrupts-extended = <&pm8941_gpios 29 IRQ_TYPE_EDGE_FALLING>;
> +
> +			pinctrl-0 = <&touchkey_pin>;
> +			pinctrl-names = "default";
> +
> +			vcc-supply = <&pm8941_lvs3>;
> +			vdd-supply = <&pm8941_l13>;
> +
> +			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
> +		};
> +	};
> +
>  	touch_ldo: regulator-touch {
>  		compatible = "regulator-fixed";
>  		regulator-name = "touch-ldo";
> @@ -149,6 +177,14 @@ touch_ldo_pin: touchscreen-ldo-state {
>  		power-source = <PM8941_GPIO_S3>;
>  		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
>  	};
> +
> +	touchkey_pin: touchkey-int-state {
> +		pins = "gpio29";
> +		function = "normal";
> +		bias-disable;
> +		input-enable;
> +		power-source = <PM8941_GPIO_S3>;
> +	};
>  };
>  
>  &remoteproc_adsp {
> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>  			regulator-min-microvolt = <3075000>;
>  			regulator-max-microvolt = <3075000>;
>  		};
> +
> +		pm8941_lvs1: lvs1 {};

LVS1 is unused by anything here - it's probably good to define it, so
that the driver picks it up and regulator_ignore_unused is aware of it

Konrad

