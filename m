Return-Path: <linux-arm-msm+bounces-22408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559F905067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889F31F2257C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4724D7BB19;
	Wed, 12 Jun 2024 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ic1SBS4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2E1C6AE;
	Wed, 12 Jun 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718188261; cv=none; b=JERGm1PGj123y5r8hFWsTTzXg/3FES6ONI/mHbEi8WXUaRna4WLrvUQ27sksDP/CcimeA/vf3FD9i6ZQWxiqDK0ROGNb9X7llr/wRJjnIrJ2jJZEt0wfNnsVBdj+336aCF/nLdQ8JXla0szzHVpigiSqrwQqQjr8stfAIl4XA/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718188261; c=relaxed/simple;
	bh=iIl3J4Y4su5oerBe+xzxiQKX7+mUafM34hKHCQLBLHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aJF+T7CdOlOIa+FhF3eqbGviDvJqzo976pztXC2B87/REhqB2Y9Jukr4CJ5cvxIaWbKGdV7LO9+ZpXIkSqGA8dIE2Cq4E5as+v8rXxIW/z2lqgsKrH4Z5vbNaExu8EbuNk2QizXG4VVHNzJ4UTsP28fLYK+/Fyq858PxPemLyD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ic1SBS4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C66kgd002994;
	Wed, 12 Jun 2024 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKwpwKZHWzQt+e7holbzQrF20Me1OIuVQ5ao6YWhUsc=; b=Ic1SBS4lWOlP1FbK
	KZGpQJVXSmiRHXxaWI5QXZymEAOhSvku3xGrAdDj+scTum3UQcvOU5Petnd0r+ZC
	9JRlvLEYoYQNiSm+yqIjtrnRC/PcrjtEY/UmVZZ6KkvfM9q2JWrDz5cODbEu9mNA
	Vwe9ESJWTsQ5Wf/2fzShJYBQk1zoD4vaYxkvMTeLysIDzQXbtbGFuIyE6z9WeuRr
	nzpIvuF2LUJCthN13NPb0jOUODv5SxBe2lTknEzLT0TiOu3DEiPK0HNpTcBYx+Ep
	M+xaM/Z0AOzBqw1suqMqrrUI+xNsbSZBNcKaAhn/eQeVJZgyqKzEOQVAR6BPEu35
	6UKUMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yphsaum0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:30:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAUt4E003819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:30:55 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 03:30:50 -0700
Message-ID: <9ea7bd3a-0d41-418b-8162-266862e1467f@quicinc.com>
Date: Wed, 12 Jun 2024 16:00:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
 <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
 <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2h7nCDdfupOpv0zO7Qrp_4Ovcfp1xG3v
X-Proofpoint-GUID: 2h7nCDdfupOpv0zO7Qrp_4Ovcfp1xG3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=619 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120076



On 6/10/2024 11:44 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 10, 2024 at 02:41:10PM +0530, Taniya Das wrote:
>>
>>
>> On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
>>> On 31.05.2024 11:02 AM, Taniya Das wrote:
>>>> The RCG's clk src has to be parked at XO while disabling as per the
>>>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>>> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
>>>> clk_branch2_aon_ops to keep the clock always ON.
>>>>
>>>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>
>>> Should the same fixes apply to 8350?
>>>
>>
>> Yes Konrad, it is applicable for 8350 as well.
> 
> Can we please get the corresponding patches (as a separate patchset)?
> 
I will send the patch for 8350.

-- 
Thanks & Regards,
Taniya Das.

