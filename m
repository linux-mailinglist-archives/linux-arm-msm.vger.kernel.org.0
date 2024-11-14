Return-Path: <linux-arm-msm+bounces-37921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F69C8DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C34287450
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E80D3B784;
	Thu, 14 Nov 2024 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm5p6S6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097BD133987
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731598011; cv=none; b=kbj8G3za/G1NcSsWt4LEOw5FxeWiHSl9ashpoi5B3K8+DhrKAn/VRknPA7GgDNS2rupjOjN5dVojUnYYGAhqoEFcxQPLHl+MvVthJMXDMdMHoylnxJzEu3pIRJxklAFUReTih7kRN0F/Ivu7a4+1mpwPCItq7f8pCRBOf+PMfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731598011; c=relaxed/simple;
	bh=+jeoGf9IWx7kxj5wQSqzv2q+UrmcExRVO+ScQVuijCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMTHFIaeRsPEkToNt/jgDqJmTLxPBOHJYNjr23d3M3qcW0elAHE8lVGWtRcvmTWWNE05yG/Z8ILzGdcrJ8eblLJb8vRXrB6Q3Bmni/R29FrvzUOnebg75vCdPFanCGbZZ7YQwSZowFZQ8Ima/VgfvOe0M0K1st3fNNDwA9FAfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm5p6S6/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEAALIA031591
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaAEA/MQL5Iap4up1jmtqc010b7v6svP+NEN3Qkjamg=; b=Xm5p6S6/VldMOuay
	5rDQEKKux7pB3srITl7eFter0sjwCoHmBgANAXvM2vz2JhCE5PgVOtXNfIvxZ16U
	Ixurh6AGLfwxtdO+d5yrFxsGzDj+C1C7RK35afcw32EvDjQI3Lol9NLPKISxSpVG
	F+YyyVR6gp5EukjuCUaMnW1r7dbHzptp3RTuUFWN0Uzm9V8FW9ensdyyKC5EJyLK
	bhsZEtRcua+gtd7GtrZ7vvZLb3XVGMaZPcTkHZU1mufjnAgsqa0WZS/3kGZfeCLP
	JT1tI35Riz6lbVOtmB4t+4f7h0m9mlPfMOjXMTG+leyhqnZi1wMYsYb5Nf4kMfRo
	T8nFVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gu7r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:26:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4609c883bb6so1693761cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 07:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598008; x=1732202808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaAEA/MQL5Iap4up1jmtqc010b7v6svP+NEN3Qkjamg=;
        b=wTaokh5vzpksJGHgrYiXuZ3d4fY6a2peQZ0nIQ8+y4fxjoTDVXJwUK34oWE1EqF/pb
         osvmoRicsPqNgd5xkm3fIENsRx35tKROja+oeDC0NOH0jCUav/7Wh4EPBStURD+2XO+b
         fMCJYmx4Tou8/nI8K6LY1m/CSLmJ00Ox+ku3VjidyPxlxCa7Caqm93Rh+JXZgirTr++b
         9wE7Dug82La+Jf3Jv3eSZmlay+9d0vYZdOKwBuZ3pROfDxrUtFSk74hRNSO/MixkZmI8
         HzaCyyBA5dDLlSEIpQ0ZzlPAo0c+6e3DVHhwh8EzIXuFOLEnK4ehKY8Co7g9bzS7+WDy
         rqhg==
X-Gm-Message-State: AOJu0YxDAs7ahqEc6xjbJi2mpMe8RB3Eon8aHhNNLML2m4+yUraVH4es
	OdW6EMPqw1o79rKgub/Q+RDE5K2PmTeZc6u5WibHrdumwHBhNzeQi9gLGJIrwjpgZmOAd+IsJGF
	CMojOyHwTR+7S3b7Ll1PIeX6F2b0YOr6TKkX9jxqr1vwkBDRIT6c2B2Fcenhk+z0x
X-Gm-Gg: ASbGncud0kEoEHddbzuB1JW7pAhCbF4nnuetKMUrcz39OmsAzndybjPXVtEls8SqYZ1
	eWj52sgCJKEihETar8I3nqQzzIcr3RsbIvwI0uIFtpQI6iBFRJWy4LJuaqmnwJh+bIWlrZ31Dau
	z99NrmjYfULL58XJk5q1f4oa3byxHiKkW3pLdpjaUAcBmHSezUdG8RsQZ0gfbvtioME7h1jjBzG
	RNb+nsvjTTJHZtelX/KWWgBWQlKbGlPKM9g8yaOqGRaOdRXwf8PMBcOqiftdSTwZYx6PtMZtT4n
	yV5GolSXPGJDR71tRhY9fNYIfhr8dRM=
X-Received: by 2002:a05:622a:2a0d:b0:463:97c:a2b with SMTP id d75a77b69052e-463097c0a2fmr145377401cf.0.1731598008118;
        Thu, 14 Nov 2024 07:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+Km+brd9preE/+PlVgl2cbIAUN7sFBM9KxI766x2sS9tI2y1AA2KqybBztWk0dxxSz5JK+A==
X-Received: by 2002:a05:622a:2a0d:b0:463:97c:a2b with SMTP id d75a77b69052e-463097c0a2fmr145377191cf.0.1731598007771;
        Thu, 14 Nov 2024 07:26:47 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e043316sm73590466b.135.2024.11.14.07.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:26:47 -0800 (PST)
Message-ID: <f987667a-5af9-468d-84eb-93051ed015f3@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64: dts: qcom: qcs8300: add TRNG node
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113021819.2616961-1-quic_yrangana@quicinc.com>
 <20241113021819.2616961-3-quic_yrangana@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113021819.2616961-3-quic_yrangana@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2BmzkLuJvEPYOMibJ0AdxORjxNchJday
X-Proofpoint-ORIG-GUID: 2BmzkLuJvEPYOMibJ0AdxORjxNchJday
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140121

On 13.11.2024 3:18 AM, Yuvaraj Ranganathan wrote:
> The qcs8300 SoC has a True Random Number Generator, add the node with
> the correct compatible set.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..2a3862568da2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -588,6 +588,11 @@ &clk_virt SLAVE_QUP_CORE_0 0>,
>  			};
>  		};
>  
> +		rng@10d2000 {
> +			compatible = "qcom,qcs8300-trng", "qcom,trng";
> +			reg = <0 0x010d2000 0 0x1000>;
> +		};
> +
>  		config_noc: interconnect@14c0000 {
>  			compatible = "qcom,qcs8300-config-noc";
>  			reg = <0x0 0x014c0000 0x0 0x13080>;

There's a jarring style difference visible looking just at this diff :/

Konrad

