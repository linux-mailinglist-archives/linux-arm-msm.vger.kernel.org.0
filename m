Return-Path: <linux-arm-msm+bounces-80151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08BC2D5BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 18:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD6014F483A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 17:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891C325FA0A;
	Mon,  3 Nov 2025 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayktmef4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bemaWx7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBA3161A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189556; cv=none; b=MzoY9XTuOrAJMDUBN5grbVaVIB+/254Hnx5fFcdMCAEwtPld6ZtuxqAdSTDYg1Fkv4U4T9xV7BBvipg/U5U3ovJC7ENHvEwtKtlfEcJkdjWLGVkvfTR8Q8bFMGVCVdBjfiqZLmxIHIPsf6S9Bd3RdnJ25MbcpLy8tmk+iPQDZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189556; c=relaxed/simple;
	bh=SE/JWvyl1mVhMRUT/t0i96Y2UjirOWJdmQMPTIz8GUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBrV/mNCiKRu1SmKOoqu34Vc4uDRc6kadBFSce30L5REicA4SScBEyc9NA+TznX3uFAeyl4Bh9yfEzjxqa+FWDmkKGPs7fiTkRb4zk9zYb7nbcf0nsXBksYClT3/gz/7TAX8gZPgr11BeM6vz2rrevdeimOwXrmjpMV+exNeT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayktmef4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bemaWx7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H34OV3845772
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMJonf3eoZDqZvJkMJ+tV/tTp+QvimJZ4zN78pLFBkw=; b=ayktmef4GFrMH0qO
	4E3/O9c3IJhUzymEbDS3WHY9Q/xXl8Q5wV9rMlhU2zFz+HPs9DMDyRIfuJMaqlfB
	x37WvIZazXcM7jrsQ0rzuuYZom4xc6t8//ZlGWHFrvG24HOS7OC4q3JN2f/gFz9u
	VaAegXsY2mCslBWcPdtapggbIGE4T4ZqzDwn8+qf7nxw8wkxOWLTandYamSU/i5x
	h0bEEZY5EkzJvBOy+N4kk0Dm2xs7y9chGD7ovNhY/u+H9kjZYhqahHT00uZHHC82
	fjL1PPlmlIqNHRuue2t3ehQS1wRwBeAy2phAwMB3T7R+fNijfcR7TOUCVuNWdphi
	U91cLw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1g0bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 17:05:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so1272382b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762189552; x=1762794352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMJonf3eoZDqZvJkMJ+tV/tTp+QvimJZ4zN78pLFBkw=;
        b=bemaWx7nWClpfHiXrCUCGBZ/9/KP2vC3mLZojhPCKypfM9/wVJWLIvtUv8OoF9d5By
         ewvCpYci9JYw1YqcopoPDoRYCXpzW+NDCF18Xybai/jDuRiNzuCtfXsq8tVDZ0ZKGP4m
         EF5SGOmIzhE5yJG+vWCvXpjf+PQcwe86oGS8Pp4Kcj9Uom4k1PqdfDXacdLDss9n3A3g
         w8Ce+dYzFz+nYXL3QDkIQzhgGorWawE69RcyllNAeDOzxYWQjHDFFOuHf3TY4cyvd6ti
         LAwKUQlN/CaXyk/CTkY1jXDSYTA4wIYMRIK6XXuw6L3LhJGeGS3XZLavCMDW2Ppzo3e+
         r1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762189552; x=1762794352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMJonf3eoZDqZvJkMJ+tV/tTp+QvimJZ4zN78pLFBkw=;
        b=bhb/stYYNNA6sG8WaTuVWse3akjuL7q6PPoTOF5d5MKO5Te0aSIjF4ybUPJ5h40dHq
         wbsAxFrPiTqDRD2vnGpox8xkpiaUvxbZv6WYLdXJDbMoQM0Fr6dwfbEzoevsWgeWgk5F
         L9sO1bWHzFcOO0dvTwmCaeYK6/E2jxm0+FzE60vFQw9mAKX9aCs6viig4yb17NNILWld
         wmRyEnDJqAhjhHlF07Y73vq0niwmrsXiHjF9l+GIqwW13QFJ7iyUcS/SoH/tsoFGcAqF
         Mj9rzQSkm0gKvD0K58ylUvxi1KuA870O4rmfFoUWTSTbTbZIYAQOUZLM+sJDvQmono+n
         KazA==
X-Forwarded-Encrypted: i=1; AJvYcCXjYyxbtE1FZkiEEHjwTWUmVdtEhBeQmLGubTgp4+/qc/Mo/Gr3xNfPohFgtd3RlkqktQ+VtCDCvRqK9SX+@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGqJadI1Naq5NbHnjsY8WqVNOCO1y8L/SOf4wEdaodxGDTw8A
	grOn+dV+v5piWAubE1ktuZPhDU77ngV8ixalxPi6FeskHkTjpO51zp4v+DvfE7m+h7iFjkNsZTS
	qac/OIH7mwLEKZjPExxfKn5NkbF1EBz1Upz6+2m/eMauJK/U2rXcHdeKI5W4zMLmiMAtN
