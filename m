Return-Path: <linux-arm-msm+bounces-41520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40D9ECF9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05151169CC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265AA1A0B04;
	Wed, 11 Dec 2024 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dXmeTMsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D1139CF2;
	Wed, 11 Dec 2024 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930665; cv=none; b=XmzBm/jkzMbZs9c40BtBmvanqF7zynUqOtZ3Cgid1fv3iplxOAcglrqM5y73FbJuA8CDlZkMe5RKnqzrvz7Gjb0+dLP31iyThDIcOox4vWzzB53La9OTwDM5uZLhCWcb+GjO2MLRt4uPoxyWmMRPOD9YVyTQfpgQVXU9fsndENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930665; c=relaxed/simple;
	bh=JTCAly+OStPe9KZBCHvF+Tdky+EvYyrWKzMy7Qnm13c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c2eOQPAnDiEK0MbQGQRvDDR1GKmoaIwYkkIqp81XdZ8jYs5sgyBcFCDvd7OlR93w5aoe/xnBrZYGiWMqAuNqWKTvcNyWz416UMg67Or2QWB9ZynsJlF80aPmfrtk/md7KmlQM00/rfK6sMDfiM1EBko9IaWAKNLelu3OQZI9N4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dXmeTMsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8cqPP019383;
	Wed, 11 Dec 2024 15:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVXRt/MsryFTFwbK3qwh/Ry87+E2D00BUYlBjDKM+8U=; b=dXmeTMsW0r3enUdj
	zY+lU1em1ZKZMrgodym0NiOgYrxcRgsnzkXZiyVjYODVcaKtt095x4ddnGYNnouB
	xcJeuA67/13ihD4T/PMoJpu72nmLkIp5BDT10bNp1Lq7EBQ68UbHXNa8+4Cm9qZa
	qFkn17k9yC3pRUv6lc1lj0xkOWa5i18c3BucqY+DhGh9mF4yq49bYy4ZjKMUo/Q6
	dJJl7B45TlO6i/9YykNLMvpyF/PNaFx57iq58oaUlnUClXQ9tzTxT9LMPQ5qCesV
	oEGiTSrEGDS1sYrpYUV8sbsSlnor33MuMQ9G8hDQ86tSdc7seVeeKba7VuPdrm9H
	UQF56w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dph6tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 15:24:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBFOKZr019597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 15:24:20 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 07:24:19 -0800
Message-ID: <540fa0c1-2e84-0c11-87e9-09198d6f270f@quicinc.com>
Date: Wed, 11 Dec 2024 08:24:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for QDU100
 device
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vivek Pernamitta
	<quic_vpernami@quicinc.com>
CC: <quic_krichai@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>
 <20241211064155.gqlbi3leoaaz3w6b@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241211064155.gqlbi3leoaaz3w6b@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bvP645HWb40LKefJwcEZ5romKqBHvDgR
X-Proofpoint-ORIG-GUID: bvP645HWb40LKefJwcEZ5romKqBHvDgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110110

On 12/10/2024 11:41 PM, Manivannan Sadhasivam wrote:
> On Mon, Dec 09, 2024 at 11:09:50AM +0530, Vivek Pernamitta wrote:
>> Add MHI controller configuration for QDU100 device.
>>
>> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
>> servers by offloading CPUs from intensive 5G baseband functions.
>>
>> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> ---
>> changes from V3:
>> - Removed IP_SW1 and IP_SW2 support currently, will add once
>>    SW_IP1/2 channels support are added to mhi-net driver.
>> - Removed qdu100 edl images, as EDL images are not needed.
>> - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
>> - QDU100 XBL FW images were pushed to linux-firmware git repo
>>    https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
>>
>> changes from V2:
>> - updated commit text.
>>
>> changes from V1:
>> - Changing naming convention from modem_qcom_qdu100*
>>    to mhi_qcom_qdu100*.
>> - Updated commit text.
>> - Fixed and corrected by passing mhi_pci_dev_info struct
>>    instead of mhi_controller_config.
>> ---
>>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 07645ce2119a71c9277356e962252b840379cd81..dee9fa9e7ae441fbc9a86e53694568c0ba192002 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
>>   		.channel = ch_num,		\
>>   	}
>>   
>> +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
>> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
>> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
>> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
>> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
>> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
>> +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
>> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
>> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
>> +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
>> +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
>> +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
>> +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
>> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
>> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
>> +};
>> +
>> +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
>> +	/* first ring is control+data ring */
>> +	MHI_EVENT_CONFIG_CTRL(0, 64),
>> +	/* SAHARA dedicated event ring */
>> +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
>> +	/* Software channels dedicated event ring */
>> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
>> +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
>> +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
>> +	/* Software IP channels dedicated event ring */
>> +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
>> +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
>> +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
>> +};
>> +
>> +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
>> +	.max_channels = 128,
>> +	.timeout_ms = 120000,
>> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
>> +	.ch_cfg = mhi_qcom_qdu100_channels,
>> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
>> +	.event_cfg = mhi_qcom_qdu100_events,
>> +};
>> +
>> +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>> +	.name = "qcom-qdu100",
>> +	.fw = "qcom/qdu100/xbl_s.melf",
> 
> Can you first push this fw to linux-firmware? I haven't enforced this
> requirement earlier, but that was my mistake.

Mani, this is already done.  There is a handy link in the change log. 
Did you miss that, or is there something still missing?

> 
>> +	.edl_trigger = true,
>> +	.config = &mhi_qcom_qdu100_config,
>> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> +	.dma_data_width = 32,
>> +	.sideband_wake = false,
>> +};
>> +
>>   static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>>   	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>>   	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
>> @@ -822,6 +874,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>>   	/* NETPRISMA FCUN69 (SDX6X) */
>>   	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
>>   		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
>> +	/* QDU100, x100-DU */
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
>> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
> 
> Did you read the comment on top of mhi_pci_id_table[]?
> 
> - Mani
> 


