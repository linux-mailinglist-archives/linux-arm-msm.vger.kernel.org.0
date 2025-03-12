Return-Path: <linux-arm-msm+bounces-51190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD6A5E373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DAE18961AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A542566FA;
	Wed, 12 Mar 2025 18:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OKjdb6yf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F32505A5;
	Wed, 12 Mar 2025 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802871; cv=none; b=BqaaGhY/Z20bDdxcI5/BxZwm3mk8HS5Ds0YmySK8+w2JfTYiu2it3EJRpApG0fI9D2KrSaN/DsSxHKRw76UFq79w1URyCraVgGgsbieqjR5b/LuZJzQsZh6uN54We6Jq6OKJ5WNrBef5ysbh7MJLDoTj+pPBSjEYTREf1NlUDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802871; c=relaxed/simple;
	bh=1KSsXst2a76sO9U9hLzvyX/yQjKNhIwOmhBZKtn6MJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KdtRnh45kj2sHMxvdiiWryqKgUlnwyJolacylqDRp1Kj/JGTghcFwcgNrezTHzN3QqWnpB66zz5X8vDVfQUhxrxwqEd3ckUAmDiwtNVqGrA8TAyk+yXuQGZ8ACAI1mwgLvQVyONAkahSEjj2oGJOH81cAwHGnq7fmR2lTRWf4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OKjdb6yf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C9kaMW017688;
	Wed, 12 Mar 2025 18:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iflqwq6RqHvT5pungbvZXhgXmvlHlcA6Bh2ee6bH3Rc=; b=OKjdb6yf+6Ftmsd8
	PYl7FmTJWezMDG41lZH8bSPq+1P1vPI7Xh1BGCEE6luTVZw7slEyzaFpRq4WYNqO
	jT77jg/xXOas42sgk8LE99Zt7aXfev4jun8r+QcKmZR+gqIWu2bMymdmG3koVdnf
	DYM4xJQtSqD7+NqVApNYRQI7MwtH2xyLf7XC45O41fTZqaxHx7RKzLDmXc6NBxrY
	S0qhoVO5MIudYhpJtOkDJdCgsTBmBaKyYTctLMtoin7W5SrjvP1HWSYvLO1Q06HM
	f4Jl0F4PhPUF2iiSMxNQAoIQiPJR8GwwLA53W9hCtaAnQpg5mvqurjqjIaqJn0wZ
	xiKY8Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au50b93g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 18:07:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CI7c1n027758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 18:07:38 GMT
Received: from [10.110.14.126] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 11:07:37 -0700
Message-ID: <26f5e187-9718-4df2-a81c-b33463632cf9@quicinc.com>
Date: Wed, 12 Mar 2025 11:07:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
 <20250304-sm8750_llcc_master-v2-3-ae4e1949546e@quicinc.com>
 <44553d96-d1c4-4cd9-88ee-5d3bd7227715@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <44553d96-d1c4-4cd9-88ee-5d3bd7227715@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bri_6UOJcYtnQt3yG_9MethkWJVhgNTF
X-Proofpoint-ORIG-GUID: Bri_6UOJcYtnQt3yG_9MethkWJVhgNTF
X-Authority-Analysis: v=2.4 cv=a4ow9VSF c=1 sm=1 tr=0 ts=67d1cd71 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=jApmf-kH9fSj0xlk7zsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=595
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120126



On 3/11/2025 3:17 AM, Konrad Dybcio wrote:
> On 3/4/25 11:23 PM, Melody Olvera wrote:
>> Add system cache table and configs for SM8750 SoCs.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
>> +		.usecase_id = LLCC_MODPE,
>> +		.slice_id = 29,
>> +		.max_cap = 256,
>> +		.priority = 1,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xf0000000,
>> +		.ovcap_prio = true,
> ovcap_prio = false, alloc_oneway_en = true
>
>> +	}, {
>> +		.usecase_id = LLCC_WRCACHE,
>> +		.slice_id = 31,
>> +		.max_cap = 512,
>> +		.priority = 1,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
> .activate_on_init = true,
>
> [...]
>
>> +		.usecase_id = LLCC_LCPDARE,
>> +		.slice_id = 30,
>> +		.max_cap = 128,
>> +		.priority = 5,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.activate_on_init = true,
>> +		.ovcap_prio = true,
> ovcap_prio = false, alloc_oneway_en = true
>
> [...]
>
>> +		.usecase_id = LLCC_VIDVSP,
>> +		.slice_id = 4,
>> +		.max_cap = 256,
>> +		.priority = 4,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +	}, {
>> +		.usecase_id = LLCC_VIDDEC,
>> +		.slice_id = 5,
>> +		.max_cap = 6144,
>> +		.priority = 4,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.cache_mode = 2,
>> +		.vict_prio = true,
> .vict_prio = false, .overcap_prio = true
>
>> +	}, {
>> +		.usecase_id = LLCC_CAMOFE,
>> +		.slice_id = 33,
>> +		.max_cap = 6144,
>> +		.priority = 4,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.mru_uncap_en = true,
>> +		.vict_prio = true,
> .mru_uncap_en = false, stale_en = true
> .vict_prio = false, .overcap_prio = true
>
>> +	}, {
>> +		.usecase_id = LLCC_CAMRTIP,
>> +		.slice_id = 13,
>> +		.max_cap = 1024,
>> +		.priority = 4,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.mru_uncap_en = true,
>> +		.vict_prio = true,
> same
>
>> +	}, {
>> +		.usecase_id = LLCC_CAMSRTIP,
>> +		.slice_id = 14,
>> +		.max_cap = 6144,
>> +		.priority = 4,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.mru_uncap_en = true,
>> +		.vict_prio = true,
> same
>
>> +	}, {
>> +		.usecase_id = LLCC_CAMRTRF,
>> +		.slice_id = 7,
>> +		.max_cap = 3584,
>> +		.priority = 1,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.mru_uncap_en = true,
>> +		.vict_prio = true,
> same
>
>> +	}, {
>> +		.usecase_id = LLCC_CAMSRTRF,
>> +		.slice_id = 21,
>> +		.max_cap = 6144,
>> +		.priority = 1,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
>> +		.mru_uncap_en = true,
>> +		.vict_prio = true,
> same

Ack for all the above. Looks like I was looking at an outdated data 
table unfortunately.

> Apart from that, it looks like there's some sort of grouping / parent-child
> relationships involved in this thing - do we need more sw changes for that?
>

Yes; I originally thought that wasn't relevant for this version but upon 
further review it seems
it is. I believe the functionality changes belong in the previous patch 
so I'll add them there
and add the relevant data to this patch.

Thanks,
Melody

