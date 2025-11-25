Return-Path: <linux-arm-msm+bounces-83160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C2C83803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA90134943E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F24328DF07;
	Tue, 25 Nov 2025 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG7m6GGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ7hICBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6118AFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052586; cv=none; b=EGrTshBmYqmQYzcGeSdXlv2Qq3QQ8OuYaYWmKF+Zt6vWjPQOkX578WU/a+GrggsLEQie1d5m53Y8ebRdsuY6o6KkI30+P/9svNHW1TGTmmr5XJW5JUENmhoBAHhQNl5NzKVns6asKz94+9uvR3z6gCpNZSkQjdDlaEHPDLmrlx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052586; c=relaxed/simple;
	bh=l0DNo5h+lK3JKphIbORDUNwt7UC72ukjQ2mjgfG1ViQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuIFxYkb4S2IJowEhqtOfGj1wwgRNiQgKduofQepE6JWEi0HcQJEWfKH70+vV9QS4fhOmlbYRIylXSKZaSJNMNet+Urz2/qvuMZTa2axE1Ea0NtDFNgNccvwl8OQVShACqa8G5d7opVX5ZaLv64cvkp9zQ9AWfAB1zd2TxhUwv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG7m6GGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ7hICBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2h5cN1232791
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=; b=RG7m6GGoXJZlKz7d
	jFgNm6cYNNZ8Y+SbfDYb1kVEnqdAq/XTFacQ3YlnMrEycDT9nSfrnkn4lOKapPjn
	UwVK8w7O+b/jyobyXrfEIoCvUMRLWW57PdZBRYAY6GVWJdebKcol5nb3Gdttz1Pj
	UgOUW7lCxjcEMyXeukc86GIZR7f0/PbfPpaWmPZX75Oc6OZ/wOpJI4i9Kp1DX2aR
	PK5e8sVJy+be/0GZ+4UiNt8Op7yp43wh4cDFHjY2M6QVNNKYQGkM/PoYRqlsE+ds
	+zpBpFYygoxIQVvBOlZZKSJaClc4L+0WfixKHtNoNvV4YqY/YLzesu9ogpd5/rkE
	mme45g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyh1tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:36:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so5535621a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052583; x=1764657383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=;
        b=dQ7hICBRWFWoeDSgmlaugKItJLwpSc0oHtZSxRwljLSAO56ckKpec8sscnDPXooXr+
         V0+A3At9X98hi17kryN28LtBdg1yeNWs39sJk80zwpHvvFlt0xXJXSN2f3apX6zXmg33
         /1dJ2mXzsMxveNxnwt/8yZOmzdSPGpCYPhw8LPhIHD2t2Wd8WQ7QGJes0JBzr3Uk7KIq
         hFgfDuzdQic4doMfFcBOxWvu55DsMqNLwnPrsXE9zioty65IsPVp8W8s8ODCNRLPZ3mk
         m3SqtfT/tX7YgPnFy4rOZ5d5XU82tKjJmOeM4FniHI/gSC3N2WRRlrd+wYAeF1TjU6ZN
         bVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052583; x=1764657383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=;
        b=Y5+GkxeEa0hFMYV112bd3K0eW4NUW9B0+Oi4T3omQc99g74Q9RT9HxbAOH8qzxDogq
         T5WWBgzmBxs6psKuhMyeQK4hz5CCk8RoMTb8QwXFjrbdJeHqfNlAYtDB/a6BjLo154cq
         UI4aZEQ2lksitpQqfPT+tbFRryEGP6Pw5iZxD2iEJne4jO66wlv8Pb/huqItPv3NI7Vv
         UjQwuYi0KTbJ0ZL7OY4LlB+SXctnn+F83NuJ19TUxQhQ69Exkx1pAdhpn6+N0bTl7Vyi
         40i2ccZ9pH3tYFRX8IvwzGkSLzrx1xclOb/HOLm7crVcNSJ+XVL1QK4FXECFh0/HDcfl
         mkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWur1Im2TMrM27Td6LgOt/TVRalStjB8i6rKb8nn5fbucVGGEReWEzv2Zzad9XOZJhdjiq8lwhqbMLvCQ9H@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdsDmWeYfQUjjMDhfV2V+HIAumHHcUv9kEy7lbwfhfPZ7ALRf
	3r5TNpXZvR0Zrg5CPWOObuVyu6n7YwxbXR5xO/33bHtnu2oQJjDp3GPjBwmULuvBqbecw4kD2P1
	KXhiy49GsW30GzGNUXPT0lB+fn82rVRLYvMNWLRYwW/7GY3A77aualmnI8uhM0XmpAQwI
X-Gm-Gg: ASbGnctEway+cSbwoqo0QhvBRBzFETwmNV3z9wF1MPO1a4Np3wXjP7FVqxBEDsJ3brI
	yX8ms9aIzc3Sr8IE0aJ4vj76oVPRVaHWu7iL7lcnYcjHSz/lTEUroTq2vJ0mEMi8yrah3MZpbFU
	HwtbP4pCSugHDEp9ZjfSJuwZaUFI9OtJTgcLTjffheNUEbnfeB5FoNiamhAxRuNOge3d2B5ctAD
	DqflpuwizXiLX18BlQjG6tzRkSQB883pqxHZfHW56smDTSft+l6GzcZGgYIArbdnApn64EXVkOU
	JXcJP+x1XQpDwm+C0p94L63LzDto+FyJ6Ic1TzyQmSAnKuDUqCBZ+fnkxk3RCcgLO4r1aqrCGls
	wwSkcoz16FXbj9IzBvq0Ly/Ys2PtpZLtXZbMz
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr12615632a91.36.1764052583193;
        Mon, 24 Nov 2025 22:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH53UOdhJtkf/Om1CXNcP5GU4fg3FUgzNy5VJS6t2nkMTAGe8/1CWvBJkYrC7jLYHEvjHy7w==
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr12615607a91.36.1764052582690;
        Mon, 24 Nov 2025 22:36:22 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm15595421a91.15.2025.11.24.22.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:36:22 -0800 (PST)
Message-ID: <4cd37160-ddd2-4027-b7ed-e56635369cee@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:06:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69254e67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lWVEJI6HPn3KqSwRoiYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX0oco5NJAprof
 S3sXlxpJNC/lF/P+it344IirLUT/0zujIhzjP0sWnQqbeg/BbO2utMf4182Rgx3X0Vw11njxt84
 ysnY9ySD2cYz6LGGDascI+GytTXypEKrhf0FAXDpuXehcPrBtqy7tKLJJqbeDlXH+aOTBpvufco
 Cg8RwMxSel1maUdYp4SNp844+YRiYMBblW3nhEI2TFhxfl8QE0RvEsUh1O7BHgzvUst4w51K3o8
 6Ked4JToPGROa5d9v6gB5zg/+TMolnGbtxaBg4wtzbU9Y81vjd0pT6ixugVTKWDf4ErkzM1VED6
 u+FFznmhwUhCJ5U+wJnvnrDcEaNtVd+VpUK7Ljx1VnYwpWK70DXsehGJSAHj9MktQ5b326r9pZR
 jUva98z/FmXX+NZRYBdSbTNOGjWObA==
X-Proofpoint-ORIG-GUID: HvEx8Lilq3HoWKwXAvQXlzS8xjU1rzcj
X-Proofpoint-GUID: HvEx8Lilq3HoWKwXAvQXlzS8xjU1rzcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053



On 11/25/2025 2:50 AM, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8550.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>     mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>     mmc0: error -110 whilst initialising SD card
> 
> Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 862a9bf73bcb..36a5b7de5b55 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


