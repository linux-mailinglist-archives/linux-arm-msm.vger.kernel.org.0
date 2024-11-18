Return-Path: <linux-arm-msm+bounces-38169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 642819D0992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DC8282238
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80501487D1;
	Mon, 18 Nov 2024 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSdfPKiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591461487ED;
	Mon, 18 Nov 2024 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731911043; cv=none; b=QXZqSBm3mfqLlFY09nei9RLZa0V4MsIMrqvYTuhz1a5iNl8x6wVa6i2B1T+XWCDgUijTq7tn8XYqEwtheuQDxKulbLoWrw24MlqHDD+zokryezvUt6K5K/fvcZ4L34NPnNuzEnBioVrGtqKK9d5H3HL9wk1qlo5VVekcJlT6R/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731911043; c=relaxed/simple;
	bh=bAq6r8qDtiDI/kMN/7bDOmCEcWEt4J/38E3SMwrCHBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R1ikNRbp1e1fG5iqMgWx6CARMq0+aO5o8LAWVBmwnR/9Y0FM8H7mB+qdsbCMMFY3yDbPMj3lkfM+hY2oBVQNwxHqRyXX6P5LuTA8Rbk0WmUKSjig0Q1RDKLpQGLscNCnCYNNZwyZGi3/RHU8gfOwmLVqzx4RzjfloFc8Q7XUDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSdfPKiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RjlV029847;
	Mon, 18 Nov 2024 06:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXoAEAWP33A7HtY2VmH9aJOMH6w5AbFfp1Ub2P7zO7o=; b=CSdfPKiZKZRO5vrp
	njou9lszEJHVJDGNfjaFl2tYB/hIGmAy4gP4HZzUQbiSiJP+VSkVDqFeR7axTCZv
	NSGS6G6t1fubbYLU8WGhGE+T4woReg/sIt7kXsqKEn2dOUJtEUBThz/fP3R/uvXU
	mb3K+d3Ec/5z++yOgTNpwZb14N52wnl0jnrwKdo+/LZ8egj+BW9yxOVr0AvB+5ou
	lNqpjgVtcnLecvJFCNoD1/ADaLgrV/uebgokQxpuv+p0/WnCbQTKXzXDTthpsymV
	OWFbrLT8jY7KTYr9Ih8a9nY07IsCGa9B6hltvQEsAZ0m8ePXpj0a0MWbeRZny/Oz
	NIJVNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xks6kk6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:23:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6Nf1P022365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:23:41 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 22:23:35 -0800
Message-ID: <89d76b4c-f21f-47f7-9346-194520853b2f@quicinc.com>
Date: Mon, 18 Nov 2024 14:23:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: display/msm: Add QCS615 DSI phy
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
 <CAA8EJpqQA3zDBRpm9FY5X-vS0aDgoGNFfDoTh9p1A2MqVa7KNQ@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpqQA3zDBRpm9FY5X-vS0aDgoGNFfDoTh9p1A2MqVa7KNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tdM4IdqFJ7VIuccKz-OKaWn6ukDUueyE
X-Proofpoint-GUID: tdM4IdqFJ7VIuccKz-OKaWn6ukDUueyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=991 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180052



On 2024/11/13 20:07, Dmitry Baryshkov wrote:
> On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>>
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> QCS615 platform uses the 14nm DSI PHY driver.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index 52bbe132e6dae57246200757767edcd1c8ec2d77..babd73cdc44f6d12fdc59c6bef27c544d91f1afa 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       enum:
>>         - qcom,dsi-phy-14nm
>>         - qcom,dsi-phy-14nm-2290
>> +      - qcom,dsi-phy-14nm-615
> 
> As stated in the comment to v1, no, this is not acceptable.
ok, will remove it
- remove dt-bindings: display/msm: Add QCS615 DSI phy patch

> 
> 
>>         - qcom,dsi-phy-14nm-660
>>         - qcom,dsi-phy-14nm-8953
>>         - qcom,sm6125-dsi-phy-14nm
>>
>> --
>> 2.34.1
>>
> 
> 
> --
> With best wishes
> Dmitry


