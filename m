Return-Path: <linux-arm-msm+bounces-22445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CD9054FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A93CA1F21B00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AE517DE1E;
	Wed, 12 Jun 2024 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="arUpZQm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5517C221;
	Wed, 12 Jun 2024 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201969; cv=none; b=e06uuuoNA90KOkiLSNaNH0leRMwp0gAWgjQDroNaklLL3znNBQUVUybgRJOJPvZiQfMI1LqJexmp4Wxt3g0A2iRNWwcazwVu2AFuUzVCmX64XLy5fuGfwgYPh/2kXS0fZGYVMKI/0Jy5oorD9uyi+tBXfViFvVf5K/neWAogfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201969; c=relaxed/simple;
	bh=m/1UUdkM/F8U6/9ty+rzPaHzO2Qrr8eAVhVF50RZiYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sn0QbaVGJq03LlR/MDQgwCB2l7gMJkmcBrAvtGeskCFcujUoXTX+fDLZGrVa2qsJz/GMmu4b4dAaVQ+M23t9IgtFJuy/C5mKj5mUmWouNzKJCBhb1p14eDAjgAvkh29ArSlNfp7bIQEDheRu8EcY+m/VlF+d4XKsIRuupiZ2vX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=arUpZQm8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CCqoJF018660;
	Wed, 12 Jun 2024 14:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOiiCfqxJl3ela2rnUbIDu7M7Owloxg8mRgKwY4S0uQ=; b=arUpZQm84guwoexo
	NTu8/KVpViP1bOn3Vyk7UNGdIoOTbtC5OKjcayqy5zNOWm19urQmMW/2ZThU4G0y
	Srafme9lY5ZbxcELo3fGITxGZnAgLuet5NE8sfXdQ7r5idwGjjgrOmxEb8x4RCvS
	MaMjRo0ItA0cE5Et13X8uGSspd54TwlgcA/U+dvIfEdREpKleoN26iMAPbnup8O/
	A2+VlTZUwdHcMZPdB03eQMPsXQku499Tcxp5vvu5KY6fYzimix8rZLKGqqieTSUP
	kFfPUziq5BqELhp8049u+JpbopygwvK8FuwZ5XAvJzWgV4wQ2Rm5LNgqw/Zq+Ad1
	MT7rzA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8hc4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:19:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CEJENw031149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:19:14 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 07:19:14 -0700
Message-ID: <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
Date: Wed, 12 Jun 2024 08:19:13 -0600
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Slark Xiao
	<slark_xiao@163.com>
CC: <loic.poulain@linaro.org>, <ryazanov.s.a@gmail.com>,
        <johannes@sipsolutions.net>, <netdev@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240612094609.GA58302@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u8DihMomhUAk3P4xj0tSZnqG-fwtbN7y
X-Proofpoint-ORIG-GUID: u8DihMomhUAk3P4xj0tSZnqG-fwtbN7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120102

On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
> On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
> 
> Subject could be improved:
> 
> bus: mhi: host: Add configurable mux_id for MBIM mode
> 
>> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
>> This would lead to device can't ping outside successfully.
>> Also MBIM side would report "bad packet session (112)".
>> So we add a default mux_id value for SDX72. And this value
>> would be transferred to wwan mbim side.
>>
>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 3 +++
>>   include/linux/mhi.h                | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 0b483c7c76a1..9e9adf8320d2 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
>>   	unsigned int dma_data_width;
>>   	unsigned int mru_default;
>>   	bool sideband_wake;
>> +	unsigned int mux_id;
>>   };
>>   
>>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>>   	.dma_data_width = 32,
>>   	.mru_default = 32768,
>>   	.sideband_wake = false,
>> +	.mux_id = 112,
>>   };
>>   
>>   static const struct mhi_channel_config mhi_mv3x_channels[] = {
>> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>>   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>>   	mhi_cntrl->mru = info->mru_default;
>> +	mhi_cntrl->link_id = info->mux_id;
> 
> Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.

Does this really belong in MHI?  If this was DT, I don't think we would 
put this value in DT, but rather have the driver (MBIM) detect the 
device and code in the required value.

Furthermore, if this is included in MHI, it seems to be a property of 
the channel, and not the controller.

-Jeff

