Return-Path: <linux-arm-msm+bounces-76215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB1BC18D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 164A53E1C51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A252E0B6E;
	Tue,  7 Oct 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQhY+riM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C32E1C54
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844676; cv=none; b=Z2xBCw8exUa+uhblMXpbTqyiny05lTlbOCl12XwxNJMiosK1fld+QwzbrmdEz7ysVOKucvooqY3mxWLjJaUX4OAjkymxHWassC0CPuEecNKvC/WtKW0wJ5D769W8MTCVPaiG0YIEQxL7iRN6duVVWe6k47qZRlh7nIy9N1ohGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844676; c=relaxed/simple;
	bh=RzC5tectGEIyc8XxwlPTI5vbHB+9S4bqXZf7cveYE/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyOhU16q1RtkU79+tTMilwr5NFAMhrI5Di9LOlZcUGx0A70TPvO1yPIUmygYC3GQYCS8T2C+U2KcZUDW3Iac4ChltEx87UIvcHSx/R8nnrsiVdjxpZmWYyT9QO6ItNgNNFMXl/r6Skhj9MrFX8Kaq3WWtN/57MhQnfQr06H2Y+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQhY+riM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5977oFDC018135
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JMHoyMsE7HxNwaf3O4ncQVvQFojmL8uHi3mQasDHEY=; b=TQhY+riM3+3DtFvH
	nsog7XPbnYl0EE7YDsSEsARjskw+WJYDIzLEy4NKY/Hsp7jt0eLC5nr6A5jWkyQq
	8zwQRlXJfTdX2+0nBdCAT3COSC8WGwcwdL4+onnATRAcpThkWAG1w4ZDpqMAB6kH
	6Vtj3EjKE31zSuZWI7SAtCi0LVVqWOA84ZQsS4dlgZ1KKBxAjMimb6K8VFPCqR3i
	LEemf1J0nt3l7h5TEhS/wh7lPcHnbA/ILq/xovfIInMU7FvFrdTNX2G6roVlhqoA
	zjEl7DJddkJl8CePyS2hnNnRSGfOoTTuvN3y2SfKlPEDcZk/VyxO3qIEpQ6UhF8p
	wQmJ8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpt6v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:44:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-879826c55c8so13123606d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844673; x=1760449473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JMHoyMsE7HxNwaf3O4ncQVvQFojmL8uHi3mQasDHEY=;
        b=Ja8IeE/pRS/fxitQiKS2dOo2exWi1D20Tg571FjlF5c7gMM8f67z6wXZuQeMrGXM1M
         SvfPpMjfeBg2uZTAbtfLk5CFlMCfrBjXs99+mWrLc2X1FIZQfeCcGt0TKzBmsbuAjt8V
         ZPvq4faXcLJCcoZEY+eksKtp00LzsFqKCqdQ2TdjOZrYPdBV1F1P3L8KqCAl/XQJskxD
         GofpkquKz/NCKraOTxG8OM+tRXvkcizscuHczio3A5xJoiZeqDDC/tPZ96KMBK9QUNTY
         82JO9JK4vMttrb2PFDR1dBKikMQ8mHG2OMH0vadvqBgyfuQnTCYQ4YPVXsFNlE8JlIJt
         uXZg==
X-Gm-Message-State: AOJu0Yz637zkhyMa1W31cO04Bp7VyDpAmTKrPqbgbfZUj7DMgFe4XZsi
	SIOv5m0XpJRawAI0Nhlecj62BcWDFnTtFgwhrKPKKsYdoAae8ruOADSoY4EthIlA5dlyoNjIp4l
	rYzXmWAoF+X+NyJNaNCCo+WcHGrPL9kO+6fpg5ZyJQ+gisyKzlU9fuGviI1qalLcPKVJo
