Return-Path: <linux-arm-msm+bounces-21435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434308D7B8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10CA281B06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 06:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E39D23769;
	Mon,  3 Jun 2024 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q5yGXO7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB332C697;
	Mon,  3 Jun 2024 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396085; cv=none; b=p4waVdK5EzpLVCVQ3gtZgLjbUvu2Ixez93yhKzORdBxi1KFSbmojphgQHMINnigh8poYNnk9EhJkzYeKKAT6VgOT+zIuEQNt77GARepTgkKHzW2CiMBZhFy4XrZGWtoJ/fSOSS2ch01TgBYMAOTsNQGB0unFfNAJIt8Gv4+zn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396085; c=relaxed/simple;
	bh=m3uCOw5Oq6Ws4VLe0UebFiUBCCSn9H/PxdviJYo/6FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uQ34lzR1KaQuqjo0nGaIaymuHHyrIHUy6fwgapbMjNLX9E7l/9Er2eiBItVwNy7+/8Bs4Juy18Q9P29ugqmc8mp03DqlLbogefosFBSeClFepJm/G1Wbedd3s5raUgkya2Ms/CWsrJfSiX1InelK9h7EB0SvxCTYm/b2FjrZZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q5yGXO7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4530TMw2015299;
	Mon, 3 Jun 2024 06:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PRQC6fus/63q1Oq0gbaSfUmF+VTJt5AADZnZIVWM1E=; b=Q5yGXO7R7Q9LMEFU
	GGsAPCZQsdesvXKX61yzYKeRtlG5Ns8ZKozzwAu1QGvqwNzaI6MH/bi6PSZlTydj
	ML0sgV2iwJoKYBOddLq4z6qpILmJEHxNNCLwQG5j0Yu39uzQaOLgjqDzncGnpjUZ
	GknBdUtgMTxdyJZ4QHFiXfSSWoqtYgCpOdvTIjfFsas7C909tge2v1ZUMoRaUR8e
	EonzttpbSNeeDZQLLukMbqUA4C+kZsfkcfM5E0dvx/r5XnuwFRr/aieiSzMCRWIb
	PZAxCZ12Dh8cK45fkcDPI27QOeY2eCxI0vwqRaM+maeckVXDlg4U49I6MtAAPkmj
	LZt4Tg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wk3db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 06:27:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4536RwcZ018593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 06:27:58 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 23:27:55 -0700
Message-ID: <6c026f78-d397-4375-a347-85f41bff1e99@quicinc.com>
Date: Mon, 3 Jun 2024 11:57:52 +0530
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
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <q6vl2d7ekrjiwbr4h6cieh6q7vewhbiqay67wrglurphkigq4c@zoeyzywhypww>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yLcKAAH6bW9SF5b1fDWXuSEKuRkl_bhm
X-Proofpoint-ORIG-GUID: yLcKAAH6bW9SF5b1fDWXuSEKuRkl_bhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030053


On 5/31/2024 5:19 AM, Dmitry Baryshkov wrote:
> On Thu, May 30, 2024 at 03:50:26PM +0530, Ekansh Gupta wrote:
>> Some untrusted applications will not have access to open fastrpc
>> device nodes and a privileged process can open the device node on
>> behalf of the application. Add a check to restrict such untrusted
>> applications from offloading to signed PD.
>>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>   drivers/misc/fastrpc.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 73fa0e536cf9..32615ccde7ac 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -328,6 +328,7 @@ struct fastrpc_user {
>>   	int pd;
>>   	bool is_secure_dev;
>>   	bool is_unsigned_pd;
>> +	bool untrusted_process;
>>   	char *servloc_name;
>>   	/* Lock for lists */
>>   	spinlock_t lock;
>> @@ -1249,13 +1250,17 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>   		 * channel is configured as secure and block untrusted apps on channel
>>   		 * that does not support unsigned PD offload
>>   		 */
>> -		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
>> -			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
>> -			return true;
>> -		}
>> +		if (!fl->cctx->unsigned_support || !unsigned_pd_request)
>> +			goto reject_session;
>>   	}
>> +	/* Check if untrusted process is trying to offload to signed PD */
>> +	if (fl->untrusted_process && !unsigned_pd_request)
>> +		goto reject_session;
>>   
>>   	return false;
>> +reject_session:
>> +	dev_dbg(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
>> +	return true;
>>   }
>>   
>>   static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
>> @@ -1504,12 +1509,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   		goto err;
>>   	}
>>   
>> +	/*
>> +	 * Third-party apps don't have permission to open the fastrpc device, so
> Permissions depend on the end-user setup. Is it going to break if the
> user sets 0666 mode for fastrpc nodes?

If the root user sets 0666 for fastrpc nodes, it is expected that this check will get bypassed.

>
>> +	 * it is opened on their behalf by a priveleged process. This is detected
>> +	 * by comparing current PID with the one stored during device open.
>> +	 */
>> +	if (current->tgid != fl->tgid)
>> +		fl->untrusted_process = true;
> If the comment talks about PIDs, when why are you comparing GIDs here?

It should be GID, I'll update the comment in next spin.

>
>> +
>>   	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
>>   		fl->is_unsigned_pd = true;
>>   
>>   
>>   	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
>> -		err = -ECONNREFUSED;
>> +		err = -EACCES;
>>   		goto err;
>>   	}
>>   
>> -- 
>> 2.43.0
>>

