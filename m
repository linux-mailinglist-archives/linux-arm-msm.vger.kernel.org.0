Return-Path: <linux-arm-msm+bounces-76002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54825BBD1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 08:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7E41881D85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 06:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A0721ADA4;
	Mon,  6 Oct 2025 06:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/a1/I8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BC1BD035
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 06:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759731688; cv=none; b=azkHAZvTdlI1BX+rKdmJAW8qaY/HYqu5/sCY2u/zWeCWCkYvTvFI5PEFh3BZUVN4IbcwLy9EU+s/UhGzE7ig89O5OkkNUBGWDW7P1rv/6NJgpiNxPgv2YprPE8J/P62xiavzMN9A8uAbQcAV77CDryYpDi2g6FJ3VveyHXittRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759731688; c=relaxed/simple;
	bh=1gKxYH6G5703madal3BzI9ccK5agAPITpacuVJtUDxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPh2wt2ti53O9eJl5AWlP7sQZucq1MtbK8nTba+Ostk9gxWdz5cV78QZdLvMYKPTCMZZ+nDWac9+fBcXLPfskQpNTpNRfgvvxn/XHd3LWuaB/3Mqy0wa+KvKu2fJKzdbkZyf+ZXWSvre7dk0qpvEomIdMlG79311FZb+GbhvDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/a1/I8Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NLPo0026488
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 06:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqBw6X+mphTJzKyTEbGzv9tl5aN8eM1+7umqmrnpPgc=; b=B/a1/I8QjwiXtAR0
	3U1kPjqkQDtCYhk68ISIl1rsAok2FZ4xylS4QL/Dt3EKtIySw8lzbSxDffV4iCX7
	vQubHp0xBsToZK9wfEUBQGfeW5QHLoBVwzABb12DzZLgi5zIqsQ9TZAuPKwl9x4h
	CLiXN1Kr9kGAtFE5pfCeqKU4QFulpaTO/uiIMnyWPz0fbhdiU2xDuBoKc4g1nQaF
	BR73AcsawyyjohiUuixAkxw42SHyixZcRS096VfAZywlqMhYd68MfZxBo1TrA+Yr
	bWuWojtOt8nvzJ9M+EjOF/r9UgKQoQ6Gi52vpFeDVfr0w11v9vBH2zyp1lmoquvA
	4nqJkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1k205-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 06:21:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fbaso59927055ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 23:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759731685; x=1760336485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqBw6X+mphTJzKyTEbGzv9tl5aN8eM1+7umqmrnpPgc=;
        b=hgZR/G0Coh0Gqx+Od2+OhrQpAmwYZyZH33dfX8+U2ypUL5YL/9Kd32LRBh4YmVJsQ0
         yNG/GODbt/nscHweWAIfzqp1ja7lCRCpZg3aAc6fpad7qNQWzFFcnb8vOVQ1mbWIyaa6
         4/lO25DFtNoaCTHmSFI/Nui71vUa8tG8tkx+xDT+6hj7PXhWIGNOqsZDZfSYz96aflRQ
         oJic1Pa+uhqc5+BnWPxjwiGvfGZHTsVo5lQN8h4QWnQz/wJMmYaUOcPRdm4LBNMt/TWI
         cX0bxmCtaRs9vgSk4UDlQeLCmi9U8jIVajTi0e34nBK9fNcWCl4mymNN4olFxEgh9NkU
         gBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNnhXKJsMrQLlOvswFqDQBNuG7qW8yKs0CSascAoWku65e+TVQIOiZ9KBoQS8iBVxuSiwF2qK1XNwZsHLy@vger.kernel.org
X-Gm-Message-State: AOJu0YydJw9netCQP53bGvAnNnchIdG5ksvHzK69NRJ7Isto1aLHsFTo
	MsG9lSfUnwmqvtswVM1HH+2nor+bmGHQC6QLeGn3E6/NzqwhaYSy9FVxNEJWGy27Qs8vStD60A1
	2gWpVGZ5g7GRgkbMTE33WeM9spIjtTsh/CLsiDR4PzlRGOP08dAeej8Kphekj0rpM6AXb
