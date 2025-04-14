Return-Path: <linux-arm-msm+bounces-54152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B3A87878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6666168AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632A51624CE;
	Mon, 14 Apr 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QHvDcUoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5E11DF970;
	Mon, 14 Apr 2025 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614723; cv=none; b=Oqraeo11dV3ZBOpxM5J8ptaTqVsT3Fp5r8uSDUsXfkpgIOoYtHq5gyP6MI2D5lR3MxzUutl2/pvhP8CwxgVvT4MlqnQMp3PB5Zhft/G/y6vWlnFmEqLxuEkrlkpVAfvnuaNveX8Fkl4tfs7YsQ7k21nT+R+GNBao449zCBX2wC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614723; c=relaxed/simple;
	bh=omLulRAPJqiFupOtXtKk+Cyon+UaGQDI1aTDMpWagFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TBlOzir3Fw1Nu8W/OEbBXHy1cUeVEsBHOBli3d1tzZw1ARKlXjM6uzOMr/1lGbx+aWDPMUNmFdcqMJv4JNXrAkiMu8NWas2UV01ir+mOVGu2OSgYc7seJeiEIMmgy/QGzSr2L2rs9tLRE11alFr6eYRVostxiHcZhc7ZJvQ/IrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QHvDcUoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DN98BO020918;
	Mon, 14 Apr 2025 07:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lo0KJlrE2tI1EHeozjkd1mbbghz/OmVDnd+mFmKsl5I=; b=QHvDcUoX0uMMgGgf
	aaSvK6XAg4oSXcQG9c6A7P6mk2mBb9XXErul2fa72BNKhkvolMWcZ1ECkB4KSFaC
	UTvh/qElZoLFuZ3a1j4vBuuz3dsIVTt691Q/prDDQJWpmxxWM5K8/Rh7FpjYt/hU
	R0RoIvLYVjwm+W1Sn2sFY3gCobgg7hmQIa9F1566ww4A2XRI2SU+VfTqZT/pPnDa
	/3Cyn2r7h7sY/uSfWNI1nz22BcLA5iyG+qqI1gGfYu9+jMf7RNyPl2q2xASjgQlt
	yyza2eGEVS0aZJ1zsX9Ax9+R0RvzA0w6Spql3Vzqmh5euDrss3Pj4GtlvV3kvOTb
	ZF3RdQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj3sq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:11:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E7Brbt003166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:11:53 GMT
Received: from [10.213.62.209] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 00:11:49 -0700
Message-ID: <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
Date: Mon, 14 Apr 2025 12:41:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <dmitry.baryshkov@oss.qualcomm.com>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
Content-Language: en-US
From: Deepika Singh <quic_dsi@quicinc.com>
In-Reply-To: <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fcb53a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GgkREn2YFvFD2luHkjYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yPT117nqYFgcG2VsXNd7ZFXhOR9nCWYe
X-Proofpoint-ORIG-GUID: yPT117nqYFgcG2VsXNd7ZFXhOR9nCWYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140050



