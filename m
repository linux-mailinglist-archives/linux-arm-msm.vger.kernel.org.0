Return-Path: <linux-arm-msm+bounces-41865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAD9F0085
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 709A7163EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7B41DE8B3;
	Thu, 12 Dec 2024 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHiQWMcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB91547F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734047535; cv=none; b=Cr/jPOXmL1rfk94wZO+U+pA1GWUyNzokpiMlKO8O2xBSGIdwMSk5psu1+wk2DCXVDtQ0vYjifog+k9bhilkY6Pi2B9UDKkN2H3dNYpTlnA7WR2xgDM42DNhGtSizrC28GUuCrDJymeCKN9RTW1sRE3IR16feqSV4nArqWsYMSpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734047535; c=relaxed/simple;
	bh=LNdi9+i3sapDxIkqiQa3mSnf4oo9sf/hIcFfrsHH0nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/b4kF9U1+GV74sjbWfq6djLlBMnQu77U7/E4NVoxRtD+kw6FYfSKgnf1NO0NacFLtb9T6uPWTHw35uJ1O2DP6lNwt1l7597WejKeVkn5ONBoHwRnMm41408HGirYU8c5CYBdkBooTZXBeReMOHBtp6bCSsfbDcViffCH5cpB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHiQWMcv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDAO13000477
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGkFlJEX4RVezVmwonvqY/5h6OHh5UjyAW4O3g0xR9o=; b=lHiQWMcvi19wSwkX
	CviO6mVqJkMVEZ+OVEOWFawKNaDgiMQYe6HnBe9ykrzLf7Pv5S73kWejXUKeudz2
	gwzkw3sVikdvC4Og+s3lV+6455cNAVTkNgAqG3zi9KX8h8hV8H0U3wKWQapAaWrI
	CwKWB6D99v+0uGoPBeKJs+Up0WmZe2GnQTKwjzpSJRuRoCMMTAQvk/yow6YJDm3d
	IPmS7ThIhstvttNFgTrYMsL9Vu2kEQTlkBtCPjB42tGKWk4/kibCcpgrbVUMK/6Z
	ByW8z24VG0jw3n5T+FFKSaBRfX7gMGD3M9RVlvY+7gu7Fd1bBsoO8jUw42AU6YR4
	IcbcNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes316a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:52:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6db1009a608so1479596d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734047532; x=1734652332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGkFlJEX4RVezVmwonvqY/5h6OHh5UjyAW4O3g0xR9o=;
        b=ALY09bR3n4MWuTlQacE+NHvkWB1ld94tE1RYdWJarid6UJZTmUKHi07na+URYAwV4W
         AJ6mjLyq4XGRq472MB3qO0u05vGlf98BhZIbzmoiHEaYMU0yOD1R9bYY53Cdtjz4q5JC
         uWHdtIGdzzW0QZkRcJT74Q1sycMmzbbZPGVxnwfEL2DmpPQ7smOLU/VM7w7Dphn6M+p0
         GwXZ9MewMdyBT9LXEwhe4EusMveeIxbb1V5p9NApeh0/et9BA2Zfx3NII73SWBHBwJFQ
         TkdWBaxsO0sgtEQ9NoyM3Ule5otQ6Vqp8rS6XbOUWcpAB4MYDcl9eKTsbGPPb7gNHtIs
         2yhA==
X-Forwarded-Encrypted: i=1; AJvYcCWKErA1wXff0KU6nI6/3uvE6TPHfpMbc/zcYqn9S8cf8hYbuR6jI8Q72qQQSxXLueKK7ME0FUsQfENKqKQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyZm5dCfvFRQ7fTlYsekNxUyZKSYR5PgKS+/yEPEEDv2pQ66KO9
	ffrrYBPV6+QeWg05PJgwrMjnUq6lurZ/z/t5v7xYTB2xLyl9uwJlnNs0tZPh/qFQzVqyZWM1ulU
	6YWkfD3qgb893vH5Ddfa8UlIFNf4ur7xVBep1CMcM/5c4qUke1lr6aCO+Qj8LVuM2
X-Gm-Gg: ASbGnctvIDxY7WdPWbXLmFKgHgnXSmRWHkgJ9AL1BcSPSusZktd52kL2vlFfAVr6Syd
	FYHsfBgODLuFcNB9jQ3GtQmeEwJ8VwkusOjBG3kAUMfSxv5nu7B+OhErmA4gzgQ/MTzIAU3+ZGO
	kXS41jsFu72I64dOfWipyLe1I62jvLwrk8SoUJevuDILPXXje8SkYcVHF8+n00uIAa9yrYOQXbH
	fISDoopvoFwcJetcU4G9rl+Gq6rjkC423++MWo15h0N45voAX16zmGYUTHctP2suLalNXMVTQ7q
	PkHZgVEgc9isDN85yPtRTsviyPzYUWD36LU0
X-Received: by 2002:ac8:5dd4:0:b0:463:2d8:180e with SMTP id d75a77b69052e-467a57f681amr3135901cf.12.1734047532265;
        Thu, 12 Dec 2024 15:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7HuJwENknc2LAHEFffGTChVf36Oo4sGXXPRWsuiOWay2pPlPdFwwnuK/EdGpzIbJnzJDhyw==
X-Received: by 2002:ac8:5dd4:0:b0:463:2d8:180e with SMTP id d75a77b69052e-467a57f681amr3135751cf.12.1734047531907;
        Thu, 12 Dec 2024 15:52:11 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa692846ac8sm576088366b.168.2024.12.12.15.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 15:52:11 -0800 (PST)
Message-ID: <6f7d8856-e2a7-4deb-8121-b079458e07d9@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 00:52:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: Add coresight node for SM8650
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210-sm8650-cs-dt-v1-1-6640ebe0c6cf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210-sm8650-cs-dt-v1-1-6640ebe0c6cf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aT9KDYT33cITdUFoFOd94ePEz2-_JKkg
X-Proofpoint-ORIG-GUID: aT9KDYT33cITdUFoFOd94ePEz2-_JKkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120172

On 10.12.2024 7:51 AM, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 187 +++++++++++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 25e47505adcb790d09f1d2726386438487255824..b3890096085fa09ce36d8199df4aee2b120eff63 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5654,6 +5654,193 @@ compute-cb@12 {
>  				};
>  			};
>  		};
> +
> +		ete0 {
> +			compatible = "arm,embedded-trace-extension";
> +
> +			cpu = <&cpu0>;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					ete0_out_funnel_ete: endpoint {
> +						remote-endpoint = <&funnel_ete_in_ete0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel_ete {

Underscores must not appear in node names, use hyphens instead

Also, nodes without a reg property / unit address don't belong under
the /soc node.

Konrad

