Return-Path: <linux-arm-msm+bounces-58425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0421ABBB8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3B53AC12C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB863245037;
	Mon, 19 May 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxpgE3K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F8201266
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652195; cv=none; b=bEOeF5nchf5F02iC54ZSYMP69R4NSzflF0FJiptlUaoXGzncW7Z8r93bopLY8qKQOvjyHGF873zAPcqUad0z1LlM/ambR08GkoSi59CH+AhU2p9BQsdQ0W1u/uppOKS8SKYO32Mew5Lx2/8Dmpot2yH4e3GiiIiylDtdf4LO84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652195; c=relaxed/simple;
	bh=6KNwkQkdS02ZNTfPVH7I0FPPpkZXF79WoUmr5cAUn7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en9DkIxqB3Bya95u4t7+N+sZmw1rrnYdsnHZV/wSxZkSUwoybKHs4Kf4UHf70e5S/2YkqFm95ag+aDrxZTrsGjlRH8bSDK+O8oT9f8cU99aqk5HWBhcbtcM+QHMGvwitLgOzWKa+G+M+nfbcIfimzqO7ztbqxLl20s7MMqnUrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxpgE3K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GcMC023185
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=; b=lxpgE3K7v51i7KPQ
	MIBlQpZaKkVeNN5/D/BLWURS4d1A6kKGVEKQm+DBSFtyJ2apYJGyDHH43TYv+G8H
	/+n2G+1w6JZBizk+eU5aUUO107oLm2DfNZeFZofF9n+yS3azxJ91gdIvnECImVXs
	cXQymdhE/w1KbmjUoC8G/M31Yd9bq2Ym4wrNlrJOC/fD8q4JDEkfA3X4inmtQ/Zq
	zPeGkxOC0jqH1ewhYkIuZvfmQxtNo4MehJkM4iVRPyH8iaUKbCAhWbwiYX6Xq4L8
	jRGLnkbWK8LakTWlhORIKMJM35/AvNlc/P0/HyQtzoTGP74i3ZAgThmNyGFAPSfk
	SGPCpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rmx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:56:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740270e168aso3820230b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652192; x=1748256992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=;
        b=F+ukr8vv7sIVpJ5z36k8roM4AJdRuk9XmMG6XGkOc0ZofQwMdesDyLafihLVC9uvxl
         LOlGrYZ53fparaMQD/E/PF4UPiPSQomaVjItuDKWIDAjWISb3JtTnsOzm8SaG/XFNBN9
         tsf8OaEg41z0th+6JgNe/XweZ7k6PdGoX5OCBVr348AsTIhrkdjVWK/pk3OpMWNXuN6o
         SD07jD5GJX2AK2adz228aq0fjlsQJTo4Mmxj6Qu0FF7T6iXHbFzzJf6Pn3xSEHtJV2Et
         kyKM8sztfdMMA89MhxlNHxj7uF42tFBqOatDEXy8/QiK5Cwkf+HEGxg8HImkLXYzvxUu
         bA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4o2M2fbnTrba3iUHXGh+BW39eNjwDcjqJzTVcsbOJelWiXLWlBEyk4QsCzVRvRBkoNkVM/bxAgDHSqDh9@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZM0NPP3wd898pxNYavmZcE2kxzp5i4H3i+6tDJQWLS2JDubU
	wRzgaXa7jn3hH4wZr/zwY9cOnU9vdHLpsiWALRTGI6KuzU+WZc6xwlE27g21+lh5kp/e2Yevrqm
	057eA3MuDWikhWnoakMiNOxAmTuF/nbcOXG0s77ha0DL9a1TvNDxUxUUKtDtzlXtzfdUY
X-Gm-Gg: ASbGncsLZ47YTJRqCyh1Jf+DOhUzzrSoNk1YMZ+JXTZ9NB3drN6qPVfBmECu3cDd7kN
	5D0qZbUppDeiVxy4iwxCYv7lBQvIq2CjkeBXjp0w3wE/tP24BcgzK1d+CStBFbJM+klnplVPRp7
	4U5K+gLGetlRALK4lYDdjqFJ4ZJ3GrRCAbMqnuUSfD4crFBnRpdEP7HIIMBBgGqdFe51BM2sOhE
	fSbKubS9WWQMWGf0Jx7fW5a1d9z38K7Z9jDxLbsIN7yP2WMqdJtWAGJfIzTkTrQfasefqpnixz6
	7AFGnIQ5B0qcLwnPh4qr+0onP33ukRk/xAdKpA==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr16582744637.19.1747652192308;
        Mon, 19 May 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+YEl4DPCmiC1kC569JIh9uPvjA+HhDzxAzt9PU6GwUL7mcjSbRxgYRKdYtvvk4K1w9WTdTg==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr16582715637.19.1747652191912;
        Mon, 19 May 2025 03:56:31 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfaefsm5947008b3a.33.2025.05.19.03.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:56:31 -0700 (PDT)
