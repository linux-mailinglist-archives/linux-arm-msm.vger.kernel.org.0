Return-Path: <linux-arm-msm+bounces-56106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16631AA08F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0144679C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC25B227EAE;
	Tue, 29 Apr 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWFVsorX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA81E231E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924237; cv=none; b=HaGjcQwCt2XFskLmMJ9jWjBjsde5gdpgd+KsgQhLCCgBAst4ilavRn9uKUz5pswPyinEyTv1Ur2yLutwYUXLArqplOkzUHwH+Jjeq+/29CgUpkK/L3Dh2TNMxg/8SmTe/wcvih9nF2f01LHBXtG64ulsN+Y23yaOhRSg0JAs3co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924237; c=relaxed/simple;
	bh=Q3IUv1IptwoqxtcxxQnCfv/z8U0PZ19+CT76FvE/MI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=balg0NoFRt9ba3fz+bh79iqt+v/1+tQHfO/n5QXmAexyd53BAj2qBJL/Orak26y6wCJWhxsh+Ilmd7PF/qhXrfuW33/awv/XuVA4q894bdAHXRjmqM74xyP0v+4V++8JjiXXpAfk1Yq1h8OWZsrjoFYfxbVQU0iUdvqVcTG95eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWFVsorX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2A0g012474
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RaIsk3krAO50FiCRlyJ2JPF+E8yq6SBCaXeUPT0TyQY=; b=FWFVsorXnJEHGeOE
	BInV6qWg8TV+/qsACwdFnOMm5gAf+twqVkl4hO4SkI+wB7oTHLZZgOdNfEAg+y8/
	XcdYDs/N8/JkDF0FeWALxtm0DXxFo9QhmTmyLtcgXe4VuwXe0IvuKYPs5AD9fnj0
	vSMTcRV0kVxi4MirRxFWiURZTtwj0EVJ97POuxRGf1z9sgGhYSqzXE6edHQblZdE
	Kq6xd1W0e8WwQfs1B0FuLta1KT/r/IIqzC3vCj8G5Qe41znJyKZ11b9tJBQ0tgis
	j3zbng/3bdBDYGjxQn545V+MS7UY3igzmJCauyjpF9WMr1+GhUvXhs4wLbV42P8q
	ylm5UQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9ca3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:57:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso10968351cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924234; x=1746529034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaIsk3krAO50FiCRlyJ2JPF+E8yq6SBCaXeUPT0TyQY=;
        b=SAmp/bLSKqJJTn6XJ3GTc6KE8eO4KpP+uRKyZyFnT9o5rQjX+Wkt8Mz2d8HfHGDOiA
         YzhNpXhO0RZgvLrAVJALsjTziQsrTS9qqkO1lo8P1Y+cFVjY59NkAkrX07SVLL0SH5+a
         8/NbVkGGnnQJEacChTx6qDpNZ3AiIew24ZgkLuwRpNra3znFA45HxFVQ2Adcwa51eiAk
         LqPxoPxUUB1rhbXyiZNfZkAlRs92SsCuKWVC4Ao4mMX6zM/BI+x/CcCe0z7GVcVn5O6G
         BxCGpFdH9MkpZOPkDVTh0XFX+mH7G5q03zIJMT+KL/uvJiuUge0d5Lq7gHIIjF6WpVWZ
         SGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhc8KWBXU6pz3KcspV/6DdnbaOu6pUwZCoQQ2B093GbhnvTWfHfEbd2dJOE5JNZULW02Ir/Qys+iMbIIYI@vger.kernel.org
X-Gm-Message-State: AOJu0YzxcqcicPBntUPIpX8CaFRhUK9P0ahGuAJUbtbyWQUEWCiPxiuN
	7HpZ13jT3ssz8mFvhvA+nd/so5N43zQpnQUCZONjqRvFoVqOtOcwna6mGcbWf8bc/KDPq3wquaJ
	Ynv7O2dPytHKiFVqnuTcf5sKRQlBu8Bmri4fP2RQHbitmeZ0WIIX3tjrTJIOoBd/p
