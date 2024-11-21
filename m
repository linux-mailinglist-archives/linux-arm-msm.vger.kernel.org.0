Return-Path: <linux-arm-msm+bounces-38617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2199D47EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E7F283D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DB015665E;
	Thu, 21 Nov 2024 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A+vhrPYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A501A3BC8;
	Thu, 21 Nov 2024 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171366; cv=none; b=Ck0p6D/h/JAT/k9SubQIApw6woM/A0qh1z58gb6zTG6tZZ97B00U4gPBHfLGtY7K2OWlxiXEuCKWOP+ISbrCblLiKi2UbvvGw+Ud3JyzJ3UAV61OqDesrLw97n8GPgUD+c4eN0te0ffI67oYpYNpSjReaIVweRj2wroSAGraxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171366; c=relaxed/simple;
	bh=9lQwP/0+cKuX3tW3z+nW1BX1KeIrkjm4Xw+2ve5/aHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOlwJK4z4U3gML6Zm7cwrP6Q+tmkoaQhhNKXQgR1L6ESsj7A3qKeIW3iLMmK9In3mZ9xJXmlYqcFA1sefYgX9+1qBCplDdVYnotcL8tGCWZkXG76WYlrDXRbnQjB/8Ur9l8MpUhuV/XdsArgrmFone11jth8c09TqsRkIoH48rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A+vhrPYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0TTQn026010;
	Thu, 21 Nov 2024 06:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfNzy9g5Cy/oIro3ADWMAQY68R/YxCz0HFf2tevRnI0=; b=A+vhrPYj9ijj2hz7
	XuoaX3yZjaZ2aRQtHykyhlTL23b2jYislXS6GTL2q+vfPZ14RwSRSt5kbiI3UnxD
	unqwdlcv60ErGe/Uk1jGAaFqV1XKpKbzCNWIhfxgVya6okgHDV6WJA4T5uRAA26e
	rj5UQBAhIRTKpsbuXcSn8LdD3FkVCyOmKksAKc+HVf6q6cWG8riQtN5cmnSzkzay
	VuQfiGv+HmMeVdeqW2LISKFb3xUFzPYt2PvmDfkpCI3o14sEKxucLz1Nw+/m3gzl
	BfzLN+fV3hh3Xzv+zQfAfJRlD91J52F5pWkHX2udEWW8jcFOzfkOlnsfxjTt0Fpo
	okZGpQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyamwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:42:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6gO0e002029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:42:24 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:42:21 -0800
Message-ID: <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
Date: Thu, 21 Nov 2024 12:12:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024111804-doze-reflected-0feb@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bguHFXILvBFJOECbbodaCIFWxCJlOlMR
X-Proofpoint-ORIG-GUID: bguHFXILvBFJOECbbodaCIFWxCJlOlMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210050



On 11/18/2024 7:32 PM, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>> Add changes to support debugfs. The fastrpc directory will be
>> created which will carry debugfs files for all fastrpc processes.
>> The information of fastrpc user and channel contexts are getting
>> captured as part of this change.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc/Makefile        |   3 +-
>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>  4 files changed, 205 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>
>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>> index 020d30789a80..4ff6b64166ae 100644
>> --- a/drivers/misc/fastrpc/Makefile
>> +++ b/drivers/misc/fastrpc/Makefile
>> @@ -1,3 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>> -fastrpc-objs	:= fastrpc_main.o
>> \ No newline at end of file
>> +fastrpc-objs	:= fastrpc_main.o \
>> +		fastrpc_debug.o
> Only build this file if debugfs is enabled.
>
> And again, "debug.c"?
I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
few more debug specific changes, maybe then I'll need to change the build rules again.
>
>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>> new file mode 100644
>> index 000000000000..cdb4fc6845a8
>> --- /dev/null
>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>> @@ -0,0 +1,156 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/seq_file.h>
>> +#include "fastrpc_shared.h"
>> +#include "fastrpc_debug.h"
>> +
>> +#ifdef CONFIG_DEBUG_FS
> Please put the #ifdef in the .h file, not in the .c file.
Ack
>
>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>> +{
>> +	char cur_comm[TASK_COMM_LEN];
>> +	int domain_id, size;
>> +	char *debugfs_buf;
>> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>> +
>> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>> +	cur_comm[TASK_COMM_LEN-1] = '\0';
>> +	if (debugfs_dir != NULL) {
>> +		domain_id = fl->cctx->domain_id;
>> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>> +				current->pid, fl->tgid, domain_id) + 1;
>> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
>> +		if (debugfs_buf == NULL)
>> +			return;
>> +		/*
>> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>> +		 * domain_id in debugfs filename to create unique file name
>> +		 */
>> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>> +			cur_comm, current->pid, fl->tgid, domain_id);
>> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> Why are you saving the debugfs file?  What do you need to do with it
> that you can't just delete the whole directory, or look up the name
> again in the future when removing it?
fl structure is specific to a process using fastrpc driver. The reason to save
this debugfs file is to delete is when the process releases fastrpc device.
If the file is not deleted, it might flood multiple files in debugfs directory.

As part of this change, only the file that is getting created by a process is
getting removed when process is releasing device and I don't think we
can clean up the whole directory at this point.

Do you suggest that looking up the name is a better approach that saving
the file?
>
>> +		kfree(debugfs_buf);
>> +	}
>> +}
>> +
>> +void fastrpc_remove_user_debugfs(struct fastrpc_user *fl)
>> +{
>> +	debugfs_remove(fl->debugfs_file);
> Why remove just the file and not the whole directory?
As mentioned above, file process specific and is getting created when
any process uses fastrpc driver. It is getting deleted when the process
releases the device.
>
>> +}
>> +
>> +struct dentry *fastrpc_create_debugfs_dir(const char *name)
>> +{
>> +	return debugfs_create_dir(name, NULL);
> At the root of debugfs?  Why is this function even needed?
creating a dir named "fastrpc_adsp", "fastrpc_cdsp" etc. to create debugfs
file for the processes using adsp, cdsp etc.
>
>> +}
>> +
>> +void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs)
>> +{
>> +	debugfs_remove_recursive(cctx_debugfs);
> See, you don't need the debugfs file reference at all, you don't do
> anything with it.
right, I can try with look up.
> And again, why are you wrapping basic debugfs functions with your own
> version?  Please don't do that.
Ack. Thanks for reviewing this change.

--ekansh
>
> thanks,
>
> greg k-h


