Return-Path: <linux-arm-msm+bounces-88099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E4D03E0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29833301A33A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DED64D94EA;
	Thu,  8 Jan 2026 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe1rwkCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN0Nj7v9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A24D94D8
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881465; cv=none; b=UgRD65oRCU2BYkgSbBfTypK2kIiW1tMIxDZg13fyBVoTKPcwx7MAaxM+ocuz+xMO65clHxIaQXD2rPbLofAYZps0BzpeOciB7jaDEQZJ9pRecsgCA9ivU+MNmsJoblEIpvHnjgl37/JMfJ12vjVUDyzf8mawXibnspoMgp8Njh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881465; c=relaxed/simple;
	bh=l0e5f2jWVtuSG5EsoRmMeyrqbrKdMDocpuar/ayJUQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CixAXFhIQQEmUeXAUmAUgGaK2WR5aw2PC19x+n59+Ih6elD51V6Tw+n1VKGKzi+XT/zloiLR8etSBKzEcwhFtR3Z/YG6iGJPYMCaITMQW3RJjRHNJmdY2UQmTuKsf30T8cHBOyDODOn3Gv5R+rNlL+43ys0s9MtLwncmHv+5cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe1rwkCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN0Nj7v9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089j0i8126050
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 14:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=; b=Xe1rwkCwGckOz/a8
	3so8x4aVDhwiZlkEaXxHAfVRb5wKbEEeZ7oFQchh0vDe/VCC1MuJb6kY8a5oS5Qu
	1/xIQLviuBoUgLy/9gB3MuGRip+GWJRODp6NsAgsu195nTjXdfNmvm90AgX2+A7F
	+nU1NkgVuxKDOsH6cQ2QPkinJzN1ZQ1jqkS4qt/wBzVvk/lIkp6s51aG+B/RpJwl
	KFBW4kPNeNCITPRIVeNwAJvPIJzPsq9ubu/juO6YaBPpMMPMkI7jqvmO/IPk2sUt
	6GTXmYiiPWCPDr3qcLd/nReuaXi9C/VnGmditW9zNHAj/3tfFK9eXv5ZKNT3incT
	NsfzJg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6a2sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 14:11:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f4f5e8574so630506241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767881462; x=1768486262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=;
        b=JN0Nj7v9sbqMzdx0BgeeR41o7+XYm2CdRbEASrazMrAHAOAek+G/l+KodrIxEDEHd4
         BSB0ONoxRosRCUVIIGX4tFlRbhLSzofQzzE2/EEQUDQhuhK8lok/fk/pweOoEitoWMTa
         JwFssUe+Okxw8thjei0ZRx9YEkkJLRei4D7ztOvA0Rl2Wkw+nZ11rKSC7gfxZZSdky3r
         2HqkMyv6YfujqGaAnCSC9Tnwg24pqKvpUe5S6gaYgHuTlJhJ4njo2MDdFmnl8f2mu1xp
         D7VkBiMq8JIzBto6VklYHeAnNAWNSAVwOFtaEDkr8INmKpJ/MqSnp3aJG5UjjTHmAeNS
         dzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881462; x=1768486262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDj0SyrBKwtUZwnlbW0UelR8aNx3msiTcnFCXsLwInI=;
        b=mXs8k48xVDDji3hzYRWPZa6gwOJGm/2N8ieRyGPn0h8CazJEjwIclsHhiPMDaP8m8n
         1JNh8f8BvYN6aSdXwNFgX+KphXEgVJpl5QZTahjT6//kLlrmy7nXfGTU2dw+rDZZxvxZ
         XVN2Rl7XFBknQy6a/1xu4e4HN8LTGOq51OiYJ/RzdSmStFjQ9BOB8v0HNu6o6kvZ9lcY
         2hdfX83MrBjL4OzvKyb5VKkIM51+PwkvMG+GOXLh2/XXoXM7yuPKs4qDt704EOdPxSKO
         jv43bvnYneSazSZlhFmhJh/p8rNtUm3OSqAUxlRUa8HfHsN53spDenYaHfCVkpBQl/ev
         NGlg==
X-Gm-Message-State: AOJu0Yz0EO1kmdL5h/PZ0qPHgv6yuKKe+LLmcA8SM4batI2VSrFO3dMu
	nusLWWKw2m3A9lMkjtk8eeo3aNkXi0zXFZV3BDwHRoU1oILumkmz65Em5vF25HBuKTMf+GF0M7e
	4+INRu1384Iz/U7NPbw7aN/6PoqI1zMwCwpxmxHWc6OJDmZu2ODgBecSB+ekjZYUCjidb
