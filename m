Return-Path: <linux-arm-msm+bounces-97602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OoSNHBItGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:25:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73028813D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20D313004433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93A23CBE8A;
	Fri, 13 Mar 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcnxHi78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyPOOsRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80953C9ED4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422696; cv=none; b=KLmHjp6nV5xzGOpgd2AiQaMw4pFw/5hsq/4uFy6lzetzUnXc8HZPHb1dXonQrktvD+Y7WfxzAeAW92c7QHf86DZMj1FR1gXIlSCqybqXRSc2F+KUWr+NvfuIVDaS6pJkAcNjggElZmwyO2FKy1QO8c0OKpBO+jt8QQlgGyNMnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422696; c=relaxed/simple;
	bh=RYUtDu4/ksEGv2btHhMUsGqDiMCF5NNiK6mOhT67obA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfV9XJ17aNXXOOtKVu5ud62E6ZQgmapVdVCdsYss5oGcN7LTvUXqpb958u4nKPTgoXJ5RZatny/m3MYF6Y4AE4KjFcHqYf38sfG1Pe5dbMNfB0zSxAPc9Bys6Thp3VtwsC3IZ6N1ng3uOwuRju0SOJl1WbMFIu1Fuyrr7i9ViKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcnxHi78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyPOOsRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXK86437822
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=; b=PcnxHi78X2qZcKs5
	zimmNyty7xM9XtxC9lw3mmn0xUAiy4v+pQYpSTY2r0VMd/MljAIRFLz18DiJpLs2
	oeDNPoQ+POmYO0wk48tJ4k2kciJTcu0cXUxXlXISzKMxR+Cl8N7lxJD3wzCcAUMe
	eBhxJ0rF4SL1lEgZLpMuPJvs3doQJIRpeWcZy17lFSpj2Pw02pzomt2bmaV2nse8
	IMN2IwpF8d9JrA+lYv6OLZ12Ft5bCJxPC+AF6ZLYREJlZYTKp1mURtKLRU3X6ndv
	zyBHH06q0n12N3N+foD9zEWZPLgLMiVmvADg/tlxlrjFiBc3UqkhY1L+Y0vwCRg/
	6qpvXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8cr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:24:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3e462daeso15598875ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422694; x=1774027494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=;
        b=jyPOOsRk8WYckMrFzEy67hDPOTgb5LjKxUBgVORMNwRPd2xfVvr9hyJdrDUeiiwUb+
         XdAn/OB4ddrHUo+kGpwAGeC7pBv6SAO7NhRczlTrFrpheiaZq0f4cwXnfrsYKAbvjLhY
         bzAqdZBrIzRvovITLauj8fsbYTI7s3ToXmG3f2n/g24ecHzR6+JL78MKVNNVYgJKipw2
         lMfp3h2hf7FUXAmAVOybBLlzFbzciz+Dfi3GBFvupjJTAa3ff2BN7mQkaCr6+25ansvB
         YBDfRezVUMwUSruylz+K6h289TSEdCEb0vnt2g4c1msrM/Zib2iChdNUw5nTVB2st4Ob
         PH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422694; x=1774027494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=;
        b=cdJ4TUAGGbjUm2yQzy3+7gkJ7GRAVKD+S0qyj1wSfjtwQ2xapNwbZW5HoSIsHmPMWD
         o8sGbouY6n0zBs8/ecfkWWEPOaLvq+d6LrgPugyJIqkZn6oA6nS6M5yOw90vs7tiDsSd
         Si+gp6NSH97Nl6RpoegnR+4aG+uh/Y7ZYuSs+5MgIPt6AekHCkGlowyadhbBUsLvtbDV
         wAoWzc4h0GGIklx/a5LdSDTyhM+YCKVQVEZ0NZR+Y9RGsEEQ/yVV6c9jOHk1R5I2FcZw
         JpPmDIbD5p/h2mTwPaVQ2VODdRSCacwvmnS4wnT1fYBgYwK6s97IukeuVuzWKYFoZrX9
         +VSg==
