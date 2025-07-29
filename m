Return-Path: <linux-arm-msm+bounces-66973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C31B14B1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C1117067B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B482749E0;
	Tue, 29 Jul 2025 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMZZvrm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F012222DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780979; cv=none; b=c9pGNibzesQia99CH0bLQS7ezNTw3uSevhErm6jKbG3rXjk1BtlHXvfSKtXowJx8g76mZV3Q3uXVqdRl66imTBfxhA7h3Z8RWmIE3rTjlIX2+olcAwPc2p/Qr3L2vpw+tWYqX/Z7pppAH/7tYDnu1wCoFLCfPPXZvYXwBTHrQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780979; c=relaxed/simple;
	bh=ehz0qUEuqwWutqTkbDkVk4X0c05JiJM9sCTKzsojpIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvAXP4O1D4x2XNR8zaCTa362E4PgX9j+jMKD3N7zGWfsKMTMdqOFpVY9tIQXLk5WIbQRjIVSW+VFJZmQsZfdv54T9NnDnYkmev+KYA2CRNpuIJ0m9OoPvjm+VfKkC5blVc4cwTHoNQU8q2de4K3GBSduSTSCN4+R/y/cOS855B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMZZvrm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T93cYK017593
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 09:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TkgBhS7qZBU5x8NwedbTLWIGpOQEhTDibEzWNdfhYk=; b=fMZZvrm6a7ZJXgoa
	VTu8tdtZtmvhJBgXio7I3ndx0mTjkv1urlBKOe8dNYOtKho5Vqba2OSn6ryP2fdA
	dJjxNCNLeujqGjE784jrmUtI7I8/1uFceKal9A4wNxwxKgDcMtiixqaew6hIbNgN
	pdpEUfn+Nv/3bvUkA2u2PmjPt+gu5/VJkq9ufuFXMeYOjT9/Bo+OSAbV2RjxMo7N
	KGpMNoC306LFlif8EX9xow4dCFGRi3ZNAJ6CGIJm9GgUgXl1jFlpqou2nxdkM/mZ
	PCCOKUg+vG14GPslX3TCbSOX3iQEce1EM5fend7HOVK6s88Fo9akRRjSQasN9Ofq
	blLqEw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1afhdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 09:22:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073ec538e2so10485696d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 02:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780970; x=1754385770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TkgBhS7qZBU5x8NwedbTLWIGpOQEhTDibEzWNdfhYk=;
        b=BeAnNMD9nZa8WVyZTYNF0Y4Nzyt38Z8IttCyK/hAacX8Y1vx1z1meCJoM4GgXwVBpt
         5ZdZ3E1xMv2whh5CwIhWnOi9yHb9snXaJyMNIiW4VAyeb4XHlS0Fm6ofOK0LBWqAmC54
         6wW9J9CoUOJ15oL9Jxw1+fHuAQXST1Jl0LOmkj2rNSuW2stnmK72eVIV7gldGcwiTRQ+
         +f7kKFpKnbXCxUvuh1InSSgFxLAbVK0QbT9vErkHFgfc8rApKRalVwX4h1Fs6gVT6Y5b
         qRd967dEIhVw38mVfRXrl438a/e/Zh08k+DLW8muQSavgCB4P3DC2zuBtazlrrfuqbpk
         HmPg==
X-Forwarded-Encrypted: i=1; AJvYcCVW6cm4YT1sLZ+Wwc6McssPMrW6AhhAjkRo/myGFeXretQorbRm9BsDH7FKB7OjdPR0VN+KlHfiznwESuUP@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsKI0iwwnpGuAh3Z2/ziZXF6CAVq2DIDF1XILn/5ij7Qo/FdE
	j3wH8jVnAC31GdQULxNpV+r18THaL9zjO6X9XoI4r/R0VGXHmo2Lb7bQVo6ZQaZeaRyyRgaVTIh
	BdMa4hu53YDqo1dRA6Asle3Ee9zNvYMCj05LNRdnIHMAzHUc/nx1n3wn6AtazAGOiJojo5/cB2e
	Ge
X-Gm-Gg: ASbGncupqpjZGhX+5d1G7CAWocrcBmbK9o2p3/mUQGCQPKBjgdYLHsqbHW7zRrUZ9QR
	+R/3nPPm6MQFeTkIafBripfGAyzWOTHeBR1Op6Biw+3lHKHuQ35AykYl8Jgqwj9qDNWYz63q6wm
	41ZtEaR0azXakBwMgs3gfm3Rt1LjmmkVEjf4HrWbbf++FQiToLd8q9AB+hFIw8x/M7YySF/FerI
	bxr/IusSuULxYzAM58RJFEVDIFqe2nuH5a6zjmPZXghRewOV9fWHqFW4/yJOQjwz7knJ4Turj3k
	GPnT56XCMnsQfwFYsF0DBFfqnAbkI8H78eLTznRViQBeyYAP2jF6zAbLX7c+5DFKZ1B54JZmYpE
	xxgrGEU/dE+JBZ25O0Q==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr768268685a.10.1753780969987;
        Tue, 29 Jul 2025 02:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2CQhO85PPfopUvJi5c2iXiK4Jj+bqO8Y1flXWAwou74i1zFQ1b8NfuQV5+s9e8bQi1QB8/g==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr768267785a.10.1753780969582;
        Tue, 29 Jul 2025 02:22:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa2b2csm560836866b.96.2025.07.29.02.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 02:22:48 -0700 (PDT)
Message-ID: <2030fbb7-3e32-4901-b106-bb3c0a1d1726@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tf-7gz6vxrBLve0aolsevWecDuWGU0U3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3MiBTYWx0ZWRfX5FXiXJON0Au+
 bc/mc7saiYtF00wANhhup5pKRh9rzOLXuZJJJDEvAsunNxjBsCsnGGeDYciRWby+BkPL8FSnZGS
 qPMnGAZv74pLlbjldPcwNgykfjKX/LHInAIfkeCX9gvWjN1Adf2AFbC1OijT2RaiffPXXZS6Cgb
 r+afMqgjp6ei8jAPxr2PUaia3v/PbC6LwzpkBfG2JFJelkzYA23L6whK5qZpAJhTdH1pTOzcy3+
 YpNmIcp3T0ilj7Pnqk07NMN0ztXtCg7pQpyhgYTUsoADkNJGTgiX/1ItX+N1wHJ6o9jZ2y29LtF
 Jn/mERs5D0vsmEpL4AU58S4VqC/q5dd/tn9ay8vRV3qMrsegj/livXtW/YlGObPQ9MRAYGeLV5S
 +AK6LuPP224wTuKTl1kJRGPse9/2x6zFmF9pbGNcGNOiFzUx/AYWKMwYOEmj2wNbpF7t4PaP
X-Proofpoint-GUID: Tf-7gz6vxrBLve0aolsevWecDuWGU0U3
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688892ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ni7ra-vBti6l6aYm9ioA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290072

On 7/28/25 11:34 AM, Loic Poulain wrote:
> The host controller supports HS200/HS400 and HS400 enhanced strobe mode.
> On RB1, this improves Linux eMMC read speed, from ~170MB/s to 300MB/s.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f49ac1c1f8a3..72503c1d0532 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -953,6 +953,11 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>  			qcom,ddr-config = <0x80040868>;
>  			bus-width = <8>;
>  
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;

These were always asked to be deferred to device DTs.. But it
seems like these are indeed controller properties.. I suppose
I'll submit a cleanup

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

