Return-Path: <linux-arm-msm+bounces-78860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE8C0CA3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90F4D1881D07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA75200BAE;
	Mon, 27 Oct 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCV6x9oH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488692E8E1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557095; cv=none; b=iZBOWS8/SiAiXRdfXS2JSnF9NgJdklQ21HhvlbIQf7Qr2gWNiBU/brhJ6sGAavOGQHAaEwoPLUAJlvq40fvijzUlz5gQtzPTyabAz7X0qP6CTvErcp5243X3dZ6i4ZkvI3H1JkV8q+IRGKzrPKTpAmMH/hX7tHC2fTBunexOQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557095; c=relaxed/simple;
	bh=hgq9c1yD2yEo9HG1HdxUXdZbXXExb9ucX0lGtUfV0DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIT0VRtFmy3On9GBmo2Uo6sXDhkX9s6xjX74tFHspYCDgKWnTteYdGlxIhDoj+1AJvPVBWXNYAYjJJ6v64Vw3TIJnlKf9dTtYa3rW0gXviTjpFiuDdn9dTWAnz1BaEtBMapcjNaqThtbz/ooW5B2kXpx3NCUdcbGKeim1VBSIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCV6x9oH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8UBP81108656
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykKfkihjFSpy5A7Zw6nBytLo5ZdUJJy6OlfC28a04XY=; b=aCV6x9oH2nRvJ00R
	zYQD4TKWRATdIKcDtCd4gpu2C5vs7Xxr+r38/Wb9yP0++UMrSmJu+HqUTCPXXq3k
	QLhYbSjcnrRlKZgZIXohIlDMNYNq/KRJCOXxibfvBc9Xp9Nd5NDm6+H8+k1R66fO
	Jtb+zaRXEzYTU+4kp7MB0rfFxsHyc7OTZB6cBXsic7KuSqgyL0ro7JFzJkXv//qi
	1faZXo11lW/AEZFF+5CiB77UQ9RsKhuA/KTc8qHvcK5kXKthum46e3AxpfHMAFx7
	4vKGeOPrCn1RkMej1SNIQr6YwlF9ANaZrhGJ2PM/ppGR4escNb8spo7b7hYHtdt7
	MoGJ4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p2q40cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:24:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26985173d8eso115340505ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 02:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557093; x=1762161893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykKfkihjFSpy5A7Zw6nBytLo5ZdUJJy6OlfC28a04XY=;
        b=JNsoewq+UeGH3iMKXiIR2FzpA5ewZNTOlDWGs3ofC5vowALm3jyo5d3HNeImzQ8KLp
         IJ3O8mCtmgHjpZTnI18EGTxdynTLKTZWvIP2gYIznP8jemY+bIivQs+CFYlcRT4/+Pol
         4s299Q9lv6n79psJOlJw8xjYVwE5mgtjpK8kIY2++U7ugR4bFIbHIEC8Tq7j4h5joGAj
         O6p8Gg4UTWRyYGLRkjHI3bfRBdPo20OV9lJ+GyGocyjvuc/+RndQaBc4hArX/LmRFbxn
         14L1cG5ZPhQrJl8BFjoMY5cZsbRgQG9Lg8WfG5J/OwRyxtBrBqhfqIPP5MZFzqJGDcKu
         jTtg==
X-Gm-Message-State: AOJu0YyqCu0fkrWJATsc5quAiDGMZuEMueTPz8hUHM5Ha+K8rNbC2fO/
	jMBjgL6R+/wvgJyDw2A9tX5PS6BQ1jvmLEfXuVfzgQPgHB0gH0/q0lqmxX5mEGvwVkhr6cErmj4
	5N4O297jbMO/uZ8tUltk9Q0geFK8wgwducJFXmhCcDsogyg/DQA5VStzrNHgK8MEdNlOI
X-Gm-Gg: ASbGncsmqhWMYkm+4PKUCfIYg5czt2HCi5oC2sEJRguAz3i89fEyL3ZssoukaBrC35d
	HCVxXecJz9D1vwBkg6zM5EjABzeEk1VKlrcpgpgX+Qcw6kHu9sorYZTZHz2jDldiSOAEUDYt+rB
	b+lKs8nu/P33BFbqsSteeOwo8HQ+/mCtEO0EUlCak65cZ/nVowBKMg2Ga99UvMeD/kMXwcH0Bd9
	BqEZ+8/ctTHRrPVwRMp9HWorUzrFVgyiSXtp8Vxi8lgaEx4VFzlIJCB81uz1Qpo5WsCLS/TuXLc
	xE2/ygBnz4a8qbsWuxexg3afdegbT5brT+fX1ojktp6ErVZ1MfQFaXzZ9vlvJqdEkV6hI7UJBOO
	cfZvXedUiGYJvh3sN4hDANQG9FKTd
X-Received: by 2002:a17:902:d510:b0:267:776b:a31a with SMTP id d9443c01a7336-290ca121a37mr489283215ad.29.1761557092850;
        Mon, 27 Oct 2025 02:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoqnglA0UI51Wei68+VK5do5gYXJuNgaPESEhOmXS2bmE6WOPNQO+FVMycseqQCXytLkXHXQ==
