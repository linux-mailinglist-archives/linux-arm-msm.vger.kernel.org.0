Return-Path: <linux-arm-msm+bounces-66286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44748B0F1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14CA21C267AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE912E54DE;
	Wed, 23 Jul 2025 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d3EGE1qc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74B28EA5A;
	Wed, 23 Jul 2025 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272691; cv=none; b=epMLlbUhonwlmcawagJQXdll5KzTPZe8JDKuJ/RarhHXsf8TYgU0U29KVqr1js4umLIHkxXNb1xg7YjHYghuTa6cQpD/MAn1kGJmPbY2FZee1wsxulOYLAwoBt8unUgb0gWwC5s7AF+YSuZiXYUPGDPvd7wEicylxeP9VzwOuDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272691; c=relaxed/simple;
	bh=BVQkkx4ks1jCz7SnnAYL8Ss31m2IY6B7ZDDOVJBjsCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DC3LHDMjQP4W4NdaVkoFsAmSUhHl9zD3C9P4cmq/bX6GdF1qVWSL6NvOggW/eOfn9ghcVYKYOro44BbWgQGzeONulPOjt/J4dT8TlU/PzF15cIvwvS1XjBovBkNv2wTdunAH8xR4XjX4lB2egOXBd3HgyvWIuATSRH/p95hta2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d3EGE1qc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9F4JA010846;
	Wed, 23 Jul 2025 12:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqYFYAC+mWsNWpnVtRJZAS2RKfDItLqPBiJ8RjaetMg=; b=d3EGE1qcToRKKSQn
	UuGHwvmlRkSQR11z5geEYtXN710cY95A3zB4eezwtLCWcaJrQ+UOkpoTIbnRPSIa
	QCStng8lYZE9IoleHJuTGSn7dKLKi2QuEc7eRTX+WmVMAsV2nINkYSXSPZPWJw14
	7KhaYiJi3Em4RP8afmdkZAu8Jkxf95MvzJ+58i3PWf5kTAkbBA9pczWmLmtgWnsF
	uXwKldBBQtJIn3vydXWkKcsxzlCFhvMqZKgzeQGA+YAkDGJfEldRzGQY0+Q/PoEr
	Mx8iYLCxD3BmYGamiMxr9JJuZmYnVE+skdibCr5i16H1bcOwEwo87MkosQ6T4WQj
	twEt1w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na3fru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:11:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NCBQXR011268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:11:26 GMT
