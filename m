Return-Path: <linux-arm-msm+bounces-96006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GdCoKnUTrWkWyAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:13:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3622EA97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DB2C30038DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FBB293C42;
	Sun,  8 Mar 2026 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5KLQAMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0vwmWCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F4727FD44
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772950386; cv=none; b=W1AqtaUlihxnhtbdRvXYfPuJOXeReJyveV6ujzvyZMRVDTvv2oUCrUQ5wDYl4z9gq8Zly+QK/4pV+ASzSAZaYN3EUcLeOQAuWauWsXjQpiN3X/rSKWCLrG/FE7P3bQ3b4e3V5Gc7TPX9VJf1tPBUA5TluKHFHe1UA3ymDMY1/7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772950386; c=relaxed/simple;
	bh=289giS6OvQsQJ5uYEg8XhWvxBKPmjDrRiVf2dOx6TY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMhM7nuRbsLD+h/zxjbfD1pSM905DYV9zW7ICcjm9R4RvEhvrumvCcmL/ayI9eou7Rn+O6x1pIJDXod2AnPXMbP4EEDnEDaU08UeTbys7hmq2zlDcEM3Odw3nWx7MBD+T7+t4h7ievrHjyZCN1oj2vyFYIByyPHKeXiNx97bIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5KLQAMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0vwmWCc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6284spbH931462
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 06:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig7lQG7szH20gMWUdPQcQVsaWtnufDXKKOQBVmvIg24=; b=p5KLQAMjcjb4+7VR
	kjBjLK3eGpkGxb9gwh5gCqJVT7tV0unzJzTWZ/cbebyBAvozSKa0YLuU7pxeWhsL
	HxNgOayaIqgHa72OGeH2ztVKWaerOwDf+QQMKMZ1/4SxN+nwvuZF60P9P3q+neq0
	Xh3sy89TPCdVb1prMsOsYMRCamn/Umla+pW5IDsSNTGTfVQnRRLiqstAiMFJPX5K
	BJ6gVHdF01PFeRGr7vAbo/C3XDsq1NVk6Z97VcZJ4rKDKZ0ya2QBnRv6C8Rw83HB
	5+3XEZGjyKcoIxkg0diIcqLmfDVZqnDUsac/XNBHYi9GhFHnGrsXWv54pnOmzNIa
	OJJBfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83a1xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 06:13:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so73723675ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 22:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772950383; x=1773555183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ig7lQG7szH20gMWUdPQcQVsaWtnufDXKKOQBVmvIg24=;
        b=F0vwmWCcd9jL6G6oKLxFdD987n7LWXrHppFvwnj1iXyyIaXYXGhSKn86iWYwhee4aM
         iS4TH22obXVN8SnAZGBjh1IprYGvMBvSDbqhKe0fPnvkHs6rgqXatvL4Jqek8yTqFPNo
         bSMW4XGH6EKCPpprhd0g2OMEXRDNwXQNODBDaT3ZAOE+04hwFlgBiNN+JcDi6AdLJ0La
         h50LXvF5JNPlo4gGIRgs/Mk1l9GOtWKHC4UmJtLx5hVm+sgQ10Sur5kcUPngn2NVwP/4
         CTkzSWe7Fo5slv2XzPpzvD4Fz15aYjxsJMyHmHIneLfzsysRq0lW7NA9pQXSlm+/SGbE
         5yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772950383; x=1773555183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig7lQG7szH20gMWUdPQcQVsaWtnufDXKKOQBVmvIg24=;
        b=mBTgi2hhN6cE+eSIp/mk10+plmofX9iQxp5d2GVMJjpbJnpGb2IxuXIPwN6zFr9jia
         6tTNnKYq3RA/zlozIB5ypRK28OVs6zM4bS/h+SQH1o8MYnF7d2RwA+od4tf0ROrK58Zb
         HKOcGuwZDo5ekReO77vF4TfHOOtbWo8l4dURTmykW2nXP4zQ5wgofaYM/ZmJ+rp2cHMk
         1YaA8++Ij1TpaIE0wr3ZT/pbtVuyxztPQkjNmaQNeXKYSMaa5MlOnfNgeLvh57FNx7BP
         6wnQXl5oqPZ4DgzM87sBZYt89k/XTKwBurdpxVtppgq8yoSg6wgl1WbNYHuMxScjNLoH
         3oKw==
