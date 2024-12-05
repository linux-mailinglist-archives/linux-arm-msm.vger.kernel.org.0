Return-Path: <linux-arm-msm+bounces-40609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E919E5D79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8644281B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCC7224AFE;
	Thu,  5 Dec 2024 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGBKQq3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989D2EB1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420497; cv=none; b=dl70E5nYAQoxnvY6eZDUCl5LEbmIPLxdXnOxJUrM+ItrRVJQ05DDyG0aiOfRtWpAfsB2lDr5w6HMhZ2nBRYIyfbstWrJBbMq3sOGVH1MmB0eAREsQhHmH8o0RTlo/y6E9Lbp/1bZ8I5I6NypOWl2cXWmFe7j6KIkUvwinKh3K/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420497; c=relaxed/simple;
	bh=6FzNAE6m2dYGEz1uwmeGhq25mZHNGBGIpgBDnJuHusc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDL9p7R5J7CjyES6pzW8dIn49eNscW+lRYX+aN85Yu+zviWkREdAIn0iEl/l2mz9JNd4SFneb0nGQy5IyqK2D0sDsPeTx246UQqqnxKdSam7EUpZO9mx2BN4b8BME4PDGEB8CObJ/2tqMc310Mivb6XKe8cg0ZkL47B4JeQUTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGBKQq3i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNBA031095
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXzRRGsyc/c2BUi8PcPVnuNR/0fJO0GE8qnSNFeaoZc=; b=YGBKQq3ixqo2vJNe
	8jq1scLTuRD8CCWNa/HeKAiG7hb72nhoipa+Ejo8ai9knqUZmlCAs+hbP7VesZea
	gMc1WUN64LZjb/ifCCZpw5hw8ryfR6kPaoqB8a4qYDPQZhkvlohZY6ZESTH22TA8
	knDKsigj7GsqigXLaiEpQorq9CKoRSSajiEKARohZpc7hbqy1RoqUlZhQscIeXpR
	clMa7Ylb4sSyRq8cAdNthFWhrITs1aqtKe+rApPMFV+GTRAld3bvBL67OWqfQ0Ah
	pJhBPw17seOWdYuwxb9wFUeH5mA9mM9pzh4zhgvyY3eEw2L3E5SLnCKxFgHnNUCz
	SxOUFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170j38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:41:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46692fb862bso2432451cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420494; x=1734025294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXzRRGsyc/c2BUi8PcPVnuNR/0fJO0GE8qnSNFeaoZc=;
        b=k8wzWJs7d6Ycspc36XJQzNxTZrgilI+55zQQcGFpN8IRbhY2ANdkncvVXBq7iEVJ5F
         7pGGQJLddn/0UvsvBYPyvtaDrUEQ1eCUwNtpQ7wXcN7JYlT7XC9Ho0Z0q0CmNTkAZVZJ
         TxK9RqTQSZ3oX3K+JLRaKQXlD4+INjnl7XvyN0niYGhcSP3GnXlVRqHkVzh+2Lj6C6dv
         dPcGB2Hoi/TO+KdJUYg9C6k7H6slhRb1XxwYJ7gXmRXNWT9PazptOPnoj6S84vBgkVQe
         SZu7Bck66/mtWVeT8tkwNn55nr1fSXEFFojHCHueGvj5BHUgPrN6HStS7FkLCJarr5Ce
         medQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj4hJQlJkhvHMg6ItbY1NntBT3lUoSybpeGwZL83z1CerQcXSQQypBXomHIZgDpgjly/gYBR7P/awa6UBy@vger.kernel.org
X-Gm-Message-State: AOJu0YxmF6PtGWylQ2D8ONZ8uWv55cXhjK2FDtw6gm6NtVic4ivl4kY9
	NL9GUppqnpwmD2rzwFsmkDiV8KMOec8/kI6cMEwzt1OOFkSwYURHID1+MIGdVyx3nXE6LT3k38M
	A9rcy20jdNkZsjuMjT2YMYyB+Qr+YgUKhbufBc1MQ2z3Ar+XEz6LvznWcsxOvcvaT
X-Gm-Gg: ASbGncva5jon6l7eM8HEGQPO9+klABJ4vI5F893xllEJdpKjdtxEH21AhqRRoQc0u/S
	eMqPx50oN0txwNyLx9aVWvQZVp37mzbfjszyRmSg/yYO29T2zgd9ICcbrFVDp9R890ehO/9yQvi
	3G6JxpBZYUenlBBR0o5GD+3gBbhsyWZzm2UWE7A8fWirdTos1bGKjXohVfYUdzPv13o8kmM8nZc
	uHkhzxlJjqTrxMVawtHKEiSoyG+3qty2lUuDUsYmKwIxwSLTswlq+bp3O2fq0Qk2SX5NwM2E2Oz
	cXa5SJB6KctCIjQE7wuD/SkvTnZFSOE=
X-Received: by 2002:a05:622a:1b0f:b0:460:e4e3:457 with SMTP id d75a77b69052e-46734eeed1emr69331cf.11.1733420493589;
        Thu, 05 Dec 2024 09:41:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4nDHz+0THtItB3ZVRkcOhOY37nBmuqywfPU8W/DhGboRjz3vQnXgf1jXoqkNHIizg2v5WdQ==
X-Received: by 2002:a05:622a:1b0f:b0:460:e4e3:457 with SMTP id d75a77b69052e-46734eeed1emr69151cf.11.1733420493160;
        Thu, 05 Dec 2024 09:41:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260ebaefsm119579666b.197.2024.12.05.09.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:41:32 -0800 (PST)
Message-ID: <bccb09b9-e139-439f-9a1d-2d17265edee6@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:41:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: qcs8300: enable pcie1 for
 qcs8300 platform
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241128081056.1361739-1-quic_ziyuzhan@quicinc.com>
 <20241128081056.1361739-9-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128081056.1361739-9-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CtHK1gE_9j3Vp1F672jBwtEhNjd_gaXl
X-Proofpoint-ORIG-GUID: CtHK1gE_9j3Vp1F672jBwtEhNjd_gaXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=879 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050130

On 28.11.2024 9:10 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe1, board related gpios,
> PMIC regulators, etc.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 42 ++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7f97f771c44a..a83faba0252e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -214,7 +214,7 @@ &gcc {
>  	clocks = <&rpmhcc RPMH_CXO_CLK>,
>  		 <&sleep_clk>,
>  		 <&pcie0_phy>,
> -		 <0>,
> +		 <&pcie1_phy>,
>  		 <0>,
>  		 <0>,
>  		 <0>,

This should be in the previous patch

Otherwise lgtm

Konrad

