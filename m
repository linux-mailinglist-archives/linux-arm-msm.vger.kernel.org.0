Return-Path: <linux-arm-msm+bounces-46463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E305A21726
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 05:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F5E3A4EA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 04:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A4E18FC92;
	Wed, 29 Jan 2025 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="koUaawgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17302190661;
	Wed, 29 Jan 2025 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738126681; cv=none; b=SyxshD9gkJdZgmEp36v7obz0Q9h+IqVDpBh9siujxpyNxeMIIb6Q8Oc8OU2rghvLH6PrS2wmF+Zfycv5cxnLYweYgxZXswDhbBTSdJfUyLViICa8rGOWwSx/q2c8Xdgwvy2kjwUE+YYzWaSlf99DJH/UR9ilJRAjdMfCkk2z+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738126681; c=relaxed/simple;
	bh=tCjA9E/MTJm4K5OVcS4VSwyPkqlIUVgNnYne1uxqOcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aRV8bhciNU2UsItMnqKEonhFRWxQQeL3VV/+E8kxaewGZvNeBYqSJnTHufGMtQuOkF2y/K8hJZRzHWF2AeSQhPFWvkIW0pZYmtrZOvfEYm6LdhAL7KG4N7tJ772fbs5U17qwBpxslI3UWHS6tRGJr45iUhn9wbhAZA3wFzA8Z+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=koUaawgy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gcGv013441;
	Wed, 29 Jan 2025 04:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVO2srdWIUbC41cHCwL/XNTXRjZcRUJ8QcM6jmVVEeE=; b=koUaawgyDGEB4QA6
	zeTx3PYDPIWiYi4JSVSDx2iFFfG2R5d2211Q0v7BkGYc1/RIaRV6Yuz7HEOkkdTb
	jukmSGrUjND5+3OS1JNPB57zcaz4wJ8v0xkry5Xn7q4gVo4VEKTGJCQxuVvI5kAh
	/CRMCPeD4hKgXWO1IYQdLEAUCkb54iRIDanQYIdav+jaBaNrhgUsTMGoteyeuzDd
	8x9q6usocdaMveXSlDnHOa7CTlgwXCpEJ7F0yWqgvvKKANeNVFXLBxyMaVf3YNic
	jLnO1KY40gidXfo1a7jDmUJZobOoUBZLhItF5ZoXvrkqNL3no5+uSiuK0/NzX3G1
	mYIBGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f9ah0cs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 04:57:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T4vpGW014012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 04:57:51 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 20:57:48 -0800
Message-ID: <fec1e345-1ebb-467c-93d1-264ad0279096@quicinc.com>
Date: Wed, 29 Jan 2025 10:27:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-3-quic_ekangupt@quicinc.com>
 <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oMQjzCU0tJmumgx6Ovhpf5RliWJgB9Zq
X-Proofpoint-ORIG-GUID: oMQjzCU0tJmumgx6Ovhpf5RliWJgB9Zq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290038




On 1/27/2025 9:13 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 27, 2025 at 10:12:36AM +0530, Ekansh Gupta wrote:
>> Add structure to invoke context parameterms. This structure is meant
> Nit: for invoke context parameters.

Ack.

>
>> to carry invoke context specific data. This structure is passed to
>> internal invocation call to save the data in context. Examples of
>> data intended to part of this structure are: CRC user memory address,
>> poll timeout for invoke call, call priority etc.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 117 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1a936d462519..c29d5536195e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
>>  	struct fastrpc_channel_ctx *cctx;
>>  };
>>  
>> +struct fastrpc_ctx_args {
>> +	struct fastrpc_invoke_args *args;
>> +	void __user *crc;
>> +};
> Why do we need a separate struct? Can we use fastrpc_invoke_ctx instead?

As fastrpc_invoke_ctx structure is allocated and returned from fastrpc_context_alloc
and getting fastrpc_context_free. I was thinking of keeping the user passed
information in a different structure.

