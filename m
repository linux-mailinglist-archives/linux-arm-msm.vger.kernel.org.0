Return-Path: <linux-arm-msm+bounces-38484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDD9D3A42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16EB51F21B66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786619F41C;
	Wed, 20 Nov 2024 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B4mzhRjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173D17F7;
	Wed, 20 Nov 2024 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104466; cv=none; b=DpLjOwPQE0l+/4/5MHKg3683CPgIJPA5Lw3wK0pLfDblpKu7k/LvPYCH3wHtYKv/0bl62P9e5sDj7YO9+MWVYGmWnMrbk22x/upj3/R+7dIF2bcDceED2fVjRunTRpA5TZjb5m+CZkZFIZUDICHfZxlXadYM86vUvUkQjQIGCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104466; c=relaxed/simple;
	bh=sIU4agl5c0sKd8ycD4wjm+awbGC+sQurasae39S0W2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gMOTFxJR283GmQE8sTCbOo2iOrjjQppB9Ad99ESkDEEFFeA53kysszor5vQsjSCwBiIrBeM0xX9Hq19PF1KfFdMMtToO5PD4lKcJaId587Tjv/E1STEuLK1jmfWfZ8gyNMnVrJpq0CBb1djNrkoEvgQtbP3dYvg10qak4f82VuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B4mzhRjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FLX5003947;
	Wed, 20 Nov 2024 12:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPYqUbAc0US3qw0Azyzie+o8Etpi4oTKHdU1SyKmKMs=; b=B4mzhRjYx0qYbXHw
	mFWRSHtb0WRyX0JGzS4S7WH3MhLJcS041t0ZRLRoXje56uZjou4puhIDIBgm8Zjm
	BNf2TTBxWFUdzxWTq0ETXVhPSgU8Zki+hn1w2Pui66x0+WKL1/pl4Fv/cGprGTh6
	9Wcp5AzkHUQMCet5IcjCtvJCc5k7Qc/E6BDu6s2C8Y3TjNA+y7PUlmI8qO2FbjY7
	MeI6Y+rWIoQUJax/fd1L13reLpA+DleD0MYC+OXhVs9iydYcGWIEbmj7M3V1jN1y
	LpKOvgnB2s447O9st7zT2li/S2WaIOgtasFgZ6S1iyAecrC9+fzEsxAZn86bphlw
	zOZeNQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce38h1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 12:07:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKC7eJq011472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 12:07:40 GMT
Received: from [10.216.2.70] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 04:07:34 -0800
Message-ID: <40694102-8daa-481b-b724-0a7e37dd4af1@quicinc.com>
Date: Wed, 20 Nov 2024 17:37:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing multiple
 SDCC instances
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20241022141828.618-1-quic_sachgupt@quicinc.com>
 <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
 <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
 <be483786-d8d2-4d46-9ca2-fbb629ba0674@intel.com>
 <0a0647aa-1fa4-4149-a76d-da7e08034fe4@quicinc.com>
 <2knkpsv3nlbcolosyza3awktztv23kqweow3b3wilbehv2azre@dcldb6a37sbf>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <2knkpsv3nlbcolosyza3awktztv23kqweow3b3wilbehv2azre@dcldb6a37sbf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IwOTFG-zRAE5-DqqTJFeyca_qChbgUmY
X-Proofpoint-ORIG-GUID: IwOTFG-zRAE5-DqqTJFeyca_qChbgUmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200082



On 10/28/2024 5:56 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 04:10:37PM +0530, Sachin Gupta wrote:
>>
>>
>> On 10/25/2024 6:03 PM, Adrian Hunter wrote:
>>> On 25/10/24 13:37, Sachin Gupta wrote:
>>>>
>>>>
>>>> On 10/24/2024 4:38 PM, Adrian Hunter wrote:
>>>>> On 22/10/24 17:18, Sachin Gupta wrote:
>>>>>> This update addresses the requirement for accurate slot indexing
>>>>>> in the sdhci-msm driver to differentiate between multiple SDCC
>>>>>> (Secure Digital Card Controller) instances, such as eMMC, SD card,
>>>>>> and SDIO.
>>>>>>
>>>>>> Additionally, it revises the slot indexing logic to comply with
>>>>>> the new device tree (DT) specifications.
>>>>>
>>>>> This patch seems incomplete because all it does is assign a global
>>>>> variable which is never used again.
>>>>>
>>>>
>>>> Qualcomm internal debugging tools utilize this global variable to
>>>> access and differentiate between all the instance's sdhci_msm_host
>>>> data structure (eMMC, SD card, and SDIO).
>>>
>>> The kernel does not accept code that does not serve a functional
>>> purpose.
>>>
>>> You could look at using eBPF or KGDB to get the information,
>>> otherwise you might just have to carry that kind of patch in
>>> your internal tree.
>>>
>>
>> Sorry for misleading sentence, the tool I use is lauterbach Trace32 and when
>> using Lauterbach Trace32 tool, having a global variable makes it easier to
>> load and inspect dumps. It will be easy to quickly locate and analyze the
>> sdhci_msm_host structure, which speeds up the debugging process.
> 
> This still isn't a functional purpose. This is a debugging code for a
> particular developer debugging SDHCI issues.
> 

Thanks for your comment and time we will explore more on this.

>>>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>>> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
>>>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>>>> ---
>>>>>>     drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>>>>>>     1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>>>> index e113b99a3eab..3cb79117916f 100644
>>>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>>>> @@ -292,6 +292,8 @@ struct sdhci_msm_host {
>>>>>>         bool vqmmc_enabled;
>>>>>>     };
>>>>>>     +static struct sdhci_msm_host *sdhci_slot[3];
>>>>>> +
>>>>>>     static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>>>>>     {
>>>>>>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>>>>> @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>>>>         if (ret)
>>>>>>             goto pltfm_free;
>>>>>>     +    if (node) {
>>>>>> +        ret = of_alias_get_id(pdev->dev.of_node, "mmc");
>>>>>> +        if (ret < 0)
>>>>>> +            dev_err(&pdev->dev, "get slot index failed %d\n", ret);
>>>>>> +        else
>>>>>> +            sdhci_slot[ret] = msm_host;
>>>>>> +    }
>>>>>> +
>>>>>>         /*
>>>>>>          * Based on the compatible string, load the required msm host info from
>>>>>>          * the data associated with the version info.
>>>>>
>>>>
>>>
>>
> 