X-Forwarded-Encrypted: i=1; AJvYcCU7i8xgd6aZVxGL3y9cc1qM4mcBHvaWq1VTwxVaaJyQJ/d4lp6LDvObHOH1n2D5KNU2+GxTndloWvcZ0AoG@vger.kernel.org
X-Gm-Message-State: AOJu0YxwH2zj6atU5o7z/M0jCZmh1CEbhX3OzPijXLeXFuHIG0bCj6du
	bcAgwYRzZWo6nHMQVte/mXpzc2LNIA/WHUqUVuTnHR4zGhgb73/yKGgmU/XV1s6ISkdF23460S1
	8gauvUsFktfTRFVZbxTqXwmcGKTMMSFFJQkd6Hphea1Uy18gx/JH3CcwJZ/0PlaSpBy8w6YNYtK
	ML
X-Gm-Gg: ATEYQzzvyQrytAGedHqMEaQ7yv1nRX266F/ZIsvecXPT7iPsr881MT+cW4jkwhT9yx/
	r41cMxOC9V80p4rxUKClKe4Jq7v4YVVGwGLRzKCz3sSJuIzS/ZceCNm0R/IhpWUpl3VRfsh7U7L
	p0H4xau3RrLiZt92IdgWm1u9NxygQ3rfz6aalJMJsdwp/fILFs6ulLgd+WcQdM1UPAIMrvtUPCo
	9jPc0SvSXDK2MWed7Rspe0vhesMI/Z+aD613A73VvNH7Ismaq7qRo+eGuBJIZYHBWyMVKXkl/HK
	Jedl3HC0UHnW9B5iuaJ/C8D//aQqtYMFLD3WvJ2LUTTzVMCMlGbsySESVJzJJe37c8pn2TIA+Y2
	ZNxbLg51otdQ3XzHRmz0rmHuvmDXfwzR9ZQejw4kXNWWLtgkSPycCiBE=
X-Received: by 2002:a17:902:d4c7:b0:2ae:3a77:a1f6 with SMTP id d9443c01a7336-2ae82937c38mr59400165ad.6.1772950382379;
        Sat, 07 Mar 2026 22:13:02 -0800 (PST)
X-Received: by 2002:a17:902:d4c7:b0:2ae:3a77:a1f6 with SMTP id d9443c01a7336-2ae82937c38mr59399955ad.6.1772950381817;
        Sat, 07 Mar 2026 22:13:01 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f752bfsm92564195ad.60.2026.03.07.22.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 22:13:01 -0800 (PST)
Message-ID: <d0cbb975-da2a-4b84-ba89-c475e711742f@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 11:42:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU
 device.
To: Krzysztof Kozlowski <krzk@kernel.org>, jeff.hugo@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
 <ab23acba-0e40-4065-968a-66307b17f5b4@kernel.org>
 <182f5e1c-3037-4ac7-b2a9-df604e9b2211@oss.qualcomm.com>
 <c22930d4-38b1-4d34-b624-247a52fc9ae0@kernel.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <c22930d4-38b1-4d34-b624-247a52fc9ae0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ad1370 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=FMpNiqSDNVB68AlqsccA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDA1NCBTYWx0ZWRfX468fXApyAk1C
 KGQX3850Kte4ZpPV7/HpoX1BwvYFKvzvs1lGtLEXSXrvKTHU3eiubTw6JFElGInN8kycN4ytcp+
 dO9sbFUu2art99+PiHgGHYEWFe0zYhaX5PsKJWLlTa5B2TN4lmXyADR/uXqY6AV2ibpeW4XmKl2
 WrOosPwoBxskPvZyYmP4oVt7iDUMjjoLhoq3E1+Ho+ov5KZovd+qQdDDeZ96vRbMk+O/NDwKemS
 X2B/gPWBpjcaeFLJaEbVcNJvuqeDupYW+zU56uXLcdYJWNKdVz8Qc4LU9sztY/ZipIZ6TAgO6Z5
 yAQm8bZd6jl0t/mDzRNsjWNufOvXfjAm4c0ailG4wCj0exJfOm9hHRE9PjKo9Bapqm86vEV+Bwg
 FyUo73tDMOtwUqbYxFAP9pOuRSvFEe7s+8OD678yJsoh5b5CAHRQ2P7f6Ws/d6V2T5m0kmoaaf4
 2HCaD8yPjqK3Jzdm1ow==