X-Gm-Gg: ASbGncutxJbT70614+Z8uJ5heLJyPwDZNIh8gFPCxG6mzuVLHXj6dYvVgQbVNitsbzB
	Lxjh17/6wn3A/v6gYDowtdi+re6WQTnSETlsdujQOltC1YaMHiCtz6pVYL/bPkIc7OiZldNig+G
	AucWawgn/Nwgm0IdUduLUE/2jLTo8m/APd+jzS44fnIUo0lGv20CPj2s9d1I9wy2vKJcxsADHsP
	OzoEDNscDwuTL1w3mQ85O8rBlY54TiBLiyzH6T+3E26zy3hRDR11vfsLUhu0ubIkiYtMdheAIlr
	AzJjPnMbNNjQh5oy43bWPFjdupMXIvSNhBl8naOrXZrxqHnp4N20OmwXFulfpuOKrGZ6UHAEcmx
	bM0A7JQ==
X-Received: by 2002:a17:902:ef09:b0:261:6d61:f28d with SMTP id d9443c01a7336-28e9a645b1amr126922525ad.50.1759731685348;
        Sun, 05 Oct 2025 23:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGDksJqEPnSCh/NIBWbkuUWFPnHcA9o8p5jALbq1jKgZg83zpF/wA8wpZbS8GZG8Ail/L3Gw==
X-Received: by 2002:a17:902:ef09:b0:261:6d61:f28d with SMTP id d9443c01a7336-28e9a645b1amr126922195ad.50.1759731684742;
        Sun, 05 Oct 2025 23:21:24 -0700 (PDT)
Received: from [10.204.101.149] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0d4esm15497887a91.17.2025.10.05.23.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 23:21:24 -0700 (PDT)
Message-ID: <66d3b851-5b29-ca88-53de-a4126c2b5366@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:51:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
 <mL8al4KIcE6PTrBxdJa_2UyBCdazqiqrW-cNH0h4hU0lxL9e1BBoPQwqSqafI_KMAHfhK014iRoKVkQmrds0dw==@protonmail.internalid>
 <5e7f20ee-7960-4a1b-bbf2-b5f5330e1527@linaro.org>
 <d603c0d3-4dd5-4ea0-8a31-47e6dd03ffd7@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <d603c0d3-4dd5-4ea0-8a31-47e6dd03ffd7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b05LfedKEfkY2pl_mbPBk6-lNLltA445
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX8VYc3iYLJtOM
 +UbJEC5IzQwmVq8BrhrpovnhTIyg78GKZ46KsjJH+gCCHpov/IWcLo1VZOWgb5pCDMo9RLGKijo
 SYVa2w1pTlKJ/7goad32O9OH0qXvdMxPqAUK4Z/MEAJbew+RKhNUhT93mlsEh9RKsdsdyBOb6a0
 AIayjAlXUkqfrh2AJi8YNfJaZHsMhX6WWLNy75k0pkEhwuyCKa6mosdDEp0L4y92RUDF6PWkcDM
 Jv49mTPUeDwp2rpLpBCttdYlD7DAZ9pVeaULUh6oNbsqSbkuPVyC3q9yB6wAtPahr/48KoVre5k
 5Hwjb/bKBZte4jlo9WPSfb5TuE7y/Xq/jVwi53u1cFbp3pkzkFGbpokVqYDVpq1VgyQvs/nc4H1
 NGyZQnWzQ37itjgDt6SPfP5wo1XZtg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e35fe6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VHB8iGSYPZFVdnVCWEgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b05LfedKEfkY2pl_mbPBk6-lNLltA445
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027



On 10/1/2025 8:34 PM, Bryan O'Donoghue wrote:
> On 01/10/2025 09:36, Neil Armstrong wrote:
>> On 9/24/25 15:28, Bryan O'Donoghue wrote:
>>> On 19/09/2025 16:47, Dikshita Agarwal wrote:
>>>> Introduce handling for the QC08C format in the decoder.
>>>> Update format checks and configuration to enable decoding of QC08C
>>>> streams.
>>>
>>> Since QC08C is a Qualcomm specific pixel format, you should detail in
>>> your commit log exactly what the packing/ordering of pixels is.
>>>
>>> In other words tell the reader more about QC08C.
>>
>> This has been upstreamed 3y ago for venus, which is the same as iris:
>> https://lore.kernel.org/all/20220117155559.234026-1-stanimir.varbanov@linaro.org/
>>
>> No need to re-explain it for iris, the format is the same.
>>
>> Neil
> Yeah no, at a minimum the explanation of NV12 + UBWC should appear in the
> commit log for this format.

Please see [1] in case it was missed

[1]:
https://lore.kernel.org/linux-media/10bb819d-105b-5471-b3a6-774fce134eb6@oss.qualcomm.com/

Thanks,
Dikshita
> 
> thx
> ---
> bod

