Return-Path: <linux-arm-msm+bounces-95191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CjHKf4np2nSfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:27:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043F1F54CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F41A300D755
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12305370D71;
	Tue,  3 Mar 2026 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHOGoSDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4GFYWTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571F36B055
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562428; cv=none; b=gzvAtzwRvmel9WGYy7JYtKPiaoII6cTrXRh7s26FBVlLHWX6owxPH2pZS85pOZTDmIo/+0tLdjVwiB4zVitB5XVv0FZZY61jvG1BDBrcex0oi6iFZdF1fd85HVbBobUjDzy+t9zUyJlJp69PKKwYfGT7Go3qVtHqV06RH4E2FoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562428; c=relaxed/simple;
	bh=c2NFnJIc71DDZiAySYYRCxrOWh1tu9lCMtz9n2Hu7w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II494p5YWXZ770ZJ+RuMHLy9qSCERDW46ETCM4bJO6ewfCMTbCpfOaH2ibxCQeVSTdqWpUgaAeyf1drMnOelzTwc9S6Tp0uTa5FvpkZCZvNkI6za9z3ntrXvXRDZuj+ypV1yHFlxmQgGnCyGdtwpgLRmxAQF7zDd+0HWkePM8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHOGoSDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4GFYWTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H1G1t728169
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYGxjAWQoxFG5EFf4xvdURSIz0MaHyEsN6qzt6ChCaM=; b=LHOGoSDPyCOJGLwz
	ODkWI8xjGje3ur1f5gPBuGxM7D3wMrsgvo2naVINiDA3CNCdLbE8r5qv+gZ5Eig4
	m1vzvXtMoUhmMnQgiMRSpukfuU4CuTYf1bF4TU+SF8Nm1fplrkrKCiq9eFOInbf2
	kKAk4BweiP8bp7EyEF921mqgwXj1k8z+CJsHlRKW2poXlOTlsEggfEzbEOrD/0O8
	xdXmCQUNkCMioiPzyuY5Q39+dBDRnSPQRzltMmUmi3f+ySTAhXmaV9LuvI5bgiON
	u5UDWqMMkHOjHZt7T1ILFsljkcrQieKRWYwndBk8VIofkGseCgs+noWC5GEVlE+H
	ZPHTOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5ftneg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:27:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8295e8e9a36so2195117b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772562424; x=1773167224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYGxjAWQoxFG5EFf4xvdURSIz0MaHyEsN6qzt6ChCaM=;
        b=B4GFYWTyr0al+aSyIP2MO3/8ur/0ZGsX/b1NzplDtGWTnG4E6OE5ADORbNIGg1ZZN+
         uBm+ZU6sKK/T1jBzPX6cHwVLQxOj19xneiUiNYXb3WIREE3R3+Z9ZuqvoKeAqYegfbGp
         LBAAN58f/1TiMRFSxl/j0JzMXLfuYlxxakx4M9w1jkMj/yLvnMz1RTqZJP7oSDkugm/v
         lqOqp0njtuPfezV7FNa5Kg+NtSs5bwT8aFtY6h+2q4PO5f3mU8GVg5w+69r5myrkNC/p
         k5wx0pXWXNKKI3YM7xIrLY5Z9s49Zr9cXtkiGxhbwIZUNl/vRTjDtpr0bh+VPMLbS9gX
         2NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772562424; x=1773167224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYGxjAWQoxFG5EFf4xvdURSIz0MaHyEsN6qzt6ChCaM=;
        b=H4ozQcQC1pYqYxMmlzQrJ/9KTNWT7DTQTJMAkgTffs/YVs+IJSRHlW8Cvac72AF9Qv
         5Kravd0N5Q1XZx1UGUebAE3LHWJoIiPzH2zz7pwrXhlDQyRCNGsmt/0whizdiWSU8UUR
         02RP+52KgYDBMB7NWg+by3B1eWc8NbbqUdvUP3IIXsuyqdCcTZlvFIUxvDadBCEmhjRb
         FPyYZQmZs8Dm2TQXUPdrHd3xVImff1U6j7Em9Odki/euFas8JXYEVjJ0ISx/CosmcDOv
         Vt12jirmaRLczwa9+WdH5srkHogvx/+IyMgk014nZFCU5oeb/pHsBJ3C6kk72B7aB3Nj
         1ptQ==
X-Gm-Message-State: AOJu0Yxje9aZnb6exdqCjC/+iO5U0NvmUJwbfSfpOIgISdDoGvUiXHzU
	BWcizidxI2X0e/7x6gK9H0Iz9+oYYHR0aHnsUia0Q9jBntSZq9hU3DNX39uHIHBrwTVF+eB48sd
	yrwN2JbUKGBqEGUvWG1hEQCnnkwBjhNLnmAkteDDT7q28q2PxIFgPV4Z6Hw9m382pkD+f
