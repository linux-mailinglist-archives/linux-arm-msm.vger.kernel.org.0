Return-Path: <linux-arm-msm+bounces-87887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC16CFDC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79A2C3002142
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48E131AA83;
	Wed,  7 Jan 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcfAFsKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fycYzEUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE3230BE9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790158; cv=none; b=UB+cqsAIAN2f5+rIKnNkAnB4F5yuqbA+kWWZBdwpKZKRUahLaFHn9ZY43t9aQXRokvvm1YXdYfephKC/mTZfWlgZ7pV6oME2nbcK3MfRtIboGda4eR3S2T5/yB75EvzA61LVzxMOtt8LZd6TwONinWieNbjYDFvHM9KJalm2FFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790158; c=relaxed/simple;
	bh=1qcGQuObdh8iqbwEEiEAuytQblaUhCXy84yY9yQKuQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SI3BJVX313Wztl1kRaPJbjF4Vl5qcXNnvbroRmy6O3XHLei8phCvqz3Ex9PU9xPsB+MH45TExUPAHyW5jJhc2Pjfsjl1b96Bds9NjMKMAd80Tb1mdr7cpDGtHAgNQRBmzfgRkSHX5jK/PPP+xeLXkR0tEqtuEWNCPqiinGK916M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcfAFsKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fycYzEUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q4St218374
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=; b=jcfAFsKcheXeoXzU
	066N9rpN+E8RR/qykmPFU/xqWXJM4tc5Dbk7qu7qM8pBV8Nb+OWtLD1M0/Ra9mke
	ASkZVtNycrA41d7T8U+6Z8kPxrZHlGS6v2pqil0766IIRmtZBzO2P0hQnM8/10Us
	cVccd7xOvFXIUGoFH+iT9oWWU8Ec/liPvjipy2lodOhmmssxdvj0jVrXaPl6EN+8
	1cJxkISsGM86YLUGM5f+X9NoVi+X1tjOKXfSXC9S4JX62qFmQ33E89LX0qk2JJdi
	7wWf4SlJHlVS+52s7uJWRvGUL7e1yUKLpqSiRyTmn035f/AVz/jIKvmZtVbcYjj9
	afiywg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808fny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:49:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so5781601cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767790155; x=1768394955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=;
        b=fycYzEUrNvdcicyuITA7ll6JOhRn3qB2FvGMzFBE8Nsh9I3dGZAoRKIR9szw94CtZa
         t9+aHpHJBf5mVP1gAFp2yCxScnbI4A2RtcS1omCTKPwAZnCqZrYr3QWfwP5Cyyr66wA7
         296cvbrc6/LEcdx9pHmx+LonDBzKCK03Q7r2Lao/NBIlpbo3pRuRgt9YntJIfmzNSJD4
         AF4EznJjADO2YwrTYuI0qM73cqiz7ruL7adQJtSOOAk4SAD4s2V0Kq5AsG1HYItV86Zb
         9pTT1hJrXxGeUXUTzllGMXUzgS4yJSKQzkb5b02g8xFqmsD9SfY58WAVQQJvZn8O9sCt
         S4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790155; x=1768394955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=;
        b=EnSZu84tKE2CngwwynOf9uQcqqfXDYrbsq8cXezlY7WoZcbp3ZgI9GlorDtf+D3y0b
         CkanXhjtaF2ZbrcTR/XHFqIP5BEhEA/bPHm89xEzgwzB0CGjSZYPSTpp/YMvLoCBwmAt
         6S0zeaFNRp52sVWq/P2evm4KQDCQMrj/SEgDVmWbGHJIIepvXz65KmxBOWjlWkeMh142
         exTuLuMfcq0OrUgKgTvqb5tUjV9zbNLm8hEEZ1cKcKPnS//UWwUPXZvFzUOcq9aq1Vcb
         GW/qEu2tpDP92YDFc/vq26kbDWUiIDJhkAXrNffPEl0YS2DxmvsNGgO5mOfRlHdlEVTV
         pcAw==