X-Received: by 2002:a17:902:d510:b0:267:776b:a31a with SMTP id d9443c01a7336-290ca121a37mr489282905ad.29.1761557092343;
        Mon, 27 Oct 2025 02:24:52 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed6c4e78sm3943968a91.2.2025.10.27.02.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:24:52 -0700 (PDT)
Message-ID: <784de75a-2821-46f2-a6d0-a4c4a6a13dfe@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:54:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
 <20251024-pmic_arb_v8-v3-3-cad8d6a2cbc0@oss.qualcomm.com>
 <0cd8f4d4-d418-4634-abaf-f66b350c81eb@linaro.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <0cd8f4d4-d418-4634-abaf-f66b350c81eb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QvpTHFyd c=1 sm=1 tr=0 ts=68ff3a65 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PRCy_2JfRc9Wa6eopEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4NyBTYWx0ZWRfX2veOw1fKaBw/
 Z0u95KVXzah2ovaPOqdEkIMHFjuSXpKALPoMdC09cZ1fc0VqPwc58xHPfUU3Y+ouboXkQSSFDH3
 KRZb8tmGNxpkuMhQli+0hliZ2g89T+rOjrZad+vxzZCujwCRmgAtJQCKGlOF6y6b/i5UtnfrDDJ
 4ut9laQO619f2hO52vzkEsYtJ9NMdqbfx3ezbBHqNQcfJH0jiDgeInUG+n1Cq22bYBTPSc5jL14
 J3z7A2jkKpqN+Yf4w3t0wJjzmgrQsi74G5XVUsuOh+MjY4NMp9KPygzFTYt85VJiPf67nbVDa/R
 Fd5F4cGIG0YqkxypPTljkLqoqR7YkRnAg/UOjz3vcKX97Vl2FzDmm6glPpLKUQCK0J+2ZaNXP0H
 HKD0UT337sZnJuDTd4CKrm3oi+/UQw==
X-Proofpoint-GUID: Sf8NFM--4YdOSNQcvVTOIS9pDG2BbQKU
X-Proofpoint-ORIG-GUID: Sf8NFM--4YdOSNQcvVTOIS9pDG2BbQKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270087

Hi Neil,

On 10/24/2025 3:48 PM, Neil Armstrong wrote:
> Hi,
> 
> On 10/24/25 11:33, Jishnu Prakash wrote:
>> From: David Collins <david.collins@oss.qualcomm.com>
>>
>> PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
>> peripherals.  Its register map differs from v7 as several fields
>> increased in size. Add support for PMIC arbiter version 8.
>>
>> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>   drivers/spmi/spmi-pmic-arb.c | 324 +++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 294 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 91581974ef84..612736973e4b 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
>>    */
>>   #include <linux/bitmap.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/delay.h>
>>   #include <linux/err.h>
>>   #include <linux/interrupt.h>
>> @@ -25,10 +26,12 @@
>>   #define PMIC_ARB_VERSION_V3_MIN        0x30000000
>>   #define PMIC_ARB_VERSION_V5_MIN        0x50000000
>>   #define PMIC_ARB_VERSION_V7_MIN        0x70000000
>> +#define PMIC_ARB_VERSION_V8_MIN        0x80000000
>>   #define PMIC_ARB_INT_EN            0x0004
>>     #define PMIC_ARB_FEATURES        0x0004
>>   #define PMIC_ARB_FEATURES_PERIPH_MASK    GENMASK(10, 0)
>> +#define PMIC_ARB_FEATURES_V8_PERIPH_MASK    GENMASK(12, 0)
>>     #define PMIC_ARB_FEATURES1        0x0008
>>   @@ -50,9 +53,10 @@
>>   #define SPMI_MAPPING_BIT_IS_1_RESULT(X)    (((X) >> 0) & 0xFF)
>>     #define SPMI_MAPPING_TABLE_TREE_DEPTH    16    /* Maximum of 16-bits */
>> -#define PMIC_ARB_MAX_PPID        BIT(12) /* PPID is 12bit */
>> +#define PMIC_ARB_MAX_PPID        BIT(13)
>>   #define PMIC_ARB_APID_VALID        BIT(15)
>>   #define PMIC_ARB_CHAN_IS_IRQ_OWNER(reg)    ((reg) & BIT(24))
>> +#define PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(reg)    ((reg) & BIT(31))
>>   #define INVALID_EE                0xFF
>>     /* Ownership Table */
>> @@ -96,30 +100,33 @@ enum pmic_arb_channel {
>>       PMIC_ARB_CHANNEL_OBS,
>>   };
>>   -#define PMIC_ARB_MAX_BUSES        2
>> +#define PMIC_ARB_MAX_BUSES        4
> 
> Why PMIC_ARB_MAX_BUSES is changed to 4 ?

PMIC_ARB_MAX_BUSES is used only in the definition of
struct spmi_pmic_arb, for this member:

	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];

The PMIC Arbiter v8 is capable of supporting up to 4
SPMI buses, so this change is needed to support it.

Thanks,
Jishnu

> 
> Neil
> 
> <snip>
> 


