Return-Path: <linux-arm-msm+bounces-54838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF4A94C75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 08:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B282516FEBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 06:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F466256C9B;
	Mon, 21 Apr 2025 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jiaQI/UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E72520C463;
	Mon, 21 Apr 2025 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745216272; cv=none; b=OspcfI8PilWdGxAVenxuOfTly0YzPQ7bWKOx8mmyMZhLMmdjW/YOiXDDLYutnmjPI0RPCOSMPzCpfuPkbcj2ZSk30CMmU9b6Vr05AvF1LnoztFYsNyXsq4Ugp0Wa79huKpI94TccwQz9vowR6BnaEqBATv0aVuSsCPic2josMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745216272; c=relaxed/simple;
	bh=oCrePx4d4VjH4BHhZkLA44wMiJPbzqpmWXCSiX569BI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fjf1x4exjzKG5isZUfMGTRPy7rMT+LoBoa5m1r/L4lHa/xV/nEe/VnbVZzSegQ2oh7YHuBi22kOayjySlD8oJep/SE0Brv2NsDONjc87cBJwAHYKc6qCuWbeWB0eRN+DyBk5RKN1bqastLo8gZcefKEvLQl40qXkgxMirK9RTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jiaQI/UK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMalgs029470;
	Mon, 21 Apr 2025 06:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNXlTlu4T4GsCHREC35AdfkGMvQbe70mPzffQrC9xdY=; b=jiaQI/UK1vk8mIQG
	rgQpfIU8tp+GJijIds5Kvsp9LczpzWrlOHHU8u/+s3EYVYep/T/nKlEUEnfAYnq3
	vXtCDWY9V3DAMppy8e32E3pRJ3kO+eEIWHkMznfsGnb2Her9cg541pVRDxJyEiuT
	QPK8XZtGXFuuYc5u2BNZAODT7WaCBloNdSrbH/beMQoMBXC+RQDR17/rF7HZLjq4
	EYIzmtrMdmF0lpavf5r6XLgERTm7OmQBxyTNFxZ16B5caKyW9HRtz4olTVuYbavd
	KJzWQzhGfpDEFgOBs8e/+yxK4AeQnsL7xqbui/xyRDUGEe7PvX6GXzP8eUjvOUKA
	Dhp16w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426k4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 06:17:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53L6Hmmg013992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 06:17:48 GMT
Received: from [10.217.218.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Apr
 2025 23:17:46 -0700
Message-ID: <b0b09073-f64f-4a2c-9294-713d7970f120@quicinc.com>
Date: Mon, 21 Apr 2025 11:47:43 +0530
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
 <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
 <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>
 <tbktzaxkgsc6d4ma4o6vkkcpnqiwghxkvwryrm36znepgqjotl@5n3di2ew3s6f>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <tbktzaxkgsc6d4ma4o6vkkcpnqiwghxkvwryrm36znepgqjotl@5n3di2ew3s6f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j9vjTexZDzTC8pP9W_ZXZogSuHBywA1P
X-Proofpoint-GUID: j9vjTexZDzTC8pP9W_ZXZogSuHBywA1P
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6805e30c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=XiVaVNMPSDe_k9p-RSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210047



On 4/18/2025 6:15 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 03:40:48PM +0530, Vivek Pernamitta wrote:
>>
>>
>> On 4/18/2025 3:04 PM, Vivek Pernamitta wrote:
>>>
>>>
>>> On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
>>>> On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
>>>>>
>>>>>
>>>>> On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
>>>>>> On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao
>>>>>> Badiganti wrote:
>>>>>>>
>>>>>>> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
>>>>>>>> The QDU100 device does not support the MHI M3 state,
>>>>>>>> necessitating the
>>>>>>>> disabling of runtime PM for this device. Since the
>>>>>>>> PCIe core framework
>>>>>>>> enables runtime PM by default for all clients, it is
>>>>>>>> essential to disable
>>>>>>>> runtime PM if the device does not support Low Power Mode (LPM).
>>>>>>>>
>>>>
>>>> Not true... See below.
>>>>
>>>>>>>> Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
>>>>>>>> ---
>>>>>>>>      drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
>>>>>>>>      1 file changed, 10 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c
>>>>>>>> b/drivers/bus/mhi/ host/pci_generic.c
>>>>>>>> index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797
>>>>>>>> 100644
>>>>>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>>>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>>>>>> @@ -43,6 +43,7 @@
>>>>>>>>       * @mru_default: default MRU size for MBIM network packets
>>>>>>>>       * @sideband_wake: Devices using dedicated
>>>>>>>> sideband GPIO for wakeup instead
>>>>>>>>       *           of inband wake support (such as sdx24)
>>>>>>>> + * @pm_disable: disables runtime PM (optional)
>>>>>>>>       */
>>>>>>>>      struct mhi_pci_dev_info {
>>>>>>>>          const struct mhi_controller_config *config;
>>>>>>>> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>>>>>>>>          unsigned int dma_data_width;
>>>>>>>>          unsigned int mru_default;
>>>>>>>>          bool sideband_wake;
>>>>>>>> +    bool pm_disable;
>>>>>>>>      };
>>>>>>>>      #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name,
>>>>>>>> el_count, ev_ring) \
>>>>>>>> @@ -295,6 +297,7 @@ static const struct
>>>>>>>> mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>>>>>>>          .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>>>>>>>>          .dma_data_width = 32,
>>>>>>>>          .sideband_wake = false,
>>>>>>>> +    .pm_disable = true,
>>>>>>>
>>>>>>> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
>>>>>>
>>>>>> Yes!
>>>>>>
>> We named variable pm_disable because the M3 state is implicitly set during
>> runtime PM suspend. Both are not needed and not fully supported for the
>> QDU100 accelerator card, so we want to disable runtime suspend for it.
> 
> You are mixing terms here. Only M3 is not supported by the device. The fact that
> you do not want to enable runtime PM for the device to avoid latency is a side
> effect of that. So you need to name the variable as 'no_m3'.
sure, I have posted an new patchset v3 with renaming the variable name 
to "no_m3".
> 
> - Mani
> 


