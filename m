Return-Path: <linux-arm-msm+bounces-73976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E1B81174
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06039175329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9813C2F9DBC;
	Wed, 17 Sep 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfztVQ02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BD238C0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758128081; cv=none; b=LqSz0vVQFLtMAiMOCAxYexltZXK24JgYDDdW1L1iOcZuy3uIpeRzXKoNe+fYkjV00264k+XLv2+SPLqMu+57zViiuHlvYL8nLui3GKyDjUWzin3+PR8+IXF7W1xeXsEmu42BjaHKRmX2FBx1HEfUtnRCLLVQ7svltug16X2ASPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758128081; c=relaxed/simple;
	bh=SyJtJxKwiZOQHDnTsOHcrkAVkRbjedBronlgWywTzuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBe48/Qq3dd+KLD9VufmuFfOm9cLnwUDyov8lXYTVpgbe3eR0BXXBPFP/4F9VARSa51CshtEqXm2UrlORF02Zo0i2gQ3JC+XGByD25fI+FcExIW8qoVJBx42Ihcj/eINeiJMqYZvX69ogZRkVOexNP4grcBMhJ1twKFxcoDurMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfztVQ02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG4VTN027242
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zARoaOb0hV0AK1XBw4ZieqPAouTNcnUfFNkn3nSIXs=; b=WfztVQ02Jsu8mAgj
	u5mhtG5yZVXtHXsWP4x9uVCB/gxzkHDJxsiMbn8+j+jsyQhYpF1cR7Pn5Npzswft
	AkNmSjELsKL8k2y/TkcPGdOQGj0n30XJ+WixlSXb0IVScBDwIIgNhrV2y8XNuc9E
	+TLoIm0R+ennl+cHK+XEpJfZDgo3niEcTl+Ai0ga/PPaMFAN7AtnlYNiW8+3WozF
	Ldei6E5yCAFZ3IVuSaRVCN6LedMefKnCGLQehfzTC135mMNuPsPJs40jXLz40IIr
	46kB/KoxA/XjSia+as9u6pdDP2vZIaAfFBLQiOs0l/Em3I1XVFtRum5hkNIX2vWu
	ZnX3+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwk7hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:54:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-780e20b83b3so114356d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 09:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758128078; x=1758732878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zARoaOb0hV0AK1XBw4ZieqPAouTNcnUfFNkn3nSIXs=;
        b=CLFXva859JJiJT4UbvZ/Qf5OQtKiLNh9za2BdOcJX3Huog0hwqPryKUh7cQgjuzW8b
         0A5vJx/qNqcD5loBtLN9a+U2lXPjQ80rhuXZwTzKVtdwNlJKftV+c6CoCTHxMzOQK57r
         Nc8Ha2M+T3RhjiFUCZFFvfizIUanEpT08R1zBAnOOQNEv9U/MC2sP+c/xzIPve4lst9r
         aZTw/oVIKvowZ6jss+DvYOuXiuh88/G060Twuq8SVRSd8S2/MapZO8up1ADNrqFnfA3L
         b1SepvH6dSGW2tZ5aBOP9U7j/JByvJBjKHwyE6wxT/jkauR2FmhKKHjzYsIkxal1lOv8
         /Wyw==
X-Gm-Message-State: AOJu0YzfJucDUcTYbtT+cNMPYrixJQAZRge6KA3zHPaywx3zXUBty9u1
	ZumXVrkFavwyCzpUmZKe37Y12wy9wRUEaCYjq4rpBh157WgHYE7iSYlqgOjT/r18HoWV4A0+4eJ
	PGnXHFnqCw0Q5YgIPjltuR8Z4VTFVAIWw7yV6XXECU2+zvjZ6qZdy46LZHPApA99sVivG8GzdjR
	ox
X-Gm-Gg: ASbGncvwy2UUR5/ne7lNo7L2H0cwkUau/hx6WbE7kemEQ6+uM+6twKjca2CzHLZiV/i
	Yh4UQDu9n4BTcoIsjFKXX9AmbJ/J2IvWy36QWkA18OF5MJ02ojPKs5QPDMg0t4Lax/hqBM/5oR9
	XI6P7uYFLAyDJTzWOePn2s1PJASQcz62e+ovplYYM/k37YU20fCIQw3MzLIUiIFpk3UnIdFaJWx
	IVYy1OTYKewwTLIJJdGQfiavX90pOOW8sY7EkIBRJB3BwoJH4oOuGYkR5wfz7yB4YErEM3REtNa
	pAumjDBgk+oYVw1ujSnW4AdBHdOOZ1CGvgHk/WvQTc1YpJl1FKuSoZLOB3e2gDsHBrWZD2VeuDm
	ukbxf7aJxppTqViEN1WwE3w==
X-Received: by 2002:a05:622a:42:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4ba6aaa6f5cmr22202141cf.8.1758128077427;
        Wed, 17 Sep 2025 09:54:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL1WLwI2pVdGCUqXzTQB2hO+kB/OJq0w3bKAMfcEcXwN9znc8rDIhp2FUT6+LLzwBys1qX+Q==
X-Received: by 2002:a05:622a:42:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4ba6aaa6f5cmr22201891cf.8.1758128076848;
        Wed, 17 Sep 2025 09:54:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272061fsm6386666b.98.2025.09.17.09.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:54:36 -0700 (PDT)
Message-ID: <946d409a-de3a-4408-b1b5-5cc13a71c0fc@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 18:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+y+WYooFByLH
 s1ESYuW0ktDp/ZGU/M5Pi7JaogLnMK0nhGc2gjLoN2bRgPyrG1f31Bi/XD9j3Jyg8yJpsc0X0pz
 EqFUB4nswTC8uf3jA4UPV1MSb+WfHzsHkWuxCZcergS4+yMxcNCD0tupNx+9Se26oKbucyBI1XD
 osl+u7iSgxbmxKxjXNLa8ZDd9vt0KK+D9YTN9OLT+44Hu/w1nF8KOhC7cp9yn0TqihfMfz0NckC
 FFUD9oeYrbn2Z3+Ldh2uPFZpdvXyYBRLqdS+WWu5whK0PZi5pp3tcFZozl/McbYg6UzciU3KclA
 MqWRghCDXyZrvkxKqEeb6h2+rQigfA+ZEXQcv475/RqN6jnUu3YxX37ZaNu5GqvyAO69ixWn7OW
 gTqa+kvq
X-Proofpoint-GUID: 00b-_CnGV573qj33rtUm_sEb5QLhnXgX
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cae7ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7YCehXCNsrAZ-mfouP4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 00b-_CnGV573qj33rtUm_sEb5QLhnXgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 6:35 PM, Loic Poulain wrote:
> The PM8008 device is a dedicated camera PMIC integrating all the necessary
> camera power management features.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Is the PMIC on the mainboard and not on the camera mezz?

>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 81 ++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index 67ba508e92ba..cc0c53fec1af 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -220,6 +220,87 @@ zap-shader {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: a \n before status looks good

[...]


> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <528000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;
> +			};

I doubt they should all be always-on

Konrad

