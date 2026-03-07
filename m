Return-Path: <linux-arm-msm+bounces-95960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKwpKd4MrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0522B6EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AF1630063BB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B522EB87B;
	Sat,  7 Mar 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exf2Y4NA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmH6PdL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0856231985D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883163; cv=none; b=G039KI6gXeU67T8U9KlpYp9dPTn483KRLwijefIvK5Y78obMhm2StLwDr/a3j3ndGvSbsLi+V0rNskwYfTyg3SSWXUaH3ZPwwAz69auAd2K+f02f3TWU65ffTJ8mYBzdrS+fCfkXRwg4Mxcy3h+sEFB7dU0yL9WFePaAva7kNzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883163; c=relaxed/simple;
	bh=eg4hR+LgHaqWiFQT95uh1NqsLQSA77eZ4Bs5pxKd2hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVwiqXMHpbRVpPAED0+1WmvqiUqZHYuFxhQ6U89vvogHY/mrYuH+bgPVssG+Av2Zrsk6lj5vlrdrqoVjH/ijzYfCYfBd+wwNTafCFBKguIqxJ1dVGwL2MKDrCx9oc0N462N/NLpZymY23GgR3mMU9zv3imOLoYfIXmbgHvWKXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exf2Y4NA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmH6PdL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274mJT81250612
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgBE10/Xv8SNqL2hMf5CYA9tAb0TwPNoT4TjYXV/zSU=; b=exf2Y4NA7u3jo5Do
	WFW4JafLPr32uEDS4sdQqvSicXYvQPLTE6v57Joiz+c3I3eO6ctN7d4p0JiMyh0R
	U9MPIXxlKWUG/KU29CpmkIskQNpkOJMx1cP+Bdwx5dv8bqzyHuRnoYMfUGVnboPt
	/5JetafSnuvAaLsjBSw96lvKqKUJXLPR2y88bK52hGd935kcC169SIkKXY23N5KC
	qOtCXU5RdhRWvLBRXbyek3a7/+OGvVPUU4VUPr5DieMhnU5N+SIpqvieEXMTNOWS
	ROqhk3O8O4Lj8twWUDV3V4G2ugpxiG8b3Afu5OBGPq71CXRrEJriOwlQV3+SMotj
	AWgpmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda98hm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:32:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso9733976a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883161; x=1773487961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgBE10/Xv8SNqL2hMf5CYA9tAb0TwPNoT4TjYXV/zSU=;
        b=OmH6PdL5398RcOOnGOZc3JpTHJV9BxLnxoX4RlIOvzrekxBrGI64nkGPR56u/RslME
         7IZ/g/ddaTwvdbX7voOIw8mgGw5IlKeRNQb2swIOwMBEJH1u5VQSaIuD8s+ef9PmFU60
         9k7fP5b+8K7mEn6i2S7HMUg+72o0YvwVW8j66FBSeZPQoNpWiWkJqwYgUvcaUk84jHJZ
         RoX5Jw1T6LEfOJODF8BQ2KiF3BpMQ5WdVulDZq5v4Ez6TaRVVhTx3d2TY4FQ0EVyhWUc
         a6a47khNQTBF9cfkP/opew0AZ5aHwoBRpRxUp9/T4U4qedU/6e+7zG8qibHEZtcwHOT8
         8D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883161; x=1773487961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgBE10/Xv8SNqL2hMf5CYA9tAb0TwPNoT4TjYXV/zSU=;
        b=kJ5Bqnjz3q7FQR61RTZBfbOFAWO8VEjoA29qIi7KLpsALkgHBh//nQymeZwQMI6Gsp
         g+2BTRiuDgCc47P0Hf4FpMGY71JQEy5QIYvS5iXknv6Yk3lbJ0CsknETM+Fp94OEpOVC
         W8qUfsLEBm7k/42dyBpl/g+vq4N3ORBwx4XSYUlWCMO0tN75eynPdFz8i14su4Ud5fGE
         7hIxXWlvo1Hbwi3aEUXxPj1HSYsutIqlzVk4MjPxKTETvKvrNXzEqxPUiaRhZ+wPIhsA
         lASUhDlwgkseftaD1PW5EAaLpBWrmYSU5De5KazFhcFiHoEVFSjyl5o+16xVUYXSgETa
         dS1w==
