Return-Path: <linux-arm-msm+bounces-55794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B947CA9D78A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 06:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B231BA4AD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 04:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0CC18C337;
	Sat, 26 Apr 2025 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KfaNFtZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722578F6F;
	Sat, 26 Apr 2025 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745642261; cv=none; b=YwwFoxXULLjVHOaGiH+6ifQf1rLyMhagYg72q7usLUpGYOoiVifodI6nFhqXZmA5PLvbBO3CwetkFUSWfW7KwCZjgZBJ6Y2akeOBrM7LWNBfgEX/KnmUnsO6M7lhhwOQkvtN/LEp9qp37aU433PJ80kMprUPqJtG4Oyuz7wK79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745642261; c=relaxed/simple;
	bh=zs7wWTJif4p/e2eqW7enn6LDMeROYRRUL/6ppwjbB2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hdVqYxPjyPNV56kO6Aes684a+M4aSQBTWSUWpYBknKYFgIz2FOwHwwY2GFxiwoDO+royh2VB67gWgZhCPexWs9NFK4ITfW01GncIEHbV8STI9Kt1x2DgF9aiGKMlnriYaLaLe1ZhrXSgjuZnWr1YGn05qIEgkrcSiYOx8Uzi/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KfaNFtZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3YsRR002328;
	Sat, 26 Apr 2025 04:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cvUlok7lJsAFdKwnEsjA4J40q+ZVvqtNhZJbWaGRN0=; b=KfaNFtZmGhsICSkC
	ZzupcjXE2b2dJC/83Hfrrs9b/xdgIQcaTl1B/ulOkTgI3euwrM65qWGGl8/r7Exy
	ndUPKUNnM6VAz8r86LCOVnWb0yUpWcm4mn+7eTzlbUpnP+gOhmxyvLQU6Ps7iARp
	395FKniJdi27Y3lR8Hwdw/J/ZrD2mNZj2c3LnO+bY8UTBhgzxWtSJrLQ6fgBNnk8
	r2cjqS/sxRoPL4BM9Bd1h1g4d6KnRtvLg/l79nXpyj9HYvRON+Ompd1zYGqNncci
	13Q5M1Jy1kx6qeVq/xiU1NtH5VdnuvwpJM+FhPHgGc543cSlMrVsxH8HJ01TKSq7
	OmndmQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq583mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 04:37:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53Q4bacK018036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 04:37:36 GMT
Received: from [10.218.37.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 21:37:34 -0700
Message-ID: <24f29ea7-8859-4dbb-93e7-5424071b6b26@quicinc.com>
Date: Sat, 26 Apr 2025 10:07:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] bus: mhi: host: pci: Disable runtime PM for QDU100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krishna Chaitanya Chundru
	<krishna.chundru@oss.qualcomm.com>
References: <20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com>
 <ciwwfmadzgpzaie5isrmpzd7s373bgyk27hh5fjaqy6blqa4qo@ar7cdrv3uuxy>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <ciwwfmadzgpzaie5isrmpzd7s373bgyk27hh5fjaqy6blqa4qo@ar7cdrv3uuxy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fWz81QGiMUBbr3KvPFU6aCFG4rYHObKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX7sG2yssV2vWi neWUoH1Ln1/FgXgaVs4EjZ/JGD0wW90jqVSWyeo7dsRUzxCZIXu8qHqZC82qg8IfTMnf7RVeiwB YoWpiYliOGUA9gwZXbA94ynbIb8n7EF0qOikYqOIIftuAu5JGGTTi1XUUPiPcXfm22LJFa/2xEW
 wyuXCsYUGFtlhjIdp1V+VbrsJYN4wKroNtRGguJqHSJhDGsubslhsKFRxM0XOq85OsH9usLKsfc uEfTeoRh66fYP9la5SZmWYu6rpS4eOTCalKc5wHF+6pDcmazpUx3GE8xEQIVb4aJDl0OQlKEt5+ pMlJCoAZRKi1rKnpu48Aq8Atjovqmu9yyDn32sfeyTqJjDILD7Jzs+9UWVE+b+HysebfeLN8jBL
 dkJu/g1/Kcn8L0hImSHG+BnHliHKPg4WauS5LFH9OFE7sYy9fcPGsGaUbHCaYyxw2ghu53v3
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680c6311 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OTJ4AGgxtXp4wH7adj0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fWz81QGiMUBbr3KvPFU6aCFG4rYHObKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030



On 4/25/2025 12:38 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 07:18:18PM +0530, Vivek Pernamitta wrote:
>> The QDU100 device does not support the MHI M3 state, necessitating the
>> disabling of runtime PM for this device. It is essential to disable
>> runtime PM if the device does not support Low Power Mode (LPM).
> 
> LPM is not very clear here. Please just use M3.
> 
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - updated variable to no_m3 from pm_disable
>> - Link to v2: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com
>>
>> Changes in v2:
>> - Updated device from getting runtime suspended by avoid skipping autosuspend.
>> - Updated commit message.
>> - Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 03aa887952098661a488650053a357f883d1559b..df80f3f62278d2cf96066c04926ce1ce58700d1b 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -43,6 +43,7 @@
>>    * @mru_default: default MRU size for MBIM network packets
>>    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>>    *		   of inband wake support (such as sdx24)
>> + * @no_m3: M3 is disabled (optional)
> 
> Remove 'optional'. It is an opt-in value.
> 
>>    */
>>   struct mhi_pci_dev_info {
>>   	const struct mhi_controller_config *config;
>> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>>   	unsigned int dma_data_width;
>>   	unsigned int mru_default;
>>   	bool sideband_wake;
>> +	bool no_m3;
>>   };
>>   
>>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>>   	.dma_data_width = 32,
>>   	.sideband_wake = false,
>> +	.no_m3 = true,
>>   };
>>   
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>> @@ -1270,8 +1273,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	/* start health check */
>>   	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>>   
>> -	/* Only allow runtime-suspend if PME capable (for wakeup) */
>> -	if (pci_pme_capable(pdev, PCI_D3hot)) {
>> +	/**
>> +	 * Disable Runtime PM if device doesn't support MHI M3 state
>> +	 * and Allow runtime-suspend if PME capable (for wakeup)
> 
> "Only allow runtime suspend if both PME from D3Hot and M3 are supported"
> 
> - Mani
> 
Sure, updated accordingly in V4.

