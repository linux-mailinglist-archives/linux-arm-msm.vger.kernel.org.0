Return-Path: <linux-arm-msm+bounces-43342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A909FC8A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 06:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D53DF162332
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D6B14B08A;
	Thu, 26 Dec 2024 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X3B+TfgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029412B71;
	Thu, 26 Dec 2024 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735191884; cv=none; b=D05BhbmIIGhxvB271Y6V9DtIun1hNV1JENYgNESGKqRvlTyTcOGEBESRP4jN3E4xYMK7zBtYSH3k7W6HGnPOWWZeTtH97EuRFui/tu/bCpWseIb3q6I4fDTrT/qBm1yreeKUZsPE6pbgI10/hhq8oQHaO2WrS8NJ4byXwDE/4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735191884; c=relaxed/simple;
	bh=NzX0YQcivlznPJTENZACWCcezdKRS7guB3pzpTNRySc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TBEdGzLJErkr84GLsPGjCzXbEemNn/hMq4wrLxwr2yvkyoa880ZVGqnfOSw5xhAs8lcF3d+NZTZ1wmtCHMmq+mj6qzOLrRv2wYjWyn7CtgAWLZW4gzXmdI4yAVtg8CNKF02POwkKl18vxZ3mkVpSWHNaOVIpupLu4kH7dSNLGpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X3B+TfgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5b0Rm004420;
	Thu, 26 Dec 2024 05:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbhS8TmGNYDg85Ez9I9cF02YUpEzGOg0ZQYZBDJOVgQ=; b=X3B+TfgESn/6PbvK
	Ec6FQ4vlE3HMGDVsxpGmTMHhTgefUjVdT2r72K2gtcRPWXzNH0oUyu20sl5v2JLp
	NT40H6xEcYpZpKdpOGCW5rrt0XZ8He9dQjkeY1GFQKPwyoVkKWyBNUSSbbW2zvwr
	h90+VBDuHyeHwI7jZfaj5+fguTsF52hHnzScQzCVP9qUaif5c7EAlbcyyOS45ADx
	L2Muem200OqTX5Ole9fpdGj5X8xFzkfb+eQOQT9PJTBlpORlWNzJRge+KkxMb54K
	GFWd7a+f7Y+x6XWf+sdmRqAgJ+KuR5ljyAFRihNcveIXVx9ICBz1mSNYf/Jtdd7v
	mnvYXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s159g1fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:44:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ5icai013043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:44:38 GMT
Received: from [10.216.12.7] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 21:44:33 -0800
Message-ID: <c6cff184-12d2-4bd1-9073-e13e55144989@quicinc.com>
Date: Thu, 26 Dec 2024 11:14:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] mmc: sdhci-msm: Add core_major, minor to msm_host
 structure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-2-quic_sachgupt@quicinc.com>
 <emdc6nq3z7z2zimkbut4hknhksoyzsemnna7iyrdvkfxpvbkvb@7vxdyoams4ky>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <emdc6nq3z7z2zimkbut4hknhksoyzsemnna7iyrdvkfxpvbkvb@7vxdyoams4ky>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ECRCaWAZBknApolE2od5pC20neIrzg4b
X-Proofpoint-ORIG-GUID: ECRCaWAZBknApolE2od5pC20neIrzg4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260047



On 12/19/2024 8:39 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 18, 2024 at 02:40:56PM +0530, Sachin Gupta wrote:
>> Add the core_major and core_minor variables from local
>> scope to the msm_host structure. This change improves
>> the organization of the code and allows these variables
>> to be accessed more easily throughout the msm_host context.
> 
> It doesn't improve anything, it is necessary for the followup patch.

Thanks for review. I will update the commit message to reflect the 
current patch information.

> 
>>
>> core_major will have information related to sdcc controller
>> major version number.
>> core_minor will have information related to sdcc controller
>> minor version number.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e00208535bd1..2a5e588779fc 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -273,6 +273,8 @@ struct sdhci_msm_host {
>>   	bool tuning_done;
>>   	bool calibration_done;
>>   	u8 saved_tuning_phase;
>> +	u8 core_major;
>> +	u16 core_minor;
>>   	bool use_cdclp533;
>>   	u32 curr_pwr_state;
>>   	u32 curr_io_level;
>> @@ -2557,6 +2559,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
>>   		      CORE_VERSION_MAJOR_SHIFT;
>>   	core_minor = core_version & CORE_VERSION_MINOR_MASK;
>> +
>> +	msm_host->core_major = core_major;
>> +	msm_host->core_minor = core_minor;
>> +
>>   	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
>>   		core_version, core_major, core_minor);
>>   
>> -- 
>> 2.17.1
>>
> 


