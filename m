Return-Path: <linux-arm-msm+bounces-26681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB993880E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 06:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 673A01C20D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 04:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CFA12B63;
	Mon, 22 Jul 2024 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WuunfAdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C081759F;
	Mon, 22 Jul 2024 04:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721622152; cv=none; b=jN5AWRF6LsnNQ5mLztNQeACBwIuDcntoH9sKJZRctnbstgGlWHZ9j0G1iNQNs+NWPFx5JymRqAov+EViNBq/540czur29NtwOf8bBrLRJg5TQjiXj9kDMIJiCre84U23TqHyWYKRTIUN4SZKFTW38LtJIONeTQsA2aJ6RxurkZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721622152; c=relaxed/simple;
	bh=62ls2IOTmXlvc5qzKM2wL/hisK4eyQN4wuTl9T4gi48=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PN9Uja86zA1EqGgXEF2Cy9w6Eo5xgIFeQm41p9UCyLgcuvuACyzdfdeDvCYGmMGELRbLxcfyq6kYurppsIVj5HzI3tbOSxXfYWfCX6kOFxiqnK7KTcODygnIEEZBjhokahvDtPRJyGlKNQLxW3XPm+/KbZgwKfsnBHau06BZ1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WuunfAdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LN0rq4016040;
	Mon, 22 Jul 2024 04:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3EOVUD+WO15qHR0VO6+BdaZL27VH5th1kQoboWWqD0=; b=WuunfAdvdeSCR/My
	0VIN+B7esRTRYL1X+NY1vLta/Ld/BnMVKlLgXl+KSEn/HRIk/Trl11CZrUizIcaH
	08Zul3SgANcrpPH++WRe08L74PaHefdySC5kt6aZI6ht5EyhTks1CHZ3wBuj/tsv
	WeGc2oU2Pc4Vcoquk+Di2BOdJZ44dROzci8IEdPBtrr4KI1+4zuOgo4SFWYnJaPO
	Ac3kU38FWM25eBQsppdCrdEtnPxzMBIBwVKX/xjBfbu3YscS5wuVDfsT2D8Eh70/
	XsSct+LCoxvh9CYBSjcItSvQlho5cguvqDKr58ONaJdoKwAh1AOIpAJ+NL74z0y0
	feACIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g46s2m6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 04:22:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M4MG2g013466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 04:22:16 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Jul
 2024 21:22:13 -0700
Message-ID: <1fa821d4-eeba-4df9-8c08-f289832e0632@quicinc.com>
Date: Mon, 22 Jul 2024 09:51:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] misc: fastrpc: Increase unsigned PD initmem size
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>
 <wd3vpjh6u7tsaxccc6ek5t3ryio453exaprsmkxyzsh4brx7qk@ywkerf5fwqnd>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <wd3vpjh6u7tsaxccc6ek5t3ryio453exaprsmkxyzsh4brx7qk@ywkerf5fwqnd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -8av5zhCzifMUNtbZ_jyGED4ko4B3FcZ
X-Proofpoint-ORIG-GUID: -8av5zhCzifMUNtbZ_jyGED4ko4B3FcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_01,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220032



On 7/19/2024 3:36 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 19, 2024 at 02:27:08PM GMT, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. This size is the shell
>> size that is  passed by user space and is checked against a max size.
>> For unsigned PD offloading requirement, additional memory is required
>> because of additional static heap initialization. Without this
>> additional memory, PD initialization would fail. Increase the initmem
>> size by 2MB for unsigned PD initmem buffer allocation. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
>>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>   - Modified commit text.
>>   - Removed size check instead of updating max file size.
>> Changes in v3:
>>   - Added bound check again with a higher max size definition.
>>   - Modified commit text accordingly.
>> Changes in v4:
>>   - Defined new initmem specific MACROs.
>>   - Adding extra memory for unsigned PD.
>>   - Added comment suggesting the reason for this change.
>>   - Modified commit text.
>>
>>  drivers/misc/fastrpc.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a7a2bcedb37e..18668b020a87 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -39,6 +39,8 @@
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
>> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>  
>> @@ -1410,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  			goto err;
>>  	}
>>  
>> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>> +	/* Allocate buffer in kernel for donating to remote process.
>> +	 * Unsigned PD requires additional memory because of the
>> +	 * additional static heap initialized within the process.
>> +	 */
>> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>>  		       1024 * 1024);
> Ok, here you have two changes in the same patch. First one changes
> the allocated memory size for the signed usecase and another one adds
> separate handling for the unsigned case. Please split them into two
> separate commits.
Sure, will be splitting the patches. Thanks.

--Ekansh
>
>> +	if (unsigned_module)
>> +		memlen += FASTRPC_STATIC_HEAP_LEN;
>>  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>>  				&imem);
>>  	if (err)
>> -- 
>> 2.34.1
>>


