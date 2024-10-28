Return-Path: <linux-arm-msm+bounces-36143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FC9B2D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCFD1F21A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AFA1D270B;
	Mon, 28 Oct 2024 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hW0p+vWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F902192B98;
	Mon, 28 Oct 2024 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112065; cv=none; b=kZNH0XjrePYaX+d5Hk/ua6bH9giR9ZC5EbsK/B1K6raMc7UP3gvcr+/47yyMB8V7mv0llr4SXVr3wGWBZnu6lFTXasdfkkqQzCu/L3LZ/K7G4gog+Iom7/JngFeQAt6E7HYI0N7k6CPbTrCoSdAlvrPxRQ5s6/N0zhqyKFw2beI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112065; c=relaxed/simple;
	bh=UZSZxr/HG9RX28U6C4Z9wIsayGdx5uiLoXfcknt/cWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V31GLajFs1v7sGml0NyRiuA6LpC+p5otH7BymxCTW8CFvWm4uJJg9vwEM6DU7JPHH07owOdYsBj+purna8eFQODCRlZHXO855KCFflt7CG8u8sUiXoXjRg8yJnu2h/V1WzIT8PLED9+i7vEHRAeQ8hUTVuCU9wR+Y7orlEcLBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hW0p+vWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RLfHdp004837;
	Mon, 28 Oct 2024 10:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAg5WQp6r9XHYcfiTy3LVub8K2pf/58GuSBUm35yAV4=; b=hW0p+vWXWWppOLkr
	yIJooWF09p0JvuTX21b1p5vVhlk3It7/TCf3jQWCiHM7ZroxCxtnY/R+uU52IoaW
	IDsS8Wvsbu+nfNdfXnasn6E0Y0OFGu0MFvqgqenb5EWdAhDbL614TlZf2dwb2YPj
	JJ9qn/L6AEolN61aCA74xXKF4DjiwMxG+A1yeLjFthilUSVUPJk/wd4rKJHOsvHo
	60/ztP6Calv0JsAwe/WO6Qz7vmyi5J5weZjVf6FL7BuGbyTdEYh80C9WkAiJP89U
	AZrx+3ro89AXkR1GeP+ZN1fVmp6IiPEUvnXOuBBNB0ZqLvUXc1aEX/L3P+oyaBDT
	a+xLvg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt6vg7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 10:40:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SAewdU013785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 10:40:58 GMT
Received: from [10.216.3.216] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 03:40:54 -0700
Message-ID: <0a0647aa-1fa4-4149-a76d-da7e08034fe4@quicinc.com>
Date: Mon, 28 Oct 2024 16:10:37 +0530
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
 <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
 <be483786-d8d2-4d46-9ca2-fbb629ba0674@intel.com>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <be483786-d8d2-4d46-9ca2-fbb629ba0674@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rM9oJELF4j0Aug5VMBmUjWNqiCQuSU4a
X-Proofpoint-GUID: rM9oJELF4j0Aug5VMBmUjWNqiCQuSU4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280087



On 10/25/2024 6:03 PM, Adrian Hunter wrote:
> On 25/10/24 13:37, Sachin Gupta wrote:
>>
>>
>> On 10/24/2024 4:38 PM, Adrian Hunter wrote:
>>> On 22/10/24 17:18, Sachin Gupta wrote:
>>>> This update addresses the requirement for accurate slot indexing
>>>> in the sdhci-msm driver to differentiate between multiple SDCC
>>>> (Secure Digital Card Controller) instances, such as eMMC, SD card,
>>>> and SDIO.
>>>>
>>>> Additionally, it revises the slot indexing logic to comply with
>>>> the new device tree (DT) specifications.
>>>
>>> This patch seems incomplete because all it does is assign a global
>>> variable which is never used again.
>>>
>>
>> Qualcomm internal debugging tools utilize this global variable to
>> access and differentiate between all the instance's sdhci_msm_host
>> data structure (eMMC, SD card, and SDIO).
> 
> The kernel does not accept code that does not serve a functional
> purpose.
> 
> You could look at using eBPF or KGDB to get the information,
> otherwise you might just have to carry that kind of patch in
> your internal tree.
> 

Sorry for misleading sentence, the tool I use is lauterbach Trace32 and 
when using Lauterbach Trace32 tool, having a global variable makes it 
easier to load and inspect dumps. It will be easy to quickly locate and 
analyze the sdhci_msm_host structure, which speeds up the debugging process.

>>
>>>>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> ---
>>>>    drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index e113b99a3eab..3cb79117916f 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -292,6 +292,8 @@ struct sdhci_msm_host {
>>>>        bool vqmmc_enabled;
>>>>    };
>>>>    +static struct sdhci_msm_host *sdhci_slot[3];
>>>> +
>>>>    static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>>>    {
>>>>        struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>>> @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>>        if (ret)
>>>>            goto pltfm_free;
>>>>    +    if (node) {
>>>> +        ret = of_alias_get_id(pdev->dev.of_node, "mmc");
>>>> +        if (ret < 0)
>>>> +            dev_err(&pdev->dev, "get slot index failed %d\n", ret);
>>>> +        else
>>>> +            sdhci_slot[ret] = msm_host;
>>>> +    }
>>>> +
>>>>        /*
>>>>         * Based on the compatible string, load the required msm host info from
>>>>         * the data associated with the version info.
>>>
>>
> 


