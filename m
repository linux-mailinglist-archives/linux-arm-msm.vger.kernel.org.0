Return-Path: <linux-arm-msm+bounces-53343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE64A7D867
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31FA16AB6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C10322687C;
	Mon,  7 Apr 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmNc1G+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FDF19DF6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015598; cv=none; b=hhgHc23aqrgPBIpgCDycTfbZpMTAYBlw0TZvT7u0bH02fAE7x2pGZhUjRNlcJ+G1HcvLWmyIQKkgCLkrPtVULorN1bHFyfT4rJc6sY5sxLhPZ1kVnGYq1Yo+boz2hF1UQm+7Y9Ikxlqivwu6LZi7yh5auqT1Sgs8Tlh3f+6WXYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015598; c=relaxed/simple;
	bh=ooTVwF1tuqL3XFrYDm1QsQE2KLIC1O7etvRaSUma0tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1+Tou6SHdHxLopXrXVeHDBNa7fosQLrSDlay5KJM6yOQEJBHq3lXYWd/rmgENp3Ah919Bd7Ac7Net4K+rKzT8i0aGpHSFm9tPdeRWHZnrewiuI/cjKfY7fTuP/KYbeLN6yRHatIdljgFVobh6mFBJiZmZWJJ4WPG6emwOg1sqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmNc1G+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dowV001542
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Apr 2025 08:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFH1Vn7+VMGmTLKkKq+C+3byVkOfbRROgqYshmkAM1U=; b=OmNc1G+AQfJnaRZO
	uaIa7iZpEr3q825Uu5qKNGqO/uSs4hRg1fyY7cUDxmGEgRJrUMgE23pA7BhRBGvR
	RpHImgx7l2eh2AzWPm+Upw0JvMdv2pS0/qihIX0bBagjTckf2f2802v+2v28FUAW
	618jZajktazpo92JXxWY9K6atGJCjUmuOMVtJAUP7ttXyv9p3hrNcAy9adKKOBo6
	mzxR1LNersc3yFOK38ZRvE4EgPS7sbgvdq4jvQYjGCrv3YMbaE/mWY8qTA1bJomG
	3xO6mqD1Bg+vnLAYbPU3OsjtdnBlHAQUcpx0AwWL0p5/S0VHn6NSHOUp6GFFw6ga
	wuEEQw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaukqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 08:46:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so12189666d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 01:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015595; x=1744620395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFH1Vn7+VMGmTLKkKq+C+3byVkOfbRROgqYshmkAM1U=;
        b=IOf655g6FdIujDmfVsWLSRvXB3gIPP3x+LjvzqsP+FGuDeo4sU4jJOpDqQtiE8CwmA
         3O3qzdR+Wy9sLbSfKhMl4WFV3kyoARyYuklxRdfj9e6J3++1ijvZaaWUDI8oUn96Pjzp
         MHMXW65fo8VqDERCLePmRaQ8/fGBsUQq//zuIZn0Bap1amhncgjc5Yt5UrY3bnsEtvoL
         gAmk6pJ+GEJlb+bU3CU2hvgQv5PKr2GGX7T1DitNeVZM/Um99t1Wa1YdazV6kGTgNL7c
         Lbmvvpj+qWz/tcshFWcERj37Gst2Y+P9dKYiQZRjnN/Bp6bXeCKHIlXiAsDzmfL6GfWR
         hLAg==
X-Gm-Message-State: AOJu0Yx4BLzcTodKgpC94J1SKHt+wjtH6k7d+ZWCAVRsKaTty6Hw7X1O
	FwvIwaBD089Kn6XF6SvxvOTzG6/0WXzCr1h5UvVy/hP0AmY1XglYFrc4ba/lkJPjpOV59uboFQP
	C9TVrRC+peiG5Bv3ctx3pgEuS3bqG+yly9cpnQI/iLikl8uVAR+cUbCONh1PJqLi+
X-Gm-Gg: ASbGnctX86fs2NCGMIucbYXyxtwScFJBqSEyfUJ7kZ2UI4s3pWxGZwjrhTYOjlOeWsx
	a/yzGT3ciwrOEpRjkyMdc58L/yECSSlKFmJr7qtGeSMZqRBEYPhvxh6AHSmgmufrlMAUlHfjtYm
	6i2uVZcmSNKcmd91cUezXcPHBOLWpNYQdCbpmpQipWidYyJiASj2OIga3x1JM0vwsfCWHorXKGW
	CxGhldibIewn9LHWbIJ8m6aOkE9bk4UXegHt4nM0kb/td0MZ8cy7SeiD3PMFlsztIsGHA8RT2qO
	HHNJPPlIrc09oxY/Lz/StBhv/kgGqWjoFYvGHzxYpuuuu1Q91Qp+XybpJu7HHph04OOfZQ==
X-Received: by 2002:a05:6214:2486:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f01e75e8ffmr59330816d6.9.1744015594941;
        Mon, 07 Apr 2025 01:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHig/enivi+ws8+gPuaVMuMj5medKR0QhIOSYcL7SCiuqnbLZCCRiz1o9AcfTi7ycwoNXmzvg==
X-Received: by 2002:a05:6214:2486:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f01e75e8ffmr59330736d6.9.1744015594625;
        Mon, 07 Apr 2025 01:46:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm719597566b.13.2025.04.07.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:46:34 -0700 (PDT)
Message-ID: <86c85a4f-3773-4d4a-8697-5405f3b03369@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add the missing l2 cache node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250405105529.309711-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250405105529.309711-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zq-k2ujDk4yaLtCS3ZCkIz100MDfCL4H
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f390ec cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rkP1mM951XnZMoyRfhYA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Zq-k2ujDk4yaLtCS3ZCkIz100MDfCL4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=924 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062

On 4/5/25 12:55 PM, Pengyu Luo wrote:
> Only two little a520s share the same L2, every a720 has their own L2
> cache.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