X-Gm-Gg: ASbGncvJARoyMQOna9NjzMv98ksNG1pydDnYyc7aqqwtGG/FWo83mPM3k2wAIQolPq7
	X8qE4ZpLekB+rXcH45XgIV+ghZ+wAAqlnGmTJbBi+EoWQ9Py0S84i5pN35tK/CFC3m06wzO3qPx
	khFB08uLSgctrYOLqY+5r+POcU80IRjVuosB1Xw1aTdfKERnNXvHSNuohsN9rUM2HPpf3OwQ9py
	yln93L5ytXTf7SIDKuALNMbCphJV7CPhNQBVfWNCDP4fCv5Lzd9TSJi/ljG8GbwJxzEBWHLypTi
	k6dVe6Fp1v8aBAXUoYkqlTVa7Fd+Dg1y1C38kg+yvcb3qHLMrB/yJ0zwMFcwaxn/XA==
X-Received: by 2002:a05:622a:1822:b0:475:1c59:1748 with SMTP id d75a77b69052e-488682fca48mr15300821cf.11.1745924233845;
        Tue, 29 Apr 2025 03:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAGDiKbYXYI1YKP03aH36Y/ijWTB1LGNtNpA7B35+8pnVEETxrISLoviJLQZ9SaGON3KQ2KA==
X-Received: by 2002:a05:622a:1822:b0:475:1c59:1748 with SMTP id d75a77b69052e-488682fca48mr15300571cf.11.1745924233440;
        Tue, 29 Apr 2025 03:57:13 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cb3sm771648166b.93.2025.04.29.03.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:57:12 -0700 (PDT)
Message-ID: <af6200f6-2abb-432d-a196-01a7e77f2649@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:57:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810b08a cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=hnSZPa_brixH1gHJoW4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Vh6wz1oyMfKJCKYWvfdOJcu0okrNxEiG
X-Proofpoint-GUID: Vh6wz1oyMfKJCKYWvfdOJcu0okrNxEiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfXy7JM1+f7ws1t Bpl8V62bIYs/h4Yx6HGi8BPXutnrklvVcGieXTHJoH352skoecbnSxo6AC8Hi+1U4e6MgiUTJuU AfvVmF8te3eU3tzMTniPz+ZW3OFeH7xw/vzH1ny8D82WhflBVzREnbMWlKAaBD4YRSnmT6Fg1pC
 ZtsabMeryBnN6+9kJkSTqMGJKre0aTQiuqwB6I0InJcDn6bmaE8snx1C93056YbJrq+6BVV2u7g puBrgiIijp5t3NAINCtKstnZKwPnmQavyfUVQn96KJZXe/ixhh2FW/195eygFLdEAm6omyM6wlQ D1qq+Ws+kRIwdF/JUZsdeYWIFalUNPDshl7sALS2axZdP0OnL4W/0QjrFQ/A8ZFY42jJli6MFDG
 mQz7rKQFqw6YJEImvcc7mV+8LIblMlKPWTn7DkPFZjgSc8cPFrlEZ66MdCBDbb0XhyS9EkLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 70 ++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 5fbcd48f2e2d..43cbdbe43afd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -19,6 +19,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -765,6 +766,44 @@
>  	};
>  };
>  
> +&lpass_dmic01_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic01_data {
> +	bias-pull-down;
> +};
> +
> +&lpass_dmic23_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic23_data {
> +	bias-pull-down;
> +};
> +
> +&lpass_va_macro {
> +	status = "okay";
> +};
> +
> +&lpass_wsa_macro {
> +	status = "okay";
> +};
> +
> +&lpass_wsa_swr_clk {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-disable;
> +};
> +
> +&lpass_wsa_swr_data {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-bus-hold;
> +};

These properties should likely be moved to sc7280.dtsi

> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -1039,6 +1078,31 @@
>  	status = "okay";
>  };
>  
> +&swr2 {
> +	status = "okay";

Please keep a newline between the properties and first subnode

[...]

>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> @@ -1095,6 +1159,12 @@
>  		 */
>  		bias-pull-up;
>  	};
> +
> +	sw_ctrl: sw-ctrl-state {

Not only non-descript, this node is not used

Konrad

