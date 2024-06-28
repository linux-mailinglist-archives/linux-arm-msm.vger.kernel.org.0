Return-Path: <linux-arm-msm+bounces-24618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0CD91BCB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 12:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A770B225DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743AB155A58;
	Fri, 28 Jun 2024 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J5gJS2xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560115573A;
	Fri, 28 Jun 2024 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571068; cv=none; b=fVziCaEMtYipgMTMk86LdvOPgBfnL9wJOU0oZEaH9ozQoOL9FNEgxUdfBiwrujxJUV/zZ3smhvUynEhwmjbNdvlt/w8ZgSnMPgGooDSJLeiD+2lmqrJlgbzKHGWr1qycpEBICRSoP+GoxFIoPeflRZ+x4f2iRVMhrFZ1FsUoJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571068; c=relaxed/simple;
	bh=GEjavDKc87i3z11dNVDYeUGDDZeEZ8jL//qnoqpdRQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IB9osPQv7aE1JPVMFOJi4VfB2kUq2DNnz+NNn602vC15bVvs3ZPFdnh9wlXps4mJYkaVboK797X3eRtnu+yKHvyh7ikLkW1Z4Mtj8oQmtv4pcPo8JyX9Hd57YeGOlh/aRB5Kvb9IH0mwX7ynXUQudtyztVGjbmY/9vawSxIpeMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J5gJS2xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8OfII018773;
	Fri, 28 Jun 2024 10:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlPUXp8dLcbfDhjBjw3JFvDx9lmgfYyz36/sytTKrhU=; b=J5gJS2xnztj+p4fP
	GbvfkYGl6HQqCE5I5Nyh3UjdDRhcWepZXIsWDsDGCF4b/f54+GmYx+npgbHW2/47
	W6RxrDbdbFBggMQ9PP3VC3wNLQvvBFpkTDCOvq9ToPVHsrAf8cFzsXaypSCwfoiQ
	62RTUtVDqi0Wg4gVngAjS0nyiFQiAmOAhhJ1511X4pAE7bp20HZoqUjR0L8QVCJ6
	NHXrwsX+NseA/kLDTuKbdm0jGo9Cx616JRFfI0iwClyC2C7/1Ppb4pCJ//QJOMOr
	eJa5VIuJXjyJBmJLQUACD+xUzVweIeOV3PZtKqxiLoXZxbNIoFplkWH9EdSBY6jj
	Sr6AXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90pn7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:37:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SAbcYN021415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:37:38 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 03:37:35 -0700
Message-ID: <4b90154d-2f03-48bc-95d7-6aa0aa57e9c9@quicinc.com>
Date: Fri, 28 Jun 2024 16:07:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <2024062716-lumpish-both-24df@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024062716-lumpish-both-24df@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8UZvoPyiYelljn-IOd95I2BYfDwJ60s2
X-Proofpoint-GUID: 8UZvoPyiYelljn-IOd95I2BYfDwJ60s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280079



On 6/27/2024 4:50 PM, Greg KH wrote:
> On Thu, Jun 27, 2024 at 11:35:18AM +0530, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. This size is passed
>> by user space and is checked against a max size. For unsigned PD
>> offloading, more than 2MB size could be passed by user which would
>> result in PD initialization failure. Remove the user PD initmem size
>> check and allow buffer allocation for user passed size. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
>>
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
> This feels really wrong as now there is no way to bounds-check the
> buffer size at all, so userspace can do "bad things" like go over the
> defined buffer size limit which you are expecting, right?
>
> So how is this actually correct?  If you want larger sizes, then
> increase the INIT_FILELEN_MAX value.
The reason for removing this check is that I don't know how much memory can
any user process ask for DSP PD initialization. There are some cases where huge
memory requirement can come. As for the expectation, any memory allocated here
will get completely added to DSP PD. I understand your concern but can you please
suggest any way I can have some bound-check to handle this also(requirement more
than 5MB)? The memory is allocated using SMMU context banks which is uniquely
assigned to process so the max allocation can go upto 4GB per process as per my
understanding.
> thanks,
>
> greg k-h


