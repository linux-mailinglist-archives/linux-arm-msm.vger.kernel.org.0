Return-Path: <linux-arm-msm+bounces-22168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E056A901DD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6505B287479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3586F312;
	Mon, 10 Jun 2024 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ewAN6JCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB86BFA5;
	Mon, 10 Jun 2024 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010522; cv=none; b=nRUAJxZpnF/YavtRYkjW8tnTfMAYzkDiULw5XqdyfX21l5GnY4MEwz3VDJJ19j8gSQfWcCSFykAXY/TkG4P2aoaOyKIpL4EVOmmzWldrdf1uaWo6niqbTHuAkIRSZLTLpfVJOZ02HYWPBiaHhfqj1IBF4PCJC6VtQWiJc3UEUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010522; c=relaxed/simple;
	bh=cDKlGRIs/sXe9FCFri+HS2RQNMYG7BiE511QhAbi+ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jfvkgCvkYYuS6JvvEje/3w/WBENN2BbECM0nxWDRRJ1UGNbeKaJlbP+gYpU29KsRdIUs8fmaYTjp+hMGcMotJiDTFQ10AOz9VKxdkF8q71y3HP+nq+gW9UMPJpp1bDRxogfcauwLnMGN2pBgMggnd/RgjFYrf7noEqPAkhgrNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ewAN6JCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A0071K005752;
	Mon, 10 Jun 2024 09:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cn6j+FKqekPCfp12nMiwBQZ/qQDhbCkmSjndds8+9cg=; b=ewAN6JCooCQay5fM
	GuqxkoU+lwNTAYza1VSFUnSvs9+ZI8JAGFXiA+Xqw4fWr9C9oYUXTxZK4XWUtaRT
	OkveARIoHgVYUvhknxfSTz30wKvQh0xJ/2kMRcrYb60Y+8w++YClJKsg7w2hD8hi
	I6hx9gE8qvtMIeO1G3sjRpmT93+Iss/qui/40U2RfzIeKhZY0j3oSQU1ezM5ndUN
	GZ+UrQpW/ksvbXpsWJIVd1ihTbaYi8MYB6UTNYa4cX3RgoOe0/uH+Y7pMGVcrlSk
	NLOCN3vdgZoolcWQFzDJH1RZst0bJMhN57b2wdboIqvwfOjQL4GBL9CtuANwsfh0
	ixAiQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymd0ebfqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:08:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A98ZWu020927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:08:35 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:08:32 -0700
Message-ID: <2debb668-e649-4e54-a7ce-b1705e8872bc@quicinc.com>
Date: Mon, 10 Jun 2024 14:38:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] misc: fastrpc: Fix memory leak in audio daemon
 attach operation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-7-quic_ekangupt@quicinc.com>
 <dkbyszjmah5swomq2b3nlk24mik5epiwfeey7c4khp2p74dxgm@4ccxtjnasyoc>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <dkbyszjmah5swomq2b3nlk24mik5epiwfeey7c4khp2p74dxgm@4ccxtjnasyoc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tax46ygPvzhlQt2Bs_m94pyy-BxlYrsi
X-Proofpoint-ORIG-GUID: Tax46ygPvzhlQt2Bs_m94pyy-BxlYrsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100069



On 6/7/2024 4:58 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 10:29:26PM +0530, Ekansh Gupta wrote:
>> Audio PD daemon send the name as part of the init IOCTL call. This
>> mane needs to be copied to kernel for which memory is allocated.
>> This memory is never freed which might result in memory leak. Add
>> changes to free the memory when it is not needed.
>>
>> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Fixes go before the non-fixes patches.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>> ---
>>  drivers/misc/fastrpc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 13e368279765..7ee8bb3a9a6f 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1380,6 +1380,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		goto err_invoke;
>>  
> A comment that the remote_heap persists would be helpful.
I'll add this information in remote heap redesign patch. Thanks.

--ekansh
>
>>  	kfree(args);
>> +	kfree(name);
>>  
>>  	return 0;
>>  err_invoke:
>> -- 
>> 2.43.0
>>