X-Gm-Gg: ASbGncsQJNPhYhdadGqu2OS6O5QqexbP1LlWx2NGQxelm1AE1ENLOKBOxHvdOV5vs6j
	6Myvz87/7RlrP8+iJ682RLikCd9GkPpoeO9HJkRV9AUnOelb9915qavQqeggI7UvG7q9uJhWJ64
	gcNl2oWVUgmeKPKCMW2AFFvQpsNkPdULfHIeADgtOtI+KbfMhxfb5borUz5MNArGup0l86kyc7I
	mrjFtjoeNxIBBKxjMo7PsP6IIyr2XN8m9PwClCVQ/+UNHhG12/Cb87LANH0UZ0yW2byjWHfgIjW
	ixtiEWkg/L//dp+jJnC7s8rIq9a7kBXk0X3Um3fPyH/Aa97rnNgVQc7gAlVctmczgYZh9UHn66x
	GSlodv8hNqC7egYFOAXKOqpiWy6Y=
X-Received: by 2002:a05:622a:20c:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e576a81e8emr140344241cf.6.1759844672329;
        Tue, 07 Oct 2025 06:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrrZPf0l8ij/9YleMlzi9UQn/coW3h1uLIhDGnK4sj9h9CmyHm2gOyOc7btpiEJZzuV7ogqw==
X-Received: by 2002:a05:622a:20c:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e576a81e8emr140343811cf.6.1759844671680;
        Tue, 07 Oct 2025 06:44:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6394ba637fasm10117255a12.33.2025.10.07.06.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:44:31 -0700 (PDT)
Message-ID: <0e6ec1d8-a823-4e17-8efe-27e2b22b5081@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:44:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com>
 <20250924-knp-llcc-v1-2-ae6a016e5138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-llcc-v1-2-ae6a016e5138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sPD_qiyGS-1eHfgjcsLqxAwraug7TXx-
X-Proofpoint-ORIG-GUID: sPD_qiyGS-1eHfgjcsLqxAwraug7TXx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX6GdaHt2bGjHF
 PHt/4WL2nwc8pdjc6IjedkScdSyM7wChxKdfb46DQakqt5SW+Feu302lWqamK6rZsl2xEuu2Eqz
 xHdYUlt2OppwCfl17W4B2ISFiMjvessFKZN6CmHXBmF5vTARwSwDfUHAamP6Lbj/EwjN1e3rmRb
 sMqFYovEdUZl5oCHY2U+0+MAs4dy0eZCNmdcL1aNGsgrAdvh2zBEcNTiBuLIvVGwrI3vs28MnbG
 Q25OE06ffI6zk1bEl7i3VnilPv8GGEA90jyqtyxayGrGN7ymAuD/RItPz5odPU48MKbMxPGmgRo
 6tqH9nQ5Qbj8ekSoRwTxrM4uDH/uXkPb2x35arOM1Wfdp7LrFJHm+gJqhJK63zG9aaYTjYpuD4w
 qkua+hKyaSy7F7NgqHq/E8aOaF1u5A==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e51942 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9J9bQqhuhIfmgtcBUKkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/25/25 1:24 AM, Jingyi Wang wrote:
> Add system cache table and configs for Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

I spot-checked some of these and it looks alright

[...]

> index 7a69210a250c..0287f9182c4d 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -74,7 +74,14 @@
>  #define LLCC_CAMSRTIP	 73
>  #define LLCC_CAMRTRF	 74
>  #define LLCC_CAMSRTRF	 75
> +#define LLCC_VIDEO_APV	 83
> +#define LLCC_COMPUTE1	 87
> +#define LLCC_CPUSS_OPP	 88
>  #define LLCC_CPUSSMPAM	 89
> +#define LLCC_CAM_IPE_STROV	 92
> +#define LLCC_CAM_OFE_STROV	 93
> +#define LLCC_CPUSS_HEU	 94
> +#define LLCC_MDM_PNG_FIXED	 100

Can we de-obfuscate these names?

Either way:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

