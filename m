Return-Path: <linux-arm-msm+bounces-37961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4E9CD9BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE6F1F21102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3E417F4F2;
	Fri, 15 Nov 2024 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YLhBMyqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E6523A;
	Fri, 15 Nov 2024 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731655013; cv=none; b=Bikv6DiXIJw4J++TeVbwZ9lnrlLqiTGV6L6/EJH5wYLS6MJEJoHdEz70lNhEc9kIMrI8rqKKBrjz2DA2KoAABUxCRiNugVTQEZ67bmDLt5cfIk759kONdC8Gzyqpjx6B2TybmvTg5nLJkrSXTHvqLpX1Xo6R2gI9cl+CBh9JxAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731655013; c=relaxed/simple;
	bh=1OxgRR5LcpCslYXw6m+rl6g4aqTWD5aqKneaOOpReeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RT63iS+PKlnZorV3O/GCNHiv2Hr78zVfh6bd6H6Kv3PItn5bdUE8FYyg2O3rBH7s83ebMZckF7Bn/YPOBWT2rfuQeeBGNnBDZFOPEHv+b4l/zibqv1bpP9LPEYA3N7gScqDD5MFSvsFJfFdw1qB2fJNBikKfNhJXbXe5Vot+040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YLhBMyqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF24IOE002826;
	Fri, 15 Nov 2024 07:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEZpw60cO8E8440ehLsbsTP7DYZlQmR134RHDtRysOI=; b=YLhBMyqfDU9Yp4Da
	c4feVAODvsUVd//sEt3BFEo9ExvAbu5PB76TirM/bgnorNmhM57N9lDGpDRunpaC
	Wv7SLKwsF+bmAikoxw4SLjt1wMos51DDEw95U7+bvswnvXN/wdh8H9SSvJtZYxet
	TbMAimrOzbgcDj+3Rutbj2ToTEm+15+LWWcumN2fp3S7CQsbs5GAqOr9qJ0f9Xun
	O5F3Axs4y/j4DnVnquXXcZ0oxd3fDSVgBlZjwUTIQ8tik0waVAo81eoyKR+Z9ut6
	jfty/1VOLL6ZRVr/TOSDJdGb8k7bkbqCfA+1l6GjC2YpoZsxrsZFreKMfOER0Eex
	1HsAUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ww6drnbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:16:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF7GfR2017088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:16:41 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 23:16:32 -0800
Message-ID: <af6ca3d2-54da-49bb-940a-69855ab2a7b0@quicinc.com>
Date: Fri, 15 Nov 2024 15:16:29 +0800
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
 <bb6ae010-5dbf-455c-a53c-6c0e688f0ebc@quicinc.com>
 <nr4xt5pefd3jngml6bkbgrfhsuxmre44v3qs6uyxz7qp5dzqad@6dss6lwhb35n>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <nr4xt5pefd3jngml6bkbgrfhsuxmre44v3qs6uyxz7qp5dzqad@6dss6lwhb35n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ram0qKo7nlOiYDega0wTj9HbYpPV0-L_
X-Proofpoint-GUID: Ram0qKo7nlOiYDega0wTj9HbYpPV0-L_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxlogscore=937 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150059

On 11/15/2024 3:03 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 15, 2024 at 02:42:47PM +0800, Tingwei Zhang wrote:
>> On 11/15/2024 2:26 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 15, 2024 at 12:59:12PM +0800, Tingwei Zhang wrote:
>>>> On 11/14/2024 9:03 PM, Konrad Dybcio wrote:
>>>>> On 14.11.2024 1:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Nov 14, 2024 at 05:54:08PM +0800, Ziyue Zhang wrote:
>>>>>>> Add configurations in devicetree for PCIe0, including registers, clocks,
>>>>>>> interrupts and phy setting sequence.
>>>>>>>
>>>>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
>>>>>>>     arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
>>>>>>>     2 files changed, 219 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>>>> index 7eed19a694c3..9d7c8555ed38 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>>>>> @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
>>>>>>>     &gcc {
>>>>>>
>>>>>> The patch doesn't seem to update the gcc node in qcs8300.dtsi. Is there
>>>>>> any reason to have the clocks property in the board data file?
>>>>>
>>>>> Definitely not. Ziyue, please move that change to the soc dtsi
>>>>
>>>> Gcc node is updated in board device tree due to sleep_clk is defined in
>>>> board device tree. Sleep_clk is from PMIC instead SoC so we were requested
>>>> to move sleep_clk to board device tree in previous review [1].
>>>
>>> Note, the review doesn't talk about sleep_clk at all. The recent
>>> examples (sm8650, x1e80100, sa8775p) still pull the clocks into the SoC
>>> dtsi, but without the freq.
>>>
>> It's begining of the discussion of the PMIC clock for SoC. Sleep clock
>> specific discussion is here [2].
>> [2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/
> 
> Please note how the recent platforms describe those clocks: the node in
> the SoC dtsi, the frequency in the board dtsi. X1E80100 is a step
> backwards, the clock are completely defined in the x1e80100.dtsi. There
> seems to be no strict rule on how to handle board clocks. I've sent an
> RFC patchset, trying to move them to a single logical location. Let's
> see what kind of response it will get. We probably need to define and
> follow a common rule for all Qualcomm platforms. Please give it a couple
> of days for the dust to settle. However, I think there should be no
> reason to keep GCC's clock definitions in the board DTS.
> 
Thanks for the clean up patch and make it consistent.

Is it reasonable for GCC's clock definition to refer xo_clk/sleep_clk in 
board device tree? Theoretically, can we have another board has 
different xo_clk say xo1_clk defined in board device tree?

>>>>
>>>> [1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
>>>>>
>>>>> Konrad
>>>>
>>>>
>>>> -- 
>>>> Thanks,
>>>> Tingwei
>>>>
>>>> -- 
>>>> linux-phy mailing list
>>>> linux-phy@lists.infradead.org
>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
>>>
>>
>>
>> -- 
>> Thanks,
>> Tingwei
> 


-- 
Thanks,
Tingwei

