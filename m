Return-Path: <linux-arm-msm+bounces-96272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHcoF4vZrmmKJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:30:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8D23A8CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5C37307B561
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7675E3BE16B;
	Mon,  9 Mar 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en1MnWJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vy6Q4fNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25826262FDC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066348; cv=none; b=II/z1cQcWBs2IJaoYhT2rBQTeHAMnsUg/ZMt/InMj6B19OfKiyltwIqcMFVqH/GeJaf48hs5qoCyFVIqdIWoqwirlpcMMP8OQwFX4au/l7gqEg4mTmEgPo3EQV+1OKaX1+t+wIgw1fxQWYwVMW8byCRF4N/VhED72Ez5yj6bdtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066348; c=relaxed/simple;
	bh=OgwCL6wtFQ6pj2MbVQ+aQMEXepn+nIhWnb6tqbbRseQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h4xvF0eKJq2EMs5IyKgJuBCcuaxdzvmCX4/Xu5MpUZ98IPIMj/kwCm/JLKWYubM/lfmxCOzkBcGuLnjIINhN2RVZHbR3m2PRyfDWNBBXwCQMtJ4lHUBAEsjfPZO+Jscg/iPbA2COnQKJk+D83SMhTw7p+dAI2bWh7oC+6qAvIJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en1MnWJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vy6Q4fNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629BMD3o1577725
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3HKGFxJsqnEzVVfvTggPuLP8AphG6db+EDmeHUq/Mw=; b=en1MnWJMsyehApdT
	8rWMyzwnvhOpWUdS5aQfbCAVYWyTE6F/p7QJ1jkDDUK9C7DiyprqSLFVheE1cij4
	s6lyvF2D0ZDFuW749LskIbZ8RrOteQYlMILWV99MvrNcFHh+RAUYgQs0PnTePAVg
	CsjIWh5mCy5aXCQ2ase/Fjpm4d+Zj28+Vv6a99b6zYs6BkACgPnj1LyWTWz5kr0O
	TT+vVmimBEPdmYuoqtC6xNGybctnC54AR0pyNP4f1tYXKl9dS0pHXYR3EdWBCDEU
	e5d+WIdfRtbNmZf+80reVm4q0fcg6eZZ6O1AVZbI3d4bHb3TwIPbmusaf2O5C8cJ
	oHP/Kw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qex2f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:25:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738662b963so3168377a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773066346; x=1773671146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3HKGFxJsqnEzVVfvTggPuLP8AphG6db+EDmeHUq/Mw=;
        b=Vy6Q4fNzwsvEANa9f2IxI/YYT1iPb80nEVi6X62ukL4hJj19vRvh5Yo2HNaUjgNKkT
         s8gHmMGV/z0/OWEXtODCwfDB/9wk2zojOQpI958OpvNJr9m7Rk1T1iza/KMtQTvykmHR
         4N3KS5AhuZd4QH7RX7Srew2auzYwE8nAd7JCdsERZNqcMktIXyGX1UENinBBxn5baUBZ
         5/4JydFQSYt/Fzh+gMDTlXnsS+1cgfRWoH0wQpk7I48RoaOKbZJQ0/5D8TxqO1fSA4W6
         5Yd2GBMDoGdq1BbzPexo24+Gw44YfkIjx8EE86RXTS/pBeDTRTU2pXxP5TzY/YUDAZ0b
         Yfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066346; x=1773671146;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3HKGFxJsqnEzVVfvTggPuLP8AphG6db+EDmeHUq/Mw=;
        b=XdnWekjZb8glsAQ1tgXr5MK6YcZl4bUVQax6e+2kOumiyI6jXCeOqm64bZXw39ssC7
         rZJm1NNpUensdes0AU65op5gaoRoVGX8csRBZaWTvLEZVwN+bU97AI2FZtXmSMlLMTWk
         ZgLhY2yMrE7rftC2v5Jz/LOmx03J7X5TYG23mvHytV+47B7DL39L7b+eE5rKiT7uQ1qr
         Zuf3Aws7YIHLPJxxv0gUxmmtvy5XrXCgEPcDE1fqx/c5AuRY9NthSG19uhq9EvXti+h+
         PR5S6WzC87BEJVy9EqB0pxzhHjYAVkZi1YcmodWW9r1DL9i6tU6DN6HYVSy58fezF6X4
         CoLg==
