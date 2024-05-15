Return-Path: <linux-arm-msm+bounces-19877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C08C65E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 13:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3A3284611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 11:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4406EB4D;
	Wed, 15 May 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JE9gX6s7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21D14AB4;
	Wed, 15 May 2024 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715773623; cv=none; b=K8Pdp2CZX96T1YPQ6jYagE7pv3wcj3IpuH84TpqRKP/D0nPQO/c38QjINI5XUgytxgtRZsxp2Vo/vIzdaIOTsDIuvrQNxDgk6/DWm0yozY011uLxoAvi/vpCyMqHS9OTAn/tU3v/TKp8lL2j3EcyOkedy0e0Rsd/fdX6Lb9+zvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715773623; c=relaxed/simple;
	bh=t7iFnEs3Iw3S8AKB68ZJKQ1wqgeLYyoGzDhSi6rtUXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QXlpPL5dn7dZ+mIjV4B/6kMuWEjXwAeX9CqPOYvDHuydx19UX9VTyJiEI4RbbQWcqctvVfU5xSyHx/iwgjFiX+VDb6hXq/xSy1XLHDOz3bz9KK8qknrhPQ+LiB9gcjklEoqA5VcqO2pyYZoKbccaRVJWLM5FxabsFWwk1lCQvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JE9gX6s7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90fgJ024840;
	Wed, 15 May 2024 11:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ssm9WErsxqX0TxnKA8/0AGDH9AJ2mm24NKSMxmRx92M=; b=JE
	9gX6s7m2ik2LmOMt8B1+l75+i24GRsECKoSxqYrTAS8B5LPkGRzPX+HolqoWTvy1
	4WoklPZfaXo5/m8u9mSBMHHOl+HzSIG7ce12nuheyTN9MFQSXjlStfAmrTiza5BA
	zVNcxGVaj7z7TrjQCNrWI1X4ObL4eoCPekdJY1gwvKFl8hFA8WhHDu1avxEG9gJV
	CtFf2xpNMA5mKFX168aSwvAN3B9rHSbZSoYhqsfRlPpjfESL57TDCHS9v3siU05+
	Z/eBfoNC0KAjAGXlYmElYHygz22NEp+6L06hIUyW+IlOKKsERqfB5jo4liDTQfkO
	ojl4ICC9SObSctp+x6Bg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49gdtah2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 11:46:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FBklYx028028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 11:46:47 GMT
Received: from [10.253.15.49] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 04:46:46 -0700
Message-ID: <38fcae90-f3f9-4b19-8b36-53ab93dc0953@quicinc.com>
Date: Wed, 15 May 2024 19:46:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Slark Xiao
	<slark_xiao@163.com>
CC: <loic.poulain@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20240515074119.GA2445@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TVmkk0hyM7JnVNjh-IkG_A4pAMjOkS-5
X-Proofpoint-ORIG-GUID: TVmkk0hyM7JnVNjh-IkG_A4pAMjOkS-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150081


On 5/15/2024 3:41 PM, Manivannan Sadhasivam wrote:
> + Qiang
>
> On Wed, May 15, 2024 at 09:29:20AM +0800, Slark Xiao wrote:
>> At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
>>> On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
>>>> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
>>>> And also, add firehose support since SDX72.
>>>>
>>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>>> ---
>>>>   drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
>>>>   1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>>> index 08844ee79654..0fd94c193fc6 100644
>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>>>>   	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>>>>   	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>>>>   	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>>>> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
>>>> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
>>> This means SDX55 is also supporting FIREHOSE channels, which is not true I
>>> believe.
>> Actually, I just verified it with my sdx55 and the answer is Yes. These channels
>> are common settings for Qcom device which support PCIe mode. BTW, the
>> default settings of Qcom and Quectel support firehose for their sdx55 products.
> Qiang, can you please confirm that SDX55 supports FIREHOSE channels?
Hi Mani

Yes, SDX55 supports FIREHOSE channels.

Thanks,
Qiang
>
>>>>   	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>>>>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>>>>   };
>>>> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
>>>>   	.event_cfg = mhi_foxconn_sdx55_events,
>>>>   };
>>>>   
>>>> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>>>> +	.max_channels = 128,
>>>> +	.timeout_ms = 20000,
>>>> +	.ready_timeout_ms = 50000,
>>>> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
>>>> +	.ch_cfg = mhi_foxconn_sdx55_channels,
>>>> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
>>>> +	.event_cfg = mhi_foxconn_sdx55_events,
>>>> +};
>>>> +
>>>>   static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
>>>>   	.name = "foxconn-sdx24",
>>>>   	.config = &modem_foxconn_sdx55_config,
>>>> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
>>>>   	.sideband_wake = false,
>>>>   };
>>>>   
>>>> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>>>> +	.name = "foxconn-sdx72",
>>>> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
>>> What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
>>> it to linux-firmware?
>>>
>> This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
>> "xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
>> since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
>> 2: this file may be changed since sdx72 product still under developing in our side. we
>> may change the base line according to QCOM release.
> Then I would ask you to add support when you have a stable firmware. I do not
> want to change the firmware name after some time as it will confuse users.
>
> - Mani
>

