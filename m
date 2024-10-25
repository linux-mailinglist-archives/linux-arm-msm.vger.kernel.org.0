Return-Path: <linux-arm-msm+bounces-35848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97499B0054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165391C20B54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F8D1DAC90;
	Fri, 25 Oct 2024 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UAKK8B/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8761D54C7;
	Fri, 25 Oct 2024 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729852691; cv=none; b=U8SSPVZScPProVhVoRaa7lQ05ypBL4VXAaLxVQeq3sNTjQJSXj19dDvZzDF3G+XJ0VE503mktYv4eNlU2YFQJ1GCjbzIs9Fa8Q7QxH0IKoEcUHw4QmTtiz9jA8JFCgiVyomci4TjUoAgEKzVQSz2P83hAMCdrZ8u/9+LpgfhqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729852691; c=relaxed/simple;
	bh=tJUMoQY10Ni9v/x889j44Ar8BxTAOSKDcnaQCmd4XUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u8CZeoXxp61Ezw/ugx6uGwgyVrI5+/lz21rmXmyoy+uY7BzV0ZFlrUxp40ZMI3BDxMCQLa9njwpWO+2LFmvEma+iQcy6+zjBcKwvHC8UMxE8txKfgyrCaLFZM1BVWV1t5n/ICLE6RBSQT2mtG81eebwqP5CdsuIZXi81nlEgxMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UAKK8B/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONoo8W030354;
	Fri, 25 Oct 2024 10:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Z/ztfHawRi4RZuL0mcjOL+bE542F1mGwWqO2uxk11w=; b=UAKK8B/8y4ZvX/12
	UiFXjKzpFAzXZtuKXl1ekmqItbZ/iCtj75PiLLo/TNM7C1iYgWmxRfqVQ6GC9P4C
	IaFuAHkgfZ5vNE+eSFznm4IdnEiUPMXt4WJBN/7bfRv7atkW7PDkD31V7pkCWnng
	FEb6ooPjUatgcf/qm21cfPVikcmT8SaXsv0VNjv6BFKVAg9N4hsC9Kg4B/VEdTJz
	kAYRebIOIf4Fs8+1uEOQZDoSikI9Ap7ApydCIh6r65nWZndEg29oqkCFlgEL023a
	jyOuPp3r4erR9sBTLIWUWxRDJ3HTrTg2frUqOlp8Ze486j/ZcCY6EaDgEjj64rhP
	hYusfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w8pcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:38:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PAc6EH015808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:38:06 GMT
Received: from [10.216.12.108] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 03:38:02 -0700
Message-ID: <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
Date: Fri, 25 Oct 2024 16:07:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing multiple
 SDCC instances
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20241022141828.618-1-quic_sachgupt@quicinc.com>
 <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iwKnVqD09o4luRgVf6rht8yl6wyO1sP7
X-Proofpoint-GUID: iwKnVqD09o4luRgVf6rht8yl6wyO1sP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250081



On 10/24/2024 4:38 PM, Adrian Hunter wrote:
> On 22/10/24 17:18, Sachin Gupta wrote:
>> This update addresses the requirement for accurate slot indexing
>> in the sdhci-msm driver to differentiate between multiple SDCC
>> (Secure Digital Card Controller) instances, such as eMMC, SD card,
>> and SDIO.
>>
>> Additionally, it revises the slot indexing logic to comply with
>> the new device tree (DT) specifications.
> 
> This patch seems incomplete because all it does is assign a global
> variable which is never used again.
> 

Qualcomm internal debugging tools utilize this global variable to
access and differentiate between all the instance's sdhci_msm_host
data structure (eMMC, SD card, and SDIO).

>>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e113b99a3eab..3cb79117916f 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -292,6 +292,8 @@ struct sdhci_msm_host {
>>   	bool vqmmc_enabled;
>>   };
>>   
>> +static struct sdhci_msm_host *sdhci_slot[3];
>> +
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>   {
>>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto pltfm_free;
>>   
>> +	if (node) {
>> +		ret = of_alias_get_id(pdev->dev.of_node, "mmc");
>> +		if (ret < 0)
>> +			dev_err(&pdev->dev, "get slot index failed %d\n", ret);
>> +		else
>> +			sdhci_slot[ret] = msm_host;
>> +	}
>> +
>>   	/*
>>   	 * Based on the compatible string, load the required msm host info from
>>   	 * the data associated with the version info.
> 


