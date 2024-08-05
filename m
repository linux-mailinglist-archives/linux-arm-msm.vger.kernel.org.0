Return-Path: <linux-arm-msm+bounces-27923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32B947A39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 13:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1304C2821EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6511C155386;
	Mon,  5 Aug 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FYi+u/QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57D155315;
	Mon,  5 Aug 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722856014; cv=none; b=kWKuWroFhCeW3OZFyoRf0NDl5uR6Eod6TuTH1UpVIHWKC3DFTg5rR0pN8cKo8r91wD0Usyg3qH/tqZI8T0YsMhiUG/DgtPZrFKgtu8QQV4rP7LEGpELAVvX+X9Dfwr+hVV8JMUqn0K3654Yb67tezBjZuQeY71TlTeAtPFA9eqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722856014; c=relaxed/simple;
	bh=75jHc2LwJDmYCiU5QfHjRi9tPjpik5ICU2y4Aa4Bbnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cw5WehdUZeu7/nS3uOIkeWBjGl6PB+jRNC84fBkq+If4fQB4fFsap1zmIRXZh8com674wukjfSk9et/J5nCgjQBSKWlYNweFAKY52gjYu8LEtjsTDcopXJz8c4a/OiMOAbRRDQeGqWwjv9KZ/kLLMtZ0AJOm5qxKiJ6DdvvByn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FYi+u/QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752W9vN011492;
	Mon, 5 Aug 2024 11:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kbhei228ZYPN7VzuJkfD88CHLXumPVxR2W3/KYWx5Z8=; b=FYi+u/QGNr0NhC4W
	KWgLT72ZrvFonEjzmBVo9NF/4cZdwCQE4eYiFp+NmeH5hNNvwNUJFhkHF5rvZLgs
	xb95JhBpNT4Kw2PtNqbaoDl5iNlNt4sHLdpsPS4O3Jk71fBcBNwCoUNd4pkPj7LZ
	EBHbFMAajKyjyeDqQz/00yBcURKN1TjKaNl9ZADqCNPevdWjadJTlWvZqAlJ9iRS
	uSMj1pxUE9QU3pNm0/+TkPOPRvNkESoGvsVGlwcHqNll40GeKJMvXPRJlCHiO8JT
	As9QOJZhkA34uJYM+bhLDPVNn61fCQgTvgURCHvSjgDmFPTyorhB7wzo3oNXNtdj
	apvdFg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sc4y3sa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 11:06:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 475B6Y0A022973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 11:06:34 GMT
Received: from [10.204.65.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 04:06:32 -0700
Message-ID: <7eab4618-9173-44f5-a185-0071f3893cc7@quicinc.com>
Date: Mon, 5 Aug 2024 16:36:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_ktadakam@quicinc.com>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
 <2024073007-nickname-payee-20c8@gregkh>
Content-Language: en-US
From: Abhishek Singh <quic_abhishes@quicinc.com>
In-Reply-To: <2024073007-nickname-payee-20c8@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kcwV0vokLrpN77KFMXAiqn5IZcH3AvQ1
X-Proofpoint-GUID: kcwV0vokLrpN77KFMXAiqn5IZcH3AvQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050080


On 7/30/2024 12:46 PM, Greg KH wrote:
> On Tue, Jul 30, 2024 at 12:39:45PM +0530, Abhishek Singh wrote:
>> The user process on ARM closes the device node while closing the
>> session, triggers a remote call to terminate the PD running on the
>> DSP. If the DSP is in an unstable state and cannot process the remote
>> request from the HLOS, glink fails to deliver the kill request to the
>> DSP, resulting in a timeout error. Currently, this error is ignored,
>> and the session is closed, causing all the SMMU mappings associated
>> with that specific PD to be removed. However, since the PD is still
>> operational on the DSP, any attempt to access these SMMU mappings
>> results in an SMMU fault, leading to a panic.  As the SMMU mappings
>> have already been removed, there is no available information on the
>> DSP to determine the root cause of its unresponsiveness to remote
>> calls. As the DSP is unresponsive to all process remote calls, use
>> BUG_ON to prevent the removal of SMMU mappings and to properly
>> identify the root cause of the DSP’s unresponsiveness to the remote
>> calls.
>>
>> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 5204fda51da3..bac9c749564c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -97,6 +97,7 @@
>>  #define FASTRPC_RMID_INIT_CREATE_STATIC	8
>>  #define FASTRPC_RMID_INIT_MEM_MAP      10
>>  #define FASTRPC_RMID_INIT_MEM_UNMAP    11
>> +#define PROCESS_KILL_SC 0x01010000
>>  
>>  /* Protection Domain(PD) ids */
>>  #define ROOT_PD		(0)
>> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  	fastrpc_context_get(ctx);
>>  
>>  	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
>> +	/* trigger panic if glink communication is broken and the message is for PD kill */
>> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
>> +			(ctx->sc == PROCESS_KILL_SC));
> 
> You just crashed the machine completely, sorry, but no, properly handle
> the issue and clean up if you can detect it, do not break systems.
> 
But the Glink communication with DSP is already broken; we cannot communicate with the DSP.
The system will crash if we proceed with cleanup on the ARM side. If we don’t do cleanup,
a resource leak will occur. Eventually, the system will become dead. That’s why I am
crashing the device.
> greg k-h