X-Gm-Gg: ATEYQzxaiRjT02ymLFn4ZI9RmI18hah//pGKCI4jNaCupxpSoeg1yOqc3h72KOiMumS
	BEm3XWYficb4UdiAB0yanUqJ4SWdvAN+nYr2iORTJg4QeL6TrEv+pugrJWlILRFNRaE1aZ0Cie0
	vk+HTuGolXlhVAoohCjFwBQM9IAf3aN6j+S45n0aBg5Hpptd21pzIrSlfavgJjJEqipUwh6pHEj
	J9EwCtsJ7ltgXbpNh0kHvaTsAYyzXInE+Z46Y6EGwPhROv+mje4nfbq5MwuJ6YdeOLbbro0w9lN
	V5XhI1OcYLTBbQZGijkTaVEf2hbPF0LtvwJm5CouRGE0W7OT8ZZie2cpfnDLYU9sKWIEQdeuu+y
	mgYIvMj2T2sPBjbtoVV5fXMM+FkM9j+VgeHcyfiqTOcrfmr/RfhFf/A0=
X-Received: by 2002:a05:6a00:3a2a:b0:824:a81e:97b5 with SMTP id d2e1a72fcca58-8274d9f452emr17084690b3a.38.1772562424456;
        Tue, 03 Mar 2026 10:27:04 -0800 (PST)
X-Received: by 2002:a05:6a00:3a2a:b0:824:a81e:97b5 with SMTP id d2e1a72fcca58-8274d9f452emr17084650b3a.38.1772562423945;
        Tue, 03 Mar 2026 10:27:03 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1ca9sm15764781b3a.36.2026.03.03.10.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:27:03 -0800 (PST)
Message-ID: <6dd03335-5fbe-4e01-9929-fcea8e5c0128@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 23:56:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] media: iris: add iris vpu bus support and register
 it with iommu_buses
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
 <20257f68-04cf-40fa-9f0b-bd798e62b7eb@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20257f68-04cf-40fa-9f0b-bd798e62b7eb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a727fa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lkRiF8b6XqOJfXNWt28A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hhEHrychcbmhJ_NbCnPBbh-MWO5iH0aN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0OSBTYWx0ZWRfX9UFqIZP5A/20
 2AmR/G3kyIHfpRsBs3jNV/TKp94yQIcIxdmblvuX8JH82p2rs29HIJR1JO3DclxoNf08WOWVyzR
 CJBxDEvptFiV7cjgq7egEC1rygqm2bTbDrnMZgEmrvNMwtqLiGhZJejlsd0wjOpZEtYns/gM9VK
 LO+cUeQhXb8riPSI6SXpl36Ns85iO0ZYIETjMdVR/ITYqf1W/6Li3NYf9LUmJetC8rV5Os2V6P7
 kR9CRBDkEOgTFF8v01KjK6uzmNNVaLIp+Ee396yTZX/p3Tm85GxNBB5xbDoCFZkEIT/sWdN4o9H
 cZsecu0n5yxOedeoCYrdZCQ3/bgqm6PvAAMiqZevrdaD8BUVWZULWgtKT+AGXddtPSsCcHaVMS2
 u2MVBk9OSHOvMQedeVXJwbcqoR9+plpVeoKqoa6K0F5XvMDGFZDXGLdk5omwJwUw7STazZByf23
 vhPR5rpQBngq4A5Li3g==
X-Proofpoint-GUID: hhEHrychcbmhJ_NbCnPBbh-MWO5iH0aN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030149
X-Rspamd-Queue-Id: 5043F1F54CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95191-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/27/2026 9:19 PM, Krzysztof Kozlowski wrote:
> On 27/02/2026 15:11, Vikash Garodia wrote:
>> Add iris vpu bus support and hooks the new bus into the iommu_buses
>> list. Iris devices need their own bus so that each iris device can run
>> its own dma_configure() logic.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/iommu.c                           |  4 ++++
>>   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>>   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>>   4 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/bug.h>
>>   #include <linux/types.h>
>>   #include <linux/init.h>
>> +#include <linux/iris_vpu_bus.h>
>>   #include <linux/export.h>
>>   #include <linux/slab.h>
>>   #include <linux/errno.h>
>> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>>   #ifdef CONFIG_CDX_BUS
>>   	&cdx_bus_type,
>>   #endif
>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
>> +	&iris_vpu_bus_type,
>> +#endif
>>   };
>>   
>>   /*
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>>   endif
>>   
>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>> +
>> +ifdef CONFIG_VIDEO_QCOM_IRIS
>> +obj-y += iris_vpu_bus.o
>> +endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..34ce78d9b0ff1feda15ba4f060a56d02749a0858
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/of_device.h>
>> +
>> +#include "iris_platform_common.h"
>> +
>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>> +{
>> +	struct iris_context_bank *cb = dev_get_drvdata(dev);
>> +
>> +	if (!cb)
>> +		return -ENODEV;
>> +
>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
> 
> 
> Apply this patch and build it. Does it build?

it was incorrectly organized, since the struct was defined in subsequent 
patch. Will fix this in next revision.

> 
> Best regards,
> Krzysztof

Regards,
Vikash