X-Forwarded-Encrypted: i=1; AJvYcCUdihFKXP2mjxhO0+c3Kp9B6xv+41QRh5oc614Am/OIB03mqMyDsr2tCAuly6lGygP2D7jcsUj0WX8Tibif@vger.kernel.org
X-Gm-Message-State: AOJu0YwS06AyXcLKJFBXQoU0eOJoHVxDS/TAtGmMqW30ByQ1lKdOGRtw
	+M1LXjbVkVsi1N08VqavQsb0lLFIWtdMc9l+QshH0QvEBhaiGP6MakG2CsbodqEBxNZYv//3fhD
	kvvbV1IRBEnaeyaP7fEio0zoUiKgKhgnt4atrVsGAcNmonPW/n/oIfzAEOIWbZm6IEfkX
X-Gm-Gg: ATEYQzyzMECX+kvaHkzionxTqsdJbAInTHetXML0ZOsNOQtlALUbWPvV33xfiNbhdQL
	wxuga36JUl59E49WAtGFKCd7FB0YjCuurvYEqw0abnSrQuGuxlKugYm0TaeYFF/94T9V+UAC6ch
	OHWVAFykIYvlmzPM9UvHLnrgCV9nOaPd4N5IdjOd92oxd3zX/HASAZAVSvRtH/kai5tRTbXMIgf
	xTY6DOjjLjImmwhbaBsL7o/zQCeivK9c9scRSAI7DjWBdO+cs8zVBnzt1YFkrRjsFny1jO5pEDv
	J/0e3687/GkVxSiJJk3PsmXxcYjGn3igVtg8VEuFFhHHg8VKmfFTuB8NH+hpuWHMJY3egzSwDCg
	tmXnagpJ7kS2NSqJkyWmSPL344jkN2vUpq6y131Owl2zn7WZ2w2zlHxc=
X-Received: by 2002:a05:6a21:8802:b0:398:7585:64cb with SMTP id adf61e73a8af0-398758572b2mr5843758637.69.1773066345654;
        Mon, 09 Mar 2026 07:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:8802:b0:398:7585:64cb with SMTP id adf61e73a8af0-398758572b2mr5843733637.69.1773066345196;
        Mon, 09 Mar 2026 07:25:45 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4867e75sm10155561b3a.41.2026.03.09.07.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 07:25:44 -0700 (PDT)
Message-ID: <88c953fa-8fcf-4c40-9a02-2f1b2918e2e2@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 19:55:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU
 device.
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, jeff.hugo@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
 <ab23acba-0e40-4065-968a-66307b17f5b4@kernel.org>
 <182f5e1c-3037-4ac7-b2a9-df604e9b2211@oss.qualcomm.com>
 <c22930d4-38b1-4d34-b624-247a52fc9ae0@kernel.org>
 <d0cbb975-da2a-4b84-ba89-c475e711742f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d0cbb975-da2a-4b84-ba89-c475e711742f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WRy0IEWK17TnxyfFNBL-0KZkCyegpftV
X-Proofpoint-GUID: WRy0IEWK17TnxyfFNBL-0KZkCyegpftV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzMCBTYWx0ZWRfXyy4FSxYmREna
 eVvlR/UK6x0u0A+LSocHHlIs+6/ewMpQpe0QGx6EUM1lyW+Lzkv9Iapa3K4dEgonJ83oZStUcxr
 oxCayCqGGYde1o49ckzLbi6dEEMk/Oia7gNqHCZGZlAkHCY8l4nAVwuq/969etYwuNNPaxKLYi9
 NK0eed19NTb7uubT3f0aoHHZP0hzE1GY4egN4M1XUtBzR9vzwXscO0RV3Bq6GHf/pigEqV7eG/v
 ODoK2XXtobjgoLk18hIhe3JLeYwOoVokGTdgi/QyJHHtioMMVshjoTPyVc6iarJtHrro4paYgGs
 IJdY9BI9AIJUg4JMbjcisBTFjkZu0TokvalbYm7XUG1pSPAITtE3i0VrD1M52bm03XGp+z/5UaK
 z5L84Hu3jsExE20usmgYTqh7/yOIA24jlyiBM/VwrzbfYMu7uscThlptAMbfs3kfteBtmBAJKSm
 23QmrzTuftjwvWaOgwQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aed86a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xYxsOUmwuIY5F2UOIzQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090130