X-Forwarded-Encrypted: i=1; AJvYcCVmbNQR8ZCw1TpFqFFKhjM3ZR8p1YN7fl5N/NIcm/J3jwZv+AEG3hlbROhfy32Zf06NHBdXlGXLdnu1x2je@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwp8E2jdIIC2/dq+iZcon16nsf7L25Wv1JcfWqj1Mgk4X9pNX7
	aZUKQmAjdI7IYRaBRZO9JgW58ehJbHAQwWzN7HXOMNLmFUh8IdMIaAHWTXgmmANuQDrtZAaVIW7
	esEpH3K1cGLwv1go6498pSaWn6+DiAu7vnb7hk5uXzt+ZvUrsAkzlEMko3/c+GKVN+LfM
X-Gm-Gg: AY/fxX6+esGHEwOOgq33/SgOqUsmbQMBl+FWtOcLpZ1LZ3oiuPWj5AYot3/fsFo8U4j
	NW6f1r4TXhkJR1xG/Ln9D34fHmdfUjxB9Uegsds9sHujzMnxI7w9WH2vnLKFPgz6/SL7QhJkPzG
	M6nb1ijsJeeSQxEmgzgK44JvSPkptV1r+qYOYeIw8oQPVA2hC6IbXqfycSfbwE6bdmpphpdOcQH
	0JEmxAyW6PVHKgw+LArhQqO9if95qfU9nKCxRZBtGQ067YvMWVZmjR2u9HkIzUsh7sDdx0wP2ZF
	/G7imM9Zv3Zg0lqOwKFv5i5nHOI637Kz+dVvZyALPCooVHgUiV64E4CBCannuitRS+uFBQc6lVF
	igShX6UYvOc+Jp4CaNALqll+oxCWiSaIhDpyXm0InvhXq5T6HGwfvCCU1ZDdXhq/sxN0=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr21811351cf.11.1767790155512;
        Wed, 07 Jan 2026 04:49:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2gokG8ME527N405gZ3vkY9wgXfUJzv7dIKmkJ1ntzHzFlAKqpRNurWr83hbFVa265biuiLg==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr21810881cf.11.1767790154661;
        Wed, 07 Jan 2026 04:49:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5187afsm494238966b.58.2026.01.07.04.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:49:14 -0800 (PST)
Message-ID: <fd801381-65d3-4d9b-aac4-5e5a80487619@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e564c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JTjpC66V-8W1Sjuwpv0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pcqDGAvMNYZwdc5RzCdAIPrWjfTHxuW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NyBTYWx0ZWRfXzLA/gazOcHcf
 TCc20Rz8L8cBJALMcF7MAdwYr8Y3sw9z4sNAwq7t3NVEY5KWYpUcNnBux+97sIX9B6hRmAYaKSE
 jQueqHw4VZjGgA85Pes73GuRBR3l6+6EoHuSO8TaBmGm0A4x4B2bVDrGlFIr6xp1xkgHZyjG9Pv
 0P31AXfUuBCePSmo750xDEz60Nv6s9TmhD7Oinfo/rwdkLR3Cis44HgjxSe4aaArxW0rQIUUa7v
 LjSUoj6PugkiEuERNYddRSvcrzpM+Rw+PU0UNu9gJXhM7pL7LiCz5wzvWmxK4YgjLFoH2uqK9vG
 dkTJWy0p6TL/G6Ts4+BsyMjbn5m1BzNrelHDwFic7FWmntiCJDbItUm2s6rzTx8uZFd7pqB0Llb
 nydw+BSOKTlg8Tu/3djUnKO4QjKXhsV7OK+xJx4IZrIu0g1RcC5/EIom93j57FCMBt/05g5m13E
 hJIK4V0a3nNT1NDu18w==
X-Proofpoint-ORIG-GUID: pcqDGAvMNYZwdc5RzCdAIPrWjfTHxuW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070097

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 177 ++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 4a8ac26846c6..8d324bf85e4d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,69 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_12p0: regulator-vreg-12p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_5p0: regulator-vreg-5p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_5P0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_1p8: regulator-vreg-1p8 {

The regulator entries seem to be sorted in a "wrong" order (alphabetical
wrt node name is preferred). Please note that you don't need to strictly
have the definition above a reference like you do in C.

[...]

> +					port@0 {
> +						reg = <0>;
> +						dsi2dp_bridge_in: endpoint {
> +
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi2dp_bridge_out: endpoint {

A '\n' after both 'reg's would be perfect

Konrad

