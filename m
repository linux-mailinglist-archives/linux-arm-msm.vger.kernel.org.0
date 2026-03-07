Return-Path: <linux-arm-msm+bounces-95954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDqvCowMrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15822B6BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DC683017518
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADA12E2DDD;
	Sat,  7 Mar 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhvEJUuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4+kJUmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFD41339A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883080; cv=none; b=b8cyfBoEfXvOtSyb5ThFUF4p1PifSb1Yj8/68wITFMFJk3Hd+5hYX3uIiHQa1xU9gc3BQJBeHo7PHk9Ai7SKVJsXpXkgFU+VddQrJEipsQ9UK6xJ67K0Xuv0hrjF55jbAg9PrLVqbXcZaguyCEORB82AiOPdvX5scDKYY98MIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883080; c=relaxed/simple;
	bh=PUjBvppUi8u6FGdl5UVyB2X1AX7pXRZKiGKocJMXGJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hxa2oNyA8d4VY8QKahs84n3GP9G2L5SwH1Qi+x3DAnvknGOr8uid8JXiL0CffCAkbrO5O0cBVhrvFInyz73qDPKorFFEKfgtJ3cUIEqwVXyZ0hOanEduXwpRB/tMhnxgw5OseKu3B41Bl3LyFHJ3369PN49FOxouQWMYIHmdsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhvEJUuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4+kJUmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276r2WM2490366
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEK8loxNNRCGhL9b5XdhFW4/qfDHKLhoG2GkqslhM0E=; b=HhvEJUuJMCV+C4UU
	uKiP2quPwG10Xrw16q6kIi93gldl7Xmwr0iaNCe7KPJOk63mtbuy7xRF5nJ47wM/
	bgI+3WazVk5P2C2sgnu05mMTv1iaXIlNtGLL4f/2UtYjFQLnePnvtO5sYXODhu3O
	inZaPBtFrYtRGr6go+oFYMiuSlc+NIlRc1IdcJ31VyI7qbCgTpm80L6/ictRKXb0
	ox9Mi19maU4t99T2WO5mVDaBzOEMDWLXGwebebD3kyfbKdj+2A3bZMujjhmWgRa5
	C8Vblx76E+2z5yZzpSgGSQ+hRWyxzZPTcJjLGq7jL3iVGJK2Neq3kMm0zrwmIUX0
	O+LIlg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838p71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:31:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4cdfc468so63749455ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883077; x=1773487877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEK8loxNNRCGhL9b5XdhFW4/qfDHKLhoG2GkqslhM0E=;
        b=B4+kJUmITkVXZfgdl+Bj/npuHqMA0UoMYpBAZK1wbz4aaDHCIlzVT1+N3gUas3JynM
         SQkc4Gn2BFJ48XuiMb6SuyRvAFRy0i0U1DI/K7aZDzph1ZUrVtuhNJ2rCDspCphNWc0x
         0GOJg3INzpe508k7Qky1hs2Ox47+9vNQLyt0qzhPbpGkrs3UYbZDwXO4ud3Ep8VxxnBM
         PrvHo8C0Hp52FgTiqGUl7KDkCoFLcPk8pa7J3r7vjMAxQFFX1uvTMyWiFhydPGYc9BuQ
         w5NugeiyAx7jP/MNYsA1vSN3GL+hxfPhzTkn4ZuECoaW/V3/L05wiBFORoUlWVJGGpej
         4X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883077; x=1773487877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEK8loxNNRCGhL9b5XdhFW4/qfDHKLhoG2GkqslhM0E=;
        b=dsoHOjKPadsQaZP6KMslF65GhjOm7fLy56cas3hgNlL/NxwgQWFPk4dZOpN7wFJ7wT
         DsSz6Y4YacgxrSSIRQFIn8hf2cqgWjwPwQo9hndN+vmNaxsiVIHzuYX+P9ygk7aBudR2
         pyDUuvMBGDAm0ZhgS3Dpn70pDxfsQYwsk2TC3j4LTzAWrFIQxDZFnbbJryhBzc74WfMg
         Awkgt2/vE0bS7zW+ABSAmaFbGxxmGd0WEt3fg2rHaKhNRVCCNhPA5PjsNBsEMWoQlVKx
         5Yh22f05MXL5+GxwP/77IvtLJL+jzFS+SSbRcfJbC2TrD3A/aJxawqCgue5rVV7IKmDt
         3fgA==
