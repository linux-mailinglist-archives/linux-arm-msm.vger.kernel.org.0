Return-Path: <linux-arm-msm+bounces-25232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7091926F64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 08:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82411284F64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 06:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347941A81;
	Thu,  4 Jul 2024 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YNv5xrie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812617C20E;
	Thu,  4 Jul 2024 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720073855; cv=none; b=pI5VdZ+b4VoD5gjKparbkEpt3VIwBJP4V39EO6eTq5YBcz2E5+ihI8lseLoQyIFcTHglos3Q73NP/QpqsIW0aS3F/i0R9yDJsGTKAyRqzt7z7SVOEkwOCEszjxo+82HMDHDbeV3tDOG8xGRXeV09EPJ4Z1Xu3mRiSAaI+1EdTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720073855; c=relaxed/simple;
	bh=fI8G+o4kIN6nY1ADVPoGKOT5crCM7Y99/paePMlU+ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tUn1xjbPQ/3wEDiUCfI61nqZbHEcfwbDv/yRuXCLMpDs7QG/2F5IfHBghu9gMgiy87wX7c0Tp9orTDMyie6Py7bytAsrTR9RTAsVhr7RbMx0BPZaWo6Z7IN17nGof2U/hCrh1U6ILka3d0S8nXkuXvyHiqXj/YVL1EzmimB+m8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YNv5xrie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463Ecuo8026743;
	Thu, 4 Jul 2024 06:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRoJDgkC/RuzkxWq4UL4dbtiu1Fo6d8QWUUORggBoaI=; b=YNv5xriekJb2IzlT
	AGVU2ANIGZPDY0YZv1JjyJ3BI+CZTTOkc5C5aFCLGWWeAgtifHxpKPWwR8xpKts5
	qd1DHQhIMELl3Qc3cnKFJYDUf5znk95WOTcT2dIMZSXQb/hWbqzyyFT1cZswEnPY
	tOLsSJ89RfZtvnHwJTr0Qb/S96GEIPC9Awuw5v+oVwhudHeh07FX6nqD5dzu5kLg
	TYg/UKpqoIQtYYTCzpJfhNqpC0piFl0qY1CATqivX31Eci7vAFFmQD2LhhznmVdQ
	4dXF0ipfRPGPt+xAc2W2Flxv06CVHXTGgucJ18n3OBXQUFs1cXnE1COSpH7vfgaI
	y7f8RQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhtut7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 06:17:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4646HRev027397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 06:17:27 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 23:17:25 -0700
Message-ID: <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
Date: Thu, 4 Jul 2024 11:47:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
 <2024070353-giggly-stardom-7b6d@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024070353-giggly-stardom-7b6d@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cjN4FQlW-huqPXPLG3vIq5D10b8zYCdx
X-Proofpoint-ORIG-GUID: cjN4FQlW-huqPXPLG3vIq5D10b8zYCdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040044



On 7/3/2024 4:09 PM, Greg KH wrote:
> On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
>> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>>  	spinlock_t lock;
>>  	struct idr ctx_idr;
>> +	struct ida dsp_pgid_ida;
> You have an idr and an ida?  Why two different types for the same
> driver?
Using ida for this because for this I just need to allocate and manage unique IDs
without any associated data. So this looks more space efficient that idr.
Should I keep it uniform for a driver?
>
>>  	struct list_head users;
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>> @@ -299,6 +304,7 @@ struct fastrpc_user {
>>  	struct fastrpc_buf *init_mem;
>>  
>>  	int tgid;
>> +	int dsp_pgid;
> Are you sure this fits in an int?
I think this should be fine for IDs in rage of 1000-1064.
>
>> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
>> +{
>> +	int ret = -1;
> No need to initialize this.
I'll update this.
>
>> +
>> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
>> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
>> +					MAX_FRPC_PGID, GFP_ATOMIC);
>> +	if (ret < 0)
>> +		return -1;
> Why is -1 a specific value here?  Return a real error please.
> Or return 0 if that's not allowed.
Sure, will fix this in next spin.
>
> v
>> +
>> +	return ret;
>> +}
>> +
>>  static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  {
>>  	struct fastrpc_channel_ctx *cctx;
>> @@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	fl->cctx = cctx;
>>  	fl->is_secure_dev = fdevice->secure;
>>  
>> +	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
>> +	if (fl->dsp_pgid == -1) {
>> +		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
>> +		return -EUSERS;
> Why -EUSERS?
This should be -EBUSY, I'll correct this.
>
> And you obviously did not test this as you just leaked memory :(
My bad, I ran basic fastrpc tests and the working of this use case. Sorry for the miss.

--Ekansh
>
> thanks,
>
> greg k-h


