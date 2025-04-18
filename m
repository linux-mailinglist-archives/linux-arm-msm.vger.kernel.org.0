Return-Path: <linux-arm-msm+bounces-54724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E7A935DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 12:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9175A3AEE82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF5426FDAA;
	Fri, 18 Apr 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SOdNMRLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7926FDA2;
	Fri, 18 Apr 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971058; cv=none; b=FxfqpKkigI6Ws7F23cSGbeKDukJtQScvlE4b7+oGt3T9G68UT4lHGcf7qeM1m72KO37i4kPaJHkrXyjl8JGYlax+kgsG21PJ3pnLrXPv5ySrjmcuwx2bOFnXTEVDvTLf+qTOMlYpfOYGU7g/OCJtFWpDHamOEdQYgM8416fgTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971058; c=relaxed/simple;
	bh=sJfyCjFuD5rdCK58wVT7A41229uTZVPw55aqKf8HWZQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=FSNXnu9HS8OXpzRiK0QCv3et8IZh64NjzVrrXFPNN8MRWQcYoZ7MXjIIYMfu4mswz44v3jkfjOj0Ph4EsXt9uMTYZpqpqIWT3keColqAMO9G/Z2n/zLj8Q8Wjfqymg2fFSr+qrLrfyX15p2bLGGIxLMcuL8h0Yi9Ep0SEMPb0js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SOdNMRLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2EfpX014600;
	Fri, 18 Apr 2025 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXl8L1D4teXBND961LY+1K6YRvHteSg3tVUoK0jz20I=; b=SOdNMRLvBOsRBrNr
	7J3Ls+7mtDI7tL6iELDJQRgu0nhICfppoTI/tsS0NKu/rhiXECBmgJymxca5YoqZ
	ZpICl0NQ2RltMzZZer5zXx1AWx/Dot3ER+1vXj//Mmi9AoVX6av6FLWqJ/DhMuNS
	EODbzOZ2z+jf2jRb+rEQ9Swd2XbuliHvehqP2g0pZD/c6TV6HLoKiuyTJgCf2DA8
	OWei6wRmRjXxR0HtCRnb1xpNDLhHJvPoL0l0NhM2Ftaqk0jQneVXmZQlw1fUq3N0
	XBAbPa7AGaZdrOF+WzamoHTwqYA/Pzl7e4zWqxg+9LuAE24ZngypcT/C/1qFoMew
	WtVFSA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1hh89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 10:10:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IAArJf020417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 10:10:53 GMT
Received: from [10.218.37.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 03:10:51 -0700
Message-ID: <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>
Date: Fri, 18 Apr 2025 15:40:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
 <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
 <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
Content-Language: en-US
In-Reply-To: <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6802252e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LYZg7-1g-tm8IrMnXwYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xzRAGJBbIFYfyPMXl-i0YLja7xJoPUjO
X-Proofpoint-ORIG-GUID: xzRAGJBbIFYfyPMXl-i0YLja7xJoPUjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180075



On 4/18/2025 3:04 PM, Vivek Pernamitta wrote:
> 
> 
> On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
>> On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
>>>
>>>
>>> On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
>>>> On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti 
>>>> wrote:
>>>>>
>>>>> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
>>>>>> The QDU100 device does not support the MHI M3 state, necessitating 
>>>>>> the
>>>>>> disabling of runtime PM for this device. Since the PCIe core 
>>>>>> framework
>>>>>> enables runtime PM by default for all clients, it is essential to 
>>>>>> disable
>>>>>> runtime PM if the device does not support Low Power Mode (LPM).
>>>>>>
>>
>> Not true... See below.
>>
>>>>>> Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
>>>>>> ---
>>>>>>     drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
>>>>>>     1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/ 
>>>>>> host/pci_generic.c
>>>>>> index 
>>>>>> 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
>>>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>>>> @@ -43,6 +43,7 @@
>>>>>>      * @mru_default: default MRU size for MBIM network packets
>>>>>>      * @sideband_wake: Devices using dedicated sideband GPIO for 
>>>>>> wakeup instead
>>>>>>      *           of inband wake support (such as sdx24)
>>>>>> + * @pm_disable: disables runtime PM (optional)
>>>>>>      */
>>>>>>     struct mhi_pci_dev_info {
>>>>>>         const struct mhi_controller_config *config;
>>>>>> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>>>>>>         unsigned int dma_data_width;
>>>>>>         unsigned int mru_default;
>>>>>>         bool sideband_wake;
>>>>>> +    bool pm_disable;
>>>>>>     };
>>>>>>     #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, 
>>>>>> ev_ring) \
>>>>>> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info 
>>>>>> mhi_qcom_qdu100_info = {
>>>>>>         .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>>>>>>         .dma_data_width = 32,
>>>>>>         .sideband_wake = false,
>>>>>> +    .pm_disable = true,
>>>>>
>>>>> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
>>>>
>>>> Yes!
>>>>
We named variable pm_disable because the M3 state is implicitly set 
during runtime PM suspend. Both are not needed and not fully supported 
for the QDU100 accelerator card, so we want to disable runtime suspend 
for it.
>>>> But does the device not supporting M3 only or D3Hot also? If the 
>>>> former, then we
>>>> should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ 
>>>> mhi_pm_resume.
>>>> There is an incentive in allowing D3Hot if the device supports it.
>>>>
>>>> Also, is there a way we could probe M3 support in the device so that 
>>>> we can
>>>> check it during runtime?
>>>>
>>>> - Mani
>>>>
>>> In QDU100 device does not support M3 state, D3_hot will be supported. As
>>> QDU100 is an accelerator card which needs high-throughout, LPM needs to
>>> disabled here. So we are trying to disable runtime PM here, without M3 ,
>>> D3_hot will not have effect in QDU100.
>>> Also in MHI we don't have provision to check device M3 capability, so 
>>> we are
>>> trying to disable runtime PM here.
>>>
>>
>> Even though PCI core is enabling runtime PM for devices, it also 
>> prevents the
>> devices from getting suspended unless the drivers explicitly asks for 
>> it. So
>> this driver is using autosuspend feature to allow the devices to be 
>> suspended
>> if PME is supported from D3Hot.
>>
>> If you want to prevent the device from getting runtime suspended, you 
>> should
>> just skip autosuspend.
>>
>> - Mani
>>
> Thank you, I will upload new patchset accordingly.
> 
> 