X-Forwarded-Encrypted: i=1; AJvYcCULEBVaPFfjcWPn7HnV0hg3X/uBw/s8RL00h9JNVV3PEPRMkxXLWASfVUQRKtk7ilsqzT4iVOHKhe9yjdkN@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJrGsmHFxZyaH3OJAKYe9PoSldnQbhKqhycmIwvMTV5+xVzPQ
	5PmRrvdWQPm1yOEWWPfnqdfZgU1/TiGchgMYYQwmVIw5IMP/qN1LTgH3kl2KzqKFEHcxpPzNoKw
	VnOTdOHT+t0JZYvQXCvFZEhGUwtF3j422LrguZCRwSv2/hHbQBZ5BvlyXGnlHcyYHEhAnM9cX37
	BM
X-Gm-Gg: ATEYQzwbXZzcO+XGDzoJQXcDGMu4p4fD7ULXZRB0qAQxN4H5BXRxY/zZZNl9Dnowaud
	mSz/oJs4jg5RIy4r3jLFh4qAbVb/HagaXD1JFKkLNh1vAUWyvRtC/lKslY90OOh0HPSxkNnHO+n
	O/tnKXMnjx9xSs1wyFCcLd0C+I5KLqNfWJoNXxl1oKjmoovFcIrITU7hvKT/F3TyYnZxXzYa22I
	Hfw4i23Wx+zqUmN/foEib2OyHjvlM7gjGE4QVHGd4Dug4FJBCeBcIDxE8bgNH1Z5R0JdpVU50Fn
	z3Fn7/DsAjDZCAUucBjYtwhfU/9oNtOHg6d+zPrOFZ66kLDNUmbm5NlnTszOFmoD06dA/5eEMf5
	h4OFCocr+3TnqtgDk6knpYWN3X5EjDFwnj6JF16xpCJdLdajexCO7UQk=
X-Received: by 2002:a17:902:f78a:b0:2ae:7f4a:ce34 with SMTP id d9443c01a7336-2ae82367072mr48269375ad.10.1772883077337;
        Sat, 07 Mar 2026 03:31:17 -0800 (PST)
X-Received: by 2002:a17:902:f78a:b0:2ae:7f4a:ce34 with SMTP id d9443c01a7336-2ae82367072mr48269095ad.10.1772883076733;
        Sat, 07 Mar 2026 03:31:16 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm64722535ad.92.2026.03.07.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:31:16 -0800 (PST)
Message-ID: <0c867deb-844a-49ad-826b-e05cc6f3e2c4@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] drivers: accel: qaic: Support for registration
 of image tables in Sahara.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-4-kishore.batta@oss.qualcomm.com>
 <acifjjzchr22da33pmriawuasn4hf2rqm5gborontjnxzcbiyq@skz2mqcq6i2p>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <acifjjzchr22da33pmriawuasn4hf2rqm5gborontjnxzcbiyq@skz2mqcq6i2p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac0c86 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OoVoIzI7qbkkq6BcJHgA:9
 a=ckXePCMR9Q5INyhz:21 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfXz0vZkZhC2w7j
 XKxBeFprbqAItrCNzAexBqJ0VS3sWMCTXI7yu8qTl91qjV6Py80sJnNahCw27phaoQt4BEGj9ME
 VapuyVlfK8oeJ63Fj/Zl2oCAkGq/Vh/YgUZNV6NR7c0+T3davWjhz7Q+EoChbqbuqC9zhCjsCDn
 hoKtVbRAWsUFh2XNahrfiNJSc2QlXzFRwe+XG+03K1QXH9d4f1AbcU6cNr0PQMvhvcR173XSmgu
 e1bkzvV4vWHDCQwjkvY4B8/3Ikxu9iSTK0JW1AOWvKLxj4xuJ/x3Tu+OANTAK3E7N9z1QTMrC2n
 KVxrK6txvot200YsZbVEs9gYxSUjVuuDiOM0+OO9qj9QLYV/CGtP4dCNjMYM+/TnUtbJaV02Xh2
 6ERNO7QHIPyOkKjBTqDzIwaj60Np6K96X78NvvTPmjbMZuAX1gvMimEnQL87TCIPagikZ1J4Ukh
 CbeSKxQU8WUUx7vFDbg==
