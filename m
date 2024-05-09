Return-Path: <linux-arm-msm+bounces-19578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A178C0E56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B5D1C2150B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF78541C79;
	Thu,  9 May 2024 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kL99DF7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE01322E;
	Thu,  9 May 2024 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251519; cv=none; b=LP0kEhwxUV6KrXj2DHAb//hSrs948uEFbfbr+jMediNt3PfWNVCDekLT/DHE9uFg8eSA/FMcZ3TxTvq1IYLPbx0pWS8+qUW7aBfNsnnmuii5iaOkkxpYC4d395lt6yITzDDiwz/FC0BDPIGiVMjZk6k+/aZwLc9P26Ps1Slmxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251519; c=relaxed/simple;
	bh=NooN6Le1pfCs/b+vZSamTLg83Aj5on0toG2qH551j7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kTu36J3jZFeQhxaP9XAmOGPWQFgycC2/NNXWEMoEvUVfHKlXmAUc4gNUhNhAln84/E3LlO42rds3T0j8X+Hgg+iJ5boCloObpj055Ue6lD6EHYf57jKVWf+kmtQygSJ3qLnw+xETVz4jInU7P+wm05JW0RzXoONWaWJ0TWtxNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kL99DF7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4491lrgt018636;
	Thu, 9 May 2024 10:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e3TRns1ea43wjwX35zCcMk6SohrYc0PP3ZPLnQfDtjI=; b=kL
	99DF7WL+T21NuBmkyhP4mPs1iQ14RjwtvfVoMsTOZU96QBMyyATI3uvRCEEjrbGI
	JEQRBgj7lk9oxCHz0u5ZUPXBf9T2t4hKkHECxVF4QXWtD15/xNXNRHDjQsRkQ7Mt
	ENMTX5+sUnacgezykHVHySdRScG2lMw01om3SBCPshywni9zawYrDIVNeOqJHEBt
	dcyvEqEYFQ3oNtRkhDwmyz8o0IaKF5zSmyKJRaQXkDoxWZxHB0dk6JO+hkdLy+nu
	ILDmkfUd48ClDJKIPvw2wCSOdlsIbYSuLLxz0eclgH1Uzj5nLw6bPiMuDyP0pltt
	q7k+HlP8wMSSH15pv/LQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09ejtdxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:45:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449AjDS4004640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 10:45:13 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 03:45:09 -0700
Message-ID: <cb905f6f-9d88-4ea7-f4c7-5b0baaf8290d@quicinc.com>
Date: Thu, 9 May 2024 16:14:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
To: Stephen Boyd <sboyd@kernel.org>, <andersson@kernel.org>,
        <bhupesh.sharma@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mturquette@baylibre.com>, <quic_anusha@quicinc.com>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <stable@vger.kernel.org>
References: <20240506063751.346759-1-quic_mdalam@quicinc.com>
 <ee18e89b77f0c08ef45cbcc75e2361bf.sboyd@kernel.org>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <ee18e89b77f0c08ef45cbcc75e2361bf.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P_6tuIu2k6DI8EK9KvoByLgrTR3xsKzO
X-Proofpoint-ORIG-GUID: P_6tuIu2k6DI8EK9KvoByLgrTR3xsKzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=774 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090070



On 5/7/2024 5:34 AM, Stephen Boyd wrote:
> Quoting Md Sadre Alam (2024-05-05 23:37:51)
>> Add BRANCH_HALT_VOTED flag to inform clock framework
>> don't check for CLK_OFF bit.
>>
>> CRYPTO_AHB_CLK_ENA and CRYPTO_AXI_CLK_ENA enable bit is
>> present in other VOTE registers also, like TZ.
>> If anyone else also enabled this clock, even if we turn
>> off in GCC_APCS_CLOCK_BRANCH_ENA_VOTE | 0x180B004, it won't
>> turn off.
>> Also changes the CRYPTO_AHB_CLK_ENA & CRYPTO_AXI_CLK_ENA
>> offset to 0xb004 from 0x16014.
> 
> How about this?
> 
>   The crypto_ahb and crypto_axi clks are hardware voteable. This means
>   that the halt bit isn't reliable because some other voter in the
>   system, e.g. TrustZone, could be keeping the clk enabled when the
>   kernel turns it off from clk_disable(). Make these clks use voting mode
>   by changing the halt check to BRANCH_HALT_VOTED and toggle the voting
>   bit in the voting register instead of directly controlling the branch
>   by writing to the branch register. This fixes stuck clk warnings seen
>   on ipq9574 and saves power by actually turning the clk off.

  Ok , will update commit message in next patch.
> 
>>
>> Cc: stable@vger.kernel.org
>> Fixes: f6b2bd9cb29a ("clk: qcom: gcc-ipq9574: Enable crypto clocks")
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 

