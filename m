Return-Path: <linux-arm-msm+bounces-83526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC9C8CF60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1FAE3AA243
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 06:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D465E2BCF4C;
	Thu, 27 Nov 2025 06:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2+H4WyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/21Rn04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1C21A453
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226341; cv=none; b=AevlNSm7W+GnwenpHU6v7l19/hGtDffYFXTZs37x6BoGF5gtWpGTM8l7AtsP1IW8WIFAIonXg1icUi/TDc399x0Wj5aA51hiPUs18D1BY6+pFyIe0XperdVr5OJCasiMOMPRBWpkG1TIETzbZehm8CpmGdvddh/v8+ikaSSM8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226341; c=relaxed/simple;
	bh=YLhwRJFdkg1hn/H9G1gqWe/TP0IzGI2y4+OR/mzvGVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBHSG2ffMgPMZ3gNOW9S1+EnLjogXLFCWPv+Ta+HZ8nhYI8MQlXxWNY4NUinJZnvNpZw5CCgIP5Lu1ZoKe/DFUrsISMtZ0BTxkWZX2xvvuC/Wb4Dr/q/6114h6TANkWKLB9s0l+JzVX76r1bk4iebhBpaA+9PpZQeiTLxsQ6YPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2+H4WyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/21Rn04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQN3Nnx3332012
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=; b=C2+H4WyYmF478myo
	YHa/+8kcjAFkbxS1uJDxEybsWoNXG1w7JCidzBdYhshKDW+hR/ogxTQ6ulRlj5OR
	tc06vNRK1MJopU6nL6DRLgNO5PWA0RV3fSvsRiFQmMRrDgc5QyPNCDjf5GQisE/8
	0mrVRxABEFeiMD7toA2gzcyklUL0eeoWzB99QRy5xA5xrV6c6SfzEBTb0KdLNCIQ
	0sHt44d2mE7zMYNKGGpUOUsczfWZYs5r9QpBbOTPL0LRQkhzv+UhLqbu9YnEFscK
	FxBQAScWYDpkvlgC51PF5u2TyBSPyc+8Bk9nYZ/LalCc8KYULpqfQsZJhZgNNqvl
	0HjjSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apavs0yrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:52:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2958a134514so8416445ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764226337; x=1764831137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=;
        b=W/21Rn04MPPE+afS+d26mSqBHbzGCwzEVds0Atq9a1Bjae1nqbNIvPQliV7t9/Hr+y
         d7lyX1QgTHUK6nzO9GBrHX5H2vUQv/IkkVYLUren4ybPy7l77c2bE6789jxGHhPb3eas
         sZCGgFahtd6iZC9x8VH0GbPwJNJ6Iz3cuvu31FLHrnfXT1WS2apkePmm75smPUcOSgDU
         RFltrcwXgEzroMbwjVprvIHKrhqs0h/f4luOkm6EVlA3sa3MZskd5QnuGTrZSxg6bYYq
         f5SMvqFNBR6p6ens2WdoRHR3B4wssmSYN0pw2JuxJvDwuI2KtlIzCZna00eI1w4HKpbN
         twHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226337; x=1764831137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=;
        b=dcOGBICL6dLx3h2n9X6XMr3TwLNfX+uhLu52IcqL5fh7BA5p9LCXDFSRw5c0MWT808
         GWwYZ7ujj7yWDBBgrB0SsN/1YxPYulzYEJpeTyT+WnKwWQJDGO+UNY3IG8uOfghCe4D+
         HgYAnOprCb7N110OAMIZ7Kxd6gxnsoU6qNSFSMfeKMVu4hOQQrGiIpEHvBB3EhkM8z87
         NCtCDEnXy+f0JSgaySvrTrgm8NxBCFa7CcEufZvASE5GaapP21vzZXoT6S0Wma2al60n
         WDoHvy8Q/VbfFbB+LTEB3yokM9LspDswn166cTsrxDjmwkwOybEGWbe3TcQTRZsprCvC
         fyLw==
X-Forwarded-Encrypted: i=1; AJvYcCXPaC3DepaSno3KAgDpFVzAig3o4nBJl6BlKf9Vcoc8f16De82D6tL85J1koOm8bAKYISVILEmR6tHzxZp6@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLylvTBw+aEp9rj30HyTDZYXlgcq7ico4C8NRE0cMy/Qeuo7y
	8o8MgewOnLZ+S1EV3w75Pjmpv90NrI0UeScnd6vD7eOgwErxTPJDzHR4J5xqV0VulR4zsO70nPj
	Dx2uNV2L6hBm4nppKf+2qQTh2vqJ7alcBTA5YCjnliCniyIOJyDU2ruUsYiXqyVdGktbt
