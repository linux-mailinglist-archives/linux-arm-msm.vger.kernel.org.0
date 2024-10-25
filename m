Return-Path: <linux-arm-msm+bounces-35849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7459B0071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C49B1F222E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA9C1D47C7;
	Fri, 25 Oct 2024 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CyvIXOwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB9481B6;
	Fri, 25 Oct 2024 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853329; cv=none; b=UJGQqjQ1YyKVpCd6yLpvRJQ0dBryQHpw5A/AfmVWMpf91gzEO8WwQElQWQXiSsNk405DqWItBPtEKYjsqm++cg1jzX60qzptgtLsTvHJE18YMxjKcWmeqqihyuun6PNrpBmJkS8mta28PLG2H9QGpo+dyAjEIAusv4ChzdRUXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853329; c=relaxed/simple;
	bh=sifrF086x9sAjtH87145QPqCxD95B2D466G4TlchTu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QgaunZGYVl8duUMc/6UJWTJktJpu8pQ+eP0ybbXXAgXKqvYjx84uZJwxZIa6Q5gd0lVkPe7l9TCo8Thb4DVCimokFAqkg2ujMTvwSGVC+eR9axe4MNVqEUJUB/Rf7rdNm5w3sW9xHT2qs3HW3L2PIBxsteDUlLvf6js0JxXdcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CyvIXOwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAUQOc031140;
	Fri, 25 Oct 2024 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xk15zFG3V8EbLscVHOGTwDdAKRM02iTTeNeusJNXAlM=; b=CyvIXOwI44dSrGqF
	sq2MSl51sK2pOxyci2HhpJBiQPnRn88uoveiv3wZ2WyEyTF8x6Lc87wSqmNQ9asX
	PRbgbSoNPeBI9OzaDBiSPE9oPajrqDgx1u7nIjiH0tTHERZ5vgj792CZuWRN5ejt
	9HbbciTn+ny4Z4HhbSTNEDY1doqR7O7+eEqQGOHz3Zas7nadBiegLAbDClIb8hZ2
	VEO/Kc5BL/STjkfGoHlgkiv/SKVF8tr5ozlqT/WUjh4yJm97n7iAVP+5pBJwFdjR
	KyLjX/PdWLTQQG+rijHP8ghuS4iASx+7ek6LAY3e96AKHKDeoU0NDiVdb3aGoBSy
	TAkeKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w0pxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:48:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PAmhnf012712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:48:43 GMT
Received: from [10.216.12.108] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 03:48:39 -0700
Message-ID: <577d719c-6c9c-4aaf-b24d-f437fa729737@quicinc.com>
Date: Fri, 25 Oct 2024 16:18:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Add sysfs attribute for error state in
 SDHCI MSM driver
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20241022141659.18764-1-quic_sachgupt@quicinc.com>
 <ed236a63-6505-4cd9-8ccf-97a1035e2848@intel.com>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <ed236a63-6505-4cd9-8ccf-97a1035e2848@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mSg-7j9nwGYqsRHaVCTtEIKpWv2P8n3Q
X-Proofpoint-ORIG-GUID: mSg-7j9nwGYqsRHaVCTtEIKpWv2P8n3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250082



On 10/24/2024 4:54 PM, Adrian Hunter wrote:
> On 22/10/24 17:16, Sachin Gupta wrote:
>> Introduce a new sysfs attribute err_state to the SDHCI MSM driver.
>> The attribute allows users to query the error state of the SDHCI host controller.
> 
> We already have err_stats and err_state in debugfs.  That seems
> more appropriate.
> 

Thanks Adrian for pointing this out. I will check and get back.

>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 40 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e113b99a3eab..a256e3569a92 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -290,6 +290,7 @@ struct sdhci_msm_host {
>>   	u32 dll_config;
>>   	u32 ddr_config;
>>   	bool vqmmc_enabled;
>> +	bool err_occurred;
>>   };
>>   
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2255,6 +2256,8 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
>>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>   	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>>   
>> +	msm_host->err_occurred = true;
>> +
>>   	SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
>>   
>>   	SDHCI_MSM_DUMP(
>> @@ -2398,6 +2401,41 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>   	return ret;
>>   }
>>   
>> +static ssize_t err_state_show(struct device *dev,
>> +			struct device_attribute *attr, char *buf)
>> +{
>> +	struct sdhci_host *host = dev_get_drvdata(dev);
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +
>> +	if (!host || !host->mmc)
>> +		return -EINVAL;
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "%d\n", !!msm_host->err_occurred);
>> +}
>> +
>> +static DEVICE_ATTR_RO(err_state);
>> +
>> +static struct attribute *sdhci_msm_sysfs_attrs[] = {
>> +	&dev_attr_err_state.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group sdhci_msm_sysfs_group = {
>> +	.name = "qcom",
>> +	.attrs = sdhci_msm_sysfs_attrs,
>> +};
>> +
>> +static void sdhci_msm_init_sysfs(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	ret = sysfs_create_group(&dev->kobj, &sdhci_msm_sysfs_group);
>> +	if (ret)
>> +		dev_err(dev, "%s: Failed to create qcom sysfs group (err = %d)\n",
>> +				__func__, ret);
>> +}
>> +
>>   static int sdhci_msm_probe(struct platform_device *pdev)
>>   {
>>   	struct sdhci_host *host;
>> @@ -2442,6 +2480,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	sdhci_get_of_property(pdev);
>>   	sdhci_msm_get_of_property(pdev, host);
>>   
>> +	sdhci_msm_init_sysfs(&pdev->dev);
>> +
>>   	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>   
>>   	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
> 


