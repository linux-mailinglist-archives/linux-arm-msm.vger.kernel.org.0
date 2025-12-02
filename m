Return-Path: <linux-arm-msm+bounces-84037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBEC9A326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96B2C4E1F2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2AD2FF64B;
	Tue,  2 Dec 2025 06:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9JmWJQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FyTdIw18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097652FF64A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655635; cv=none; b=h8JjmTfjt6b/KktJpFaL+kofabfLgpKnXYw0i/j+/G+P1KjKcXnyx3vJuFB08Z0hm9VnZy5lBjIh03nADnlHqX2qLG4W4+Hu8qsdxOIjGpG9xl6rChbjXpy8kkgXjciHaYSz4sxl/hBZTeaBjFrg4i6TvOXiv1IgTUctiDoWG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655635; c=relaxed/simple;
	bh=pBO6NPy8PGFXIVPpwWkBohKbGGOBk1h2IXQXUXI88ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVUTC25u1RB/J+lWwKQwmjXnhDvudyqpvtDzjVZWYvLjeFpgkH6QuCqQlyEltLIqBi4mDOj49cJgqczTfvEKv9NLvAosLuGE5i/8F+x0+sUgAnLa3B4hdf72wg3m99yRpWyLylP3TKV5SvpPy0i4TX8C5PF1W/jNP6lMOAmP1kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9JmWJQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FyTdIw18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24CcCt1591497
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=; b=H9JmWJQnFaFoSB1V
	UgkTOJAmSvy0wDqNHZAxwQt5FvifJE9lWcp2wiCPzGB59gbsFxf/VgD3EO1tOzQl
	lREaxW98fEWUsQo4ROUOdjjnMxKyprU1HLsU8zZa0NR3BjpU1FuXvdcIh1T9oPlF
	2uBT4FI0Nh4VKjVwcp5OnAUacD5eN/JRAOq5lyObv4pZMPvOZ8IadU2DalhrljcE
	VmJMiEO4LckrX7esE+FqloRyvRBLkdv46rrdGKsvtfUiT3PnovOlsUg3DZusaxnT
	XOBToNA2AeGCFp3aswU95y9IvwTwQ15pKo10kjkrperEZmjZkli/F64gxC8vEpyd
	8KobQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr89cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:07:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295595cd102so84025325ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764655632; x=1765260432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=;
        b=FyTdIw18RMwerqwRNY6ME1Hin6jpWUnClugppB0A3rlMzBd9sH/YYn6g4BHk0ORVKQ
         gpc3FV9fHGIkrT3M9C0bbedWfkjQfsGGpHW1x1v9JpHJsc72EQ2x1mKKD7SPLbPiVoRb
         E/NIRysm3OH/WOkMfSJpzdyTtQaztUcVnjkb01pTNmIvVFI1NTEyVwptgCACPFoY4JyM
         EhQYS+0J3ySIIiY7YmBO+Q/kL09Jgz+IDs7JPD2nYiGvE0/AJ+O9JObHzy/0vBUXKDDS
         Xl9OdNScoyWacc9JNeSCpZ/5eGdqQuEfIbzalJX1oz3oG5ddy+Q19Z0cAwJHTti3cRKv
         DzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764655632; x=1765260432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8K6bpgWS5ImuU3GaEbIeRt3L/diGyGItD0oE6T/xlg=;
        b=bPY6ANclrsxvnTwxdJeIgpX/wFnLyMz/7JTNguL2UWtOGHdo+Jm5wAQ/p9nknQvq3W
         6w31Rg7IjT1twzM2dDnb1HkLhno6ZA0k16a3z5lGDHLaNDbQc8OCyjx9pMpHeAt8jT3I
         +UZajEjRkeWeIw9dVGh+R99/OEz7SVvGOuQZrkcQh/1w4Ob9Rz3vF+UQjMFEhrq3yazi
         uQ7oSZEq9vHShOTFiV1mxwh9YnEHqlSGNHFnlTXwNaQcTcUq2Bg4XX+DrMyKO37aZdST
         /5mq83ApMiJWfXRaTB0mEFGMR5GUf1NRNfUTOQ6a1j+4UdE2Cg9QfWpcPfb5HIFJdGbs
         BjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyxH8t72ODimkCq+x9Cnudq6AhuLHD8ORYGUd3hd10bP0Dy75CacDmiHEBRutEiW6/S+MkEa0QpwVOHN/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MxJMyYlGDVHfC9joH43650g5Gdu9eIB01aShoVGrbyabKfwL
	9dt0wLoNG9gLiwk3Gr8E1vO13B9PU+ae/P1F27xCM0REZTx+YaxEHuUIwmaLVD5BzHqMHjOjrd4
	aPpuPewL8JlhvTgvRzu4jsDlb6Tuy/YZHVE+CdTDAzVR5nbwWMEor1h52hVS90HV5HPkE
