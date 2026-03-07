Return-Path: <linux-arm-msm+bounces-95962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHALIgwNrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A322B702
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AC083007E0C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B3531985D;
	Sat,  7 Mar 2026 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKmaoGWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Virr7arL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665B2EB87B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883197; cv=none; b=sqMUO7Tr+QSrvfV+p9+NguMAIYjhnrqlfHmAZRtilcj5xTgneHQYHWVUCDA2ITbtnaWldHKAeZfsS9s5TX/uC3ee5pVJnbkjiKfXL9D9h/5JEg9lJ1vYFBEV1PYY5o5DOqCru9Af54Cea/cccjQV+CapOJgW8TO8mT+fjQKkwug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883197; c=relaxed/simple;
	bh=JT2XAoqZhZej4N44fYb+YIqNs1wqrxM6nt9K7zpUrAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beXdHkbM9qj+hPCCTMvuhhMnOMDVX+jlOl167Z5I/CPwXqrD1saa6PSmg+tNFLX5DbuskEe+IdlgvG0ncu13r1M8QfQ3N77x3wDXtNudt2LPKZZgvXgASVMjSE4avdrgfoQtl7NRjEQ0yoSfmEq4cVNtNHQx0ED8DK5uoam2VAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKmaoGWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Virr7arL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276rHVd2490682
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JMq5fsXEEU93iMPL5lXi/VUkmO47xjq2WzcMOn1Jmys=; b=BKmaoGWNhZ7Yz4Ze
	26HvhvOfu+F2LorcUs8Hpqy7e/+NQM6sbtAWPw3ZCcw25RnfDCsu4EDxWoKjxz1W
	32BWBzGYJFmi25at0T/of32xtpeDXAoi5rYnwYB7QQq5UvflFK65Df019UKyg3yT
	GAtMRhDpTLTemzT4wd1BWRAH4zLKK2xKsiGqGeYHwTSB5hu6kQ5wTh0sLLnIk82S
	sQTku50q9QcKXV1yUiLDmm36geRvxUjBsrVAdit0cQhQSzg2THHMxId54I+3DUaQ
	78Z3XfE4l7RDTBIeUaNlvb8Yrtsduo91sTfoQM+PZwuUxZCjhaFO0QYG8Vjc7YD7
	xqXjRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838pc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:33:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73781252edso11938914a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883195; x=1773487995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMq5fsXEEU93iMPL5lXi/VUkmO47xjq2WzcMOn1Jmys=;
        b=Virr7arLoFKsHE4Xdjj7tFniZktSRdYuujyTV7ulUVu6v0h2uhcD7PbxMsRC2BZL51
         ghYIxhur5+Xo7TsCQsFbPmHbALeRiNFVJX4fxO4MXBILgRPX0i9ur56lTYVz6PPAX6nP
         QWHn21F05GkwcNygGaLFdoa2s2LKHEgE8RyN+ofdrlEK8OCWcoJ8Lbct/HzDVTyYeGkn
         rnEffcLGqWe2zIXGW4/L6v6dP0grXn/sI5Pch9D31gdub2JkhE9dtUgruh+D0nsybZXF
         Q7fPl9/7fitzxSIRnvFvSiMOEsReCnE9PDkLrDR4a4FJKAaQ9tZHZavyuOhPjE+7HfM3
         1fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883195; x=1773487995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMq5fsXEEU93iMPL5lXi/VUkmO47xjq2WzcMOn1Jmys=;
        b=JzUdMQ2ZTXeJ7oeyETGTewc8Mwdkd4WUFy8N4jvUB4KXz147hsIYIEg07mhcvsMPDQ
         8yIW3VWNJVLS7A1EbN6PdnTwKX7lY63rMFUkYyf8Ajim+6yeUQKCypFwOoQpshOxUOy/
         S2eFIBS7X7laRyQUy3UITXVa+cy4Z7EMqVLGmD/wxHjEfKzdwax9ml2bef0YFlE5ZJEK
         /Gy0vChCefjlpv/YhCnq0rquvwVKTwBOoUuFAI8bmdRwARNRVBdTULdnML0yuMPs4f7k
         /KM+iv+fT4LCP1gZRmRogKYu+FDndlHCEcCGixc52uJMsMPkgLoysB9n+rtcoqMLny7E
         Q3kg==
X-Forwarded-Encrypted: i=1; AJvYcCW6A+8a1vyAme+mDw5mdgX9Bd2mneEj+zdHrWN65dj6J+tui6lXHecPBir6+PYRoDqTBB0CSxOH/b6Rz4sJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQud2qdHTM4O9bEypaY5TQiDAIfrizMow+BL2VSQp/qbMdIKas
	UgQFYTcluRZaNWqbIrIsI/5DjonbLL++Ulg3cGBexa/4AMG1drcUjnfZiJIDjmL1Hzrb1oswwyL
	mNID7UMWTVj0R0VMwCXz5zXyULpRwIWk6ipz05p3+8evhud7KwRefDM2S3Wmsc1SJj3Qb
