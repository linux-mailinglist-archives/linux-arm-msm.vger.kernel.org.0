Return-Path: <linux-arm-msm+bounces-61289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D2AD9EFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACBBE16FE45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6E61DE2BA;
	Sat, 14 Jun 2025 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gySbz4hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886953A7
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749925853; cv=none; b=RT15gaBi/llcqdUpdmJmegZRE9pdDaBECwSPBw+UcW+HlMDQS0X7A8Fr8j4fD9n7mg/mYzzkhgKwtGDLX0gZQddUoQciosuTAFdEAQb/caGIQI8Q/VNOQccXZJ69NKcGBBZdCU+EZQX5g+bZ1S02tzUZUDVupGcNDO9IlnauH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749925853; c=relaxed/simple;
	bh=DwhzSolpHnQGsu7k0rCbg3BfE3JcSr2XRBcVKat7fLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTR1nsbGNc7SASl2JgFX1B9ypyifCKx+aX8wwTmBfc3ckg7DJke00fYQPKBdm7D0FtAoKe6w90rqYhiXpnHLp+F9pEdLXG6uoefAukrom9pnyy/9tyExyuSsY/zUzVH7EXOHcONk3i7aWR5IXqG+J8k+oV8B0Es+L/GzcT9pKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gySbz4hr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EGmR8B021570
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jjhG81loWz4RuioBU1R+FIllgioIfWaqlYvlaoEHAU=; b=gySbz4hrdkqdCepZ
	9l12RES/JwyxMLOrOy9YhSjAcXvRWqdeNkaOX+g4NdD+eUI/HTu+SLx6uony7Ssw
	fYhA13rg/0QzEFz9usYXLWWtQJa/rTqwA2lJfYjGY/cFP5BNt2worMN/+JQPBT0X
	uNN1Aii5hnrhiaIyFFULo3Bo3uD5O2AmCqR2BnV0auCW03owhFc1r7ARzsyPDhIR
	7jFa6ObeFbtYeUVZAIXQBzYFwg6gw/l3YxI2WLktOxIZ1UaQ54QdYNn9+2HaGFrl
	1hksYgGTF7vWd/ZO+JpeJ2LjyUet98tdh0wKrEcdvV6Odko/Iq9Tj6spcDO1VViz
	ZzLitw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hf8vww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:30:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so91742885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 11:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749925849; x=1750530649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jjhG81loWz4RuioBU1R+FIllgioIfWaqlYvlaoEHAU=;
        b=flV5XGhXdHOwn0akbBHcxfiUeR2+8eJyi7/S5iuouEmHvqxl4BqpYaPb5WcPj8+meM
         qzRPv88EOnhK1WVJoa8DWjApq+mrR7HktEHx7heiHFSb5eyZbNw4Spd+XjfYPKm9qHix
         AQ9U1LrpUvi4cgCmQYTPeIGtVuxMklllqP+Dl6QdwLF4wF9THM8t+cCg9iajGL96xniL
         EWy/uB9m8VJTEHhxigLNktR37NUv+Vo7NHP5uufPo+y7I65USqVheVW08IBT7tDNRcyd
         qLKLlTnAOlY3d+RbxOgrKTdJZbvU2eGgxJbDk4o21Meh5HKN/0XDKcuU5PTRgoYeSMNh
         +gSQ==
X-Gm-Message-State: AOJu0YztKZ5ihyvzduuRZ3DZn3XUpL8l2c2j7gZsxo3Fug7R48xAV/Qu
	xSVEFVkrVtO+CNi+rEJGIOLIc+yvgDOTYRhWoBCHq8UOGmf8PTd2uuHrO9Fmxo9fTagC7kDz19H
	cjPWSUTxMmbpzIueFCGI5VWdc7AVgY8+iYL0pTnG5il89kIHr8oq2ljvO4Q/D4wodbjFV
