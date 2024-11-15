Return-Path: <linux-arm-msm+bounces-37953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A049CD79F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 951BA1F2312D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0633518871D;
	Fri, 15 Nov 2024 06:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EiGEL29y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232817E015;
	Fri, 15 Nov 2024 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652991; cv=none; b=cgRn7T3TdF3dOFGLH1tuiDkB06gPN5Q9okfyRx1Mask5mUeIG8vV7y1pUuNWmg3HViTL9DvPCD4sooB577n07WEYGwjnGRKPN10tdQeNFcd8yO7iLX68i9pNUAAXuHEtXgJB3L1XDVTgvXoHT0MRwOk1VF/noHzKKxYmn/fsLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652991; c=relaxed/simple;
	bh=LO6M/7x2j01/pPdvUPY2zzBjhuQ0Zp/0fWcg4PLzzr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=erwpbOS8BzZJCerKaPE+kVkp7Ij9LzkgOdAOhl71MBJO+Swwq0I8E7LLTq04gAcWJEFRteKhBy0FNzD6itw3R5td4LtiYxbWnKXyNYBmRmM34o8qbCQ3gJnVXLdv4aGP+sUQF0dTiPGE4bT6SXMSb7k0f1oWKRhpxWouMeOou1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EiGEL29y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHxGo023742;
	Fri, 15 Nov 2024 06:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdCqxFgKYBBW+wSh2Dq7JpS+yUVwsYdQXDlP9OW1jYc=; b=EiGEL29yT7AbHxRf
	iUodtjZ0d40Rs3KPoNEuOjyN1qptflhK6khqaDZAbnK+Y8Rpp38GKFnlAJ1L2/ca
	gQ8P0NuJf2lPbcGecOUuNyjaqkn4NdlYsDii18HeRabuaDMTMylhqpDaHJEEfSn8
	EEDL5WY2JM/jW4ZXsjSDzcq3Ms6x/hwBg1KMPQmosq/Q6IeRAT739OJtNawm2BbY
	r+5FBJeTrKMECNPJMrxbg1g8h2jAaU6IH4KCOVRNXcEj+IfulaWaTrvj6YuqvfE4
	arZJt17MKHafOGSqSGpNx+TpD/9zfC6PqHAKUu9rWCqTdIi/CFWjEo17HLdc4kIe
	El0oEA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gwbw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 06:43:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF6h0xX014079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 06:43:00 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 22:42:50 -0800
Message-ID: <bb6ae010-5dbf-455c-a53c-6c0e688f0ebc@quicinc.com>
Date: Fri, 15 Nov 2024 14:42:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ziyue Zhang
	<quic_ziyuzhan@quicinc.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_aiquny@quicinc.com>,
        <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <rg4isufmnhnbsiljm34rfdsn46gfpatbsiscynaqtsnykbhnm3@ovcaulkfj4nk>
 <26943ea3-109c-473d-818b-2a08dba859ab@oss.qualcomm.com>
 <288be342-952b-4210-afe7-6e194dfd54a9@quicinc.com>
 <cp2g6j43zlx2njou5qz5tmwsnnzahqtk2hsxkj2ftrzbcmy742@ysca5ica4mvr>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <cp2g6j43zlx2njou5qz5tmwsnnzahqtk2hsxkj2ftrzbcmy742@ysca5ica4mvr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B-EQsEH5OUakbYjiFEDH5wuxrJBqyiqs
X-Proofpoint-ORIG-GUID: B-EQsEH5OUakbYjiFEDH5wuxrJBqyiqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=923
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150055

On 11/15/2024 2:26 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 15, 2024 at 12:59:12PM +0800, Tingwei Zhang wrote:
>> On 11/14/2024 9:03 PM, Konrad Dybcio wrote:
>>> On 14.11.2024 1:10 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Nov 14, 2024 at 05:54:08PM +0800, Ziyue Zhang wrote:
>>>>> Add configurations in devicetree for PCIe0, including registers, clocks,
>>>>> interrupts and phy setting sequence.
>>>>>
>>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
>>>>>    2 files changed, 219 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>> index 7eed19a694c3..9d7c8555ed38 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>> @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
>>>>>    &gcc {
>>>>
>>>> The patch doesn't seem to update the gcc node in qcs8300.dtsi. Is there
>>>> any reason to have the clocks property in the board data file?
>>>
>>> Definitely not. Ziyue, please move that change to the soc dtsi
>>
>> Gcc node is updated in board device tree due to sleep_clk is defined in
>> board device tree. Sleep_clk is from PMIC instead SoC so we were requested
>> to move sleep_clk to board device tree in previous review [1].
> 
> Note, the review doesn't talk about sleep_clk at all. The recent
> examples (sm8650, x1e80100, sa8775p) still pull the clocks into the SoC
> dtsi, but without the freq.
> 
It's begining of the discussion of the PMIC clock for SoC. Sleep clock 
specific discussion is here [2].
[2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/
>>
>> [1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
>>>
>>> Konrad
>>
>>
>> -- 
>> Thanks,
>> Tingwei
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


-- 
Thanks,
Tingwei

