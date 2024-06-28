Return-Path: <linux-arm-msm+bounces-24617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116091BC9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 12:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED9A31F240CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EF2154434;
	Fri, 28 Jun 2024 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nGrdi3t7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A51514DD;
	Fri, 28 Jun 2024 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719570592; cv=none; b=S8QtnM5kXyeZ5YNngxCav6WiNb9/OGJ6bxqgNOTukOUWC+ijQF4DQW6LsDhuiikic6WtdFVWGhonTIaab1tDL4nI+vLMNpUGPmh1SUki92u3d16VjifIWNF/OMCdiLNYMIL8O2AeXlLf/cZuKDpkw0X43ltPNpWaZEKQnEQtvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719570592; c=relaxed/simple;
	bh=g0UlWRpuWPHqJatkY6d1jhQBJAHBe6XAKHB8uo046Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WE7Xet7nw9UUNE9UIcVkbKBeaLEJVGwSUH04H5KH9iRSlo+dJXqwrdGV6LiY07ksQGnVSVLyLtlN+i/GuuITqAkSh5huvsbOpDdqKytoOrB6TGS52TblTBVDP+9sb0+0i/fJAej/JGyq48p3N8gn4bwtmJAl/ZInNsZR8G7j27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nGrdi3t7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SALtv8001294;
	Fri, 28 Jun 2024 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj/dXJvb3tdoEKfiVsF1o+98MLXQ+GvKIKHtJVX1pwE=; b=nGrdi3t7Xbfog2Js
	je+GpVABigJ9JKFQGX2sfmIF8ZS4RKuXSXjYxJhWb5dxkpjkBhtXC4dj96ZmzrUC
	EYhYNl+ac5PxzKW5OrQ4AUcvZYTcci24KkU9mOIyOn6G9QPIqyKl0+/So4bPS+No
	9795lNJAe4c9L2JoaTkp+CwLpLZBCuhHu3JsyH11azLchJvyZ2Ob+jZkFySFr/xD
	4Xo6E0gEKtzAt/3beJU3zMGBg5CXWV/qLbGi129mcdjbh2rG1B8mddTmi2U4dhlp
	986cERMmq3Apkh+zyuzXe+CNh/5BDTaf2Ye3yDI/a0D4X9uss7GB3jFtRGf2HZPf
	5UgFPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401ubvr0tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:29:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SATgtO020903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:29:42 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 03:29:39 -0700
Message-ID: <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
Date: Fri, 28 Jun 2024 15:59:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0wpf4uAaiK_XRH1ZL7sFYkVyiRI7g3Jx
X-Proofpoint-GUID: 0wpf4uAaiK_XRH1ZL7sFYkVyiRI7g3Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280077



On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. This size is passed
>> by user space and is checked against a max size. For unsigned PD
>> offloading, more than 2MB size could be passed by user which would
>> result in PD initialization failure. Remove the user PD initmem size
>> check and allow buffer allocation for user passed size. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
> Would it allow malicious userspace to allocate big enough buffers and
> reduce the amount of memory available to the system? To other DSP
> programs?
The allocation here is happening from SMMU context bank which is uniquely assigned
to processes going to DSP. As per my understanding process can allocate maximum
4GB of memory from the context bank and the memory availability will be taken care
by kernel memory management. Please correct me if my understanding is incorrect.

--Ekansh
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>   - Modified commit text.
>>   - Removed size check instead of updating max file size.
>>
>>  drivers/misc/fastrpc.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 5204fda51da3..9d064deeac89 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> -	if (init.filelen > INIT_FILELEN_MAX) {
>> -		err = -EINVAL;
>> -		goto err;
>> -	}
>> -
>>  	inbuf.pgid = fl->tgid;
>>  	inbuf.namelen = strlen(current->comm) + 1;
>>  	inbuf.filelen = init.filelen;
>> -- 
>> 2.34.1
>>


