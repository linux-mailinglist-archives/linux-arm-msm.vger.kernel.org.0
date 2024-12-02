Return-Path: <linux-arm-msm+bounces-39815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB19DFDE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551A9B2274F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F2D1FBCAB;
	Mon,  2 Dec 2024 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VvH//XR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED61F949;
	Mon,  2 Dec 2024 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133476; cv=none; b=KSaLyQWXv7za/oORLNSKKaNzuuHhuXxX9jUcoFmPR/1jRtxwjzeh/NUspdXDWRNyy7fUDwUW81MSSZ/sM6r3Iqi2FMw90WygllUnKuJu20KctC5VdXAgxjARltQlEJ9xCj4XQU97C4+E43MD1h9zjiSOgAdqlmhMiwvO4iX7T1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133476; c=relaxed/simple;
	bh=HzjIx0ruBlOFDmMmZbtHvQIQAEBGqAuhW7fmVwTfJfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KowZWiM5uqI8q9zlUS2qh2wOtrij6y3SNiIgxzLY3RUvXU3q73FbbNktbuplyLDb1vMJqSvdmXdffGZOffHATaujUawRejU68QscE15cOwLXrdx5cVtpTxngdCrU4vZEFXnWIFUJ3V9CD/1hDGM+2IDSqckU9lhxpQnezg+j2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VvH//XR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28HFQT032619;
	Mon, 2 Dec 2024 09:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE8h/72Aa3n0axcTtOzsPf1oUCC9MTHu1/c+uJaZaWY=; b=VvH//XR+X88Kc0z/
	FiWBTK2OirCnLH9mg7mpBYEYVfAR/F4cccPztpi/GArTsV7YDh5/cL0+7aJuL3qQ
	NIQdSqLx/zQKpFfRLHWUwHf69iEFivC/zKQoBiKp7o5A/oU1fBnXmBDubjYvmNXh
	G674mBmYPCtU1rivoCg+GIaEORY2FYrZhrYKIFdgcYOYMPZMNPNlb1Ylg7pJ2oc/
	jQDK5qnP8twgScwv8pMvDGrbftOsUGzWGbsrnHHejAo9jYSC6eLE/gXrZIJzQz1q
	5aNCEML51RYMZ/PsgN7AkOrG0g6G0jP4nKHraNq5EmsmWyNbBcAdmfdIMUSAvbIL
	Wz5Y4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36ccwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:57:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29vnBv031431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:57:49 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:57:46 -0800
Message-ID: <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
Date: Mon, 2 Dec 2024 15:27:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hVsfgsixexTtICsium2SN9mM1exSnKbd
X-Proofpoint-ORIG-GUID: hVsfgsixexTtICsium2SN9mM1exSnKbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020088



On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
>>
>> On 11/18/2024 7:32 PM, Greg KH wrote:
>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>>>> Add changes to support debugfs. The fastrpc directory will be
>>>> created which will carry debugfs files for all fastrpc processes.
>>>> The information of fastrpc user and channel contexts are getting
>>>> captured as part of this change.
>>>>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>>>
>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>>>> index 020d30789a80..4ff6b64166ae 100644
>>>> --- a/drivers/misc/fastrpc/Makefile
>>>> +++ b/drivers/misc/fastrpc/Makefile
>>>> @@ -1,3 +1,4 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>>>> -fastrpc-objs	:= fastrpc_main.o
>>>> \ No newline at end of file
>>>> +fastrpc-objs	:= fastrpc_main.o \
>>>> +		fastrpc_debug.o
>>> Only build this file if debugfs is enabled.
>>>
>>> And again, "debug.c"?
>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
>> few more debug specific changes, maybe then I'll need to change the build rules again.
>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>>>> new file mode 100644
>>>> index 000000000000..cdb4fc6845a8
>>>> --- /dev/null
>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>>>> @@ -0,0 +1,156 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>>>> +
>>>> +#include <linux/debugfs.h>
>>>> +#include <linux/seq_file.h>
>>>> +#include "fastrpc_shared.h"
>>>> +#include "fastrpc_debug.h"
>>>> +
>>>> +#ifdef CONFIG_DEBUG_FS
>>> Please put the #ifdef in the .h file, not in the .c file.
>> Ack
>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>>>> +{
>>>> +	char cur_comm[TASK_COMM_LEN];
>>>> +	int domain_id, size;
>>>> +	char *debugfs_buf;
>>>> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>>>> +
>>>> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>>>> +	cur_comm[TASK_COMM_LEN-1] = '\0';
>>>> +	if (debugfs_dir != NULL) {
>>>> +		domain_id = fl->cctx->domain_id;
>>>> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>>>> +				current->pid, fl->tgid, domain_id) + 1;
>>>> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
>>>> +		if (debugfs_buf == NULL)
>>>> +			return;
>>>> +		/*
>>>> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>>>> +		 * domain_id in debugfs filename to create unique file name
>>>> +		 */
>>>> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>>>> +			cur_comm, current->pid, fl->tgid, domain_id);
>>>> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>>>> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
>>> Why are you saving the debugfs file?  What do you need to do with it
>>> that you can't just delete the whole directory, or look up the name
>>> again in the future when removing it?
>> fl structure is specific to a process using fastrpc driver. The reason to save
>> this debugfs file is to delete is when the process releases fastrpc device.
>> If the file is not deleted, it might flood multiple files in debugfs directory.
>>
>> As part of this change, only the file that is getting created by a process is
>> getting removed when process is releasing device and I don't think we
>> can clean up the whole directory at this point.
> My 2c: it might be better to create a single file that conains
> information for all the processes instead of that. Or use fdinfo data to
> export process / FD information to userspace.
Thanks for your review. The reason of not having single file for all processes is that
I can run 100s of iteration for any process(say calculator) and every time the properties
of the process can differ(like buffer, session etc.). For this reason, I'm creating and
deleting the debugfs files for every process run.

Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
the information(like in debugfs) here.

--ekansh
>
>


