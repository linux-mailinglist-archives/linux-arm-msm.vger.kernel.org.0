Return-Path: <linux-arm-msm+bounces-55766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7EA9D2ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CBD4A311A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBF9221F02;
	Fri, 25 Apr 2025 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYv9FjDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066A221DB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612641; cv=none; b=omRtGMRnvMPjJ5YiaBPaMx7Dp5yfolzkCvobA1qAvHiD6nRcpurI8HnhwmNKcWlrhpzTOUnUXyyWB2fChNNn3n5qOFd7GdpY5wKf94mh4Uw4KVO92XWJz1rmGFXLrjy/eHzfcud4+yIWuxNv7vAeucX2OJSDkyahHJXCzRF1QfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612641; c=relaxed/simple;
	bh=6jcOXtZ8yw/PG2mZRLKYqvuu9+gIse7sKPo4JRdFcpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ix7U5z5XQpxTFdfiTn1kAaP32J4MHYmSJbCC99UUQtZNPV2CJNUu3bgd+7Ga699+ms+jFNvMKBMqPInNzW1l5N+1Q+xjRJo8HdSLer8Ts6Q9x3WH5h6eDiTJXKYXDJ2nS3j6HYQU6xx7niwKYaMriA5HVb1NDTxFmRFqx9kxaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYv9FjDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqbj004641
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZU3IwA+bgrpaQ2TBAaKogUm3yKHUkoHUnNFfaSufJk=; b=QYv9FjDj8TwUwwY9
	1iz9od9cq1sS0Wjjd7QdWJ+WxcaR01vkUfE4LBYlnDkT3dYzB/VKKZnwMSlIwckn
	SIW5ABcO1x5GfSaoIOkWCUmhudtAT+fOGW9EDPj9BgkcvDfYgRv35n/42BSkqymO
	OqgV6UiexjZoTjWWU60Vow0z9JAVeJrbkMvcxBWjwKNu05s/Bqe+5BzN6YXGIaEo
	KePUClJ3HX0TTPEO6MF/Qvm4GVbfX7WFlg0pLD+LI42ylFia9qGYA82pnSwUKbZx
	AvhTB2nqb/oNJQGSUXrDOSCNJo+cWcDTENdjP49jDWpraFBGodvsAQ+xWoB8efZS
	kMz0FQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a823-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:23:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47aeab7b918so6068421cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 13:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612638; x=1746217438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZU3IwA+bgrpaQ2TBAaKogUm3yKHUkoHUnNFfaSufJk=;
        b=XdTG8nApUiQ1qhl8TcIeuckGeUHLxjU5LdhkYOG2gpIrQQjeAksVxxLRhhtAho2/gC
         xCzfVCcEfQlmQdOJol6Y3lwHRFIxUimussbZ/mwBGtJCyh/DbdhKGMSWCEoGu7rXl3SQ
         t2pL6Of0PEEFdzf0LsYP7mSM1i2OoB39n8aJGbE1pSh2q0BCfZHo8EitFuCZY1K9/F+K
         2axjh6oh0fl0qubck/QMEPqlMrtMMKWOxVOZa6BrLVS1D7QDFlZ8+fmFu0pM46KR4tSI
         iyRU6OYH4a5n9O3+Z1FMzBhySEMtOd56crw3drdeV+L//q/pvJ2Qlk6AFvfSQFuBZhoD
         0Mog==
X-Forwarded-Encrypted: i=1; AJvYcCUdMtT9jJ/rwqHSZDZeWxMlP16G4yJMC7GL+kN/d7TZJbT2IdmctkicAiB0ymFCo2Zk9T6E3SNmBMmMsgKO@vger.kernel.org
X-Gm-Message-State: AOJu0YyoieUQCCXwqIZfIEhAPGchUnIi0V7Cocqa28d38qCr8Nu1aRGa
	xShiXuN+sfLAa77sH5+y9hJLLt+PuS29kdKClyYshRfJ2ymLgWSz4APQraNia51sBQVUN+QwArP
	Imli8UQEj/t7TYF/m039bhk74ux2WCFNWdpTDEncd7w+VyFIzN4o1jgaURqt6tH2t
