Return-Path: <linux-arm-msm+bounces-21856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE68FDF7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020CA280DE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 07:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA533D56D;
	Thu,  6 Jun 2024 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZhvpbASW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072D1E51D;
	Thu,  6 Jun 2024 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658549; cv=none; b=LiMq3ZG104J2c1wDN4ydhrm7BsLap0WSt8a1Xkqj7Bcpk9cGPz1U1jT9wMMqwoXxsxg+/vfKrWQ7RRvPZIyvmnQEPOOXg1fFxJqFMnPxFZFh1ZSNBgCjfBZj1pmMwvaKSUVIBwyhOWxolg4cmRfc3h171pFs65HFFlqrhjkhaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658549; c=relaxed/simple;
	bh=szT99mGZHql/9nIzB4JuC9TNyyUcXb4GeLPFPN+LAng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DaDsUc9Mn++35q2Sw/RFJiUKdfMXZ9YyGxpuicm8etaYxKVlZ9Iz9vYDpZm22dwgSftkMr1g4XqJKMAJ8xoSGyNqr8HbXtB3+XjjkOF6hUMNIEGVUnhIJ2U37mh1Ry0cyv0TUV/pBEgUTfQatYvf95arupHlrRDcxjP9OfhniHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZhvpbASW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455KICoa004174;
	Thu, 6 Jun 2024 07:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N7P+qpAqx1kFTEkel5RJU3y+gdL6UcRibDpmh659lw=; b=ZhvpbASWzo+wPdwZ
	Qwl/RthFSC1QS1XjqoAU60DlO80J2iU20H+g4qShP8T6IMHiAeMAOPiHMTsqf683
	XKK6rHuP9FidB8yJjFPr0Be0UDRbB8Zy9iwQU5slisu3Dxo/tiZMeD55dKf1vkyw
	zezN8rkgfjAN3Wmpe4XuTgAMjzopQcQcdC3jy5PwgBHn2twFApBHghEG+o9CUOXN
	Ylw0yyImxQx/XnnFIrCXUAoKhv12z5FSnPJYLGuOhnYQ7Vc91ZA3KtQIfKnCF1i7
	wpSKsviU2JhGPYrITu+3sYPYuHjeb9PP43vw5W23o5WxDR15O+NLr+anAvL8Y4CT
	fG+XQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjxxas1v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 07:22:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4567MLkv008618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 07:22:21 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 00:22:18 -0700
Message-ID: <becf237b-1f46-46cd-b196-fdfca35ef736@quicinc.com>
Date: Thu, 6 Jun 2024 12:52:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] misc: fastrpc: Restrict untrusted app to spawn
 signed PD
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-9-quic_ekangupt@quicinc.com>
 <q6vl2d7ekrjiwbr4h6cieh6q7vewhbiqay67wrglurphkigq4c@zoeyzywhypww>
 <6c026f78-d397-4375-a347-85f41bff1e99@quicinc.com>
 <7eygwrefc43aaqeihir3odjhdseeewweqvabvq6jg5bbmnhrkz@p33mhebq5v3w>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <7eygwrefc43aaqeihir3odjhdseeewweqvabvq6jg5bbmnhrkz@p33mhebq5v3w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _ufIZBHHGWcd2BdGZqHXuGL4ZfSL7WGH
X-Proofpoint-GUID: _ufIZBHHGWcd2BdGZqHXuGL4ZfSL7WGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=923 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060053



On 6/3/2024 3:32 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 03, 2024 at 11:57:52AM +0530, Ekansh Gupta wrote:
>> On 5/31/2024 5:19 AM, Dmitry Baryshkov wrote:
>>> On Thu, May 30, 2024 at 03:50:26PM +0530, Ekansh Gupta wrote:
>>>> Some untrusted applications will not have access to open fastrpc
>>>> device nodes and a privileged process can open the device node on
>>>> behalf of the application. Add a check to restrict such untrusted
>>>> applications from offloading to signed PD.
>>>>
>>>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>>>> Cc: stable <stable@kernel.org>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>   drivers/misc/fastrpc.c | 23 ++++++++++++++++++-----
>>>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 73fa0e536cf9..32615ccde7ac 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -328,6 +328,7 @@ struct fastrpc_user {
>>>>   	int pd;
>>>>   	bool is_secure_dev;
>>>>   	bool is_unsigned_pd;
>>>> +	bool untrusted_process;
>>>>   	char *servloc_name;
>>>>   	/* Lock for lists */
>>>>   	spinlock_t lock;
>>>> @@ -1249,13 +1250,17 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>>>   		 * channel is configured as secure and block untrusted apps on channel
>>>>   		 * that does not support unsigned PD offload
>>>>   		 */
>>>> -		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
>>>> -			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
>>>> -			return true;
>>>> -		}
>>>> +		if (!fl->cctx->unsigned_support || !unsigned_pd_request)
>>>> +			goto reject_session;
>>>>   	}
>>>> +	/* Check if untrusted process is trying to offload to signed PD */
>>>> +	if (fl->untrusted_process && !unsigned_pd_request)
>>>> +		goto reject_session;
>>>>   	return false;
>>>> +reject_session:
>>>> +	dev_dbg(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
>>>> +	return true;
>>>>   }
>>>>   static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
>>>> @@ -1504,12 +1509,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>>>   		goto err;
>>>>   	}
>>>> +	/*
>>>> +	 * Third-party apps don't have permission to open the fastrpc device, so
>>> Permissions depend on the end-user setup. Is it going to break if the
>>> user sets 0666 mode for fastrpc nodes?
>> If the root user sets 0666 for fastrpc nodes, it is expected that this check will get bypassed.
> So, any process will be trusted? This looks so Android-centric. Please come
> with a better way to define 'trusted'.
>
> On a typical UNIX system a used has multiple supplementary GIDs (which
> can be used to allow access to the devices) which have no relationship
> to the process effective GID. On a multi-user machine it might be
> logical that fastrpc nodes have separate group-id and group's read/write
> permissions. But then each of the users has their own unique 'effective'
> GID. Which of those should be using for computing the 'trusted' status?
Thanks for your suggestions, Dmitry. I am considering dropping this patch and system unsignedPD patch
from this series(due to the dependency). I'm redesigning the trusted-process term to make it more generic.
Planning to make it depend on the group IDs and have a check with both primary and supplementary GIDs
of the process. I'll share the design with you along with the changes once it's ready.
>
>>>> +	 * it is opened on their behalf by a priveleged process. This is detected
>>>> +	 * by comparing current PID with the one stored during device open.
>>>> +	 */
>>>> +	if (current->tgid != fl->tgid)
>>>> +		fl->untrusted_process = true;
>>> If the comment talks about PIDs, when why are you comparing GIDs here?
>> It should be GID, I'll update the comment in next spin.
>>
>>>> +
>>>>   	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
>>>>   		fl->is_unsigned_pd = true;
>>>>   	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
>>>> -		err = -ECONNREFUSED;
>>>> +		err = -EACCES;
>>>>   		goto err;
>>>>   	}
>>>> -- 
>>>> 2.43.0
>>>>