X-Forwarded-Encrypted: i=1; AJvYcCVvo1zVaEeuzOGNWHQFvMvwG6wKkGsiwFuTEIc5ERaZM9SfQ0mag3tOHj+gU65Zm7FHmLOUhjBe6111M9Dr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XxgFZ81Vh0Oi8PDufK1eRbVWbyztmxqiZ36jrczNzT8KJagA
	0+bowZd1ftQJ5Lvo9zqMotyvR7wItxjKEx0YoS40hVz5ZA9tGWN+v+TnZ9AIV9lv5pUihxam61Q
	Arr0+B235H0iFuIy9eOC9prL/XNuU2o5HWgPOqMtYmM66PfB7L/nETDu6r5BVng7RNy+W
X-Gm-Gg: ATEYQzyQAeqk6QC+Fa+RWJIcRCppru7AAQpJrXwTaxqdlXa8QDeA4k6SzMIPb2ta0yP
	nt0BYxub2rhjqIamejt1o8+Y3417BAFlscfRmjuXpqrVFgZS9VtDOlkaG6cs0XuJKOpNKMRVb42
	Bvwv+tzHXLqG4vXk4/HuxQXtAMmO+bxP5lgi265yEeuMDRqv1tCGQqtEkEPIvzLZKDmrf2q+ONY
	xQzbliI41na5geUvqKf5WP/JRpsLJT0stV2cgLtUkw82G4UI5oS2Jn0ISYzNCxIkHyqnag0/tyW
	jB6elpzngaPSvThOPsWqfqxt/oVljFuOxirFCUTt2p9Figy4wCBRPdb8MZPE/chhcLPCr15i2fA
	Zu9uxzJKFazOaMcw1OkGDDtPJb/f2zijWzEZHjq1QJN8=
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr37715385ad.38.1773422693611;
        Fri, 13 Mar 2026 10:24:53 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr37715155ad.38.1773422693145;
        Fri, 13 Mar 2026 10:24:53 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83d391sm35439165ad.79.2026.03.13.10.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 10:24:52 -0700 (PDT)
Message-ID: <a088d852-a813-4537-b20c-1dcc4d166597@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <44xgivai4jqlc7f5xxe6yohzrqicb2sgso465xuip66n5tatqt@6cu2u4erpe5j>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <44xgivai4jqlc7f5xxe6yohzrqicb2sgso465xuip66n5tatqt@6cu2u4erpe5j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _1xwNZRU_TjvV3-7heMzAanR2X81lEly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOSBTYWx0ZWRfXy2vXXdgIna66
 5VBl/gbY3IlFCamVXPMXc6Vhh6iG8Qcjm/kX9uy1nBZAJlJ9UVYlz88L02/+UeyfjgEBBDiREsP
 oNaTntrlT3g6l8AH3y2G7srX4PI5/4u5OqhmI5ptdFtXYC0ycSRvQMK70uJtMpa/5KHUqu1a/6D
 lbMh1jhAA7Mz6YEWLoWeEjHsD4ok1Ht/8PVDK9yWf6rYA8Jg8qQrZl2fTMWAOB6QszgbkQEf2T2
 Ku+9Oxy4r3YOhpDrpdDEdQ28ZePPp32rD9DgT5jZh2uS9D2iS54nxctQeP6Wz+x9ro9mRDEWiVa
 aayPaW7HFxYpvqorx2yEZpvc0NMCzo9ueJ3+rFfDllTk4EtbYo46RajbKFnyj+PPgVwwRkKrKBr
 TNxTxzotf3CpRv1OG6hWZKoxKg1n8ObiO3TS17NZTWKi7Un0/XpSPLjCmTFbzkLYGNw4fk+4yzC
 /DMdZ9OFgpma2LZvUSQ==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b44866 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EhmMhbG5NVnfTD3xWHIiWQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VOWR3M7HpeV8rc-S3HoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: _1xwNZRU_TjvV3-7heMzAanR2X81lEly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97602-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF73028813D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 8:05 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 03:59:52PM +0530, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  12 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 468 +++++++++++++++++++++++++++++++++
>>  4 files changed, 489 insertions(+)
>>
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,468 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Drop the year from Qualcomm copyright, please.

Will fix in v5.

> 
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/thermal.h>
> 
> Please add <linux/slab.h> and <linux/interrupt.h>

Will add both headers in v5.

> 
> With that and with the typo fixed,

Thanks for the review!

> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 

-- 
Best Regards,
Anvesh