X-Proofpoint-ORIG-GUID: 0qz3bmjwxkoTBEJAitB0JIs8ZQmtJcW2
X-Proofpoint-GUID: 0qz3bmjwxkoTBEJAitB0JIs8ZQmtJcW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080054
X-Rspamd-Queue-Id: A5B3622EA97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96006-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/7/2026 6:50 PM, Krzysztof Kozlowski wrote:
> On 07/03/2026 12:33, Kishore Batta wrote:
>> On 8/28/2025 7:49 PM, Krzysztof Kozlowski wrote:
>>> On 25/08/2025 12:19, Kishore Batta wrote:
>>>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>>>> index 99e490e3174e..8d036edf304a 100644
>>>> --- a/drivers/soc/qcom/Makefile
>>>> +++ b/drivers/soc/qcom/Makefile
>>>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>>>    obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>>>    obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>>>    obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>>>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
>>>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>>>> new file mode 100644
>>>> index 000000000000..afd8011793fa
>>>> --- /dev/null
>>>> +++ b/drivers/soc/qcom/qdu.c
>>>> @@ -0,0 +1,85 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>>>> +
>>>> +#include <linux/init.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/sahara_image_table_ops.h>
>>>> +
>>>> +static const char * const qdu100_image_table[] = {
>>>> +	[5] = "qcom/qdu100/uefi.elf",
>>>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>>>> +	[16] = "qcom/qdu100/efs1.bin",
>>>> +	[17] = "qcom/qdu100/efs2.bin",
>>>> +	[20] = "qcom/qdu100/efs3.bin",
>>>> +	[23] = "qcom/qdu100/aop.mbn",
>>>> +	[25] = "qcom/qdu100/tz.mbn",
>>>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>>>> +	[33] = "qcom/qdu100/hypvm.mbn",
>>>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>>>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>>>> +	[37] = "qcom/qdu100/multi_image.mbn",
>>>> +	[38] = "qcom/qdu100/xbl_config.elf",
>>>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>>>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>>>> +	[41] = "qcom/qdu100/devcfg.mbn",
>>>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>>>> +	[43] = "qcom/qdu100/kernel_boot.elf",
>>> We should not accept this code because corresponding linux-firmware
>>> release was not properly authorized in Qualcomm. All of above might change.
>>>
>>> I can give more details in private.
>> Thanks for the comment. The QDu100 image table in v2 reflects the
>> firmware images required by the device for boot. The sahara driver
>> relies on request_firmware_nowarn() and does not make assumptions about
>> firmware distributions or availability.
> You did not answer to my comment at all. It does not matter what it
> reflects to. You violated GPL license and that's NAK here.
>
> And responding to this after half a year with irrelevant comment of
> whatever is clearly:
>
> NAK
>
>
> Best regards,
> Krzysztof

We understand the concern regarding GPL compliance and firmware 
redistribution. The kernel_boot.elf image required for this device is 
not authorized for inclusion in linux-firmware, and we agree that 
referencing a non-distributable firmware artifact directly from upstream 
kernel code is not appropriate. We also note that this kernel_boot.elf 
is no longer present in the linux-firmware repository.

 From a technical standpoint, the QDU100 device does not boot without 
kernel_boot.elf being provided by the platform. However, given the 
redistribution constraints, we are looking for guidance on the preferred 
upstream approach in this situation.

Would you recommend:

1. Dropping the explicit firmware reference from upstream and leaving 
firmware provisioning entirely to downstream/vendor kernels, or

2. An alternative pattern that upstream considers acceptable when 
boot-critical firmware cannot be redistributed ?


