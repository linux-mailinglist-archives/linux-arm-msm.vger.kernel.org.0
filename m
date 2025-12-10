Return-Path: <linux-arm-msm+bounces-84838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B6CB1870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B8A0300698E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7238A1C5D59;
	Wed, 10 Dec 2025 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hR/GBNn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0111pe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A814A0BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327299; cv=none; b=exPQBjoTmEAswJdvZZKo81d7W69ZLnz5t839wyvnnsfoRU5HBhLQA/antLrCqKSm3oSKPHYmE7Zo0FSzE+jVOXQFdErUukusHSRFq2uyrz/nxHqRNZXLiwgx1LOokdSR36kqF9pNRUMFC82lg3fWcVXp/fMSl9vXb04vCJM5/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327299; c=relaxed/simple;
	bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsIPxDB9GE1jb6GzPCMvT30vyjm4yjQMdfrHSQjxBVatbI4TNrXyRBuUfS6sTjfw3VDUkQROaZfyK4L22brcNF3woLDBOeH0ldhqljO5/kTpOxhFe1ZtszY9gwJUWjRsGJWbab/9OocseXflCVWF17tgpqS/Tw2YSWxF66F/onM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hR/GBNn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0111pe4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OTIK1722398
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=; b=hR/GBNn1He2JVOQl
	GlEh6OZh1sY99F/+cbs/bTP4Ar0HTtCQtazagzEpSdrVo7mQQGwwNqroVvRDC3uj
	IklNm0g0/KYKZ7VCeIhF6Kv43HbfoUgSPlwbU3as8IYUnWdJNmAnyoA/QiZo3Zo9
	eW5785yhBGTrxrZWPfLDHZxt8SCaVBJlNnGvwkrrcgi79rt2zqOZ/dTgnZxAvw92
	ojWkghSUUygtLkLj/BteTvyFie7mxfT1wEzF8pqRYApSselz5C00EpmKXIKqPiiP
	Tb/jCEjXGuuhlf502AjFzXqfYSn1aZRMtJn1kXrbGsFuPJnFUQx6lafh8cKrXf1j
	17KxBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu596ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343e21575f4so1839613a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327296; x=1765932096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
        b=R0111pe4CS+wmH0sB3Nl30w8tQps1Wwacep16ZzuPmVD1neTiijJmXgIHCBLvWFUVR
         J9/F6dSAp7+h3YqcYo1zATwfHyqZIhzBMua7s5kSk3ypLyDg9x58JUILCNtKU7bSn6H0
         2wXkG+BEuRERaMBec6ab3QAPTR0+UJUqF7Pkgvw1wOtbUbDUxlNEAFnHbWvcqcx3MfGe
         wMCbrxkAX6ub0oS52+CrgIkl3q+9niX7iRBXvH3MAbQbkPfrefj5IA11dI4a0fX9/DpL
         uk9g1kzZsUTCWeG6kb7HE90uJWjejuNuuRVXG+gzX1Jf0HSy7KPWw81wGCTBk7s8DpY5
         KxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327296; x=1765932096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
        b=szEYFdB4vCwdHlNCBeAR4WY0rGv/srELdAucHyRAWg5caZ9rNKqF5eIJbwAjIaCHQx
         4beM414fb4CFaObgvU2fIj0ipaLEwRkJkRcPNpfmNzudWl2IiHd7XCTg71JtXJBrgvlM
         Z+nVMJPPHM/rAPGPkyxG1efGFjFmbFb7KJeMXmFPqDYAgo/l+B4X/vdDXRbzlEyYGj7l
         qHxrNvJg7gKNfJ7usw3bDsUSpM/t1C0r7L4b7VeUjfVC3YpTdx8GyR5urQjZkZ18U35M
         zcW3hk9KlhhutVvDgGSifTiNOFvKUf+UYrzxTgad9S1a/CXM52AWu6RE5s0VC5T7LsgF
         049w==
X-Forwarded-Encrypted: i=1; AJvYcCXPIMaiqUZ5+Oq+XPumS52M+e855S8J/549zKNClfeA/668s4NB1HyNxYodrYXb3OMgU0/xGKP37b+G7aXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3tPwSnYL9hzuQN+evmSO8TJWbiwnx1W5YHgOqJXSHT3DkcEu
	EkliZjPCrLAVLETsZvw7C6nhHc4buH7StZy7D/AFvzGX7ZxPatc2VFL4Z1WsJvOtRqodOscu7z1
	HyhNcydYFDPafNqEXfZoXDRs7cACl9qhJNuc0p7ktZjV9dx7w8OYVEEJ69w1X5UJn+Qli
