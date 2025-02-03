Return-Path: <linux-arm-msm+bounces-46771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E4CA25BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357AD1883CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E147A205E0A;
	Mon,  3 Feb 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUPDIv0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5A2010FD
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592085; cv=none; b=tydmw1orQ2bhqAJMoO91vekfOBj/4Qpdd6Y49i4P1NVpjCuDUlvILJa4r7sf2ca5ijCofXhJ6k4Ibs9DvboJPQjYAh16f/h1Z6+faFL3f56TDDXUy+Vb/IBaWqAuu4CTrKGYwqUwFedgnzvHE005pVeZ+uS3Sg94VWu5OP/5J7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592085; c=relaxed/simple;
	bh=GLS47vtT3nuOUmU+wF1U4f2z06P/ZzFU5ppHdYrIRl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGU5ROFdGAYRCDVJIEy594AKcB8pNTC6D/kqcyNRnuJamzw6qzOdjT0XKVnEu3Mx+BPZS+qA9/nuWp194ltOyCTpIoxuadUMrbiuXdxsekFFwnGG/J0DvODUJx1RoDwrl60mqz1XO1J3FNIImo5eRqmzJNaE3GG06o6AtKGtxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUPDIv0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135Nitf032015
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 14:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ed5FD2P7X9YaTZMReMsjptBhvML/e4p1WW07sHSBxs=; b=oUPDIv0oh0BYT43o
	UuO+W6eMj3rOly1MESJtG+RA4e4gOETUhWvJ5luYP/69cHcjCmkvaz9RPb7ziOFl
	yMDOGS7/yuVrTCp8pdzYLatfsSnZ4gJbB7M5ddXXrF88EeWk3jMkSO/sxOM1hwU9
	SP93oBaAPQ/v38IF0k58iOCgBdU9B32gB6Ni76RJ/TZ4i5MgBmR/KgGJqvIw4frn
	3IiRWTKP6/US4VK+A848MfXMB8ipn9Bp2Ep3RR28beNNlJjvChnoBQa3F4SUV1h2
	5nhIciqCL1cMlzuaVYvQKuu4raquZpU9zWL8ex/oKku8R323xzo6fMRUpjuYXcbk
	szGnrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm41b2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 14:14:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6ea8fc9acso43784385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592082; x=1739196882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ed5FD2P7X9YaTZMReMsjptBhvML/e4p1WW07sHSBxs=;
        b=eJgew7tnsnKqpfIER2/LTC+afdA673BvFx3FmCADP3uVkPC0LELuwG2cL1vp4vaN+0
         RIbdyowABb+EnJRWRF4AgeqCTGLAR1lPc2GkNp1BnIbbZIxlV+QnERV7V3FYOLcuaDtX
         1I9sdsXhrJ4vpSKCcdT5Jml0WlCs1Hpo3+XE1zmVnRupUjv8k8bw/m7vD/V1YX0194sn
         MUWBdunDDAxN0/OWQDgDI39GurCspP71ElyoQS/az9EA2J6K+0JX8RZsvvy4xp3LtWju
         HXNd8EfS6/I/kEmLLAAc2utfxVpK0ek2HrWF2r5bQB3oSoDo+Tz6X/xPNYX/YJgJS9o4
         Sisw==
X-Forwarded-Encrypted: i=1; AJvYcCVy80aiMFFDEzTGBnZX/4grGtbJnsxsz1j8NINd0u5be7pRiX1/DQrILJqHA/YWKNawM0pnpOLw67P8VLEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8Zi8w0WU4D9ClCAQ2u3Ikj9BlK25UH4u7yh8yTXYsf0jyqKT
	NerN+aHApFEIO+HXOurh7AVAE2xR8SXLPAiKVFZMwumn1pVZtD1Ayz44pQ4irmfrNK4iLIufrTO
	W+li4xbvKSGbGE2S8OItx5rTcvGWPNzCCBxFG++ba+SS9Re2BiyVoUfkQa21p1AeM
X-Gm-Gg: ASbGncuNlLFzADuAQ/u7p9hYeQDmTMPSlXFfQbyJe+/rW6wOSGdJdViIRo520GYQXR/
	BteD7EV7RBF+eMXtoXSrLKnTXaNz6ywUJrBTj9XT6FxIIVCawxIj9CqNC7Pnm4z0w4LPKWFegnI
	4rJxdGNZG8OkQyP4yTEjhgV4i/Rr0t51mo/FgJNYAVR7TV2BEU06z3+qRM6U+/53kWglsCyOUP7
	ZmS8XMu/SH9w1OtBtcEB0kI4Ba7zaBbQ4Pv0QfH0rQB9txrevY9o/ZGb4xy3TKvvvU6BSgYY4o5
	XHxd7kblylFezqW+jO0Jys/CmfYYwEE9SC9TdU8NZ6QlIuLlg9e29c3I348=
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1181508685a.12.1738592082304;
        Mon, 03 Feb 2025 06:14:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH1738FSuy+pc3rDZ0plUoVJ+oWo3QVzECxej0AWdMRUeWLLFwJpYf/Ff6igbrOhSMl69Frg==
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1181507085a.12.1738592081987;
        Mon, 03 Feb 2025 06:14:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf899sm761968566b.44.2025.02.03.06.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:14:41 -0800 (PST)
Message-ID: <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:14:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: obUUNwmQX-qLH9r5s_6O2vUX2BRqXslh
X-Proofpoint-ORIG-GUID: obUUNwmQX-qLH9r5s_6O2vUX2BRqXslh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030104

On 19.01.2025 1:00 PM, Taniya Das wrote:
> Add support for video, camera, display and gpu clock controller nodes
> for QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3,7 +3,11 @@
>   * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>  #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -1418,6 +1422,18 @@ data-pins {
>  			};
>  		};
>  
> +		gpucc: clock-controller@5090000 {
> +			compatible = "qcom,qcs615-gpucc";
> +			reg = <0 0x05090000 0 0x9000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GPLL0>;

This would normally be GCC_GPU_GPLL0_(DIV_)CLK_SRC, is this intentional?

Konrad

