Return-Path: <linux-arm-msm+bounces-54722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E973A93565
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 11:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C75CA166C75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFDE204F78;
	Fri, 18 Apr 2025 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PEO3dc7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE5205ACF;
	Fri, 18 Apr 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968888; cv=none; b=rzcxBfSC8DOLFgYeHQ+MJeA5rqQL68AbvhMP3ed3Jr93Zm0ehhi58+R6Jitz0QLxZ1bvxaRLynEPeui51XWLL/01/lEsh9nYi8eNCjjlt9EgZd67wH+kYs3EYm+84XOQETcRo9wlrHDfCJ9S9xRVhkHQAlG+udlVfUbxUpdrJF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968888; c=relaxed/simple;
	bh=+q8KhlDxuSaaDnzDN2QF0Qr9fEZY1wMn2vvENU6RQLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tVu7cBhCusjM3/eZpDXxmfzbIRFm2PwBOiJn1gkK4ZAnEe8ILBNqTxr9ow8ULJkO5QS0FmgVCT2mSVvS/Rs/ntkN0ho1Izy7R6fnU8ADXktEh+fmPDbS0s57ZB0gxF8kxwlc917B8Q7CDj5+I3FHCd8IPwfFlhAYCI7EmPX0/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PEO3dc7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1UZPr012331;
	Fri, 18 Apr 2025 09:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Znw86IU4kiozP/U1IaOS5mXXh2XWycOUjRToJHHs0Wg=; b=PEO3dc7i/jT81MFr
	qi4+Tn7jM13JTOCg1YBKp6YNkWFa38hE0PZuM7v/OjtR25vXJiTxIEEYgxStkYO+
	2IX3+1oR3ncFfejVkTs5Xvwcc+0szU3mpJplrzJ74W0V9gqTjsj0OB59atrZWPOf
	5CQARtQ7njK08nQc/IP/qS/OwNHRlFa+IkMgC0smxriFKs9WswQ49Opn0IUHJhbQ
	lKld2Wq9qg/DtOBPJnOdcVHstoMfWoNLNhKPtylEoZVnn6mDWyZ56MsXHzjBt1J7
	FwqXkOtZpFfw3m4xMnvw7phpjiWXosP5niNNuzkBFXL2dIgeTkF3a2ftZzHo2Rq4
	hB+/mQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vsqjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 09:34:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I9YhNJ023614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 09:34:43 GMT
Received: from [10.218.37.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 02:34:41 -0700
Message-ID: <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
Date: Fri, 18 Apr 2025 15:04:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
 <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cv5Snk7ZWDVtJkCi8usbIV00ro57yIom
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68021cb4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=W7FBjEr1nMv6UFPOgwQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cv5Snk7ZWDVtJkCi8usbIV00ro57yIom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180069



On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
>>
>>
>> On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
>>> On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
>>>>
>>>> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
>>>>> The QDU100 device does not support the MHI M3 state, necessitating the
>>>>> disabling of runtime PM for this device. Since the PCIe core framework
>>>>> enables runtime PM by default for all clients, it is essential to disable
>>>>> runtime PM if the device does not support Low Power Mode (LPM).
>>>>>
> 
> Not true... See below.
> 
>>>>> Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
>>>>> ---
>>>>>     drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
>>>>>     1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>>>> index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
>>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>>> @@ -43,6 +43,7 @@
>>>>>      * @mru_default: default MRU size for MBIM network packets
>>>>>      * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>>>>>      *		   of inband wake support (such as sdx24)
>>>>> + * @pm_disable: disables runtime PM (optional)
>>>>>      */
>>>>>     struct mhi_pci_dev_info {
>>>>>     	const struct mhi_controller_config *config;
>>>>> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>>>>>     	unsigned int dma_data_width;
>>>>>     	unsigned int mru_default;
>>>>>     	bool sideband_wake;
>>>>> +	bool pm_disable;
>>>>>     };
>>>>>     #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>>>>> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>>>>     	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>>>>>     	.dma_data_width = 32,
>>>>>     	.sideband_wake = false,
>>>>> +	.pm_disable = true,
>>>>
>>>> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
>>>
>>> Yes!
>>>
>>> But does the device not supporting M3 only or D3Hot also? If the former, then we
>>> should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
>>> There is an incentive in allowing D3Hot if the device supports it.
>>>
>>> Also, is there a way we could probe M3 support in the device so that we can
>>> check it during runtime?
>>>
>>> - Mani
>>>
>> In QDU100 device does not support M3 state, D3_hot will be supported. As
>> QDU100 is an accelerator card which needs high-throughout, LPM needs to
>> disabled here. So we are trying to disable runtime PM here, without M3 ,
>> D3_hot will not have effect in QDU100.
>> Also in MHI we don't have provision to check device M3 capability, so we are
>> trying to disable runtime PM here.
>>
> 
> Even though PCI core is enabling runtime PM for devices, it also prevents the
> devices from getting suspended unless the drivers explicitly asks for it. So
> this driver is using autosuspend feature to allow the devices to be suspended
> if PME is supported from D3Hot.
> 
> If you want to prevent the device from getting runtime suspended, you should
> just skip autosuspend.
> 
> - Mani
> 
Thank you, I will upload new patchset accordingly.