On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
> 
> 
> On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
>> On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>>
>>>
>>> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
>>>>> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
>>>>>>> On 11/18/2024 7:32 PM, Greg KH wrote:
>>>>>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>>>>>>>>> Add changes to support debugfs. The fastrpc directory will be
>>>>>>>>> created which will carry debugfs files for all fastrpc processes.
>>>>>>>>> The information of fastrpc user and channel contexts are getting
>>>>>>>>> captured as part of this change.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/misc/fastrpc/Makefile        |   3 +-
>>>>>>>>>   drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>>>>>>>>   drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>>>>>>>>   drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>>>>>>>>   4 files changed, 205 insertions(+), 3 deletions(-)
>>>>>>>>>   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>>   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>>>>>>>>> index 020d30789a80..4ff6b64166ae 100644
>>>>>>>>> --- a/drivers/misc/fastrpc/Makefile
>>>>>>>>> +++ b/drivers/misc/fastrpc/Makefile
>>>>>>>>> @@ -1,3 +1,4 @@
>>>>>>>>>   # SPDX-License-Identifier: GPL-2.0
>>>>>>>>>   obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
>>>>>>>>> -fastrpc-objs    := fastrpc_main.o
>>>>>>>>> \ No newline at end of file
>>>>>>>>> +fastrpc-objs    := fastrpc_main.o \
>>>>>>>>> +                fastrpc_debug.o
>>>>>>>> Only build this file if debugfs is enabled.
>>>>>>>>
>>>>>>>> And again, "debug.c"?
>>>>>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
>>>>>>> few more debug specific changes, maybe then I'll need to change the build rules again.
>>>>>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..cdb4fc6845a8
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>> @@ -0,0 +1,156 @@
>>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>>>>>>>>> +
>>>>>>>>> +#include <linux/debugfs.h>
>>>>>>>>> +#include <linux/seq_file.h>
>>>>>>>>> +#include "fastrpc_shared.h"
>>>>>>>>> +#include "fastrpc_debug.h"
>>>>>>>>> +
>>>>>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>>>>> Please put the #ifdef in the .h file, not in the .c file.
>>>>>>> Ack
>>>>>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>>>>>>>>> +{
>>>>>>>>> +        char cur_comm[TASK_COMM_LEN];
>>>>>>>>> +        int domain_id, size;
>>>>>>>>> +        char *debugfs_buf;
>>>>>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>>>>>>>>> +
>>>>>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>>>>>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
>>>>>>>>> +        if (debugfs_dir != NULL) {
>>>>>>>>> +                domain_id = fl->cctx->domain_id;
>>>>>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>>>>>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
>>>>>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
>>>>>>>>> +                if (debugfs_buf == NULL)
>>>>>>>>> +                        return;
>>>>>>>>> +                /*
>>>>>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>>>>>>>>> +                 * domain_id in debugfs filename to create unique file name
>>>>>>>>> +                 */
>>>>>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>>>>>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
>>>>>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>>>>>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
>>>>>>>> Why are you saving the debugfs file?  What do you need to do with it
>>>>>>>> that you can't just delete the whole directory, or look up the name
>>>>>>>> again in the future when removing it?
>>>>>>> fl structure is specific to a process using fastrpc driver. The reason to save
>>>>>>> this debugfs file is to delete is when the process releases fastrpc device.
>>>>>>> If the file is not deleted, it might flood multiple files in debugfs directory.
>>>>>>>
>>>>>>> As part of this change, only the file that is getting created by a process is
>>>>>>> getting removed when process is releasing device and I don't think we
>>>>>>> can clean up the whole directory at this point.
>>>>>> My 2c: it might be better to create a single file that conains
>>>>>> information for all the processes instead of that. Or use fdinfo data to
>>>>>> export process / FD information to userspace.
>>>>> Thanks for your review. The reason of not having single file for all processes is that
>>>>> I can run 100s of iteration for any process(say calculator) and every time the properties
>>>>> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
>>>>> deleting the debugfs files for every process run.
>>>>>
>>>>> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
>>>>> the information(like in debugfs) here.
>>>> Which information is actually useful / interesting for application
>>>> developers? If not for the fdinfo, I might still vote for a single file
>>>> rather than a pile of per-process data.
Let’s say I am trying to do debugfs read when 10+ or more sessions are 
active per channel, then for pushing data of nth process in a single 
file, I would have to wait for n-1 processes, by that time process data 
might get changed. How do you suggest handling this?
>>> I have tried to capture all the information that could be useful.
>>>
>>> I can try changes to maintain single file for all active processes. Having this file specific
>>> to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
>>> carry information of all processes using that remoteproc.
>> I think it's a better idea, yes.
> 
> Hi all,
> 
> I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> on this patch series.
> 
> //Ekansh
> 
>>> --ekansh
>>>>> --ekansh
>>
> 