X-Gm-Gg: ASbGncujNBWVWDWjQ6l1AGhQNtBg4799fc1V8W6Nh2ld9OrpQfxNCihji5kSs+teXjR
	6ZFZ/hVzE35Js7Ni5WZoHjpZcQ2QCSqM6qp7QNr8E1n7nKV1pYYeiMaQQpdwPCecu8AQl4jBEve
	9vjN9g4BYX92U4TzSGdCcCfPzcpHYiUozxHFFLohQz4C12BPkwSCGrXqKNrPirmhs+SiyE13WK5
	d4wNRj7//4t+nX8W/VRn9IrN3QlV5S8gFZ+Mis+sGD71712X445l5Lm8YP4k+mfqgMBcYx3uroB
	6EKJ763xRmnCQ4vn/DVIPHNakg8Hz07wuj61MquvL/fLlE9HOYnZKG6KvpuglAdcQMfA8KdkSqC
	05tE239Qm6vOJlx/xIyBNPYqU/r1qbzQ+PZxEBKqk
X-Received: by 2002:a17:902:cf10:b0:295:4d50:aab6 with SMTP id d9443c01a7336-29b6bec46afmr496941105ad.18.1764655632361;
        Mon, 01 Dec 2025 22:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH48Bn8NoJ1p0E5RqctHP3ZlF8O/wTAnajenHXwUDkGTLgAiFY24benR1CbGAPHl3ePh1Q5Wg==
X-Received: by 2002:a17:902:cf10:b0:295:4d50:aab6 with SMTP id d9443c01a7336-29b6bec46afmr496940705ad.18.1764655631666;
        Mon, 01 Dec 2025 22:07:11 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce442702sm144280365ad.35.2025.12.01.22.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:07:11 -0800 (PST)
Message-ID: <4efa42cb-807b-46b9-8fc6-46c7c05db15b@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:37:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
 <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
 <2025112854-septum-asleep-8c35@gregkh>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <2025112854-septum-asleep-8c35@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692e8211 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0Ga8u4h-uXT8-BnDPgUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CEpPqaWyP-k0Mfzy7BiaeqIyas9QnYkA
X-Proofpoint-GUID: CEpPqaWyP-k0Mfzy7BiaeqIyas9QnYkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX8YYhjQa7QpLr
 9wJtwsI3EEgfMa/NqkLol8EZCqBE3ht77LrvVXtJncmKO9G4otq9eNllfk+OMytzO9BBA7H6tyT
 /CSpJt2emnA22+/k/PgwAN8l9SQE3M2ZOJnRACbKjvL4T4HONdRDpv+Xzk8bEgLLhw0j0Oyz3TJ
 TE/RGcKQ83RXVjbKgRFqvpsLRFUbsWBxjPTSiwTYsSNevP/nzk99V8hRXwUrAqZYfyuTiVQhBI9
 WqP4tqQDfOFg0dvbhLiwtkMQIBKyH+Px17S1FFbz6mHxTXVJ9Sth9x48+XBnCfVROnbQp2j6ITX
 qxCUOupNQVR3xYCKUilXZ1S2/dHaB57I8P2o/8JWPWmO+y7Bd/lnLoh6A9IVOySksMqjzy9DM7y
 G4ueC2GahQMZrSoHuWHN6EKXkTfv0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020046