Received: from [10.218.37.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 05:11:24 -0700
Message-ID: <43424518-e73c-4136-bb0c-d4cb30062d7b@quicinc.com>
Date: Wed, 23 Jul 2025 17:41:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <Vivek.Pernamitta@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
 <68f18f09-913d-4ef9-bd13-ad32c1d5f8ca@oss.qualcomm.com>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <68f18f09-913d-4ef9-bd13-ad32c1d5f8ca@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VoWv5eBGznUOkmRGoidG1-Hd4OtOtALh
X-Proofpoint-ORIG-GUID: VoWv5eBGznUOkmRGoidG1-Hd4OtOtALh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMiBTYWx0ZWRfXzPgNtTHK3uov
 yMPHyGS7iy1hofKWNDS9P369n0o3mVo/B3HlDr50B9cw9xgS33o1j20trYeYxfxopzvrqOnQg1X
 nWaeJUnLoUw94ovATOtKXbPBVrfn7cUHNHlNVy9TQe0KR7Oc8gkYclqotUM8mX211kL4L8tdP3U
 AM6u+Cm9ZlvQ7vRqsyxUq3iklOcfcYMbLVtRIbftz1Tog7pZrYrA/sUf8uG6lCpkn9ma9Q5mP+H
 VCKh/FnykhpiErsISZxaty/lEDPnaSeyEoWi8S9iiDeM3/oqq9F6JjPBDOtBOI6Ixht4u2v2Cg7
 R8NMs6rL5TnQs7Zs0MkOVBP8jDtQW21autjFiOTqExtEEWbQH/whu2/AdbK/Oc3UOAfapd0m9mk
 4F1VX32usAsnZnIDI/IvvMlK6gInfdMxylyUMch+fPgFfRwUQ/wfZyV/MCbpRDCY05EMSIzT
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880d16f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=sMkw372tbV0BwNLCCAcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230102



On 7/10/2025 6:12 PM, Konrad Dybcio wrote:
> On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> When the MHI driver is removed from the host side, it is crucial to ensure
>> graceful recovery of the device. To achieve this, the host driver will
>> perform the following steps:
>>
>> 1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.
>> 2. Perform a SOC_RESET on Physical Function (PF).
>>
>> Disabling SRIOV ensures that all virtual functions are properly shut down,
>> preventing any potential issues during the reset process. Performing
>> SOC_RESET on each physical function guarantees that the device is fully
>> reset and ready for subsequent operations.
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 4bafe93b56c54e2b091786e7fcd68a36c8247b8e..2d1381006293412fbc593316e5c7f0f59ac74da8 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -45,6 +45,8 @@
>>    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>>    *		   of inband wake support (such as sdx24)
>>    * @no_m3: M3 not supported
>> + * @reset_on_driver_unbind: Set true for devices support SOC reset and
>> + *				 perform it when unbinding driver
>>    */
>>   struct mhi_pci_dev_info {
>>   	const struct mhi_controller_config *config;
>> @@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
>>   	unsigned int mru_default;
>>   	bool sideband_wake;
>>   	bool no_m3;
>> +	bool reset_on_driver_unbind;
>>   };
>>   
>>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>> @@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.dma_data_width = 32,
>>   	.sideband_wake = false,
>>   	.no_m3 = true,
>> +	.reset_on_driver_unbind = true,
> 
> It seems rather unlikely that out off all MHI devices, only QDU100
> needs this quirk when working under SR-IOV
The reset_on_driver_unbind flag has been explicitly added for the QDU100
device. While other devices might enter RAMDUMP mode and wait when a SOC
reset is issued, the QDU100 device will pass through without entering
RAMDUMP mode
> 
>>   };
>>   
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>> @@ -970,6 +974,7 @@ struct mhi_pci_device {
>>   	struct work_struct recovery_work;
>>   	struct timer_list health_check_timer;
>>   	unsigned long status;
>> +	bool reset_on_driver_unbind;
>>   };
>>   
>>   static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
>> @@ -1270,6 +1275,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	mhi_cntrl->mru = info->mru_default;
>>   	mhi_cntrl->name = info->name;
>>   
>> +	/* Assign reset functionalities only for PF */
>> +	if (pdev->is_physfn)
>> +		mhi_pdev->reset_on_driver_unbind = info->reset_on_driver_unbind;
>> +
>> +
> 
> Double \n
sure will correct in next patchset
> 
>>   	if (info->edl_trigger)
>>   		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
>>   
>> @@ -1336,7 +1346,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	return err;
>>   }
>>   
>> -static void mhi_pci_remove(struct pci_dev *pdev)
>> +static void mhi_pci_resource_deinit(struct pci_dev *pdev)
>>   {
>>   	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> @@ -1352,6 +1362,20 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>>   	/* balancing probe put_noidle */
>>   	if (pci_pme_capable(pdev, PCI_D3hot))
>>   		pm_runtime_get_noresume(&pdev->dev);
>> +}
>> +
>> +static void mhi_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> +
>> +	/* Disable SRIOV */
>> +	pci_disable_sriov(pdev);
>> +	mhi_pci_resource_deinit(pdev);
>> +	if (mhi_pdev->reset_on_driver_unbind) {
> 
> Can we not simply check for pdev->is_physfn?
The reset_on_driver_unbind flag has been explicitly added for the QDU100 
device. While other devices might enter RAMDUMP mode and wait when a SOC 
reset is issued, the QDU100 device will pass through without entering 
RAMDUMP mode.
> 
>> +		dev_info(&pdev->dev, "perform SOC reset\n");
> 
> Is the logspam really necessary?
> 
>> +		mhi_soc_reset(mhi_cntrl);
>> +	}
> 
> Konrad


