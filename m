Return-Path: <linux-arm-msm+bounces-82297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA9C69642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E26F341C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7602A26B75C;
	Tue, 18 Nov 2025 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmPG92a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrHmB5jM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38232E888C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469152; cv=none; b=K8JdS8BGU7Mq4zVFo2ixCcuuoMbKsWIAbU7V57yEZHq+CgkxGiY6vkYSpyywMsO+JsIaKxXDC3LtCaqHEGCjG96pIEa7NeA5SkbR9yZsBxuIwC4Ajrb32xoqO0W+JBAeZk/aWpfXRAur1SLi1fmMkH89dVLdsW6ZwOlZlLwYsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469152; c=relaxed/simple;
	bh=fvFoo9fhDYfbREAY0AlledD8IPpn47ehSnAuBWaNz8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFJCmxjFFCC20K/hEQSXUEFMxU4YesF80vw336b4Kj6hDkWCZLbSXnRaFGReWmPBDsjKjnXr6c3ar5wZ/bQBRZlTm3ZXqDuwr46G9TQa3Q1CnvPf4Lx5M7mEH9cVNMoymAH8vmX5MA/N6IIHhUWK+C9IW2vxfUnHb6t1mQTbSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmPG92a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrHmB5jM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8lnb32756393
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=; b=DmPG92a62btS/mhL
	leNG15fgB7xCZQOhb3QGnesVslm6NdEKPQz7dWXoroLIaAMibQ3ZhyxFJNQHg569
	g2i9ENSsxDeN+BbwFZu8mJuS+zQahVRfRYNSG5vNUxBa1bs91U2xy/WFIfcmhQaR
	8krIGyG/oufveCbHVD+zcRyUCOyasopXd6ZT1+lTnNUcVrxRhEO6xU6y1hmuNm2V
	okby7n7tMHq/h/Jx1+COXGj6hWitH6HPI7rpp6elGsOBs6JayRcj9ywv7BgtQdaP
	LfDev9SXjTKU7s0LOmg0rdnlIqsuRl4bIZ8h/WZVTBQp3oPmyyaXqMaEbIEpO02r
	q6y/PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj0mpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:32:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927208so10710491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763469149; x=1764073949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
        b=hrHmB5jMpRhtwXJnvxDgHmLMbY18ffhRyCivZb5Hf+FsoceL77cGza6V42NaovN51O
         smkP17UX02o3jdWw4+/HM1Ddm5tpXx1ch+RUceXtYOu+oEJphs3GWnO2IJjyArL1aHOj
         2A8GpTAC3vn7FAtsIddIvwFbPb1W3lcPynhYHbvvsU71HBL/97ALVC/1atzvJl8v0bAk
         s3Y57y/QBW0rWJZou+6oo/OttpIQZuQRM6vUWqFlV7DKzQxCKnMYjgPNAswZf/Vvb3/x
         6wizaMDTLh40qINIK0wwldJDKS6V+G/+PeLR+qW0RWaVhzrVewuNw7O++fsYal61G780
         SIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469149; x=1764073949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
        b=EWGwjtW/1aX3wzXC5aEp/sfE5+3B11WDJlCCLcbLLQqvn3CMBdxNrqnLfxgG2n0JF0
         yElEpYaWSKk37fp6wBeQit8n9WmDpyqTtE6SALRe0WOGdFT0Gjra+pe798NBXa3O1Hvp
         +XQrEiZ/n0OwIYkCQkLjGsFzunXLj87EydAdLqMbgtjwMi05YZOxHK/yxyVPGC7aD4E4
         H57gisb7GJF1It2sQTRcUAs39+G9rrsryNYFmP13q3XwivlJwb23PWrx7b+Vwbg/P6MV
         sKqTV5QmRZkxK24EALTUzjAXYxtfmswCFfxn96eDfUPVB/ATZBUq0SHaNn7R7gOHz5KP
         HF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpWQ4eQSm7V4RGayIqO3OaL258v0VJlNzFFU/UGfJwqdOl7FtCvfULSJ6+3Vkzo9gtVHEF7dvol/sdE2UV@vger.kernel.org
