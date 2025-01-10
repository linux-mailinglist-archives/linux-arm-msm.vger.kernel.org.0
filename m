Return-Path: <linux-arm-msm+bounces-44705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2206A0867D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 06:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E673188A3D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 05:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3262054F9;
	Fri, 10 Jan 2025 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="izVoDzbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E11E25F4;
	Fri, 10 Jan 2025 05:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736486600; cv=none; b=p4ezuMstdfJ2HQcam68gcQv5he9qLPDmny9AC03IcXMIzeBOO6SGF4fTwk2QTfglYRJYuCm3sQzrZbhsu9e7PjylYkuVl5TD8x/Swj9mTQn6kbfUxP3qnO2Uor45zO+LjYOFpHFKVnbllWGggXAumawubC1YPA1Gtjfk+gj1jkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736486600; c=relaxed/simple;
	bh=e2x6HBFferLn3orAOqqQfR25ez9f9bBZme+XzmfSKVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gEJu9dbfS82B26uZ7meb6K6CAOZy8abZ+jOeT5vnxzZ4EgnMKqhZDwTL6xc/Nq4T4OFikJpPl/ei1NrAGayQK3sbbaM4zBAQLy+Si2+FyE+CI7Ik1f1FBrveWsXx8IFifS2vW5ywpOf8oR6cl1kUSrNiX3c0X388Q0O94QKsJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=izVoDzbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A1G4Ux014540;
	Fri, 10 Jan 2025 05:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1DfT2v8Ib1hkBwg4j0zmv42Kh9XU7zScZpnUmI/SR8=; b=izVoDzbC+8ciC34x
	cclwYiGT9mEq+BA3nJdPF0e0yycvEfvOdltaliFBc2h9LV4AibLtZ3YaaqVNTLEJ
	kiQxiNupAjoli1xwljtJZo9ZWkoom4Do+bRhU1BiZ6h12jF4F6tsfHl8g4l7sPPZ
	SoRXnhiE1Dadf6t1K+fV4m/wYGT52MYAkFzS1uZasm1x7IhnE02HZG2V5CzxvMO2
	EXDJ3HYb62hFeOFbojvxhWx+xLm9aZyaY2n++cNsE4lrPULjBid4JEtJTzsTwWaq
	5RI0GPI7KjZYjnzkgtTkLzKwkKiPChiPN0BtRpxovOwTmv4NPDX25KhXV0G5G7xP
	9aOpxg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442sqvgf50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:23:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A5N8wU029932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:23:08 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 21:23:04 -0800
Message-ID: <25bfbeaa-db33-555a-c268-dae2324915d3@quicinc.com>
Date: Fri, 10 Jan 2025 10:53:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] dmaengine: qcom: bam_dma: Avoid writing unavailable
 register
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Georgi Djakov <djakov@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <robin.murphy@arm.com>,
        <u.kleine-koenig@baylibre.com>, <martin.petersen@oracle.com>,
        <fenghua.yu@intel.com>, <av2082000@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <20241220094203.3510335-1-quic_mdalam@quicinc.com>
 <9ef3daa8-cdb1-49f2-8d19-a72d6210ff3a@kernel.org> <Z35dG7J8BLzeoT3B@vaman>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <Z35dG7J8BLzeoT3B@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W_mLUVUDNOrex1KUucxFisCH1U-yBX3G
X-Proofpoint-ORIG-GUID: W_mLUVUDNOrex1KUucxFisCH1U-yBX3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100042



On 1/8/2025 4:40 PM, Vinod Koul wrote:
> On 07-01-25, 23:30, Georgi Djakov wrote:
>> On 20.12.24 11:42, Md Sadre Alam wrote:
>>> Avoid writing unavailable register in BAM-Lite mode.
>>> BAM_DESC_CNT_TRSHLD register is unavailable in BAM-Lite
>>> mode. Its only available in BAM-NDP mode. So only write
>>> this register for clients who is using BAM-NDP.
>>>
>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>> ---
>>
>> My Dragonboard db845c fails to boot on recent linux-next releases and
>> git bisect points to this patch. It boots again when it's reverted.
> 
> Should we revert?
I have posted the fix. Patch available at [1]
[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110051409.4099727-1-quic_mdalam@quicinc.com/
> 
>>
>> [..]
>>
>>>    	bchan->reconfigure = 0;
>>> @@ -1192,10 +1199,11 @@ static int bam_init(struct bam_device *bdev)
>>>    	u32 val;
>>>    	/* read revision and configuration information */
>>> -	if (!bdev->num_ees) {
>>> -		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>>> +	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>>> +	if (!bdev->num_ees)
>>>    		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
>>> -	}
>>> +
>>> +	bdev->bam_revision = val & REVISION_MASK;
>>
>> The problem seems to occur when we try to read the revision for the
>> slimbus bam instance at 0x17184000 (which has "qcom,num-ees = <2>;").
>>
>> Thanks,
>> Georgi
> 

