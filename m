Return-Path: <linux-arm-msm+bounces-22180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC990901F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91C2F1F2792C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F261D78C64;
	Mon, 10 Jun 2024 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cq9c3Nbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152E7868B;
	Mon, 10 Jun 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014836; cv=none; b=jbxo+X7UQw6trhp4l3bNxF1irvrOVIuSxbvFItGSrb4M2d/6cUSUnOsBpLFO7nP5Qcm3yUQF76ADpFAxCKnmYCPnJ5zgD55ego5IOqkiCPIajN7G89R9E6Kcnnm+Ukzut3mBkHyMZw7LDfcUd20bN2687p4EiQnq998OJ2OR5Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014836; c=relaxed/simple;
	bh=I9PxK3rdF+tfMUYdLYp8pKfptvnImr0LgsByPeNImaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SIeLFZajRzKvNPWhUeDfak+Elk3e6ir2CzdxV6WHtLvcgPAFexDaquSJA4xYViZLNX6/0tuLiAKFrGIDgzjp0IzzHnXU5cN9ZpHngZ1EDP+QuOKOAJVJlRi+WHoP4aOYZQKFMtE3E7ElUgH57IBCggq9lCIVyqa74gkDM2bl2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cq9c3Nbc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A0Jwlq008673;
	Mon, 10 Jun 2024 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DBDr+CQyS7PGg1HLqK3xT20y/UTWy5RaOTdkKPJ1hwY=; b=cq9c3Nbcsgre6ImA
	G4qMIp+n+LwXfDw5/OPVTPNFE50exB5NwUtqPmbSHV5BKRfOw95ww72dn+3LMIZX
	/5lPOCRWr/lUBsyDaD0/uH0NfBkYQqEhwxMRPyzrAod2Av83MqLqn+iKe/lIGW3v
	eQX3LoinSmn6w1t+JgMxYvvYyUr8SsPhY83iXkTIFgKGZADskaicMaznrYR0mrPO
	qe4c4c0rFOQGqhtbR0asWdwp6yskaR7ivuG5AiM44FjQMkK7pno7QxkCEtqWmMes
	woQXZ8+qcl2nGF9599xoAUaL55p+IL/0CbOfUK+VFIrizCDeproMyR0f9yP3HV7w
	xlPVVA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgfk3jfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:20:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AAKOmc028439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:20:24 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 03:20:19 -0700
Message-ID: <efc093b9-cf86-418a-b159-d63d7135a053@quicinc.com>
Date: Mon, 10 Jun 2024 15:50:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, <devicetree@vger.kernel.org>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
 <22becbf9-a663-4f25-aee5-8fd195e6fa55@linaro.org>
 <uthsf2dtvb5bduf3o52t6bjmvferzfyrlb2xy4pqaeqvpf35cr@kb5lpb6n37sc>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <uthsf2dtvb5bduf3o52t6bjmvferzfyrlb2xy4pqaeqvpf35cr@kb5lpb6n37sc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UzKrzmGIPy4fscwfyIypm0958U_xuGrZ
X-Proofpoint-ORIG-GUID: UzKrzmGIPy4fscwfyIypm0958U_xuGrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=600 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100079



On 6/7/2024 3:37 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 07, 2024 at 11:34:03AM +0200, Krzysztof Kozlowski wrote:
>> On 07/06/2024 11:30, Konrad Dybcio wrote:
>>> On 31.05.2024 12:22 PM, Taniya Das wrote:
>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>> controller functionalities. But the LPASS resets are required to be
>>>> controlled from the high level OS. The Audio SW driver should be able to
>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>> support for the same.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>
>>> Please stop ignoring my comments without responding.
>>>
>>> https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
>>
>> So this was already sent, feedback ignored and now we have again "v1"
>> skipping previous talks?
> 
> And no changelog from the previous patchset. That's really sad.
> 
Sorry about that, it was not intentional. I had posted the v2 and 
decided to split as it was delaying the other changes in the older 
series which had more functional fixes.
> 

-- 
Thanks & Regards,
Taniya Das.