>
>> +
>>  struct fastrpc_session_ctx {
>>  	struct device *dev;
>>  	int sid;
>> @@ -574,7 +579,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>>  
>>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  			struct fastrpc_user *user, u32 kernel, u32 sc,
>> -			struct fastrpc_invoke_args *args)
>> +			struct fastrpc_ctx_args *cargs)
>>  {
>>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>> @@ -605,7 +610,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  			kfree(ctx);
>>  			return ERR_PTR(-ENOMEM);
>>  		}
>> -		ctx->args = args;
>> +		ctx->args = cargs->args;
>>  		fastrpc_get_buff_overlaps(ctx);
>>  	}
>>  
>> @@ -1133,7 +1138,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>> -				   struct fastrpc_invoke_args *args)
>> +				   struct fastrpc_ctx_args *cargs)
>>  {
>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>>  	struct fastrpc_buf *buf, *b;
>> @@ -1151,7 +1156,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  		return -EPERM;
>>  	}
>>  
>> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
>> +	ctx = fastrpc_context_alloc(fl, kernel, sc, cargs);
>>  	if (IS_ERR(ctx))
>>  		return PTR_ERR(ctx);
>>  
>> @@ -1233,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  {
>>  	struct fastrpc_init_create_static init;
>>  	struct fastrpc_invoke_args *args;
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_phy_page pages[1];
>>  	char *name;
>>  	int err;
>> @@ -1307,15 +1313,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	args[2].length = sizeof(*pages);
>>  	args[2].fd = -1;
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs) {
>> +		err = -ENOMEM;
>> +		goto err_invoke;
>> +	}
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
>>  
>>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				      sc, args);
>> -	if (err)
>> +				      sc, cargs);
>> +	if (err) {
>> +		kfree(cargs);
> No, this should be a part of the error path.

Ack.

>
>>  		goto err_invoke;
>> +	}
>>  
>>  	kfree(args);
>>  	kfree(name);
>> +	kfree(cargs);
>>  
>>  	return 0;
>>  err_invoke:
>> @@ -1351,6 +1367,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  {
>>  	struct fastrpc_init_create init;
>>  	struct fastrpc_invoke_args *args;
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_phy_page pages[1];
>>  	struct fastrpc_map *map = NULL;
>>  	struct fastrpc_buf *imem = NULL;
>> @@ -1438,16 +1455,26 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  	args[5].length = sizeof(inbuf.siglen);
>>  	args[5].fd = -1;
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs) {
>> +		err = -ENOMEM;
>> +		goto err_invoke;
>> +	}
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>>  	if (init.attrs)
>>  		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
>>  
>>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				      sc, args);
>> -	if (err)
>> +				      sc, cargs);
>> +	if (err) {
>> +		kfree(cargs);
> Likewise.

Ack.

--ekansh

>
>>  		goto err_invoke;
>> +	}
>>  
>>  	kfree(args);
>> +	kfree(cargs);
>>  
>>  	return 0;
>>  
>> @@ -1498,17 +1525,27 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>>  {
>>  	struct fastrpc_invoke_args args[1];
>> -	int client_id = 0;
>> +	struct fastrpc_ctx_args *cargs;
>> +	int client_id = 0, err;
>>  	u32 sc;
>>  
>>  	client_id = fl->client_id;
>>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>>  	args[0].length = sizeof(client_id);
>>  	args[0].fd = -1;
>> +
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>>  
>> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				       sc, &args[0]);
>> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> +				       sc, cargs);
>> +	kfree(cargs);
>> +
>> +	return err;
>>  }
>>  
>>  static int fastrpc_device_release(struct inode *inode, struct file *file)
>> @@ -1643,22 +1680,33 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>  {
>>  	struct fastrpc_invoke_args args[1];
>> -	int client_id = fl->client_id;
>> +	struct fastrpc_ctx_args *cargs;
>> +	int client_id = fl->client_id, err;
>>  	u32 sc;
>>  
>>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>>  	args[0].length = sizeof(client_id);
>>  	args[0].fd = -1;
>> +
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>>  	fl->pd = pd;
>>  
>> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				       sc, &args[0]);
>> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> +				       sc, cargs);
>> +	kfree(cargs);
>> +
>> +	return err;
>>  }
>>  
>>  static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_invoke_args *args = NULL;
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_invoke inv;
>>  	u32 nscalars;
>>  	int err;
>> @@ -1679,9 +1727,16 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>>  			return -EFAULT;
>>  		}
>>  	}
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs) {
>> +		kfree(args);
>> +		return -ENOMEM;
>> +	}
>>  
>> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
>> +	cargs->args = args;
>> +	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
>>  	kfree(args);
>> +	kfree(cargs);
>>  
>>  	return err;
>>  }
>> @@ -1690,6 +1745,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>>  				     uint32_t dsp_attr_buf_len)
>>  {
>>  	struct fastrpc_invoke_args args[2] = { 0 };
>> +	struct fastrpc_ctx_args *cargs;
>> +	int err;
>>  
>>  	/*
>>  	 * Capability filled in userspace. This carries the information
>> @@ -1706,8 +1763,15 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>>  	args[1].length = dsp_attr_buf_len * sizeof(u32);
>>  	args[1].fd = -1;
>>  
>> -	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>> -				       FASTRPC_SCALARS(0, 1, 1), args);
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>> +				       FASTRPC_SCALARS(0, 1, 1), cargs);
>> +	kfree(cargs);
>> +	return err;
>>  }
>>  
>>  static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>> @@ -1794,6 +1858,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
>>  {
>>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_munmap_req_msg req_msg;
>>  	struct device *dev = fl->sctx->dev;
>>  	int err;
>> @@ -1806,9 +1871,14 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>  	args[0].length = sizeof(req_msg);
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
>>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>> -				      &args[0]);
>> +				      cargs);
>>  	if (!err) {
>>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>>  		spin_lock(&fl->lock);
>> @@ -1818,6 +1888,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  	} else {
>>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>>  	}
>> +	kfree(cargs);
>>  
>>  	return err;
>>  }
>> @@ -1852,6 +1923,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_buf *buf = NULL;
>>  	struct fastrpc_mmap_req_msg req_msg;
>>  	struct fastrpc_mmap_rsp_msg rsp_msg;
>> @@ -1902,12 +1974,18 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
>>  	args[2].length = sizeof(rsp_msg);
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
>>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>> -				      &args[0]);
>> +				      cargs);
>>  	if (err) {
>>  		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
>>  		fastrpc_buf_free(buf);
>> +		kfree(cargs);
>>  		return err;
>>  	}
>>  
>> @@ -1942,17 +2020,20 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>  		buf->raddr, buf->size);
>>  
>> +	kfree(cargs);
>>  	return 0;
>>  
>>  err_assign:
>>  	fastrpc_req_munmap_impl(fl, buf);
>>  
>> +	kfree(cargs);
>>  	return err;
>>  }
>>  
>>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>>  {
>>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_map *map = NULL, *iter, *m;
>>  	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
>>  	int err = 0;
>> @@ -1982,14 +2063,21 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>  	args[0].length = sizeof(req_msg);
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
>>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>> -				      &args[0]);
>> +				      cargs);
>>  	if (err) {
>>  		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
>> +		kfree(cargs);
>>  		return err;
>>  	}
>>  	fastrpc_map_put(map);
>> +	kfree(cargs);
>>  
>>  	return 0;
>>  }
>> @@ -2007,6 +2095,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
>> +	struct fastrpc_ctx_args *cargs;
>>  	struct fastrpc_mem_map_req_msg req_msg = { 0 };
>>  	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
>>  	struct fastrpc_mem_unmap req_unmap = { 0 };
>> @@ -2051,8 +2140,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
>>  	args[3].length = sizeof(rsp_msg);
>>  
>> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
>> +	if (!cargs)
>> +		return -ENOMEM;
>> +
>> +	cargs->args = args;
>>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
>> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
>> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, cargs);
>>  	if (err) {
>>  		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
>>  			req.fd, req.vaddrin, map->size);
>> @@ -2072,11 +2166,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
>>  		return -EFAULT;
>>  	}
>> +	kfree(cargs);
>>  
>>  	return 0;
>>  
>>  err_invoke:
>>  	fastrpc_map_put(map);
>> +	kfree(cargs);
>>  
>>  	return err;
>>  }
>> -- 
>> 2.34.1
>>