X-Gm-Gg: ATEYQzwFJxOO1X39YjYnOB/Q49VwkanSVP/fw4pGlMiCi3KFWgUTFb2CGKf29ZUyqdN
	kBAuI56iBHbSkfY2fkJo0T9ZqauQXqMOPOPeufzQT0Oj8tWFlPm88zGfonRMSoSsCZ1U88+u8Y6
	zA0KvKNpj+kX+YtWHLBQ+L+NAh0NNhNvEvRYdJiNpQw2Klfvz60Z3v2NWemTjidzUiZCbULu1la
	gdT5/QNCmoKEKouqhII84gV3pYy7+dG6SVRkGl/e30tXxLIhxLv853UXJ0TwZQ0cENB3x6Ts229
	2mJUHdZvwc7dZ5VQVIfhDaf80l/cCChlau2p+Sh0KuyY7Pn7GU4pduRWEOca6uxBFT5Miez8E2E
	VbVnnvOOzL5awTrKx4nKVi5PA0g15UksW4lgvIyKfyhmH1j8s65lRpLQ=
X-Received: by 2002:a05:6a20:939b:b0:398:7946:b70d with SMTP id adf61e73a8af0-3987946b7fcmr443138637.51.1772883195473;
        Sat, 07 Mar 2026 03:33:15 -0800 (PST)
X-Received: by 2002:a05:6a20:939b:b0:398:7946:b70d with SMTP id adf61e73a8af0-3987946b7fcmr443119637.51.1772883195035;
        Sat, 07 Mar 2026 03:33:15 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0c7427sm4179821a12.9.2026.03.07.03.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:33:14 -0800 (PST)
Message-ID: <182f5e1c-3037-4ac7-b2a9-df604e9b2211@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:03:11 +0530
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
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ab23acba-0e40-4065-968a-66307b17f5b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac0cfc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nVMcT_h1dDSqu-fAkOIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX/dv2zPmHZocj
 UOHNJ7O+o17SOGkXnJGZ2hiewkhKlaDhAzyu/OCIms+t0eu5CVTeg7LY0lXp95/24kt99gC6+3z
 okDjbJXNMwBmOw4+j7+9IUEVhV+zQbza+YlkAoJ5SR3qPX7ZDGux8zu98n+otC2daOSh+au0Zvd
 YpJIJrF4ni3+YrJRdUahZXASC1TNs4C++qea9I2dY4/1jcZdpTsiUSAGXJoVcWhsLBSfpV2Ku1x
 xjeSQlI0dIDnVjK8hL3UGZ6MfZcUWxfsorQR58x+LVaFMIlLeI7nBpnzQ/qyRoBLFdKTRZ70wLU
 8+XyfwjxRUjz72mVonrKlkzATvcxQwmLPWNOKOIx4XH+/2veW/rDR90LhePHdQlx5F8HJFptU6S
 +YZHUl0eJjUEdJeF6CqpNKGaE2wg/8p570p6qPBKIEnF+XvcB6PATImjCJhJ9LZDhJHk9tfHKDl
 YyzlXPS9G3GGdWSsTkw==
X-Proofpoint-ORIG-GUID: JO1TjQzgSxOLV5ox5s46cChT4pmCZhXC
X-Proofpoint-GUID: JO1TjQzgSxOLV5ox5s46cChT4pmCZhXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: E09A322B702
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95962-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/28/2025 7:49 PM, Krzysztof Kozlowski wrote:
> On 25/08/2025 12:19, Kishore Batta wrote:
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 99e490e3174e..8d036edf304a 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>   obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>   obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>   obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>> new file mode 100644
>> index 000000000000..afd8011793fa
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qdu.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> +
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/sahara_image_table_ops.h>
>> +
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[43] = "qcom/qdu100/kernel_boot.elf",
> We should not accept this code because corresponding linux-firmware
> release was not properly authorized in Qualcomm. All of above might change.
>
> I can give more details in private.
Thanks for the comment. The QDu100 image table in v2 reflects the 
firmware images required by the device for boot. The sahara driver 
relies on request_firmware_nowarn() and does not make assumptions about 
firmware distributions or availability.
>
> BTW, please drop full stop from your subjects. Subject is not a sentence.
Sure. Removed full stop's from all commit subjects in v2.
> Best regards,
> Krzysztof
>