X-Gm-Gg: ASbGncvGX1bYsVhDJFWcG6j7hbvHsbHWKeTjCPRXtr3SjiYXYwGlz3kFZX0HhjI7VGv
	61Z2IKsHUyTMn/qfJXaK4hXoArc5T+5iQwhSz4EtnLTS3jyKnWH4l+L7vcfhYdOxzD/kV62eAWa
	97mSCvHijxpreFY+lb1VGNXj0awoK2/qmq49oHUgz+ZGE9W3gNcNwrnTXw1AthbB84KEWI8ZZA1
	Vl0WGhPXEDxJK0nHnEkXzJ6XwlCdoax0Il6+hN5U71HvjHTayjwHNG0RsmFZsBbRNyYGYZOwqcL
	1nGWGs0PMfWCYIXVTTb/nzQ1f3+Mo5fR5yYMAm/I+L4hhir2nxxNbUlLSozyjXNgfRY=
X-Received: by 2002:ac8:5d4c:0:b0:477:686:b40b with SMTP id d75a77b69052e-4801e10d41cmr18419931cf.12.1745612637997;
        Fri, 25 Apr 2025 13:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdHoZR5pCK2t6lb87QvYnJjLEk1VyW1AcMpSBdCT2VlKLRjguijyNKwCmllzoOHpr6Y73rfg==
X-Received: by 2002:ac8:5d4c:0:b0:477:686:b40b with SMTP id d75a77b69052e-4801e10d41cmr18419781cf.12.1745612637564;
        Fri, 25 Apr 2025 13:23:57 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70b1fsm183172066b.157.2025.04.25.13.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:23:57 -0700 (PDT)
Message-ID: <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfXxfRtOd4jzfnd 5BT3PUrS0ACTQrqw+AuCul6aionReVBiDril+BBVT8xvjptb0lGthhWmJAXmkqY6JEbML6ZbGEv 9fhcHGqg5wHbcanIXNEUXYs3XthfhJ6sFx0FuCcCL+iwoVVrGBqTsrddYbQX6SpA67tWSNdpanW
 sIfHe8kELmrhQPt2YfJX2cC8fp70cWND1uUxedKlMlYU8EzYr8a5IEzsthz4f1UG4ffgujs24lH DdKt8e4bDJJslN9iUGstV9+uNBGG+pNHfQVdSzl2BAi6F3mZJfUyh/dGzVfxYgaslTzqRJvAoxv q/2eVdi8+kxcr/cwcIQk1u9KhNwHujx/DUkavGPTpLtVNiUjYh1Q+WhcxsBiMNCoOPh6NoopKrC
 fwoXw8vwr8N53Cf978XqchLcQpSJ9HEtLGWxHfUJQe5NggSE0AG3dAKxyZv8DxzRXNoz0an1
X-Proofpoint-GUID: rpOFj-rTND_8LLEwU_azMRcEoi-Vw-QH
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bef5e cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=g0nLbwh1i6OCtKyAYTkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rpOFj-rTND_8LLEwU_azMRcEoi-Vw-QH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=907 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---
> changes since v3:
>         - added necessary padding for 8digt hex address in dts 
>         - fixed firmware-name to use .mbn format
> 
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 69dda757925d..fc120fd8b274 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * IPQ5332 device tree source
>   *
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> @@ -146,6 +146,11 @@ smem@4a800000 {
>  
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		q6_region: wcss@4a900000 {
> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc@0 {
> @@ -545,6 +550,39 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@d100000 {
> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0x0d100000 0x4040>;

This is 0x10_000-long

> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";

Is the firmware OEM signed?

Konrad