X-Gm-Gg: AY/fxX65F7Wf87XFAiVTQp2rI17sjiKQYwH85tu+Y1q5w6afgNimxzDWKh+lUlVdOY3
	YL/DQBALzE9bHFHflySfpATs3HPocqb9ESwmsfybRBGordwvMZUOHUKhBtIdAF9Zk2rEvZqnd5V
	3GEOGpkVIvICNJxYS8TAFdcGbvoJrRXC+ox8aj79CwBbRBHtlf3oTn+2VoLYdq2BOSXarXDZbSZ
	/CMq3bWqDVnDSjxTT95EB1cr1z+HqNHDPOdaLBj2WwNlT/zYJousvNIJ9/3kXGzLE8U7weGYsXc
	3yn57u8clAelsMRmE7qRu8FLG9tWdkN2YyCnwIyXIYYVO6+k3pRq6wvyPD2YexihxHdbhdL0/rQ
	3fAQF2Zl/59kTmR5kmahRjWI/FV1kPPZhype5ylR2MAabLWK4TKaz3DIIb1vdBC3iCt4=
X-Received: by 2002:ac5:c15a:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-56347fd3dbfmr1198685e0c.3.1767881460094;
        Thu, 08 Jan 2026 06:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEijgO1jNR3691smMRceSnemB4rFBjC4LyZ/kq7RRolPPOrjZaN5nPFbUqww4SzQgZyOL1U9Q==
X-Received: by 2002:ac5:c15a:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-56347fd3dbfmr1198644e0c.3.1767881459379;
        Thu, 08 Jan 2026 06:10:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c0bfsm841928766b.22.2026.01.08.06.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:10:58 -0800 (PST)
Message-ID: <328342d6-e833-4fe7-828f-6978ae17cf0a@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-3-f9f7e4efbd79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-3-f9f7e4efbd79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BzW-1hOsgl2HTPecgwYU7d_lbvyywYD3
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695fbaf6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=20ciNqFLEIM2uVeCJLoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMSBTYWx0ZWRfX0UIwFIY3yufO
 cjnfceSKH3/o92sXImB27C6qvT7b5ymbd85KmCRRPky0RKoit+Av1nYv4gphJrTFNh3c/Hp9J5q
 bwhbMRas4cgogvfKO7Sz3Sm8DaPH+VTxYsDU82f+Y9vQneMmbVl4cEB+meN6GraoJHe28rJmaVe
 ybf2TnuXXBFM0sRGQGaHDC2NieetM7BzR/kvge367Lqu029PEocvCxiPs+wZxj6Bvy0ruiGvjEH
 xrfX1Q8D6u+s2rdb72+uduVu04yF/WJyiiXhCon3nP3wgTNxtGZ8enWHxYAS5CKAiIkdtN8wwYX
 vXeHUOcqN5ywaNhtyIknwIvsOVKoS7xw6n8ko+J3kwckucYOo08F3n3HW5uLgmWBU269GuzyrD0
 0GerRvjwWlsO0Os3bBUKf2LM1/Wu0E2v2e7FoOip1teIcs8IO7zRyrxij7ENyVNZuOjruVqSe61
 p/9IaVg9Nx4Ng/4MhFg==
X-Proofpoint-ORIG-GUID: BzW-1hOsgl2HTPecgwYU7d_lbvyywYD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080101

On 1/7/26 6:35 AM, Luo Jie wrote:
> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
> 
> Add IPQ5332-specific clock definitions and of_device_id entry.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index 369798d1ce42..962462286837 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  /*
> @@ -20,6 +20,11 @@
>   * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
>   * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
>   *
> + * On the IPQ5332 SoC, the CMN PLL provides a single 50 MHZ clock output to
> + * the Ethernet PHY (or switch) via the UNIPHY (PCS). It also supplies a 200
> + * MHZ clock to the PPE. The remaining fixed-rate clocks to the GCC and PCS
> + * are the same as those in the IPQ9574 SoC.
> + *
>   *               +---------+
>   *               |   GCC   |
>   *               +--+---+--+
> @@ -51,6 +56,7 @@
>  
>  #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
> +#include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
>  
>  #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
> @@ -117,6 +123,16 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
>  	{ /* Sentinel */ }
>  };
>  
> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
> +	{ /* Sentinel */ }

Trusting you on these entries as I can't find a source

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