X-Forwarded-Encrypted: i=1; AJvYcCUdMt1kIxS2VsncmGhZSOi2T0hVIgS4/dAmar7mvjvKhPA1+9dJhc1eJnFDTZi4IaP4NtWx2u7fH8ZjhS+F@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGjEvJkTG32HxKXUWgzFwmRGsSUfK1hl8NbnC1/AXYpS7j4EP
	TqpNbxLwwE0YMJQ13bZkMiGg2QfayCaTEUYSSlSKbebLbHDAZ6ND2HSBcrtZxagAk+UbwmdgRl8
	Q6Jul7gVc9jVLUqRQwHk+4RUVaXoyifmsSfqQ9Zxj3dfyANy7tkoVL7zxiYpdKtNU0gts
X-Gm-Gg: ATEYQzx7ZiTUN7v8vVezY1OHr73d005F0wA8orhJeJQPm/Q3BnRTwZfok0sDbgZaEFA
	Xc+T5SxrQ4WP+/Jmo6XI6k74pFdXvOqUntuMMw4Y3vPqwtT16Uis9N6y75rrvbiP/hN+jCKW/7I
	mn7X+l123Ks9Xd1WYuMIdxooV4ikMAPKKZeF+kXiMkbnXk/ZgWfkQGbLw496vNRZOHFgpX4oj4b
	XjPrGC2n8rE+g2QTqoxib/R9gyrGbDDfUmRW8H+RYOTcmC4ei8qSu4TtEszTnrAZ6SqLqGdeXtn
	hqt79nqisVo3jHMsj+vwkWHm8uQq7Lq9RPjp/LsPAEdQ5KRG65nMVGsGQ1H5CldZt9C5ChjKJN4
	QH9l+Ohnbse/vKG4ztLfgunMVXNkVsL+ZghrxSkIz3nBm8vQBW70qrrg=
X-Received: by 2002:a17:90a:de98:b0:354:c3a4:3a2 with SMTP id 98e67ed59e1d1-359be3536b2mr3256141a91.29.1772883160559;
        Sat, 07 Mar 2026 03:32:40 -0800 (PST)
X-Received: by 2002:a17:90a:de98:b0:354:c3a4:3a2 with SMTP id 98e67ed59e1d1-359be3536b2mr3256130a91.29.1772883160001;
        Sat, 07 Mar 2026 03:32:40 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bc9e3ed6sm2298110a91.4.2026.03.07.03.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:32:39 -0800 (PST)
Message-ID: <74be61ca-2f02-4083-807c-f63778c1cf3b@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:02:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU
 device.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
 <et4b6ijowhuins5xibpne4jf7v2cus4i3sqk3cm7aqasc6v6w4@psiej5eq4ftx>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <et4b6ijowhuins5xibpne4jf7v2cus4i3sqk3cm7aqasc6v6w4@psiej5eq4ftx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX6vJ/3m9MtcqT
 SiFfEWTkTy/7qxs7eLFfrkkVuyTXldyAY+Nw/EH7wjXxguGHf9gZ7PIig+LtJC1bPf6O7liKExS
 ykNglUDYw2BRxxPoaSRtSKy+kVXbMD9qlTzkMn+UPvGIm9EnB0vuvk3bh2JsTLhzlLtujfBhSt9
 W17he6ogM+d9bqKKMrXZ5JlOpx5VenHT9/SOFvRXcaujFW4N2xZLBiZvYgT7RCq8GePD05mwE8z
 hHZQQtR+TrRy6gC2ejQUoIWVGQRsVoNphSAAAE324jJjCtJFcqkjSebcGnTbAxnXS4RzYd4F1rd
 Yw1Qz0gKHegMDtHxNDFJajD8wWaRQqUSM+OsQvOeHrdkWlPrHPAGuKIOa7e+B9amP75PZ8wOEcS
 B0EjYcn6jZ74brfJMInvdpMhZ7mwB7JjdmmZ9GxC6kgqWgN1liVaTH15Ys5XRzgqdxzXUv44iS2
 Gw30JV34nnW6z7qikmA==
