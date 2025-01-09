Return-Path: <linux-arm-msm+bounces-44604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1AA07964
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D873A5CEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7704B21578A;
	Thu,  9 Jan 2025 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSnoYSZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8A21B1A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433446; cv=none; b=HO4tx6aQN+GKEmGiSmqCQJbjwLLhnbp6W3D71Ypqaz//lhMgPtB6Sdx8KtwJxOhh3Mo7xo2lKF+93/BaQOBOrEzAHgH0ZehlrSQqoKpUDOITsrHWDccU5i1LDz/miHapiOxf5t0DvGF/gJsIih5/SRIOGQbdDu2Ol1iEJh2LnEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433446; c=relaxed/simple;
	bh=O0WMCuKaeCo18+EWld3efByDAsM1DMJMAJMmSP+RRC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loxSuLoUOZ+JDQgG6j0ariInJebZsGhGkMv6BKH1AcmZYUVbNYGDT1fb+M+WyZR8H+6ZbRCHKrIZkI/PHXeBdRIRS4BCrCZWhKj1sK0wDwureYLVhKXhf1Ul3Mc1YkteWu4AHq6bcfjNpTBWuPZXH1akjtgLX4kQiXdJeMx/NxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSnoYSZD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Ci8SK006599
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 14:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXTAvWWJZJ1SEqZQJIZWExX9jqYfwbakZA0U9QC2/mw=; b=CSnoYSZDSEOZCWd5
	II3gvxjbwNvbwYGvByxrZUhbA6eBuHETBhl/vB6Ft60IdcFsNZYHe19FSjJed1/D
	3ma1vfohE/eQ5leh49dFVIKvhwoMswTqrwvS12o2RLd1RGqFzSQW6YPJATVzaHgp
	WV/F3W5S5YNWgja51JAiUFsr3LNLwY1bKfLFUN5CK1VIPPoe9hyTHOyn+tHNFgo4
	vAoCCU3ubNvQCB684udiUmJ+Oh+4sotX6Kt9mNs9zuTtpe/mjU5GtD5dst1owZU6
	CUtDX0ga6M6kTysLP8pXUqGN1ZX21RIVy+xBB+jQUYJYtsStyOI+mP8l8c+S1fn+
	QWIAOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442epxg8ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:37:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so922831cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 06:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736433442; x=1737038242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXTAvWWJZJ1SEqZQJIZWExX9jqYfwbakZA0U9QC2/mw=;
        b=MWVt0QPgDbmR/d0HX8dgyIBpgGpQuvX/vExPnsWBSM1fmfh9+QVLlEuVBp8fehX4hB
         Qa9g+daxPjjRllcgtfQJmlONl9ce3vkrxIPUm3xoPevxwYyR6v7A1TnNsmWZgwyF5a22
         R04fAaeKa7l/+glb2PuYzLENPAqfBe3AcBlGDT9gjw7bm05pBGAMCY1kSdPO7QvXhqew
         HQm+TgIr+ZaMTgzjYzzjxkk9KutECl1hyVjT7BZsw6Qq4fPNr0YdeRROU0pyoSBgcSIF
         GaFqL8oAthFt+Zwi8mbN5gJKsyOabixF9KDXQ8W9BVykRcuZobq8cXNBOUymYPPzETWY
         smXw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Sdl81FKOFo8OdRENgJsS9miSQp15PCiIrhobnIzFxDJl24Wlh9NGxV89YEaHmlxotw0UBq5qkQr5ALJc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9wAux/5IVGphaGZlWThK4pdZN3c5WWxp176pChbYQZSwZqV0Q
	7mll0lNs9P5jlwBDE73lwAd+UUNrB7PmVx85/cRik/4Sf8kWKIvhDkx7XGrKtVhpOdPPDYhJjZC
	NsJQQxUIMcG4qdHu+44kLyP6Jd8W7iiWdEGZtFw+FQl5KyIalaSaoZcuaR++QV5AV
X-Gm-Gg: ASbGncvdiBRC4y34Sw/PF4MbKqvQmiJRdVIzAsOn5REww7gp5RXaT7+LKNsXnltwZHR
	Cs8yMj81v18dlMhFKx6bT3VLqes47jrIhuJgqqQFvlCFW7BNOOpLytMpgArZF/na4cdY3TCm9WY
	VQemU3cPIhl9t1qXD3cTBil6BaEO/ynBGHOHyydCw6mvinV6/hGVA6em517xxkP2DjkpVta1bWG
	P5DcIgcZzVxqdODyTaLb7yTC63GaWxDqvxvd7n+pPGNqMMp5tHmH0Z2IyD8XvW+gCQ9XWr8ChtQ
	Wd/on4+0CfySJzZxcf8KpCsqZVp2YlMFHSA=
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr40847441cf.10.1736433441584;
        Thu, 09 Jan 2025 06:37:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUZYQUve7zJIeK0jKX/0nSErkVBt1y7Exysoxyuwprb0L/l48rtjRcFnYYdZ7KVHC5YjlsVg==
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr40847221cf.10.1736433441218;
        Thu, 09 Jan 2025 06:37:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3333sm688478a12.47.2025.01.09.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:37:20 -0800 (PST)
Message-ID: <e003376b-0560-4d9b-8909-937d70ca9f22@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:37:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250105174159.227831-1-mitltlatltl@gmail.com>
 <20250105174159.227831-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250105174159.227831-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iV_5Ae1zb45rVjVc5F7TySZBXORyBGUB
X-Proofpoint-GUID: iV_5Ae1zb45rVjVc5F7TySZBXORyBGUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090117

On 5.01.2025 6:41 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
> and provides battery and adapter status, port orientation status, as well
> as HPD event notifications for two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c ports, orientation switches and the QMP combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 09b95f89e..ff5db8f63 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -28,6 +28,7 @@ / {
>  
>  	aliases {
>  		i2c4 = &i2c4;
> +		i2c15 = &i2c15;
>  		serial1 = &uart2;
>  	};
>  
> @@ -216,6 +217,40 @@ map1 {
>  		};
>  	};
>  
> +	usb0-sbu-mux {
> +			compatible = "pericom,pi3usb102", "gpio-sbu-mux";

Sorry, there's still one too many tabs here and under /usb1-sbu-mux

The rest looks okay though!

Konrad



