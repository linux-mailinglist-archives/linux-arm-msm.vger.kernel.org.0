Return-Path: <linux-arm-msm+bounces-91150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPpNGqE5e2mPCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:42:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49EAEFC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D98E303702C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD82D3382F4;
	Thu, 29 Jan 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYOIPuWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLyHnKZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5522D33FE17
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683190; cv=none; b=q+Px0njyl1G947mED7Kofp2mnGmk/nMBZ7ANvkoXc2qR0RwCsCWq2ryQqRLqvTLlfa0BI1wYbdz5xD+Y3Zip/F9Z08po4ckLIKiUBRFX+VdMqQTaRZR4dfAy2i6vsczzIh/6zjzdmbxPOpK5T2gvHZktbYMaQ3rQI9/TqxZBSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683190; c=relaxed/simple;
	bh=LmLnoI92W6kcubHlziijB1nvk1Jvl69W7a0k46sP2i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkIuyBraWViLRdvTD1pyCI9kuHc1r9AErHI6L7J0WAsHACGTclWn3g1oRsHvh5+o+Bx8bDpyy/rYoOARDNOlufbT7ugLAJxcKnDo0dksiinL0oaP60epuyVAzkNfWF/5xZDwGogvLIYisfMntDGrigCyyQc8dZS7W/LXf41Z/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYOIPuWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLyHnKZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TALcfG3145253
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=; b=gYOIPuWvCXd5tQe9
	DcwiewBtUph03uNBa/ps7tk4klnw4MDPd8SPThIHzMVINib6WvcriRRmmDB8dYbu
	Q/66SOT3zBHmqAbwXOoENObGbl/KUORbO3WscHCK+nM2HJofhINh+ZYLuRcyynSf
	nPiDIsFAV8ujS0+I6MgBnQZvnKWOkchZf7M+a2Wsqm1RC4mYERcYgKEeP7s8/B1o
	DyTatLn+3pJVCDcaelUZyVLxEgQ7PULLYLsy502ByHQ4nabos/2v7d9/8hxbeOr0
	oFvKxePN3wQzzk0qVN9ZioeynP76byZoBmgr2BxMlJ0AbLfrQ7X/8/oZUbHhOT2m
	FRP/TA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxjndh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:39:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so567285a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769683187; x=1770287987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=;
        b=gLyHnKZEGQ35f2TtDzMzpXnDWtK0WpGSR3DUZsinHn8rhIrF+hziDdh/cgyNeVEZfL
         038SgMTN/OVwgODgLlBoMLw4TS7QBRy2aOe4M481Km5cvZkvp/LZ0FmLytpXg5NHrLEK
         z5akHieC7m5cUhCtK50Z8L9Nz2b893fcHd/mf0k4ToleVVZ2CA//TqVgtWPCmIh4yU9g
         EiQeQYy6icWPbgsEMjwPcPHbokElmVI/jTQc5SaKygHonPHl8tSYusGCjHYEVi0saCFg
         B8eOs/Z1oAJH0kkkO9ISA4lcKm6JjUdi1dsbwBlS5Ftycw8S3KIq83Q2if1D4r5NqMTK
         ibgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683187; x=1770287987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=;
        b=HcIoyxS1Hkh53+ThDoMPqb9nWj5EiMC64A+rebQRSJtBup/Kp1CGoghJDTC0ndhJNh
         0ljiaH/XKnS+U7Nad0ZLzQiT7Ds+1nQIconMZtb5zzDeNBVYbXPEIiM3zzJa7S8tfDZQ
         VztsrT110i2vSKCSBINeVwYc1Woa26+GtNXnhx34bBw8sWTmFKt3wHruow+deNIaO0B3
         Tl22xhgKS995pBH5zzXrZnt1kLRVoICnJJ0FG11RRQLnQmU5UvCq8DCrEW2x1oPv9ETl
         SpdTxx9yRR0j8W/hPYZJ40A+pBT4xk3zqvUSTuTMBrNWOqjG9nGXgrZQPzhszL9GjTeK
         vn8w==
X-Forwarded-Encrypted: i=1; AJvYcCWY/E31J2/DcHcnI8UpAOVuk9OnjsjBruwoV4thmI+7Qu+6pF6E5pmAe7I1df/oTnJS2633a+vSbE+xtxje@vger.kernel.org
X-Gm-Message-State: AOJu0Yzff1JYcD+qmoDJr2Gr570E5hkUeTgte8OrvN7xmVBgDwyUJJ3m
	Q+Gkjz/1BbOiKfCnLFW8WQYnCjvqgl9GJMg92L2TZFn+zgjz2O2QPwpgQGv3RMhvqt5nmE75yEy
	55+0mnX+iFI5zHLB0oUgicC8tdg9Qr0TjsAcLSoYudTY0XTjKPvfU8QAk7zH7f4t1YiWU
