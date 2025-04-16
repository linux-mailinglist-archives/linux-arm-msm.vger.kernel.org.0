Return-Path: <linux-arm-msm+bounces-54523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F2A906FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E32F167545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996041F1526;
	Wed, 16 Apr 2025 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh8PAI4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28315F41F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815115; cv=none; b=JePx0cmTtHqrFBIjsSpTfEZlQjnMwbSWpQVCoaKCVjnKwTens/1vfL54g1AnyMUJ2V0hpN9sktk1okJlFzhJnJ7zSoYjoSQXEL5G+4jgQjgQskqJhTZ2ynnya/ICZyqXJOVwsLa+j8XYsmsr9yg/rMYxAZDfuQsG22FZV3sk/Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815115; c=relaxed/simple;
	bh=vwL1BbE9dim+EUQ5oei2dD+XaH7nnA7tsi2X4O+Jtts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QY+Nuuynfs74/ZB6ZtRgnXV/baJiODyVSPCB+OVe8dULer6ndUrWF5QhfUM1v46i7Wiu6X7HWyiEbzCtbEGYEBiHR0FdX+LELvcZescLI2ISuhR2yUJRCGYfZz6pvLva1GztgD4ff0ikL1dFC3k/Q1/zENUQeLWIwcllXN13EtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh8PAI4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mEdZ007029
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68ZrhJQovSEcR2kztjippS0ohW5/EM4NVarjyk+ti00=; b=Jh8PAI4wOElWmlPv
	1QGJhjgN/Jp67AVwgq3d/dMdL5otjq5VvoRBN0m0Dmetmey0PuG3zuGTPRWKoKTW
	Ai4p2CTx2L+35klVlCzvpEWSoY8emzYp9yjt92TXYph4eFOpe4xKE1C2gPxQ3eSM
	rUx3ThcGdYrBZ2LUUbVIyh99R8vX6/wTxLAhzHStBIG39TljXfB5cdAtSExq9Fcd
	9f2m106XuI8gd507IFN9y4PhzEmc3HtB/1Ile7RU3ddadVF80RhOlFXif8T7wV4R
	/sa2/1FA3QjXftyYdSJ3wxSk2thyNWR6YPgg3RqBh9JGvNGiLlDxocVQz1AuJJwl
	ttxYeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6kx92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:51:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so163217785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 07:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815112; x=1745419912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68ZrhJQovSEcR2kztjippS0ohW5/EM4NVarjyk+ti00=;
        b=JZuMZCqTW65+bp6RTKPbftRs8DTaLTi7BOK+Ps+ZyeHz+ChY7M3ox/A1DCCCDjeB7u
         uA1Qjp/kY9lc9tXLU/fxLawmSwxgpMx9wxqe4gwGAF9vTgMwpg5YhGN/bCL6U7wskgwM
         +kQKGzGxz/vC8swixwmQPh63kRO6lKShC+6TE5uArtjJh9X7WhnjJC0DBw8FsHQDm68m
         QgnVxsbrgnfaEkEh8tP8mU1X5wBqLWUQA6HJ8yYm+83HaoTTtS/xogRC5Oih3AwuBDNI
         VA184YM5V5k61rTIxWDUIGMGI5i0gU7JQR9mk5Br8CCrOVcmeZsaiQ4BRKpg9baOScx/
         //tA==
X-Gm-Message-State: AOJu0YzhUzjWSRP0JCKEvMBSKXVdpQhwV5PDPM/hjVuqpOYeoCn/s30X
	fNz1Xd2hhWdzy1SUz78jXfzkGuyk1w1So7+i00sJfyUzqPHTHYiNeVgvZNuGMnJBzPCjKA3LpP1
	1cqsGPT8XIr/gmLF+6C4+qgHRI3hhB9VOdDEcVw4r5opwHoFIbwnAENVCXKI9H8R3
X-Gm-Gg: ASbGncv/ZbCdLQGPkZbn4ISy3ZzHcWk7CstC0Y2Dlknivhs5wE2+gdkrRvwSphV7Wh8
	UMvG3eZoWLC6E8oXqeAedTyXOCoeQf8hjcYLsFFgBFO3KHP5Zw7gDlte7n1cgZJU2A6h7SPjVAB
	/2GhE9mjjnu73wUbz45Lt2VgdSghREfNlDwFjKLDDbNFybk70w24L8cAPXg7/lvI0g7YGnMwGFS
	IXi2wf553GwvUw0ZRlV2SJs6htuiZZskGtasq/F0wU3ZRBMTqF888RrX0Gj8yIItJDg1m7WRhGq
	Cox75tLSnb3I1c/z8gS42bTz5ygt/h+R4UroknxOZWFh2pvr6gVk3JlfIVNSnMjvWJo=
X-Received: by 2002:a05:620a:3949:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91907f98bmr107038885a.14.1744815111892;
        Wed, 16 Apr 2025 07:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcOviPf73nDukXkJL7ld7hTvKQxe8wwMiCfiI19F135lGpiXQBbhZ3nTHbf1J+gRCPNMCQDg==
X-Received: by 2002:a05:620a:3949:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91907f98bmr107036185a.14.1744815111395;
        Wed, 16 Apr 2025 07:51:51 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdda64fsm140691166b.62.2025.04.16.07.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:51:50 -0700 (PDT)
Message-ID: <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5txOdQOA9_0jCp8a2gI6NN07EVLFxeIT
X-Proofpoint-GUID: 5txOdQOA9_0jCp8a2gI6NN07EVLFxeIT
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffc409 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4JCwT51NPQo9-FzctWsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160122

On 4/16/25 10:29 AM, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was restarted
> due to WDT expiry, bootloaders update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>  drivers/watchdog/qcom-wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..94ba9ec9907a19854cd45a94f8da17d6e6eb33bc 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
>  enum wdt_reg {
> @@ -39,6 +41,9 @@ static const u32 reg_offset_data_kpss[] = {
>  };
>  
>  struct qcom_wdt_match_data {
> +	const char *compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>  	const u32 *offset;
>  	bool pretimeout;
>  	u32 max_tick_count;
> @@ -175,6 +180,15 @@ static const struct watchdog_info qcom_wdt_pt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
> +	.compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
> +	.offset = reg_offset_data_kpss,
> +	.pretimeout = true,
> +	.max_tick_count = 0xFFFFFU,
> +};
> +
>  static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>  	.offset = reg_offset_data_apcs_tmr,
>  	.pretimeout = false,
> @@ -187,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>  	.max_tick_count = 0xFFFFFU,
>  };
>  
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,

double space> +					const struct qcom_wdt_match_data *data)

Please align this

> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->compatible);

I still think nvmem could be better here, as it allows to plug in
more magic values

Konrad