X-Gm-Gg: ASbGncs5F+bB5JzPgVbnyLa+6qaCsq0SOS2U+vwHA34WrEBSOhJX/xOUpnXrPIMADNz
	+TjFBMgMqOKPcllQgT8Hb6Z/gaXNQjE1ojkLXlBBEwZUjZ5loEwEEYUVqqllBghDfZmWV+trHNX
	1odeleScrbLfx87PUYM4hgDiUGQx/7vEJsd0TaJq1nXHU6dL67A2A/8DAeZGmJqs+1pC9NMl/W5
	BhcyTsd1tdl5YFPEh57zIZ1HQOrObvqiwoica9jm7DV/RXCbAcEy9vo8WCAmf7x2z6/yYrVyReG
	KUBssbw0F9XTADkVy4+4pC1FX33rCaJVac9xK4wgv4ABNAdKvtNCUQzblQau1v+9dcCAVI+dcef
	WILkd4wHjk6cwQhlLiAjB3IXyyTWrKOZeiJHJpFqy
X-Received: by 2002:a17:903:acf:b0:298:2637:8029 with SMTP id d9443c01a7336-29bab2e52e3mr98795095ad.55.1764226337212;
        Wed, 26 Nov 2025 22:52:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzzHNuVpLYCgpOOf3ktsnI6mESDza7cusfY6IV2b5RSnZNS9XI6nJu9nqS/SYzjksLhohdJg==
X-Received: by 2002:a17:903:acf:b0:298:2637:8029 with SMTP id d9443c01a7336-29bab2e52e3mr98794795ad.55.1764226336657;
        Wed, 26 Nov 2025 22:52:16 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb277f9sm6295465ad.46.2025.11.26.22.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:52:15 -0800 (PST)
Message-ID: <60ee82fc-db30-43f1-b2fa-49e6d211c6df@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:22:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
 <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZQIfdLFo0GEusBIvQIkZFlV28yp0XQgf
X-Authority-Analysis: v=2.4 cv=PYPyRyhd c=1 sm=1 tr=0 ts=6927f522 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5DFYxTXXmBTTg87Ck3YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfX/xbed8OW2bHA
 4aL0vUKYsOuTUZV02LGGD0zRAw92M5mqj3Y2AxNNIuzmG9LwY+jblYRAXwVQ+KCDMRt/rvCPgFa
 pqzwaUVdePuzkrnXMEGDcKbjB/Mu4cVa69TvIm/caFHKhC03tBm219VkjKZGvj9EiK6dObnK8UQ
 vVQ/UAzN8/0pw2QTlrJDiyJYH4wqs/XlRsK6MF1mxwt45kD3PLQxWfK9j2Cz56O8LryhkgYyMSw
 aon7roPFX7D6RglL7h6T5cktQPlgIVdoGaF/G6FPerOyG4PQny9KZsVQLc9jqNslZn5LKeDfmu0
 vQjZ+RsvyXXyhYJ/dvTtg9dXaCQ82lcyDgR+pIAF5del7o/f8qYqncY1yReYK10DEu9ONRrBBJ/
 w/EfqKRwaIYMZIggtMcXVm/Waaur3w==
X-Proofpoint-GUID: ZQIfdLFo0GEusBIvQIkZFlV28yp0XQgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270049