X-Proofpoint-ORIG-GUID: GyW6xmmCzLqMg0vncgenmwupphS0JI8v
X-Proofpoint-GUID: GyW6xmmCzLqMg0vncgenmwupphS0JI8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: 7D15822B6BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95954-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,get_maintainers.pl:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 2:56 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:17PM +0530, Kishore Batta wrote:
>
> Just noticed that your recipients list doesn't match get_maintainers.
> Please adopt b4 and let it choose recipients for you.
>
> And same subject prefix issues as all the patches.
Acknowledged. For v2, I'm using b4 so recipients are pulled from 
get_maintainers.pl automatically and the series is addresses to the 
correct lists/maintainers.
>
>> Support the registration of image tables in the Sahara driver. Each
>> Qualcomm device can define its own image table, and client drivers can
>> register their image tables with the Sahara protocol. The Sahara protocol
>> driver now exposes the necessary APIs to facilitate image table
>> registration and de-registration. These image tables are used by Sahara
>> to transfer images from the host filesystem to the device.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Makefile                 |   3 +-
>>   drivers/accel/qaic/sahara_image_table.c     | 173 ++++++++++++++++++++
>>   drivers/accel/qaic/sahara_image_table_ops.h | 102 ++++++++++++
>>   3 files changed, 277 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/accel/qaic/sahara_image_table.c
>>   create mode 100644 drivers/accel/qaic/sahara_image_table_ops.h
>>
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 1106b876f737..586a6877e568 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -12,6 +12,7 @@ qaic-y := \
>>   	qaic_drv.o \
>>   	qaic_ras.o \
>>   	qaic_timesync.o \
>> -	sahara.o
>> +	sahara.o \
>> +	sahara_image_table.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/accel/qaic/sahara_image_table.c
>> new file mode 100644
>> index 000000000000..dd0793a33727
>> --- /dev/null
>> +++ b/drivers/accel/qaic/sahara_image_table.c
>> @@ -0,0 +1,173 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> +
>> +#include <linux/device.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +
>> +#include "sahara_image_table_ops.h"
>> +
>> +struct sahara_image_table_context {
>> +	struct list_head provider_list;
>> +	/* Protects access to provider_list and related operations */
>> +	struct mutex provider_mutex;
>> +};
> Drop this struct and turn the two members global variables.
I have removed the registration mechanism in v2.
>
>> +
>> +static struct sahara_image_table_context sahara_img_ctx = {
>> +	.provider_list = LIST_HEAD_INIT(sahara_img_ctx.provider_list),
>> +	.provider_mutex = __MUTEX_INITIALIZER(sahara_img_ctx.provider_mutex),
>> +};
>> +
>> +/**
>> + * sahara_register_image_table_provider - Register an image table provider.
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> says you should put () after the function name.
>
>> + * @provider: Pointer to the sahara_image_table_provider structure to be
>> + *		registered.
>> + *
>> + * This function validates the provided sahara_image_table_provider structure
>> + * and adds it to the global list of image table providers.
> What is the key thing this function does? It validates the
> image_table_provider! And then second to that it might add it to some
> list...
>
>> The list is
>> + * protected by a mutex to ensure thread-safe operations.
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-context
I have removed the registration mechanism in v2.
>> + *
>> + * Return: 0 on success, -EINVAL if the provider or its required fields are
>> + *		invalid.
>> + */
>> +int sahara_register_image_table_provider(struct sahara_image_table_provider
>> +					  *provider)
>> +{
>> +	/* Validate the provider and its required fields */
>> +	if (!provider || !provider->image_table || !provider->dev_name)
>> +		return -EINVAL;
>> +
>> +	/* Acquire the mutex before modifying the list */
> If that isn't obvious from the line mutex_lock(something) consider
> giving the lock a better name.
>
> It's obvious what this sequence does
>
> lock()
> modify(list)
> unlock()
>
> Document things that aren't obvious.
>
ACK.
>> +	mutex_lock(&sahara_img_ctx.provider_mutex);
>> +
>> +	/* Add the provider to the list */
>> +	list_add(&provider->list, &sahara_img_ctx.provider_list);
>> +
>> +	/* Release the mutex after modification */
>> +	mutex_unlock(&sahara_img_ctx.provider_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * sahara_get_image_table - Get the image table for a given device name
>> + * @dev_name: The name of the device for which the image table is requested.
>> + *
>> + * This function iterates through the list of registered image table providers
>> + * and returns the image table for the provider matching the given device name.
>> + *
>> + * Return: A pointer to the image table if found, or NULL if no matching
>> + *		provider is found.
>> + */
>> +const char * const *sahara_get_image_table(const char *dev_name)
>> +{
>> +	struct sahara_image_table_provider *provider;
>> +
>> +	/* Validate the device name */
>> +	if (!dev_name) {
>> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
>> +		return NULL;
>> +	}
> This is overly defensive. You're writing the only code that should ever
> call this function, just make sure you don't explicitly pass NULL when
> you do...
I have removed the registration mechanism in v2.
>> +
>> +	/* Iterate through the list to find the matching provider */
>> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
>> +		if (strcmp(provider->dev_name, dev_name) == 0)
>> +			return provider->image_table;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * sahara_get_image_table_size - Get the size of the image table for a given
>> + *				device name.
>> + * @dev_name: The name of the device for which the image table size is requested
>> + *
>> + * This function iterates through the list of registered image table providers
>> + * and returns the size of the image table for the provider matching the given
>> + * device name.
>> + *
>> + * Return: The size of the image table if found, or 0 if no matching provider
>> + *         is found or if the device name is invalid.
>> + */
>> +size_t sahara_get_image_table_size(const char *dev_name)
> You don't need two identical functions for getting the table and its
> size, just add a "size_t *size" parameter to sahara_get_image_table()
> and return both values in one - saves you 29 lines of ~copy-pasta.
I have removed the registration mechanism in v2.
>> +{
>> +	struct sahara_image_table_provider *provider;
>> +
>> +	/* Validate the dev name */
>> +	if (!dev_name) {
>> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
>> +		return 0;
>> +	}
>> +
>> +	/* Iterate through the list to find the matching provider */
>> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
>> +		if (strcmp(provider->dev_name, dev_name) == 0)
>> +			return provider->image_table_size;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * sahara_unregister_image_table_provider - Unregister an image table provider.
>> + * @provider: Pointer to the sahara_image_table_provider structure to be
>> + *		unregistered
>> + *
>> + * This function validates the provided sahara_image_table_provider structure
>> + * and removes it from the global list of image table providers. The list is
>> + * protected by a mutex to ensure thread-safe operations.
>> + *
>> + * Return: 0 on success, -EINVAL if the provider is invalid.
>> + */
>> +int sahara_unregister_image_table_provider(struct sahara_image_table_provider
>> +						*provider)
> unregister functions typically return void, because there isn't much
> useful one can do if it fails.
I have removed the registration mechanism in v2.
>> +{
>> +	/* Validate the provider */
>> +	if (!provider)
>> +		return -EINVAL;
> This doesn't really check that the point is valid, just that it's not
> NULL. And per the intended usage, that can never happen. So I'd suggest
> dropping this check.
>
>> +
>> +	/* Acquire the mutex before modifying the list */
>> +	mutex_lock(&sahara_img_ctx.provider_mutex);
>> +
>> +	/* Remove the provider from the list */
>> +	list_del(&provider->list);
>> +
>> +	/* Release the mutex after modification */
>> +	mutex_unlock(&sahara_img_ctx.provider_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
>> + *				device
>> + * @dev_name: Name of the device for which the firmware folder name is requested
>> + *
>> + * This function searches through the list of Sahara image table providers to
>> + * find the provider matching the given device name. If a matching provider is
>> + * found, the firmware folder name associated with that provider is returned.
>> + * If the device name is invalid or no matching provider is found, the function
>> + * returns NULL.
>> + *
>> + * Return: Firmware folder name if found, otherwise NULL.
>> + */
>> +char *sahara_get_fw_folder_name(const char *dev_name)
>> +{
>> +	struct sahara_image_table_provider *provider;
>> +
>> +	/* Validate the device name */
>> +	if (!dev_name) {
>> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
>> +		return NULL;
>> +	}
>> +
>> +	/* Iterate through the list to find the matching provider */
>> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
>> +		if (strcmp(provider->dev_name, dev_name) == 0)
>> +			return provider->fw_folder_name;
>> +	}
>> +
>> +	return NULL;
>> +}
>> diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/drivers/accel/qaic/sahara_image_table_ops.h
>> new file mode 100644
>> index 000000000000..f8496bd1aa35
>> --- /dev/null
>> +++ b/drivers/accel/qaic/sahara_image_table_ops.h
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> +
>> +#ifndef __SAHARA_IMAGE_TABLE_OPS_H__
>> +#define __SAHARA_IMAGE_TABLE_OPS_H__
>> +
>> +#include <linux/list.h>
>> +
>> +/**
>> + * struct sahara_image_table_provider - Structure representing an image table
>> + *					provider.
>> + * @image_table: Pointer to the image table
>> + * @image_table_size: Size of the image table
>> + * @dev_name: Device name to identify the provider
>> + * @fw_folder_name: Name of the folder where the image binaries exist.
>> + * @list: List head for linking providers in a list
>> + *
>> + * This structure is used to represent an image table provider in the Sahara
>> + * driver. It contains a pointer to the image table, the size of the image
>> + * table, the device name for identifying the provider, and a list head for
>> + * linking providers in a linked list.
>> + */
>> +struct sahara_image_table_provider {
>> +	const char * const *image_table;
>> +	size_t image_table_size;
>> +	const char *dev_name;
>> +	char *fw_folder_name;
>> +	struct list_head list;
>> +};
>> +
>> +/**
>> + * sahara_register_image_table_provider - Register an image table provider.
> You already provide kernel-doc in the implementation, no need to
> duplicate it also in the header file.
>
> Regards,
> Bjorn
ACK.
>> + * @provider: Pointer to the sahara_image_table_provider structure to be
>> + *            registered.
>> + *
>> + * This function validates the provided sahara_image_table_provider structure
>> + * and adds it to the global list of image table providers. The list is
>> + * protected by a mutex to ensure thread-safe operations.
>> + *
>> + * Return: 0 on success, -EINVAL if the provider or its required fields are
>> + *         invalid.
>> + */
>> +int sahara_register_image_table_provider(struct sahara_image_table_provider
>> +					  *provider);
>> +
>> +/**
>> + * sahara_get_image_table - Get the image table for a given device name
>> + * @dev_name: The name of the device for which the image table is requested.
>> + *
>> + * This function iterates through the list of registered image table providers
>> + * and returns the image table for the provider matching the given device name.
>> + *
>> + * Return: A pointer to the image table if found, or NULL if no matching
>> + *         provider is found.
>> + */
>> +const char * const *sahara_get_image_table(const char *dev_name);
>> +
>> +/**
>> + * sahara_get_image_table_size - Get the size of the image table for a given
>> + *                               device name.
>> + * @dev_name: The name of the device for which the image table size is requested
>> + *
>> + * This function iterates through the list of registered image table providers
>> + * and returns the size of the image table for the provider matching the given
>> + * device name.
>> + *
>> + * Return: The size of the image table if found, or 0 if no matching provider
>> + *         is found or if the device name is invalid.
>> + */
>> +size_t sahara_get_image_table_size(const char *dev_name);
>> +
>> +/**
>> + * sahara_unregister_image_table_provider - Unregister an image table provider.
>> + * @provider: Pointer to the sahara_image_table_provider structure to be
>> + *            unregistered
>> + *
>> + * This function validates the provided sahara_image_table_provider structure
>> + * and removes it from the global list of image table providers. The list is
>> + * protected by a mutex to ensure thread-safe operations.
>> + *
>> + * Return: 0 on success, -EINVAL if the provider is invalid.
>> + */
>> +int sahara_unregister_image_table_provider(struct sahara_image_table_provider
>> +						*provider);
>> +
>> +/**
>> + * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
>> + *                             device
>> + * @dev_name: Name of the device for which the firmware folder name is requested
>> + *
>> + * This function searches through the list of Sahara image table providers to
>> + * find the provider matching the given device name. If a matching provider is
>> + * found, the firmware folder name associated with that provider is returned.
>> + * If the device name is invalid or no matching provider is found, the function
>> + * returns NULL.
>> + *
>> + * Return: Firmware folder name if found, otherwise NULL.
>> + */
>> +char *sahara_get_fw_folder_name(const char *dev_name);
>> +
>> +#endif // __SAHARA_IMAGE_TABLE_OPS_H__
>> -- 
>> 2.34.1
>>

