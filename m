Return-Path: <linux-arm-msm+bounces-22366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D89049F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C0F1F23163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 04:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143971F60A;
	Wed, 12 Jun 2024 04:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DNP6//o8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAED29B;
	Wed, 12 Jun 2024 04:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166302; cv=none; b=uVnHFuXS3OTKYfKCTTvLwvo1uYHa05wEH4gsOFWVH8YE4zMaIq+Wqj8pt3lgEA9hvgz9IvDcXYhhclRiTsJ3b/C6EZ+0k6GIENJq7oGAWJ+tA9pZmjBzVS2J3cLUTnHJrhW3sOEakeaR8V2ccUCwjGVWuEZPePMC5qKWmWDtva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166302; c=relaxed/simple;
	bh=78ncIyaP7pYcdKMoaPU7VdQY1FQ4HrATW1XybqOLtNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P1J1nrAQfEyX0g/PeVGoQKf5HizA5M+WeIWScQdL2N7wRExyAPJXl5A+Jz9AJ/7R48FykUXXXgUMDRBmYfUKJp2/NetqR1+25XHyk3yOtKIn43sFJE8Z1njmw9B8J3qluzVuaHxgUBh49ZzYxDkJrjCJtUNhFFA46h4UfCGLqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DNP6//o8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BHHppI001173;
	Wed, 12 Jun 2024 04:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKHD1zmjF9P4ZtQEVORcTZtEvMNDGPxVrC7RhKQw4T8=; b=DNP6//o8x3Vajfff
	ZkEimIbiwPr4eHe9zcuCSguflur8wL9oJSIQbxxKSqhZog03yhl/spDMgNEih42X
	g9GqIR3dFZAh5mOcdeTAeKARZWYiNM4eoe4T+0GkMNJqY6ZYPyqS7bEWFKz/5W70
	YkDSgM87YaKtdQUxk6z+OChhPIKoL/U+gVMrK/u+ICc5987V7sn9oWXY78uaXB7b
	f+TPuvzTbywjtBE6NfDryhE69n/Ift2bTF96QrtAVnABNqmHiH13uXp+wYDhQUnw
	13l+RJSe9HY5t4U9ifspvWQ1ov6hXC25TXy8wYOtQCKj93W/m1JxXVosBwDpjqCf
	hF1rwA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy15dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 04:24:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C4OrV3001927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 04:24:53 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 21:24:50 -0700
Message-ID: <7d75f6b1-60fe-4a03-a251-4675a3364148@quicinc.com>
Date: Wed, 12 Jun 2024 09:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] misc: fastrpc: Fix ownership reassignment of
 remote heap
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
 <20240611103442.27198-7-quic_ekangupt@quicinc.com>
 <xc2ys75plbtrenastitqafadfrtolpd3bjdqcrl3wnozpc6kdo@e6e73ousyea7>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <xc2ys75plbtrenastitqafadfrtolpd3bjdqcrl3wnozpc6kdo@e6e73ousyea7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pDjTw1QLgo9oFpG5hPkAdDLwRFwaKZgz
X-Proofpoint-ORIG-GUID: pDjTw1QLgo9oFpG5hPkAdDLwRFwaKZgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_01,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120028



On 6/11/2024 5:29 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 11, 2024 at 04:04:39PM +0530, Ekansh Gupta wrote:
>> Audio PD daemon will allocate memory for audio PD dynamic loading
> What is Audio PD daemon? Is it something running on the CPU or on the
> DSP? Is it adsprpcd or some other daemon?
It's adsprpcd which is going to attach to Audio PD.
>
>> usage when it is attaching for the first time to audio PD. As
>> part of this, the memory ownership is moved to the VM where
> Which VM?
In audio PD case, it's the following VMIDs:
QCOM_SCM_VMID_LPASS
QCOM_SCM_VMID_ADSP_HEAP

Defined here: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/firmware/qcom,scm.h?h=v6.10-rc3

These are expected to be added to fastrpc DT node as "qcom,vmids"

>
>> audio PD can use it. In case daemon process is killed without any
>> impact to DSP audio PD, the daemon process will retry to attach to
>> audio PD and in this case memory won't be reallocated. If the invoke
>> fails due to any reason, as part of err_invoke, the memory ownership
>> is getting reassigned to HLOS even when the memory was not allocated.
>> At this time the audio PD might still be using the memory and an
>> attemp of ownership reassignment would result in memory issue.
> What kind of 'memory issues'? Is it even possible to reclaim the memory
> back?
In case when audio PD on DSP is still using the memory, the ownership should not be
moved to HLOS. This might happen in daemon kill scenario where remote_heap is not
allocated again, but if due to any reason if the fastrpc_internal_invoke fails, that might
result in the ownership change of remote_heap memory.
>
>> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1ba85c70e3ff..24dc1cba40e9 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1238,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	struct fastrpc_phy_page pages[1];
>>  	char *name;
>>  	int err;
>> +	bool scm_done = false;
>>  	struct {
>>  		int pgid;
>>  		u32 namelen;
>> @@ -1289,6 +1290,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>>  				goto err_map;
>>  			}
>> +			scm_done = true;
>>  		}
>>  	}
>>  
>> @@ -1324,7 +1326,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  
>>  	return 0;
>>  err_invoke:
>> -	if (fl->cctx->vmcount) {
>> +	if (fl->cctx->vmcount && scm_done) {
>>  		u64 src_perms = 0;
>>  		struct qcom_scm_vmperm dst_perms;
>>  		u32 i;
>> -- 
>> 2.43.0
>>


