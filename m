Return-Path: <linux-arm-msm+bounces-73487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D66B5710B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2992C3BA16E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2F22D29D9;
	Mon, 15 Sep 2025 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6aDHMK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1412C285C88
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920710; cv=none; b=itf9QjjAo2Mp0Uajfl90pZfq/MlAmqd9s344paFQgzib7TiVEKtP9D6AgOdN7kqhVDYLCOY5mpFsFO03dfdHcOFrcyA+UdtBMkIqBpsKEhIKoh5VNcYAV/ma7JL3T0oekFSE4nz6kgYKbez+LsBYvSXb4yeoFtrabKdtYamfBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920710; c=relaxed/simple;
	bh=RfdtUEfshvy974yJPEuKYRZCnsD9sadOk5+B4IIchgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfeJrkv6hQA1bZyQ4jzPdxziADcYVAwrc8yO7pl37Zi8qZmVc84km4lMt69uI7tz2ku89Xqhihn5ipsXF7qIP0c6PtY5+NvLCkAIjfpBXpnhaoIucAvv41WS5zbqZ5rc9117io4gdzhK1crtSdltp9T+RlsZjWGYt+Cb9JpHzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6aDHMK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I4UM031594
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZV267zGbAJfepcXaTiuuQWN4inCsP8FeAE5hho9iso=; b=Q6aDHMK9HuKE5Y3F
	NIiaSHrfaGl2cAbgwa4kUr9MKGdieLygu7fdAkUMPuaeJYhtK69sw0LgzBv+MvIR
	eisNrguxPBLtKqoBl0+09iKijldaVC3ojgS1IZurSdMXw4Ydzu0C/qrvqJZ0isCt
	LvjqHBk/hFOi57TCxYty41HmoAOf4jUDGJfEk8jh/ZUxFLY3uR7FMUtLYvfv0Y8g
	BJY+P0b2GCxnnG4f3aIPe/o50SteMQaMQkEdIVMi7qVanw1bvYypXf92oDzV6cFq
	h9jVXG4NCYKIxK38K4btLteebRdEZQv1uUvFAoEyotz1Xo1YiLPY3i7YYDFk/ASI
	7bG4EQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv3v6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:18:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-787395166ecso608256d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920707; x=1758525507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZV267zGbAJfepcXaTiuuQWN4inCsP8FeAE5hho9iso=;
        b=mGPUDiH7o4oRAClD8Sf3zrQd+eByPAAc2ad0YOxF7LLtGKggojSL/pvT2UMoYEQkiv
         3yfzHdLdy+130cX0avypq74mDabrZCtFwnqpjefA3501AREoh6VIHWvXyUrtUqcOZZ+u
         /LCrZbwO/KwVp3k1aiB32I51+o68dQOaOQu510cbWy8ODNKWshPjmVe+2nRO4uSZm0DQ
         lCb8hY5OzStPfhmIgy7fgdaxL7SwKu5yJtJIMz0yLCHVq77dw7ra5DztL3FKG660CQUW
         qKexUbRM7iumdLi72k2GtCl8HuUzL9Ru5L/2gGbLUQfa26iwKfNJEtlDrP80RyL+JkDo
         DwnA==
X-Gm-Message-State: AOJu0YyudanKmjJ1H8W/y51BFJZNzJjRrjM283zqT4/a2B/sOMw9uZXv
	ier7tnCd1gkCMaOrbOGEhnAXtJL742cPZxe8O6XzWRXF3MoXWyMxAtd86IJSDdxHYpvNUaMW2dj
	mBWHMY6e149ncMhId5Zl6MwhIH064r/2RjVPB4lVLAZh7xE/F4oZg0Os+wA3N+Qg7XXhV
X-Gm-Gg: ASbGnctaO0r1ItNk/kVkmt9FGuFCEr2GLI+FjiJw29WCfg5N2ZK/+BULb+dUVl2VtFi
	Jah9X43jB3/Rp7ElijC0YhUSgdkS/0FzZPZe5Itl4VskIkgsNBRN+3xooj4PQTPBIu69yIileAb
	zVH1CnSbBjoNo7aw3tO12nCpuQy2X6/iybBUJvK391jRj9zPezARULxsL67hSBJyyDJa71/xyx0
	BiZSz2fDhEeYJzmynxuZe1Yq/IjMfytZ5X9rKwipAu0b/QyogYk77+8iegFjg4tEdTwwrAFjk3q
	ArxYDzDJka+DsoBTjux7yOx7ttWWEd95vEdV8U1WHmvS1c4E1H5p4LN78vkaDYbmvSMV3WeGAyR
	ftHXQ1sErrEtmNTnxH5qE+w==
X-Received: by 2002:a05:6214:2b0e:b0:726:8d13:da3c with SMTP id 6a1803df08f44-767c3772701mr87916666d6.5.1757920706759;
        Mon, 15 Sep 2025 00:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG7fCLxQ6z7xmoYKJ3boF9j/ZgGnwmZqrMmvyGalmjSbO2uXoz6sKz7oSM6s6OaaZY7WTQPA==
X-Received: by 2002:a05:6214:2b0e:b0:726:8d13:da3c with SMTP id 6a1803df08f44-767c3772701mr87916546d6.5.1757920706314;
        Mon, 15 Sep 2025 00:18:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33f57dbsm8550654a12.25.2025.09.15.00.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:18:25 -0700 (PDT)
Message-ID: <33c43646-a8d5-49cd-b27f-093b73517bd5@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm845-lg-common: Add wifi node
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 42bI8Ht_B27L-pJW2jcyqwK3vBlDGMH7
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7bdc3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=qoi5gUcjuFCQQthds88A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 42bI8Ht_B27L-pJW2jcyqwK3vBlDGMH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX7RCgpEs3pNBA
 whRdyiRxPb4H2QF6UyeNC/00E5LMdrDM0Ob3JJXB02XGP/mmPYZMK0WgMLJ/dajzX1hBgOGjnAe
 e+Vt4EFX87Nv3DYET81BaGw2YMqnL0OgC41mwrLIA2pdKMsmcFvr4+eU18rrhbmfYRDh8hb5F5o
 HAWYNkLutRNZTbC6SkV/aDRNwzq6t+hDUcBHS6KG3CmpEeVUGi8g32/Rx0PQF5F3wccwCKx4HWv
 a9B74XB38Lu1uuX19LEy40C+DWpdSKIvverzMg4a+hWP6vZ1Dejz4XZUohqcnD4dbG8pE190+fH
 GqGdMjMFsigzLBLQOANTfHG3M1Ukj/K7XXwSfTioMmREfCXq4r3cfAIx+m0ALOir0TbaPSnB0fD
 wjKZiA1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029

On 9/14/25 1:56 AM, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 1bf2f2b0e85de174959ec2467076a95f471a59d4..585582ff4e0bbe8c994328278d5e5dd3a280ddb6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -682,3 +682,16 @@ &uart9 {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> +
> +	qcom,snoc-host-cap-skip-quirk;
> +	qcom,ath10k-calibration-variant = "lg_judy";

This is deprecated, use qcom,calibration-variant instead

Konrad