X-Proofpoint-ORIG-GUID: -3ue-VKiOHKeaEJMRY23NdNUykywzbIm
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ac0cd9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1yD4IUB2qnYqGipxwh8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -3ue-VKiOHKeaEJMRY23NdNUykywzbIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 1BB0522B6EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95960-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 4:54 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:20PM +0530, Kishore Batta wrote:
>> Add support for the Qualcomm QDU device. The Qualcomm QDU driver acts
>> as a client driver to the Sahara protocol, including the QDU100-specific
>> image table and registering it during device initialization.
> "including the QDU100-specific image table"? That's not "including" it's
> the only thing it does.
>
>> The
>> registration of the image table is required to transfer the QDU100
>> specific firmware back to the device using Sahara protocol packets.
> Compare above 5-6 lines with:
>
> "The QDU device is flash-less and uses Sahara to load its firmware,
> provide the table of firmware files."
>
>> The
>> MHI driver exposes a new channel name for the Qualcomm QDU100 device in
>> the pci_generic.c file, and the same channel support is added in the
>> Sahara driver.
> Which MHI driver exposes a new channel name? Please rephrase this and
> perhaps split it into a separate patch?
Got it. In v2, I have removed addition of new file separately for 
qdu100.c. Also rewritten the commit message and subject of all patches.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/Kconfig         | 14 ++++++
>>   drivers/soc/qcom/Makefile        |  1 +
>>   drivers/soc/qcom/qdu.c           | 85 ++++++++++++++++++++++++++++++++
>>   drivers/soc/qcom/sahara/sahara.c |  1 +
>>   4 files changed, 101 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qdu.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 7ea4cff9a679..ffaaf6261c35 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -303,6 +303,20 @@ config QCOM_UBWC_CONFIG
>>   	  with coherent configuration data. This module functions as a single
>>   	  source of truth for that information.
>>   
>> +config QCOM_QDU
>> +	tristate "Qualcomm QDU driver"
>> +	select QCOM_SAHARA_PROTOCOL
>> +	help
>> +	  This is a client driver which registers the device specific operations
>> +	  with sahara protocol which is used to download firmware to Qualcomm
>> +	  distributed unit device.
>> +	  The Qualcomm QDU driver facilitates the registration of device
>> +	  specific operations with the sahara protocol, enabling firmware
>> +	  download to the QDU device.
> This makes it sound like there's a bunch going on in this driver, is
> more of this coming?
Removed in v2.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called qdu.
>> +
>>   source "drivers/soc/qcom/sahara/Kconfig"
>>   
>>   endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 99e490e3174e..8d036edf304a 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>   obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>   obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>   obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
> This list was somewhat an approximation of being in alphabetical
> order...
ACK.
>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>> new file mode 100644
>> index 000000000000..afd8011793fa
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qdu.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> Look at other drivers in drivers/soc/qcom...they don't format this
> comment like this.
ACK.
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
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
>> +
>> +static struct sahara_image_table_provider qdu100_provider = {
>> +	.image_table = qdu100_image_table,
>> +	.image_table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.dev_name = "qcom-qdu100",
>> +	.fw_folder_name = "qdu100",
>> +	.list = LIST_HEAD_INIT(qdu100_provider.list)
>> +};
>> +
>> +static struct sahara_image_table_provider *qdu_providers[] = {
>> +	&qdu100_provider,
>> +};
>> +
>> +static int __init qdu_init(void)
> So patch 2, 3, and 4 just laid the groundwork, so that you could add a
> new "driver" with the only purpose of carrying an array of firmware
> names and the extra code to register it with the Sahara driver.
>
> Why don't you just put the qdu100_image_table[] array in sahara.c and
> save us a whole bunch of changes?
ACK. In v2, qdu100_image_table is also defined in sahara.c.
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
> Future proof! Please don't.
>
> Regards,
> Bjorn
ACK.
>> +		ret = sahara_register_image_table_provider(qdu_providers[i]);
>> +		if (ret) {
>> +			pr_err("qdu: Failed to register image table %d\n", ret);
>> +
>> +			/* Rollback previously registered providers */
>> +			while (--i >= 0)
>> +				sahara_unregister_image_table_provider(qdu_providers[i]);
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +module_init(qdu_init);
>> +
>> +static void __exit qdu_exit(void)
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
>> +		ret = sahara_unregister_image_table_provider(qdu_providers[i]);
>> +		if (ret)
>> +			pr_err("qdu: Failed to unregister image table %d\n", ret);
>> +	}
>> +}
>> +module_exit(qdu_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm distributed unit driver");
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index 5e17d71a2d34..b07f6bd0e19f 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -795,6 +795,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA", },
>>   	{},
>>   };
>>   
>> -- 
>> 2.34.1
>>

