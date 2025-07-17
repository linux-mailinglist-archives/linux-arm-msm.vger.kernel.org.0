Return-Path: <linux-arm-msm+bounces-65549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B49B095CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73A4DA439A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB2C2264A0;
	Thu, 17 Jul 2025 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLkmmo7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209F223DF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784834; cv=none; b=ii9+qIj0tLDQz1Aqb3hzJRzj/Zo4Z022BAKq4IKtOd6Dsyze45W31FGjf3GTFjWvTjC80ENqa/dda3puzIfkjO3LbkKRKixAFq80dO5wFGRF6xhnGM1ZSe+tZaq592WvjjGSx0LQ4IuCUV+6AvZM8P8f8+g5rdDs/DBMzPhjRGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784834; c=relaxed/simple;
	bh=+PKURqZUiFLHGFdok2C2mZeAkQagOq/qdJTWlYR6YI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjmcQHdfPJ8HO8NeaMxQN488rtqGKeRZHF2t9RflSVunybqr4l2byQ+8McxRKNmDVTYTYWwMQJ1WbX0KD8oIbVIZwe6DMonoXEGIoNDn6AMeRz7e2ZQCk1g7Vc+U1tX/ILSiFmGZJNbf6WRDI/le6vlmDugkEuTbM5XSGXlp8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLkmmo7k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJlEJ5021536
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcA+kp3HypSPdvU2NDchUlEnmvRzp6s5z33xRBR58yg=; b=BLkmmo7kc3scYKxZ
	mjfnbXvyG0g7oXjZUoiUEQ44uLA6XV5nH9+mSFD+fAkInK+06RhrU+wF5uqUFPXY
	UCbek+1GQTOFiEvsYUvD655hpeVtv0OYahZP7QFc29/Q7s9AU0n+bdqxit4zCoDo
	SrDSKDeMU2P+x7tTNOxEOTHR6+GhzvPofq9jZzr19qUHAU/zoTBBgXdzXKf1F9Yb
	XFsAVz00EoI2V/4chGHDZsOaC7e/5ZOcZPyuK49/YV+lGWU9v6wawmujcXbSQuKY
	UDjd9RHMkXuQ8FBJOTN9tI5+yasOyvyrr21eXBC+xby4vgIT/6k3RqwygmyWwxyr
	aO7PFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpm6hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:40:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5e4f4600so2839641cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784831; x=1753389631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcA+kp3HypSPdvU2NDchUlEnmvRzp6s5z33xRBR58yg=;
        b=IXTaGGmGU0pxms0EBlWDMU3B8wQVNTMHSRDdn7wnhc9EhNDPZBNHGQYCnbOT0JzSVP
         LUa+aPzqsUIQOArMGR2dA+RzZIPviXnpsFF+f74joTBF16BWBZlaMUDZBDnmbHV97GAR
         aBgQDcSlJKpYAnY8ux0zt9eq3cYkxSQKdlvHIv3lskIi0oOTZQCJRRsqALCrp0b/curJ
         X+GRG5jqkXUZos4+gJ5Za3S/OLERi6ZaY46T1KrKYZztBMH6WlVaV/FeSQDBpNCnq9bH
         HhT5F4psB4h+ozzLZu105VLColOtOdUCWGIYEAnKDkq2UA+cqHUSQYtXiCjr2DvLBJ28
         /6qg==
X-Gm-Message-State: AOJu0Yz+4qebyo2GCEhfnR4vEfrSoUgp7Se1gilBtrHGpMZEkAi+s+0Q
	HCy3RcwJRmmnY2t4sfMRfiDyIZJcRBaaZYeeUwb/FLSN79xKEluDili0IGbj90hpVXtmLb1t7ZV
	WyqpZt8m7xyc7lYRvKi7dNvsCl7c0lc0yN0IN4fJnx+cqGXFuYLV8M1xeiJ9FJbVkLiC3