X-Gm-Gg: ASbGncvxHeHrc9TCCDGRLG7x15PIZTbCrm3VLCIkw8GcSXJE1TaD5awutJ8zq8Y8UET
	+77BVTc1G+jDDcAqOwQKe2+9DLdv8+hiMXp14+wi8Qmg7xbyZkK6YujvIe6N+N42obouyVbsDjY
	Y2wW1+MiYxDSDtQUjcESJNgHNQa8Rzh1U4tE9fngvQK21pPYZsmLlaUA+wXh5k0ie2BPIPEK3Ge
	+I2aaTp9t0pKsKmhL+eUgYyFSBL14XC/54sz7eA40ryzdjUWTa9L7xK3SVEjVqbHoA4+g2YW6Mh
	qRx+pN1ZExHYt9sCZLeVjpGkKfYjWKfzJbE4uMlHZMh1RJi8sR2VGwEWXe4YwVeyKXIiBeP4AQR
	allCQVtVTU0AT0j3Tn48An4khwaXz/rdBqg==
X-Received: by 2002:a05:6a00:1b57:b0:7a9:d1ca:8a44 with SMTP id d2e1a72fcca58-7a9d1d9d2c1mr6108944b3a.24.1762189552376;
        Mon, 03 Nov 2025 09:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7nCpt2pmA1p/z363FYH3kIpWcm8j5TSHch0KWpmzexTdxO5el0iJ6fZJaaxezvkDjSttQfQ==
X-Received: by 2002:a05:6a00:1b57:b0:7a9:d1ca:8a44 with SMTP id d2e1a72fcca58-7a9d1d9d2c1mr6108911b3a.24.1762189551653;
        Mon, 03 Nov 2025 09:05:51 -0800 (PST)
Received: from [10.216.41.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aa3e645220sm5955873b3a.72.2025.11.03.09.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 09:05:51 -0800 (PST)
Message-ID: <1846a8df-62b4-2ee1-6d32-4d2937357b30@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 22:35:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v8 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
 <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
 <CAMRc=Mfh+WQx-vasZed6jWi5nUjg=K+ScVRBMCiFgK397=JbVg@mail.gmail.com>
 <da04aa57-f3dc-9bcd-5ba3-05088a6661ab@oss.qualcomm.com>
 <CAMRc=Mcj_6g3ory9zqxEWCHmpxh3hf4C-iBK0XT82F8nGVcFKQ@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mcj_6g3ory9zqxEWCHmpxh3hf4C-iBK0XT82F8nGVcFKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=6908e0f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oVS8WQ759SglhW3IA7sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE1MyBTYWx0ZWRfX4HLpzQmGGdHW
 X1A9w3crcCdp/gD1VjfzrtzdDqhXkKTqBnmJxPIZ1PKV54LcUTE+YgGJccmO3IjOAd87R2Nd2t/
 wCzUxN4CSwFykk48Leegnwy4947dk9CUNZMI92HAYBurNkgr+ryYimC+nN/YS83ZnPxv1yn0EH6
 POris+qis6bZIfYpGlCftj0Pxh2NELpDHtw6epCK+qeTuICZur1IS7kOpIbN4rYRep8ISHEjw51
 R6bvQjEj8QJiBdl2JxW+zzAvsqOzilcwUXyEzaJIzXr0YGmEFjOE1mpl8voB12mxZjA3Y1Qi9Da
 nR8G+H0J8ka5DWhRsM+ZtLkGTLI3e35k847YpvrjUKXknBRLNyfoBrP7Vf+MuFPEoqQEZPMEw13
 X/wS4Oo9/Xv3k8euWfoOTol5ePEpbg==
X-Proofpoint-ORIG-GUID: 5fN48Egq0BIrzIBgWgHCYtBTo1dtIRmW
X-Proofpoint-GUID: 5fN48Egq0BIrzIBgWgHCYtBTo1dtIRmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_03,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030153



On 11/3/2025 10:29 PM, Bartosz Golaszewski wrote:
> On Mon, Nov 3, 2025 at 5:16 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>>>> index 28979f95e51fbee94b84c1570a4d88a76f72db4e..0b6efa7c2bdc25a3ba152c25d5451d1154779ddd 100644
>>>> --- a/drivers/firmware/qcom/qcom_scm.c
>>>> +++ b/drivers/firmware/qcom/qcom_scm.c
>>>> @@ -47,7 +47,7 @@ struct qcom_scm {
>>>>         struct clk *iface_clk;
>>>>         struct clk *bus_clk;
>>>>         struct icc_path *path;
>>>> -       struct completion waitq_comp;
>>>> +       struct completion *waitq;
>>>
>>> Why this change? This makes the name less descriptive if not misleading.
>>
>> Want to make it dynamic array of waitq`s. Should the name be kept as
>> struct completion *waitq_comp; ?
>>
> 
> Yeah, can me waitq_comps if it's plural.
> 

Ack, Will change the name to struct completion *waitq_comps;.

thanks,
Shivendra