X-Gm-Message-State: AOJu0YwodIpaqz37ddv0kqkvaRvB+wQkSKew53ytaOltkp4M1wN4IQLs
	tapIDI5x/ZshNQUHgvF7U1Ga57EiwjlUoDKGyn16mRnFS31L54ElSO6/65/UdTxFFJOok97lmxP
	IeQVtJWDpsEbSCM3Ri6zMick0xZIDyY6IWkNIVwFvrF0r+8gAZacVHkBM95Zd/Iljpa6Z
X-Gm-Gg: ASbGncs0YFquJIYRuraPy1Rq7tVd4Iq5C9HdoyOyL4Gjvmdnq9taN8D9jtBCabJaDL1
	O6Xi7A1C9A2hwpgdH1bGW/acIHnIbg62AY5hJ96WpP321bvgt8TilQwp0qAhULkCijWdAoKKJew
	Eoio/DO3QyJv2mfdD0/FiXWQzxk6iMn556kpIhNQ7d3iE9IupTWklPB7eopmDLsmQGZmJauiBbz
	kwDzhA8w8/b2bR1Il3lJYhhsp5WX1FZP/B4Z+wGwFrzn0oh54b/lOhOPVeDlGg2utbL9VQuoxow
	SCQkW5MDFIHjvlLeRx63ecBiEQnao0dxcWkOBzjcWtmlitLg2wZrhZlU0JBy+FpJYbDkzz0SxqV
	S0uHH4IKO/Kzw7HppSCYeZDjb2LBnhKN/nTtm5IlEBgQ18yvEbF5hooHw6C21EG0lWR0=
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee313fc7f6mr22769251cf.2.1763469148947;
        Tue, 18 Nov 2025 04:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/j9scY6gKmY7H/LVrmAogDQfP058lK6yPhTQca2byI2jY5prL43O5zkzKrB7PPWz4H5MFg==
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee313fc7f6mr22768981cf.2.1763469148416;
        Tue, 18 Nov 2025 04:32:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm1345195766b.62.2025.11.18.04.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:32:27 -0800 (PST)
Message-ID: <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:32:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zJtJ5EA2Bh-5lmYzfMMA7bSF2D_25PE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfX/lVRrVYyUklR
 NV7MfW/qetcsKl4opQzF6Cyo06yFKtTGcFOQZb2jed5vTw/Y7loMLky/NaK83aYMOoMnY6NAyog
 V4mUqrB1QGiZKb2+/vI17i1ksHA4ux9avjNiAnOo5wdl+MWSJD5xaBd7yS0ZgtC3dddYqdenvd9
 ngLAy379VDRiEYXpHhrz4kzUMovZyZFjrPEezob7K8CeDOd2g0KjoBZa3f7UIwz5bKfbWxTTl27
 x8Ydk36v11dXhqognmCjsfFbY0RLWID81sqwwG586ZiuiqTsKVhaA29nTC+oyTJgy5z9VWL8UWi
 2HBMTC8bOrtquBPOKaKaZadrK1A45HBkYVzxK3QjAR/5lQp3EIjEjfap9v20JZND8KXo1jzLXDy
 Wd25bGosylFC6au1YjVvGU9hGR1ikQ==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c675d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=T2UTSHRGlJI1zv4ncCYA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zJtJ5EA2Bh-5lmYzfMMA7bSF2D_25PE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180100

On 11/18/25 12:30 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.

[...]

> +&cont_splash_mem {
> +	reg = <0 0x9d400000 0 0x02400000>;
> +};

You override it to the same value on both devices, keep it in common

> +
> +&framebuffer0 {
> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	format = "a8r8g8b8";

The format is mandated by the UEFI specification and won't change too

[...]

> +&tlmm {
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";

Pin entries would be best sorted by the GPIO index:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};

Stray \n above

[...]

> +&adsp_pas {
> +	firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";

Sorry if I asked this before, but are the binaries identical for
both devices?

[...]


> +		vreg_l14a_1p88: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

Is that still the case with your fixes to the panel driver?

[...]

> +
> +		vreg_l28a_3p0: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

ditto

[...]

> +	regulators-1 {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;

This is a very broad range, what voltage does it need to be?

[...]

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */

stray space before '0'

Konrad

