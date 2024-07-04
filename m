Return-Path: <linux-arm-msm+bounces-25233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F8926F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 08:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622F11C22016
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 06:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC711BDCF;
	Thu,  4 Jul 2024 06:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ivBebod6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F42F23;
	Thu,  4 Jul 2024 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720074072; cv=none; b=iq6+Yw9TyJairTG/8oCtZ7ia+ydj2liH0xScl1C8jBi9qvxA72sVX/li7EkjChqE2olQovjDinScUr9vOdT70nsfiz6seY3cwogEBgbtSUuuxVn/im2OuWfib37H0J/IfekWrfONzrKIfXSswXR/jy0c2SHfDGKNWp1sep5Hays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720074072; c=relaxed/simple;
	bh=l0jXg9Z37c7YXtzxXyO5KhWqS9Dyjj1FQkZJMk2TBmI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=CQyph8FxPXmmXBU2PtglUwpeV4IOcbqC6+mvXm4QGA5+2WNS8GChr7zD43PhQSXCY2mn9cJ9bAOROW/TtwyXV5K8NZqx4hgbL0w3J6uf3R0UZ8S7fmjPAjJOSw9Ko/6Os8sUuCfEdJEMZ4xYZ9e91Px5DKL92DDPWhPZmgA//7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ivBebod6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463Jg0Sa015265;
	Thu, 4 Jul 2024 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFlplKsC2U4laB+KrH0cH5+kAdnVOXbiGsTloY1PRoQ=; b=ivBebod6pQ3RuNmq
	qJhf5gwIpxhTkqkxyFvqU2kXqJvSojd4pUsNhSKEV/NLed0e30vgYSSdUKKIwWEb
	m8Rq1bi0k0wfHHucvRddZgq+6bjYkH2FESCJN40DCrAZAzTM1nw0qeUroNA9h4nS
	XoXLTGyy3xl1nVc/Iog+dBx2Qw88GEVsUl/n6unoiBmH6/H/2lM2LwkGrZ45z+cH
	0S7yb4ALN/gGH4LhStDjGI6YEe9iOl9cC//TjbOZlN5U+371+oPBJ3W+Xjp7NeuW
	lEcQ3+9nI2qW2tOk13/VOER4zKlvDO8Go+dGuQ6wIxU+2ulg1GLA8GNypYcl+34C
	8aRbCA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4052yhjcfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 06:21:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4646L38L026997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 06:21:03 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 23:21:00 -0700
Message-ID: <05a87604-af26-4755-9740-7af157e12099@quicinc.com>
Date: Thu, 4 Jul 2024 11:50:57 +0530
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
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
 <2024070353-giggly-stardom-7b6d@gregkh>
 <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
In-Reply-To: <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FpRFOUq01CFQk1vxffzAtJjAxd395DNG
X-Proofpoint-GUID: FpRFOUq01CFQk1vxffzAtJjAxd395DNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040045



On 7/4/2024 11:47 AM, Ekansh Gupta wrote:
>
> On 7/3/2024 4:09 PM, Greg KH wrote:
>> On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
>>> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>>>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>>>  	spinlock_t lock;
>>>  	struct idr ctx_idr;
>>> +	struct ida dsp_pgid_ida;
>> You have an idr and an ida?  Why two different types for the same
>> driver?
> Using ida for this because for this I just need to allocate and manage unique IDs
> without any associated data. So this looks more space efficient that idr.
> Should I keep it uniform for a driver?
>>>  	struct list_head users;
>>>  	struct kref refcount;
>>>  	/* Flag if dsp attributes are cached */
>>> @@ -299,6 +304,7 @@ struct fastrpc_user {
>>>  	struct fastrpc_buf *init_mem;
>>>  
>>>  	int tgid;
>>> +	int dsp_pgid;
>> Are you sure this fits in an int?
> I think this should be fine for IDs in rage of 1000-1064.
changing this to u32 as won't be storin any negative values here if allocation fails.
>>> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
>>> +{
>>> +	int ret = -1;
>> No need to initialize this.
> I'll update this.
>>> +
>>> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
>>> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
>>> +					MAX_FRPC_PGID, GFP_ATOMIC);
>>> +	if (ret < 0)
>>> +		return -1;
>> Why is -1 a specific value here?  Return a real error please.
>> Or return 0 if that's not allowed.
> Sure, will fix this in next spin.
>> v
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>>  {
>>>  	struct fastrpc_channel_ctx *cctx;
>>> @@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>>  	fl->cctx = cctx;
>>>  	fl->is_secure_dev = fdevice->secure;
>>>  
>>> +	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
>>> +	if (fl->dsp_pgid == -1) {
>>> +		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
>>> +		return -EUSERS;
>> Why -EUSERS?
> This should be -EBUSY, I'll correct this.
>> And you obviously did not test this as you just leaked memory :(
> My bad, I ran basic fastrpc tests and the working of this use case. Sorry for the miss.
>
> --Ekansh
>> thanks,
>>
>> greg k-h
>