X-Rspamd-Queue-Id: B5C8D23A8CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96272-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/8/2026 11:42 AM, Kishore Batta wrote:
>
> On 3/7/2026 6:50 PM, Krzysztof Kozlowski wrote:
>> On 07/03/2026 12:33, Kishore Batta wrote:
>>> On 8/28/2025 7:49 PM, Krzysztof Kozlowski wrote:
>>>> On 25/08/2025 12:19, Kishore Batta wrote:
>>>>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>>>>> index 99e490e3174e..8d036edf304a 100644
>>>>> --- a/drivers/soc/qcom/Makefile
>>>>> +++ b/drivers/soc/qcom/Makefile
>>>>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)    += 
>>>>> qcom_ice.o
>>>>>    obj-$(CONFIG_QCOM_PBS) +=    qcom-pbs.o
>>>>>    obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>>>>    obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>>>>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
>>>>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>>>>> new file mode 100644
>>>>> index 000000000000..afd8011793fa
>>>>> --- /dev/null
>>>>> +++ b/drivers/soc/qcom/qdu.c
>>>>> @@ -0,0 +1,85 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its 
>>>>> subsidiaries. */
>>>>> +
>>>>> +#include <linux/init.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/sahara_image_table_ops.h>
>>>>> +
>>>>> +static const char * const qdu100_image_table[] = {
>>>>> +    [5] = "qcom/qdu100/uefi.elf",
>>>>> +    [8] = "qcom/qdu100/qdsp6sw.mbn",
>>>>> +    [16] = "qcom/qdu100/efs1.bin",
>>>>> +    [17] = "qcom/qdu100/efs2.bin",
>>>>> +    [20] = "qcom/qdu100/efs3.bin",
>>>>> +    [23] = "qcom/qdu100/aop.mbn",
>>>>> +    [25] = "qcom/qdu100/tz.mbn",
>>>>> +    [29] = "qcom/qdu100/zeros_1sector.bin",
>>>>> +    [33] = "qcom/qdu100/hypvm.mbn",
>>>>> +    [34] = "qcom/qdu100/mdmddr.mbn",
>>>>> +    [36] = "qcom/qdu100/multi_image_qti.mbn",
>>>>> +    [37] = "qcom/qdu100/multi_image.mbn",
>>>>> +    [38] = "qcom/qdu100/xbl_config.elf",
>>>>> +    [39] = "qcom/qdu100/abl_userdebug.elf",
>>>>> +    [40] = "qcom/qdu100/zeros_1sector.bin",
>>>>> +    [41] = "qcom/qdu100/devcfg.mbn",
>>>>> +    [42] = "qcom/qdu100/zeros_1sector.bin",
>>>>> +    [43] = "qcom/qdu100/kernel_boot.elf",
>>>> We should not accept this code because corresponding linux-firmware
>>>> release was not properly authorized in Qualcomm. All of above might 
>>>> change.
>>>>
>>>> I can give more details in private.
>>> Thanks for the comment. The QDu100 image table in v2 reflects the
>>> firmware images required by the device for boot. The sahara driver
>>> relies on request_firmware_nowarn() and does not make assumptions about
>>> firmware distributions or availability.
>> You did not answer to my comment at all. It does not matter what it
>> reflects to. You violated GPL license and that's NAK here.
>>
>> And responding to this after half a year with irrelevant comment of
>> whatever is clearly:
>>
>> NAK
>>
>>
>> Best regards,
>> Krzysztof
>
> We understand the concern regarding GPL compliance and firmware 
> redistribution. The kernel_boot.elf image required for this device is 
> not authorized for inclusion in linux-firmware, and we agree that 
> referencing a non-distributable firmware artifact directly from 
> upstream kernel code is not appropriate. We also note that this 
> kernel_boot.elf is no longer present in the linux-firmware repository.
>
> From a technical standpoint, the QDU100 device does not boot without 
> kernel_boot.elf being provided by the platform. However, given the 
> redistribution constraints, we are looking for guidance on the 
> preferred upstream approach in this situation.
>
> Would you recommend:
>
> 1. Dropping the explicit firmware reference from upstream and leaving 
> firmware provisioning entirely to downstream/vendor kernels, or
>
> 2. An alternative pattern that upstream considers acceptable when 
> boot-critical firmware cannot be redistributed ?
>

Following up on this thread.

Based on the feedback, I have reworked the patch to remove the 
kernel_boot.elf reference from the qdu100_image_table and validated that 
the device can still boot when the image is provisioned by the platform 
downstream.

Unless there are objections, we will proceed with this approach and post 
an updated revision(v3) reflecting these changes.