X-Gm-Gg: AZuq6aJTOrmGDU4DE93wf7BRscWelpdaKSDIPQI6dJsCnNPHBrvnAQddf0edzndK9ug
	Ns5JJxwLkD79aUTaapk0eO+NZuYXi7pGk2p4VeswyoqmWihya66giZGzhVwyglSkXmOHV03P1JZ
	J9TWQgQD/JzpFcZEiB6Sxueyj05ZBs5sm1BlOMhsa/+FMqwAhJRr/Cl1NUPgfn43B16r15bBC0y
	EGOVQgy9vL8QdLTVjlKSoQcGgg4CQfQWcVSBvvxuuWMnTkKCVNj+DEfki7PpmEIJV4aT3XQ75Wm
	KUmSGazciWk4wfyRdEyGxcUEMyT18SrDrQ04zb6qQ6TINTAtpP2pJSKcnqgFEbMkPNHIRMeLeSd
	5cNR8vSm92A40AGh3xtSH2vaMP8mQo9eYFrbvlw==
X-Received: by 2002:a05:6a20:7345:b0:38d:ebc4:b552 with SMTP id adf61e73a8af0-38ec62ddfc5mr7700196637.27.1769683187070;
        Thu, 29 Jan 2026 02:39:47 -0800 (PST)
X-Received: by 2002:a05:6a20:7345:b0:38d:ebc4:b552 with SMTP id adf61e73a8af0-38ec62ddfc5mr7700176637.27.1769683186576;
        Thu, 29 Jan 2026 02:39:46 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642b0b4c07sm4563659a12.36.2026.01.29.02.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:39:46 -0800 (PST)
Message-ID: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:09:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aUQxeQT-_axCbXVOE1VvvDhw_Ex2uenY
X-Proofpoint-ORIG-GUID: aUQxeQT-_axCbXVOE1VvvDhw_Ex2uenY
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697b38f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZcInPQ15WBUuy6mFm-kA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MCBTYWx0ZWRfX4c2oIHQ+uQhE
 Tdq03MxF9mBVoJnbAXqM0fmCvaLT/ig6qSX3KPFZkqpUE9X+Vf6gMQsVGEiiiJx7g1S+oXkqsct
 zAK24j0R247M/xgDY1x1vbhVhIhLgocbbaAAvC6bT7XCKaGIJc07MyQ3MmW6Td7rV0DeJtV5/zF
 jMEMWDik74t3H+Jj5B7+6UPtGGnqeyQU/jVNlNyHMSz5MVbbzixvRq6/4Zy0lWSjPmxvUkKG/dp
 s/Z2W8ZxY63Y1fSx1eXod+99w5P7pW1TXyahGghl6Q5s3UwXF1lNAvA+lomocQ6QndpJ82XrfRp
 wqns/FSOFGp1RRhr8OphqfUwyMfrI1u5S76gt040D7O+UZPHBM4Qu41UKLn0jz3vVRStFdU2VM9
 aTHYfenOoao8p469QxadSAfndSrgkM/3bNShimvnKkpu5iiVHn8hB2DARSMa7SkHlEO0lN+HZFR
 GbX4yUyyIsDOMsIDE7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91150-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C49EAEFC1
X-Rspamd-Action: no action



On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
>> Currently, FastRPC only supports mapping buffers allocated by the
>> kernel. This limits flexibility for applications that allocate memory
>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> Hmm, for DMABUF we need _import_ support rather than support for mapping
> of userspace-allocated buffers.
>
>> Add support for mapping and unmapping userspace-allocated buffers to
>> the DSP through SMMU. This includes handling map requests for rpcmem
>> and DMABUF-backed memory and providing corresponding unmap
>> functionality.
> For me this definitely looks like a step back. For drm/accel we are
> going to have GEM-managed buffers only. Why do we need to handle
> userspace-allocated buffers here?
That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
change is to enable routing of DSP logs to HLOS which is done by using a shared
buffer between userspace process and DSP PD. The buffer can be allocated from
both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).

So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
with this change.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>
>> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
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
>> +
>> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>> +				  req.vaddrin, &raddr);
>> +	if (err)
>> +		goto err_invoke;
>>  
>> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>> +	/* update the buffer to be able to deallocate the memory on the DSP */
>> +	map->raddr = (u64)raddr;
> Which type are you converting? And why?
I'll drop this.
>
>>  
>> -		return -EINVAL;
>> +	/* let the client know the address to use */
>> +	req.vaddrout = raddr;
>> +	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
>> +		(void *)(unsigned long)map->raddr, map->size);
>> +
>> +	if (copy_to_user(argp, &req, sizeof(req))) {
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
> Side note: why are these flags not defined in the uABI header?
Ack. These should be part of uABI. I'll create a separate patch for this.
>
>> +		err = fastrpc_req_buf_alloc(fl, req, argp);
>> +		if (err)
>> +			return err;