X-Gm-Gg: ASbGncuCyH3ix4ow+eAWrddDh2WL4S13mKGGH5kFxDI0MnDRL0IooipY+MGcsDQpqK2
	fy3Y3UhntjD99TLnS5KRfJNfi38cKa1sodwjRFNNbzjlAlVa74ex1NcAHpZc0is+pVTzZM5/Qg8
	Ibuzhv7pQ9Hy7CyOTFTEZm3Xyfgtbii4BXqF8KCxxVyS2EJ85NEhKzrqEnCxUa029atuY2WqDIN
	ABYvxejbqiCDkJmYsue2bwI6Dloi7UkfJGR3l+4x6S3SzW6lOQTd/Xp97UHtzepV+k7WRQRJPMd
	2/VDaCU/OtMWGS2ouQKZv9xrgUb0VY17hsCyHGmUHQORIj7ZBqcDCUOxCDjz8y5jTCogoOGKK/a
	b7ETZW76wmPhUlEID8DyuH078M6dGqs7DwnU+wuqu7yLYb4KH9sP9kjyZI84CLIHXhDomGjAy
X-Received: by 2002:a05:7022:45a5:b0:119:e56b:46b6 with SMTP id a92af1059eb24-11f295e9734mr244395c88.0.1765327295528;
        Tue, 09 Dec 2025 16:41:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjbK6H2LR0Eg2xR5CKo0RsaF8+emf7lWY2up65AJbe4FEd8or8hNbHhM7LZTaTc7EAMSpWbA==
X-Received: by 2002:a05:7022:45a5:b0:119:e56b:46b6 with SMTP id a92af1059eb24-11f295e9734mr244378c88.0.1765327295036;
        Tue, 09 Dec 2025 16:41:35 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm76082570c88.2.2025.12.09.16.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:41:34 -0800 (PST)
Message-ID: <797f93b5-e31c-4ee8-96fd-4d974daa0b3c@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:41:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
 <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
 <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1d-6ue5C2Wb3l1LYmnO6Aj2NqrjR0UDS
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938c1c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ukZIlUgswIJF011o_R4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1d-6ue5C2Wb3l1LYmnO6Aj2NqrjR0UDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX/y+PXweyqgPZ
 yg0bOjXZtkfsqcLskXTVDSI7E5WvHzGaeRGJ/waptyvvXQUrnz4k3lXrw1wexDC2YxUt2UUMFoZ
 v+6MHAqSLAUXp7LeZFM9iENOe5yeLyIjEWjgIzgsde7AWIpZbRF2mNGGM9ksORk32WwQpE2t9Hl
 I566fIGR06KJgvwMAI+3xYvKqWqC7V4xbfn8JKvur3sR9d+Ztz5/hFVtr7IDawCusXknwkGYEaP
 VPkXwMOd4YDLYOsDeZaGEImSXZbkZPQSSbslrwQou0+M69vYYs0l3Is2Fy4I27GKRYuqXfcwMra
 01D9r96XApwIt4dxseEfp6CGIlvPaH95l0Z8VqlJeqyKXf77cVZZmormMw1GsrI6PHam8ex8kJ5
 2xj429QMWXKY3X7A1p0sdpOqngrxEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100004


On 12/6/2025 3:36 PM, Bryan O'Donoghue wrote:
> On 10/11/2025 17:21, Deepa Guthyappa Madivalara wrote:
>>   #define HFI_PROP_BUFFER_MARK 0x0300016c
>> +#define HFI_PROP_WORST_COMPRESSION_RATIO    0x03000174
>> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR    0x03000175
>>   #define HFI_PROP_RAW_RESOLUTION        0x03000178
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE        0x0300017C
>> -#define HFI_PROP_OPB_ENABLE            0x03000184
>> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT        0x03000180
>> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED    0x03000181
>> +#define HFI_PROP_AV1_OP_POINT                0x03000182
>> +#define HFI_PROP_OPB_ENABLE                 0x03000184
>> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
>> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>>   #define HFI_PROP_COMV_BUFFER_COUNT        0x03000193
>> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING    0x03000197
>
> I'll fix this for you because I'm infinitely sound BUT
>
> #define HFI_PROP_AV1_FILM_GRAIN_PRESENT         0x03000180
> #define HFI_PROP_AV1_SUPER_BLOCK_ENABLED        0x03000181
> #define HFI_PROP_AV1_OP_POINT                           0x03000182
> #define HFI_PROP_OPB_ENABLE                 0x03000184
> #define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> #define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>
> please stop using whitespace for tabs !
>
> ---
> bod
Sorry, updated to tabs in v9.
>