X-Gm-Gg: ASbGncsH+bjT610fWg8sTZqczJqs1TrShuBlhFJxD7ph+y/aOLVr/m+r/JdceTxPx+u
	IixX7CejapsguqRoOYEnMJtnp1AlovLKdfujczajQBr6YBL8ZNHiG4z9ZkNryZEhgzva1TUoM66
	X0iHtMHNonpRP9qevrqPfPjFEUgnPOKNANz7nvdGeaRdNNxwqeyliNtghjgHTu06dADI4zkg9mo
	7chCzANEq7AI2KILDfFBM7XdSJRK/6Eu2ynm/U7tXhqwRsG9JrY++lEYzpis3UontVnh1PAc52s
	JETmMwSEK1CHpuCpi6zT3A+TPFu/zpHThCgnfP1wurtXPu64Gfa+RqAFJsMNtu0Vt+0M4x0Zi1S
	1BGTTPHP2L4Szid1qXvkg
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr62007991cf.3.1752784830698;
        Thu, 17 Jul 2025 13:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGacEtOK6P1w0TqLkAVvy3zfLW2JrPG0JSKgt/e9kAEeqsdXApuxd5RMOc2e1Ib7SbZf4Jkog==
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr62007551cf.3.1752784829965;
        Thu, 17 Jul 2025 13:40:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fd2sm1430651366b.108.2025.07.17.13.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:40:29 -0700 (PDT)
Message-ID: <ad726c8c-0eb0-4498-a430-f906ea61c80f@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] clk: qcom: ipq5424: Enable NSS NoC clocks to use
 icc-clk
To: Luo Jie <quic_luoj@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-2-f149dc461212@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-2-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MyBTYWx0ZWRfXw6Y79HwAbWTK
 FGkFoxnaclisPg2ViSmQKyZ91C1P3KZace3d7PDylx6cGeuDV7vD7qP2bzxj5VFXfeVQTr+2o75
 cOhpOtSpCBZrsyQ/6rzMVnrxyJwZVMcUHDitBDrzn8JkCy1Z024MbDKqanf+2D7HueEtOsLAFyc
 WC0mCUyaZBw+0M2/TnHSSH2O54Ty0wmD6BGycHcHrO1V9gK1NCXQZPWXg6x7Pp1K+DIGEbYLGiD
 +TJy/KCgAkWaS30qJe2CPtfTSbBX87WVkTP9xYIfKcWpTkeeZeVh7KdytiaLARf62oy+wfXcVvI
 AM7AJnxv67447NyqxWar0l6tBVLVY3oTWb+QsM8Wnd1wP38sA1kamik4a8ndSYZSpbIukgjA584
 GZtgvaXcJLIbc6pa5aLnJyJHgt827cYhKoyhz++F3dsr9VhzcKUZm0qD+NnybUae8xCWK2tt
X-Proofpoint-GUID: zs8Xic_7SMI5jp0NtuVFDRcP_QrshuCf
X-Proofpoint-ORIG-GUID: zs8Xic_7SMI5jp0NtuVFDRcP_QrshuCf
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68795fc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=53G8P9gWY_1ATa02Ga8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170183

On 7/10/25 2:28 PM, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.

Are there any other similar clocks that we should expect to pop up
in the future? We should most definitely have a single commit that
takes care of everything that'll be used going forward.

grep "\[.*NOC.*CLK\]" drivers/clk/qcom/gcc-ipq5424.c | wc -l

returns a number of them that aren't described as icc clocks, most
notably the GCC_CNOC_USB_CLK is consumed as a regular clock.

> 
> Also update to use the expected icc_first_node_id for registering the
> icc clocks.

This is a separate fix

> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> index 3d42f3d85c7a..3a01cb277cac 100644
> --- a/drivers/clk/qcom/gcc-ipq5424.c
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please follow the latest recommendations for the copyright notices

Konrad

>   */
>  
>  #include <linux/clk-provider.h>
> @@ -3250,6 +3250,9 @@ static const struct qcom_icc_hws_data icc_ipq5424_hws[] = {
>  	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
>  	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_CNOC_PCIE3_2LANE_S_CLK },
>  	{ MASTER_CNOC_USB, SLAVE_CNOC_USB, GCC_CNOC_USB_CLK },
> +	{ MASTER_NSSNOC_NSSCC, SLAVE_NSSNOC_NSSCC, GCC_NSSNOC_NSSCC_CLK },
> +	{ MASTER_NSSNOC_SNOC_0, SLAVE_NSSNOC_SNOC_0, GCC_NSSNOC_SNOC_CLK },
> +	{ MASTER_NSSNOC_SNOC_1, SLAVE_NSSNOC_SNOC_1, GCC_NSSNOC_SNOC_1_CLK },
>  };
>  
>  static const struct of_device_id gcc_ipq5424_match_table[] = {
> @@ -3284,6 +3287,7 @@ static const struct qcom_cc_desc gcc_ipq5424_desc = {
>  	.num_clk_hws = ARRAY_SIZE(gcc_ipq5424_hws),
>  	.icc_hws = icc_ipq5424_hws,
>  	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_hws),
> +	.icc_first_node_id = IPQ_APPS_ID,
>  };
>  
>  static int gcc_ipq5424_probe(struct platform_device *pdev)
> 

