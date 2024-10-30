Return-Path: <linux-arm-msm+bounces-36380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5E9B5D8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45DD81F2323D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5859B1E0DFF;
	Wed, 30 Oct 2024 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MvH14qhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0C1DFE16;
	Wed, 30 Oct 2024 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276533; cv=none; b=d1TqLzyU8I0M/Z6u0mpRNUIPTfxUNZ5pB0iqzrGZ3TsIxEyD7y2NgONJpxTZyLzl21giYqtcJlpSe7KLOfFQTd4zc4sxHtSvmPx1PVWrMONQa3hAPLX7Z6M+1TfuhbzBcekrrTmqK1TJrLAZ/GdOPmd8y7EHf69g8ybyFYesDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276533; c=relaxed/simple;
	bh=DWYnLGkiN2PMlXa8wdKXfPzpxErN/Zr77L6vOtX6ac8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kkVKEo+EIdG6RyY1ysRdeNqOEx/CwAngFy/b5gwqKk31TqqyCbFvqJyZUQWW5K40BmNz8kqe67IHZZuUVFiLjhVMMsnNQo+PJKTBleZuZV7OUdvxzRu1dRYbfPoRVQX1LIgaSWBTB6Gh/UMkL3epDeOEMAMZxGPo5twPr3gMRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MvH14qhl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TLdvfu030537;
	Wed, 30 Oct 2024 08:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzuxKdU4ZRLT2MY1cC4a93fwZsOuoHolMj42z3Aar/0=; b=MvH14qhlDZa2yKE+
	PzeD8HjvSg4YwLPWfiG6hFgc4H17u7Iqow0KzhPhE+0cI3XkmcFs0xmvb1q+OXh0
	u9yWgxhzC8twtWCVTOHWEEbQ189ctpvmHng6bFR1/RFymEKIRXUdVTRjYV9h3kB1
	b71he4xjYL85xMujjcW0IPzue0neSL+RTghufA2US6Y1nIp7ELQDXCKIRbZdctyH
	dpoxUh/BgmG/QvS1uL5LQm4P/zcPJz1zoD8c6oiiwCIhUGPnN24mtR+xmilvZHn7
	pIO/HhKJ2bcPtIlCGThXKa2ZGuqM4kqiKuoxDPYkISOyoXkph6gQmhSAMdprG0aU
	ZlTaiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8k6u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:22:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U8LxjH024621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:21:59 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 01:21:55 -0700
Message-ID: <197f3520-70a0-4056-b4b4-5325de520ab2@quicinc.com>
Date: Wed, 30 Oct 2024 16:21:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-5-quic_qqzhou@quicinc.com>
 <8a60b729-b312-4afc-835b-a18060ad3f03@oss.qualcomm.com>
 <zsphor7rpbwx4km6uxpepky2h7atbgjn2435puygmpssfc36mc@wkquqxud2yij>
 <8c9804f2-ef4d-412b-97ea-f521dfd35ec2@oss.qualcomm.com>
 <nhthg2rlfatc2pyhsuoulvo5447cxg7buv4aq3r7r5amsmjjoq@pgfyvvegfron>
 <828c465f-684b-4257-86cb-d9c753fc30f1@oss.qualcomm.com>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <828c465f-684b-4257-86cb-d9c753fc30f1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l6jd9oubk9CrZXNtnlo1NWgmNnS3jJrp
X-Proofpoint-ORIG-GUID: l6jd9oubk9CrZXNtnlo1NWgmNnS3jJrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=721 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300064



在 10/28/2024 11:46 PM, Konrad Dybcio 写道:
> On 26.10.2024 8:18 PM, Dmitry Baryshkov wrote:
>> On Fri, Oct 25, 2024 at 06:45:01PM +0200, Konrad Dybcio wrote:
>>> On 25.10.2024 1:06 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Oct 25, 2024 at 10:54:24AM +0200, Konrad Dybcio wrote:
>>>>> On 25.10.2024 5:07 AM, Qingqing Zhou wrote:
>>>>>> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
>>>>>> to limit DMA address range to 36bit width to align with system
>>>>>> architecture.
>>>>>>
>>>>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>>>>> ---
>>>>>
>>>>> You probably also want to mark it `dma-coherent` (see e.g.
>>>>> x1e80100.dtsi)
>>>>
>>>> Is it? I don't think SM6150 had dma-coherent SMMU, at least it wasn't
>>>> marked as such.
>>>
>>> I don't think I have any documentation on this, so.. one way to find out!
>>
>> I don't have qcs615 at hand, so a purely theoretical question. But how
>> should it break if we mark it as dma-coherent, while it is not?
> 
> The board will hang rather quickly
> 
> Konrad
Thanks for review comments from Konrad and Dmitry!
QCS615 SMMU hardware supports IO-coherency after confirming with Qualcomm hardware team.
We also try to add "dma-coherent" for APPS SMMU node and test some SMMU clients, such as UFS and Ethernet, these SMMU clients work well on QCS615.
Do you advise and agree to add "dma-coherent" for SMMU node?