On 11/19/2025 2:26 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 12:11:11PM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
>> mode can be enabled by user by making a remote_handle64_control request.
> Which request?? I thought it's enabled by making an IOCTL.
Yes, it should be set_options IOCTL, I added user library API details. I'll modify this.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 138 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |   9 +++
>>  2 files changed, 140 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ccba3b6dfdfa..60de9dcb9815 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>> +#include <linux/compiler.h>
>> +#include <linux/iopoll.h>
>>  
>>  #define ADSP_DOMAIN_ID (0)
>>  #define MDSP_DOMAIN_ID (1)
>> @@ -37,6 +39,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>>  #define FASTRPC_CTXID_MASK (0xFF00)
>>  #define FASTRPC_CTXID_POS (8)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> @@ -106,6 +109,12 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> +/* Poll response number from remote processor for call completion */
>> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
>> +
>> +/* Polling mode timeout limit */
>> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
>> +
>>  struct fastrpc_phy_page {
>>  	u64 addr;		/* physical address */
>>  	u64 size;		/* size of contiguous region */
>> @@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
>>  	u32 sc;
>>  	u64 *fdlist;
>>  	u32 *crc;
>> +	/* Poll memory that DSP updates */
>> +	u32 *poll;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> +	/* work done status flag */
>> +	bool is_work_done;
>> +	/* process updates poll memory instead of glink response */
>> +	bool is_polled;
>>  	struct kref refcount;
>>  	struct list_head node; /* list of ctxs */
>>  	struct completion work;
>> @@ -301,6 +316,8 @@ struct fastrpc_user {
>>  	int client_id;
>>  	int pd;
>>  	bool is_secure_dev;
>> +	/* Flags poll mode state */
>> +	bool poll_mode;
>>  	/* Lock for lists */
>>  	spinlock_t lock;
>>  	/* lock for allocations */
>> @@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>>  		sizeof(struct fastrpc_invoke_buf) +
>>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
>> +		sizeof(u32);
>>  
>>  	return size;
>>  }
>> @@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>> +	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  }
>>  
>> +static inline u32 fastrpc_poll_op(void *p)
>> +{
>> +	struct fastrpc_invoke_ctx *ctx = p;
>> +
>> +	dma_rmb();
>> +	return READ_ONCE(*ctx->poll);
> How does this work with caches? Does it require dma-coherent fastrpc
> devices?
I'm assuming it will work the same way any normal RPC call works on platform with
no cache coherency. Is there any other change/check expected for this?
>
>> +}
>> +
>> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	/*
>> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
>> +	 * or until another path marks the work done.
>> +	 */
>> +	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
>> +				       (val == FASTRPC_POLL_RESPONSE) ||
>> +				       ctx->is_work_done, 1,
>> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
>> +
>> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
>> +		ctx->is_work_done = true;
>> +		ctx->retval = 0;
>> +	}
>> +
>> +	if (ret == -ETIMEDOUT)
>> +		ret = -EIO;
>> +
>> +	return ret;
>> +}
>> +
>> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
>> +					    u32 kernel)
>> +{
>> +	int err = 0;
>> +
>> +	if (kernel) {
>> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> +			err = -ETIMEDOUT;
>> +	} else {
>> +		err = wait_for_completion_interruptible(&ctx->work);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
>> +				       u32 kernel)
>> +{
>> +	int err;
>> +
>> +	do {
>> +		if (ctx->is_polled) {
>> +			err = poll_for_remote_response(ctx);
>> +			/* If polling timed out, move to normal response mode */
>> +			if (err)
>> +				ctx->is_polled = false;
>> +		} else {
>> +			err = fastrpc_wait_for_response(ctx, kernel);
>> +			if (err)
>> +				return err;
>> +		}
>> +	} while (!ctx->is_work_done);
>> +
>> +	return err;
>> +}
>> +
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>>  				   struct fastrpc_invoke_args *args)
>> @@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (err)
>>  		goto bail;
>>  
>> -	if (kernel) {
>> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> -			err = -ETIMEDOUT;
>> -	} else {
>> -		err = wait_for_completion_interruptible(&ctx->work);
>> -	}
>> +	/*
>> +	 * Set message context as polled if the call is for a user PD
>> +	 * dynamic module and user has enabled poll mode.
>> +	 */
>> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
>> +	    fl->poll_mode)
>> +		ctx->is_polled = true;
>> +
>> +	err = fastrpc_wait_for_completion(ctx, kernel);
>>  
>>  	if (err)
>>  		goto bail;
>>  
>> +	if (!ctx->is_work_done) {
>> +		err = -ETIMEDOUT;
>> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
>> +			handle, sc);
>> +		goto bail;
>> +	}
>>  	/* make sure that all memory writes by DSP are seen by CPU */
>>  	dma_rmb();
>>  	/* populate all the output buffers with results */
>> @@ -1780,6 +1877,29 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_ioctl_set_option opt = {0};
>> +	int i;
>> +
>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>> +		if (opt.reserved[i] != 0)
>> +			return -EINVAL;
>> +	}
> Empty line.
Ack.
>
>> +	if (opt.req != FASTRPC_POLL_MODE)
>> +		return -EINVAL;
>> +
>> +	if (opt.enable)
>> +		fl->poll_mode = true;
>> +	else
>> +		fl->poll_mode = false;
>> +
>> +	return 0;
>> +}
>> +
>>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_ioctl_capability cap = {0};
>> @@ -2134,6 +2254,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>  	case FASTRPC_IOCTL_MEM_UNMAP:
>>  		err = fastrpc_req_mem_unmap(fl, argp);
>>  		break;
>> +	case FASTRPC_IOCTL_SET_OPTION:
>> +		err = fastrpc_set_option(fl, argp);
>> +		break;
>>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>>  		err = fastrpc_get_dsp_info(fl, argp);
>>  		break;
>> @@ -2465,6 +2588,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  
>>  	ctx->retval = rsp->retval;
>>  	complete(&ctx->work);
>> +	ctx->is_work_done = true;
>>  
>>  	/*
>>  	 * The DMA buffer associated with the context cannot be freed in
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index c6e2925f47e6..6c1375ba0042 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -16,6 +16,7 @@
>>  #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>> +#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>>  /**
>> @@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
>>  
>>  /* Fastrpc attribute for memory protection of buffers */
>>  #define FASTRPC_ATTR_SECUREMAP	(1)
>> +/* Set option request ID to enable poll mode */
>> +#define FASTRPC_POLL_MODE	(1)
>>  
>>  struct fastrpc_invoke_args {
>>  	__u64 ptr;
>> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>>  	__s32 reserved[5];
>>  };
>>  
>> +struct fastrpc_ioctl_set_option {
>> +	__u32 req;		/* request id */
>> +	__u32 enable;	/* enable flag */
> s/enable/value/ ?
Ack.
>
>> +	__s32 reserved[6];
> I think you got feedback from Greg regarding handling of reserved fields
> few months ago. Please drop them.
I remember the comment asking to add proper checks for reserved bit[1]. I have added the
necessary checks. Please correct me if you are pointing to some other discussion.

[1] https://lore.kernel.org/all/2023092840-rental-ascension-b062@gregkh/
>
>> +};
>> +
>>  struct fastrpc_ioctl_capability {
>>  	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
>> -- 
>> 2.34.1
>>