X-Gm-Gg: ASbGncu4mK+TCKJiup5HIX1o8fBIgSdaRcFviSad8ZVCF3ZxBNbaRWlfc+iSce/hH3b
	3o+hDYJvbPoYxC12lpeYxcPG2lsYQYA4KpAqB/8kokeCvK8Ci/gQVmt2dThvt5IAhslfkeK/iqs
	sV5hIZEfOqc7+5wSiJOW/IjrMT0uGeOEIsXsRRkPfa9ceHch3iJ5Yy9rhEuVj2dIdUUYK+CPfQt
	UPIfLiABaFgfKz8hInFNK4EOioOsdF9uqVfZt7+md2NaDMzM4sXFAWdAwiYasKJy3fXA+lCfMr2
	TzhthhKMoM3krIpbEXygMCEPXQOjrwJBijcU4ZnmSHKogkvOuUsqfTUaclopvLz1QOewY8YPD+O
	2FtM=
X-Received: by 2002:a05:620a:d89:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3c6cec2ddmr231098485a.14.1749925849417;
        Sat, 14 Jun 2025 11:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvFTUPPrRoF6zayeHhnBj8mBhdSWc9gdeNtd3F+nan7ZgX3nBmd83xrz/enT2N6VHXwJAaPQ==
X-Received: by 2002:a05:620a:d89:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3c6cec2ddmr231096985a.14.1749925848982;
        Sat, 14 Jun 2025 11:30:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1db714sm906822e87.178.2025.06.14.11.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:30:47 -0700 (PDT)
Message-ID: <dce016bb-b12e-4ffe-8042-4e39c29b0e77@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-1-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-1-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NSBTYWx0ZWRfXw9Rx4S5D2kvS
 K8AEjQs8NNaGmv2B1ZtRs6C9x/rmsJM0LJEzmoqx7p8tQzfahbf+fj5DpZZiX1tsYt3JhHFHK2E
 hLmcuYz31yGIsMIWQ3Rq1UY9ZqEY1bPG9c4Cgt/OiSFBsLUp/FVKuzTKwIU+ULjwvB8gojt4/YA
 Rkey4K+V3vrjX6973NS4woPxfjT2COlRUj4uM6NmnJ0WGFp70Ccz73C/Vw0pjCuJ94McRzpG0z1
 2zViOig6vy0HHZokwTc+7QfYrldKQGQ5vsAYjSNp5BYL5C5flht43HZIhgLL0Q297QhaHR5jYJk
 1V0NnGHhtmDIi3btdzjbBxME/T4wCLKVNOQUNsOAx3xCrnjKwUMQtwQNQzieUSmipBOnzjGtRJC
 9NQ7c34g6LIK3siI/rVbZJYHJdSmcaNeICniQcRKGtx672UnBvkqFvUlx0ZBGrfxGOV/I92b
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684dbfda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8
 a=eEByw65rTXB7yy4hQzQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: i9AlLDHNjXe8kxuj3VZQc-muVECXb3o_
X-Proofpoint-ORIG-GUID: i9AlLDHNjXe8kxuj3VZQc-muVECXb3o_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140155

On 6/13/25 7:50 PM, Antony Kurniawan Soemardi wrote:
> Adds sdcc3-default-state and sdcc3-sleep-state pinctrl states for
> MSM8960. These are required for devices like Sony Xperia SP to ensure
> micro SD card functionality, though they are a no-op on the Samsung
> Galaxy Express.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      | 38 ++++++++++++++++++++++
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  5 +++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> index 4fa98277128897a531c54296576a6f15cd6d2a28..77fe5be24b36fbda83ba73034939db10db6ef4c8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> @@ -18,4 +18,42 @@ i2c3-pins {
>  			bias-bus-hold;
>  		};
>  	};
> +
> +	sdcc3_default_state: sdcc3-default-state {
> +		clk-pins {
> +			pins = "sdc3_clk";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc3_cmd";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins = "sdc3_data";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdcc3_sleep_state: sdcc3-sleep-state {
> +		clk-pins {
> +			pins = "sdc3_clk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc3_cmd";
> +			drive-strength = <2>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc3_data";
> +			drive-strength = <2>;

Please add bias-pull-up to these two as well, just to be explicit

Konrad

