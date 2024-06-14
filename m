Return-Path: <linux-arm-msm+bounces-22738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D9908D62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 16:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906AA28A376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 14:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15674D512;
	Fri, 14 Jun 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NTj3WqvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3E19D8B7;
	Fri, 14 Jun 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375483; cv=none; b=GPETNfFj3bqwOXx9Og7gyCNKagba0rBiP36WqV2zUAnAvnMBZoFT3Rtbch2ng6eIyy0qv8GpAKKtp0Yy1lTX13oQmw5q7qN/15N0/vnsD8VL8PWxSAZRNVnHoGKWKt10sYIxxmJYDvBq8vC/XsEWz4Jl/FPirJlB+9sLz2pW07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375483; c=relaxed/simple;
	bh=H5Yy/sxdwgIuX8tRfVn5eMnCQ3Elk6flBf23hdxKehg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KYcQo/4eLorFs9+KXz/ghhFg3of/7s2cIInsxdIBAebuk5cwJ4WZxdqIoTUGNxIfYASTg4ClpNfb6OmOA3ZCw9NsdHCjrbImNCIIR6kIqr21rMbafPn1FD/RyMuimuwfgn+D/+LXEis+Ops6pu/IXeJXXTETeEn0O823xa/i9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NTj3WqvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E9GYAg004651;
	Fri, 14 Jun 2024 14:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmEScxo8p+jswVM+m3Pf0pxK0QWrkpyXHZXyuUSc9qQ=; b=NTj3WqvQk4Z8c2Mz
	jQF2KEJtDN1iC9Waft6qYGiKp8KzqMEuOYNohR/AMQJSGko2a9CH1JkTDiEGj54q
	COzrsJeNdacMyVu0zGBgQtsGkiQ/DwP5YR+C2nhphOCvYgSpwMb2D/x+mvQ7WUob
	5jpLOe99RLvPSthL8kWa9W2DrugzIG/sVMCq85FQGE4oL6eaQb66+qJzgAKoElj9
	Zq0kzvSqSarfevgBADU+HnOcN1N2eNW1zn/G9KOZCw0LCVlXjNzoYZTmQ93qwGUn
	PE7ZjZuxzQtnZyEOzTkTDPreTN6ObL5ctie3d/sGtviyYE7yfzRwmGBZZHYuMZnj
	Iso03g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q4j1j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 14:31:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45EEV5In008383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 14:31:05 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 07:31:04 -0700
Message-ID: <c275ee49-ac59-058c-7482-c8a92338e7a2@quicinc.com>
Date: Fri, 14 Jun 2024 08:31:03 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Content-Language: en-US
To: Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Slark Xiao <slark_xiao@163.com>, <ryazanov.s.a@gmail.com>,
        <johannes@sipsolutions.net>, <netdev@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
 <20240612145147.GB58302@thinkpad>
 <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OcAp4mqsCNinlbDH_rQGfAU64AzKUZHb
X-Proofpoint-GUID: OcAp4mqsCNinlbDH_rQGfAU64AzKUZHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=977 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140096

On 6/14/2024 4:17 AM, Loic Poulain wrote:
> On Wed, 12 Jun 2024 at 16:51, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
>>
>> On Wed, Jun 12, 2024 at 08:19:13AM -0600, Jeffrey Hugo wrote:
>>> On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
>>>> On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
>>>>
>>>> Subject could be improved:
>>>>
>>>> bus: mhi: host: Add configurable mux_id for MBIM mode
>>>>
>>>>> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
>>>>> This would lead to device can't ping outside successfully.
>>>>> Also MBIM side would report "bad packet session (112)".
>>>>> So we add a default mux_id value for SDX72. And this value
>>>>> would be transferred to wwan mbim side.
>>>>>
>>>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>>>> ---
>>>>>    drivers/bus/mhi/host/pci_generic.c | 3 +++
>>>>>    include/linux/mhi.h                | 2 ++
>>>>>    2 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>>>> index 0b483c7c76a1..9e9adf8320d2 100644
>>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>>> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
>>>>>            unsigned int dma_data_width;
>>>>>            unsigned int mru_default;
>>>>>            bool sideband_wake;
>>>>> + unsigned int mux_id;
>>>>>    };
>>>>>    #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>>>>> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>>>>>            .dma_data_width = 32,
>>>>>            .mru_default = 32768,
>>>>>            .sideband_wake = false,
>>>>> + .mux_id = 112,
>>>>>    };
>>>>>    static const struct mhi_channel_config mhi_mv3x_channels[] = {
>>>>> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>>>            mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>>>>>            mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>>>>>            mhi_cntrl->mru = info->mru_default;
>>>>> + mhi_cntrl->link_id = info->mux_id;
>>>>
>>>> Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.
>>>
>>> Does this really belong in MHI?  If this was DT, I don't think we would put
>>> this value in DT, but rather have the driver (MBIM) detect the device and
>>> code in the required value.
>>>
>>
>> I believe this is a modem value rather than MHI. But I was OK with keeping it in
>> MHI driver since we kind of keep modem specific config.
>>
>> But if WWAN can detect the device and apply the config, I'm all over it.
> 
> That would require at least some information from the MHI bus for the
> MBIM driver
> to make a decision, such as a generic device ID, or quirk flags...

I don't see why.

The "simple" way to do it would be to have the controller define a 
different channel name, and then have the MBIM driver probe on that. 
The MBIM driver could attach driver data saying that it needs to have a 
specific mux_id.

Or, with zero MHI/Controller changes, the MBIM driver could parse the 
mhi_device struct, get to the struct device, for the underlying device, 
and extract the PCIe Device ID and match that to a white list of known 
devices that need this property.

I guess if the controller could attach a private void * to the 
mhi_device that is opaque to MHI, but allows MBIM to make a decision, 
that would be ok.  Such a mechanism would be generic, and extensible to 
other usecases of the same "class".

-Jeff