Message-ID: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:26:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX05DQi6PlJv7r
 n9HgukQAar3h+4Z/QzDr+7/ydF+ZJfFJ37UsbAH/pH5lhRbQfwaiscU6eNb97dVEdpTNQESnnBK
 sZ0fxyYDqEQ3Gu82wZE/ejMsrqQN8wYDseEpBJ1nMc3Vf7dH0u6xL8Z7zH8YreFaNDE5RVW477u
 0Xe04vuf81xWkcRBEQv0YIeVgjeBNq1McUB2aXrWYAX/7u2zK4hL3kt72XvZUZpNiPVT995TrZX
 Cx6vzTZQ/fdiHAGHhyPYG72c8u76DRpV0AvEk92bJEbvjS6PU0vBYWg6ohKJ5HSaJasJBiovo+M
 2CpbLnRfyXglhNGRnlcxFXuOjAmMz86MNAlij2u1DcBFeBY1Gd/KM6sn46q9IC0aeXCcSeqNZDn
 LKt7ChBSesS07RlBoV8nLPOIcoEOo4p3so1R8sJnwBfqfxvLObe5BZ4Ij49Sr+8ifMhttwkP
X-Proofpoint-ORIG-GUID: BrxJ5J8N8M5Lg55v-qq5mRbDv-44l2gI
X-Proofpoint-GUID: BrxJ5J8N8M5Lg55v-qq5mRbDv-44l2gI
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0e61 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X88mIgiXdH4OVKoEc0MA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103



On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>> getting removed from the list after it is unmapped from DSP. This can
>> create potential race conditions if any other thread removes the entry
>> from list while unmap operation is ongoing. Remove the entry before
>> calling unmap operation.
>>
>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index b629e24f00bc..d54368bf8c5c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  				      &args[0]);
>>  	if (!err) {
>>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>> -		spin_lock(&fl->lock);
>> -		list_del(&buf->node);
>> -		spin_unlock(&fl->lock);
>>  		fastrpc_buf_free(buf);
>>  	} else {
>>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>>  	struct fastrpc_req_munmap req;
>>  	struct device *dev = fl->sctx->dev;
>> +	int err;
>>  
>>  	if (copy_from_user(&req, argp, sizeof(req)))
>>  		return -EFAULT;
>>  
>>  	spin_lock(&fl->lock);
>>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {
> Cosmetics, please drop.
Ack.
>
>> +			list_del(&iter->node);
>>  			buf = iter;
>>  			break;
>>  		}
>> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  		return -EINVAL;
>>  	}
>>  
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_impl(fl, buf);
>> +	if (err) {
>> +		spin_lock(&fl->lock);
>> +		list_add_tail(&buf->node, &fl->mmaps);
>> +		spin_unlock(&fl->lock);
>> +	}
>> +
>> +	return err;
>>  }
>>  
>>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  
>>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>  		err = -EFAULT;
>> -		goto err_assign;
>> +		goto err_copy;
>>  	}
>>  
>>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>  		buf->raddr, buf->size);
>>  
>>  	return 0;
>> -
> Please keep the empty line here, it improves readability.
Ack.
>
>> +err_copy:
>> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> +		spin_lock_irqsave(&fl->cctx->lock, flags);
>> +		list_del(&buf->node);
>> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
>> +	} else {
>> +		spin_lock(&fl->lock);
>> +		list_del(&buf->node);
>> +		spin_unlock(&fl->lock);
>> +	}
> Can we store the spinlock pointer in the struct fastrpc_buf instead?
this spinlock is used for multiple lists(bufs, maps and ctx).
>
>>  err_assign:
>>  	fastrpc_req_munmap_impl(fl, buf);
>>  
>> -- 
>> 2.34.1
>>