On 11/28/2025 9:02 PM, Greg KH wrote:
> On Fri, Nov 28, 2025 at 04:04:28PM +0530, Ekansh Gupta wrote:
>> Currently, FastRPC only supports mapping buffers allocated by the
>> kernel. This limits flexibility for applications that allocate memory
>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
>> Add support for mapping and unmapping userspace-allocated buffers to
>> the DSP through SMMU. This includes handling map requests for rpcmem
>> and DMABUF-backed memory and providing corresponding unmap
>> functionality.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 85 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 9bf76e224852..feba79913763 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>> +	struct fastrpc_map *map = NULL, *iterm, *m;
>>  	struct fastrpc_req_munmap req;
>>  	struct device *dev = fl->sctx->dev;
>> +	int err;
>>  
>>  	if (copy_from_user(&req, argp, sizeof(req)))
>>  		return -EFAULT;
>> @@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  	}
>>  	spin_unlock(&fl->lock);
>>  
>> -	if (!buf) {
>> -		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
>> +	if (buf) {
>> +		err = fastrpc_req_munmap_impl(fl, buf);
>> +		if (err) {
>> +			spin_lock(&fl->lock);
>> +			list_add_tail(&buf->node, &fl->mmaps);
>> +			spin_unlock(&fl->lock);
>> +		}
>> +		return err;
>> +	}
>> +
>> +	spin_lock(&fl->lock);
>> +	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
>> +		if (iterm->raddr == req.vaddrout) {
>> +			map = iterm;
>> +			list_del(&iterm->node);
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock(&fl->lock);
>> +	if (!map) {
>> +		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
>>  			req.vaddrout, req.size);
> Never print out kernel pointers "raw" like this, use the real %p tags
> instead.  Odd that the current code does this, that is not good and is
> probably a "information leak" somehow.
>
> Can you fix that up first so it can be backported properly?
Thanks for pointing this out, I'll fix this before refactoring.
>
>>  		return -EINVAL;
>>  	}
>>  
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>> +	if (err) {
>> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> Same here.  Also, no need for a \t in a kernel log message.
Ack.
>
>> +		spin_lock(&fl->lock);
>> +		list_add_tail(&map->node, &fl->maps);
>> +		spin_unlock(&fl->lock);
>> +	} else {
>> +		fastrpc_map_put(map);
>> +	}
>> +	return err;
>>  }
>>  
>>  static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
>> @@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>>  	return err;
>>  }
>>  
>> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
>> +				  struct fastrpc_req_mmap req,
>> +				  char __user *argp)
>>  {
>> -	struct fastrpc_req_mmap req;
>> +	struct fastrpc_map *map = NULL;
>> +	struct device *dev = fl->sctx->dev;
>> +	u64 raddr = 0;
>>  	int err;
>>  
>> -	if (copy_from_user(&req, argp, sizeof(req)))
>> -		return -EFAULT;
>> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
>> +	if (err) {
>> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>> +		return err;
>> +	}
>>  
>> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>> +				  req.vaddrin, &raddr);
>> +	if (err)
>> +		goto err_invoke;
>>  
>> -		return -EINVAL;
>> +	/* update the buffer to be able to deallocate the memory on the DSP */
>> +	map->raddr = (u64)raddr;
>> +
>> +	/* let the client know the address to use */
>> +	req.vaddrout = raddr;
>> +	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
>> +		map->raddr, map->size);
>> +
>> +	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
> argp is already a user pointer, no need to cast it again, right?
yes, right.
>
>> +		err = -EFAULT;
>> +		goto err_copy;
>>  	}
>>  
>> -	err = fastrpc_req_buf_alloc(fl, req, argp);
>> +	return 0;
>> +err_copy:
>> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>> +err_invoke:
>> +	fastrpc_map_put(map);
>>  
>>  	return err;
>>  }
>>  
>> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_req_mmap req;
>> +	int err;
>> +
>> +	if (copy_from_user(&req, argp, sizeof(req)))
>> +		return -EFAULT;
>> +
>> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
>> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
>> +		err = fastrpc_req_buf_alloc(fl, req, argp);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		err = fastrpc_req_map_create(fl, req, argp);
> You changed the logic here from what used to happen if req.flags was not
> set to those two values.  Are you _sure_ you mean to do that?  If so,
> how does userspace know?  Why don't you have a new flag for the new
> type of memory you want to map?
The userspace follows the same logic for all the flags other than the defined flags
where a buffer is allocated using DMA-BUF and then mapped onto DSP using this
IOCTL call.

Do you see any concerns with this?

Thanks,
Ekansh
>
> thanks,
>
> greg k-h


