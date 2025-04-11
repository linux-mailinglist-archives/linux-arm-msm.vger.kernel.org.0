Return-Path: <linux-arm-msm+bounces-54077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D234CA8695F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF39E1B6530C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 23:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285182BEC52;
	Fri, 11 Apr 2025 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQ3dwEZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF72BEC48
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744415013; cv=none; b=POLk9cKDR76X/TzF+/oTBE24l7segnKKwgXJa0uXdAbsB80pC9QX4pLPzbd+jm57h0RLqJG1dH1PccKSlhQTBBGlQX7YxITP7+6pu4A8WcT1odT2Z5YrpL/IrdZlKjKFevmy2eT7lfAc+ietZsgvrv/A/0TcmJQQMlwdpp0gP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744415013; c=relaxed/simple;
	bh=RcYfp/RjV5F1dKaHB49S7m3vw72njaVwN3ugq7P95S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNVrbAMG7TMLRatVsMAdB1YnzxSqdH0prF+cRrpP0HNo7m2i4NdNwjEvQrl4OXxqFKz7nceroyiyLCvZNc+dk8GcqkZjS+TZ7zZUw/EG2fFkY3br+88ucjo9nEvKMiZkv2tf5iRYwaozXm15tM+krzzs/IxXTrYakB4qr35Rt1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQ3dwEZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFREBp018394
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kuwO957i06jlGl35YGVg3kdzK0saemUuXwQScoMGh0=; b=XQ3dwEZX9tsZtwYx
	/NE4ChGMLeguTVuiUE5GTgb82bXZruH6tgXuUkNKhN7YkOFrqSq34aIAV5aSfa7m
	xIjah+eQ3uKG2OYh5FeHXz/L3geQhOqT4Vhvu0Ih/q8kCwwN36KprfI+nt92VU5p
	D1WPQ8LoPZwasbs2uCg1ZXvOcf2czFwOVXTH1CHa/Vl3J4WOhAgrrWHMNDG9cFAQ
	0Jehvvro6M1twbc6KduVg3RyAqp828vM0OUsIJPkvkVLkpKTHPIlp8nSIb8l363F
	N4iMRcDnnWEHpnn9tKEaC1TJhr+768RLaZ92pEosQJY7JYwbdE4fB/4S3uQ7tMl0
	/s5hBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtbc1ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:43:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso59612785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 16:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744415009; x=1745019809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kuwO957i06jlGl35YGVg3kdzK0saemUuXwQScoMGh0=;
        b=E1IzKhSzol6sUpvttkkWvJnpHyvTWCJSTWl1lG0BpfCcXQ3Pq0Yxtsm617gvX1aoHl
         EqNOnxNN3LnTD0Zu/IVj7uB/XevfSmY1JfnimzShFEHTNQxH9EhevowzerO13J10cwjJ
         BQVYD6/F2i5rpSP+mXefhTHA5CsuYrLvKuYh56RUOjGtO/FRfS25VbjGgnJgs+r1aWn4
         7c4s+WEQSf305kRFqHqilcphzMAyVUrnsGNrqt25as3ej56DtxVWLqFwyFK887lPh+rp
         yMexRHexg+Ds4HysWk3fQ2qxC4ouJmAtdmJYAg3aeDZjMfddUd+7qXZTYimUFzN/EZKR
         QaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSz2npdh1iBUHeLTS1KqaNDhae8+3hjTI19lwymlB7I6BTEdHqY70dWzYKw7REQ8Q3d6Mol71DnPpAl1RK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwju3BWhtpv3Yq0Qkxd/z3Ej2LHMEMV7hYXs0PWEj24989maZM
	kyek6kaZaqPhzKxUnM5Tk+y20ujlzh9Iw3wS9E8h7sBpoJONCS0VW3LNOz8f+XPv5RE57DkU1ko
	dwkp9z2Li5HsvrT8dPdIzszVpZ3Ws0yVMsQilZqrpw8IrYJukI41Pvzv9V+D//lmV
X-Gm-Gg: ASbGncuOiJee++D45RZ3GJ/AkOk9bSab3sdC3AoSoLbnxSte+paNiMorN4ODPoFv2kc
	5gE0xeeyhQ8afs7uCpsOuKuQJnYggVjGRFw4FmowOyWH9Z6Ow/6tpQAazKVUxEPinFN4Ks9Qx6k
	FCYllDJqqjYrHBHDTXHtXxVC+7xxEofJ0YWzEig49T42jQvn5+W8j07dI44LpBZAESArKxjGVBk
	pVKu8GNUIK2Ax5G6pxhv9f+Fv6Uws3/g6pyam8YgU1i6biegCTNC2hoWZTZq9SegATx+4s1Ow2r
	l1FH25FqsLf85tdUL7qVWEWKrWdGAa7E0rx/+CG/lDrkyjRiyhIH9i5g+9rccJzW8Q==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f230ed2d8emr20608356d6.7.1744415009365;
        Fri, 11 Apr 2025 16:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjBNP6sTL79kHO3BeKhFTVOdbgi543Y7RfDMhY1m1LwH1hR6cEmGuWH0TjpSSwXUHB3XNjhA==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f230ed2d8emr20608246d6.7.1744415009028;
        Fri, 11 Apr 2025 16:43:29 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3fcdsm519045966b.107.2025.04.11.16.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:43:28 -0700 (PDT)
Message-ID: <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t_1rE-6K4BkbSJM8leuv0vleO3opgUJM
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f9a922 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=b6z04DhpLtwLpLbA0DcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: t_1rE-6K4BkbSJM8leuv0vleO3opgUJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=793 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110155

On 4/10/25 4:00 PM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---

subject: "arm64: dts: qcom: qcs615: ..">  arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
>  1 file changed, 281 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index edfb796d8dd3..f0d8aed7da29 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: tsens@c222000 {
> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0xc263000 0x0 0x1ff>,
> +				<0x0 0xc222000 0x0 0x8>;
Pad the address part to 8 hex digits with leading zeroes> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,

&pdc 26

> +					<GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;

&pdc 28

Please align the <s

> +			#qcom,sensors = <16>;
> +			interrupt-names = "uplow", "critical";

it would make sense for interrupt-names to come right under interrupts
> +			#thermal-sensor-cells = <1>;
> +		};
>  	};
>  
>  	arch_timer: timer {
> @@ -3677,4 +3688,274 @@ arch_timer: timer {
>  			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> +
> +	thermal-zones {
> +		aoss-thermal {
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +
> +				trip-point0 {
> +					temperature = <110000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		cpuss-0-thermal {
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +
> +				trip-point0 {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature = <118000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

Please drop the passive trip point for the *CPU* tzones, see

commit 06eadce936971dd11279e53b6dfb151804137836
("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")

and add a single critical point instead, see

commit 03f2b8eed73418269a158ccebad5d8d8f2f6daa1
("arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown")

Konrad

