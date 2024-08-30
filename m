Return-Path: <linux-arm-msm+bounces-30190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF61965AA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F36A1F245D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4B516DED4;
	Fri, 30 Aug 2024 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MBPn82I8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1908D16E873;
	Fri, 30 Aug 2024 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007467; cv=none; b=BlGRMb/JHHiX6E03HGH703H96kNklpQdx5TRUWzd5HcsPla5uJHc0+r06foZhiHKB8uNlilIhlNtS3JtMt08IBE+ZEscaTvct37EuSoc0P+M3+r5aWPoaEUH98jm2RZOm9cMjg489pMh3wV7Ko8OWvrA4PRcrzMDiX/m1SIUkRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007467; c=relaxed/simple;
	bh=C225QkJd2epNCH0etsveqgpfETwyaMzzkR42Qj72KpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o3bn6zQLPBfpSKgGUotbWSP+HPhJv4gNbgV4D0ER/TY/dcWDWHsxlgIvwJYQ/PoX77FN1r/XTiI93KqyDP5/yluQBOMnejO0xJSI2zUIVPrJEEJrfRBmqnpG9tkHgcfjPSLGyz3HigAyN7kJzq0p24Ufdro/ibYGEzJ5Fxbss0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MBPn82I8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7wlPe019971;
	Fri, 30 Aug 2024 08:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oq2dse9VR1I6VjtxSVdHNe1+4MMRfLvcK9XF6VbBV/E=; b=MBPn82I86lzF3g7b
	FmELT6vYuyRe/jbMqjLwRPl16p3KrMVXkYIMf3QH+FEK1CoGjDAIuVtrAtv8uW8c
	451xYoEXNWSJ2mwPskJ54hGCMDci5LyJnm0VnKTxZPsantNlSQLNeLd//bio9FsV
	BbPiElRpXheVyv+NS/iQBZhMNHRnpyGb4Du5mjn2yd8LJOTxX5pxgiE5Lzve3o3s
	Es3RNLd7dtrJZK+wCygsu9Mw/MEaRW/ImYjDWLM2VFyHbib4sBIeqRGgL1n6bEvR
	28jEW9sDbJiz8O6R65VVnPvqdD50KvfTNymYHyEH1lv/hqSWwFtJHPAGysv0RXpy
	GXCNvQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putr29j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 08:44:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U8iKp9014726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 08:44:20 GMT
Received: from [10.204.65.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 01:44:18 -0700
Message-ID: <4b0b90e2-a6c1-40d7-9dc6-ec22adfafca4@quicinc.com>
Date: Fri, 30 Aug 2024 14:14:15 +0530
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
        <quic_ktadakam@quicinc.com>, <dri-devel@lists.freedesktop.org>
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
 <2024073007-nickname-payee-20c8@gregkh>
 <7eab4618-9173-44f5-a185-0071f3893cc7@quicinc.com>
 <2024081353-blah-reversion-1435@gregkh>
Content-Language: en-US
From: Abhishek Singh <quic_abhishes@quicinc.com>
In-Reply-To: <2024081353-blah-reversion-1435@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fPnWUN-dZcG1MQM9iX8EXEY13SosmtZG
X-Proofpoint-ORIG-GUID: fPnWUN-dZcG1MQM9iX8EXEY13SosmtZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300064



On 8/13/2024 3:07 PM, Greg KH wrote:
> On Mon, Aug 05, 2024 at 04:36:28PM +0530, Abhishek Singh wrote:
>>
>> On 7/30/2024 12:46 PM, Greg KH wrote:
>>> On Tue, Jul 30, 2024 at 12:39:45PM +0530, Abhishek Singh wrote:
>>>> The user process on ARM closes the device node while closing the
>>>> session, triggers a remote call to terminate the PD running on the
>>>> DSP. If the DSP is in an unstable state and cannot process the remote
>>>> request from the HLOS, glink fails to deliver the kill request to the
>>>> DSP, resulting in a timeout error. Currently, this error is ignored,
>>>> and the session is closed, causing all the SMMU mappings associated
>>>> with that specific PD to be removed. However, since the PD is still
>>>> operational on the DSP, any attempt to access these SMMU mappings
>>>> results in an SMMU fault, leading to a panic.  As the SMMU mappings
>>>> have already been removed, there is no available information on the
>>>> DSP to determine the root cause of its unresponsiveness to remote
>>>> calls. As the DSP is unresponsive to all process remote calls, use
>>>> BUG_ON to prevent the removal of SMMU mappings and to properly
>>>> identify the root cause of the DSP’s unresponsiveness to the remote
>>>> calls.
>>>>
>>>> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 5204fda51da3..bac9c749564c 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -97,6 +97,7 @@
>>>>  #define FASTRPC_RMID_INIT_CREATE_STATIC	8
>>>>  #define FASTRPC_RMID_INIT_MEM_MAP      10
>>>>  #define FASTRPC_RMID_INIT_MEM_UNMAP    11
>>>> +#define PROCESS_KILL_SC 0x01010000
>>>>  
>>>>  /* Protection Domain(PD) ids */
>>>>  #define ROOT_PD		(0)
>>>> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>>>  	fastrpc_context_get(ctx);
>>>>  
>>>>  	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
>>>> +	/* trigger panic if glink communication is broken and the message is for PD kill */
>>>> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
>>>> +			(ctx->sc == PROCESS_KILL_SC));
>>>
>>> You just crashed the machine completely, sorry, but no, properly handle
>>> the issue and clean up if you can detect it, do not break systems.
>>>
>> But the Glink communication with DSP is already broken; we cannot communicate with the DSP.
>> The system will crash if we proceed with cleanup on the ARM side. If we don’t do cleanup,
>> a resource leak will occur. Eventually, the system will become dead. That’s why I am
>> crashing the device.
> 
> Then explicitly call panic() if you think you really want to shut the
> system down.
>
>> What does it mean to explicitly call panic()? Are you trying to say we should use panic() instead of BUG_ON()?
> 
> greg k-h


