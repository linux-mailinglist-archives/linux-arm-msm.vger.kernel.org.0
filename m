Return-Path: <linux-arm-msm+bounces-45891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739AA19E10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 06:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12EC13ADE76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 05:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C6D15D5B8;
	Thu, 23 Jan 2025 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hHA7jfiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC10C2FD;
	Thu, 23 Jan 2025 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737611264; cv=none; b=u18DD5Y1ibaYa15y2Q/23FqRwTcVRX3k8a9E8v5KVUYc3hJIyow5MS1YGdjUTaYV1saHsMlx7AQfUsWWz+BszaTctgEGJR3OziwUKb6BRhIkg4L4viqT0KI0XUF2+UWAGoB6xBKEs2VFtiJbiQFCFWoLxk9vxtf9TzKgRZL4YOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737611264; c=relaxed/simple;
	bh=VMt5WLJ/ewZmOUdHtp/jTIzwWeVvXGXtswOFv/KbxF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jK9LhpbA7oS2ScqFTqyLPOLD9/CyibY2ACjqqEuowzyMJpXXMmLb0HTNtR1YDncGYAPp8cVAjwtC8Qb6wB2VLZPKcPHN9HgWasZmQmbfZTFmUcUyrSFLBM5Iywy4NDxQGnXRS9Lh0pQS0r7LrvgDmH3zPP8N6mFIehe3Nwz1Tgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hHA7jfiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N0cA6r031390;
	Thu, 23 Jan 2025 05:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1qOnL/Q4KgrcwuymeCuZ1tXIPS4RMKus+0rJkmaTH4=; b=hHA7jfiSul9OKPP3
	ZIcKdJthDuwqKE6xlXEKlD/9llqvIhP24fNiiZfxBsXvdZyE8pFaiFrmWQBc4piP
	Exis1VzSlPUrTz8TXrBz2TLSY2J+190R2T/LJz/iyvdYaGWJDHxDYKdFB5dbrj4w
	vTSs84sw84J/SFdlvCtgbPITbPNhUJEQqY/xW99ewHtBRdQo4ajfu0VlVywa+iFs
	df7IEPITD1kjcZmKW01FFoCHCgTqxw+YeDt7mdRtyqqVxGXE4lBzxlY2xrdskB3w
	BnpQvKzXO69djnky69pd5JtJV7IF4IxGpc6nTrsbbig19O2vmAMGVio/SAmIzaXM
	tP0XdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bbd2ghkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 05:46:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N5klkR027764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 05:46:47 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 21:46:44 -0800
Message-ID: <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
Date: Thu, 23 Jan 2025 11:16:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vsAUfHyj84cLBrvn5R2O-DgGkdhtb3ZN
X-Proofpoint-ORIG-GUID: vsAUfHyj84cLBrvn5R2O-DgGkdhtb3ZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_02,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230043




On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
>> InvokeV2 request is intended to support multiple enhanced invoke
>> requests like CRC check, performance counter enablement and polling
>> mode for RPC invocations. CRC check is getting enabled as part of
>> this patch. CRC check for input and output argument helps in ensuring
>> data consistency over a remote call. If user intends to enable CRC
>> check, first local user CRC is calculated at user end and a CRC buffer
>> is passed to DSP to capture remote CRC values. DSP is expected to
>> write to the remote CRC buffer which is then compared at user level
>> with the local CRC values.
> This doesn't explain why this is necessary. Why do you need to checksum
> arguments?
This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
remote call. This is not enabled by default and user can enable it as per their reqirement.
I'll add this information.
>
> Also, what if the DSP firmware doesn't support CRC? How should userspace
> know that?
CRC support on DSP is there since long time(>6years). From user space CRC check failure is
not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
call failure. Should I keep it as fatal considering that ever very old DSP support this or should
I consider the copy failure as non-fatal as userspace is treating this as a warning?
>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
>>  include/uapi/misc/fastrpc.h |   7 ++
>>  2 files changed, 116 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 74181b8c386b..8e817a763d1d 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>>  
>>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  			struct fastrpc_user *user, u32 kernel, u32 sc,
>> -			struct fastrpc_invoke_args *args)
>> +			struct fastrpc_invoke_v2 *inv2)
>>  {
>>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>> +	struct fastrpc_invoke_args *args = NULL;
> Why do you need to init to NULL if you are going to set it two lines
> below?
>
>>  	unsigned long flags;
>>  	int ret;
>>  
>> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
> Why does it need a typecast?
>
>>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>>  	if (!ctx)
>>  		return ERR_PTR(-ENOMEM);
>> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  	/* Released in fastrpc_context_put() */
>>  	fastrpc_channel_ctx_get(cctx);
>>  
>> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
> Oh, but why? Also is it a user pointer or in-kernel data? If it's a
> user-based pointer, where is the accessiblity check? Why isn't it
> annotated properly?
This is a user pointer where the crc data is expected to be copied. There is no
other access to this pointer from kernel. I'm planning to change the data type
for crc as (void __user*) inside fastrpc_invoke_ctx structure.
>
>>  	ctx->sc = sc;
>>  	ctx->retval = -1;
>>  	ctx->pid = current->pid;
>> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	struct fastrpc_invoke_buf *list;
>>  	struct fastrpc_phy_page *pages;
>>  	u64 *fdlist;
>> +	u32 *crclist;
>>  	int i, inbufs, outbufs, handles;
>>  
>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
> I think we should rewrite this parsing somehow. Is the format of data
> documented somewhere?
fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
to store these pointers to ctx structure and directly use it wherever needed. This will
clean-up this unnecessary calculations at multiple places.
>
>>  
>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>>  		if (!ctx->maps[i]) {
>> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  			fastrpc_map_put(mmap);
>>  	}
>>  
>> +	if (ctx->crc && crclist && rpra) {
>> +		if (copy_to_user((void __user *)ctx->crc, crclist,
>> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
> Oh, so it's a user pointer. Then u32* was completely incorrect.
> Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
> filled? Or are we leaking some data to userspace?
Yes, right. Planning clean-up in next patch.

All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.
>
>> +			return -EFAULT;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1137,13 +1148,12 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  }
>>  
>> -static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>> -				   u32 handle, u32 sc,
>> -				   struct fastrpc_invoke_args *args)
>> +static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
> Please don't touch what doesn't need to be touched. You are replacing
> handle/sc/args with inv2, not touching the first line.
Ack.
>
>>  {
>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>>  	struct fastrpc_buf *buf, *b;
>> -
>> +	struct fastrpc_invoke inv;
>> +	u32 handle, sc;
>>  	int err = 0;
>>  
>>  	if (!fl->sctx)
>> @@ -1152,12 +1162,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (!fl->cctx->rpdev)
>>  		return -EPIPE;
>>  
>> +	inv = inv2->inv;
>> +	handle = inv.handle;
>> +	sc = inv.sc;
>>  	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
>>  		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
>>  		return -EPERM;
>>  	}
>>  
>> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
>> +	ctx = fastrpc_context_alloc(fl, kernel, sc, inv2);
>>  	if (IS_ERR(ctx))
>>  		return PTR_ERR(ctx);
>>  
>> @@ -1239,6 +1252,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  {
>>  	struct fastrpc_init_create_static init;
>>  	struct fastrpc_invoke_args *args;
>> +	struct fastrpc_invoke_v2 ioctl = {0};
> Why do you need to init it?
Ack.
>
>>  	struct fastrpc_phy_page pages[1];
>>  	char *name;
>>  	int err;
>> @@ -1248,7 +1262,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		u32 namelen;
>>  		u32 pageslen;
>>  	} inbuf;
>> -	u32 sc;
>>  
>>  	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>>  	if (!args)
>> @@ -1313,10 +1326,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	args[2].length = sizeof(*pages);
>>  	args[2].fd = -1;
>>  
>> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
>> -
>> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				      sc, args);
>> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
>> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
>> +	ioctl.inv.args = (u64)args;
> Can you pass it as is, without typecasts?
Cleaned up in refactoring change.
>
>> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>>  	if (err)
>>  		goto err_invoke;
>>  
>> @@ -1357,6 +1370,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  {
>>  	struct fastrpc_init_create init;
>>  	struct fastrpc_invoke_args *args;
>> +	struct fastrpc_invoke_v2 ioctl = {0};
>>  	struct fastrpc_phy_page pages[1];
>>  	struct fastrpc_map *map = NULL;
>>  	struct fastrpc_buf *imem = NULL;
>> @@ -1370,7 +1384,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  		u32 attrs;
>>  		u32 siglen;
>>  	} inbuf;
>> -	u32 sc;
>>  	bool unsigned_module = false;
>>  
>>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>> @@ -1444,12 +1457,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  	args[5].length = sizeof(inbuf.siglen);
>>  	args[5].fd = -1;
>>  
>> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
>> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>>  	if (init.attrs)
>> -		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
>> -
>> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				      sc, args);
>> +		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> if (init.attrs)
>     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> else
>     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>
>> +	ioctl.inv.args = (u64)args;
>> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>>  	if (err)
>>  		goto err_invoke;
>>  
>> @@ -1501,17 +1514,18 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>>  {
>>  	struct fastrpc_invoke_args args[1];
>> +	struct fastrpc_invoke_v2 ioctl = {0};
>>  	int tgid = 0;
>> -	u32 sc;
>>  
>>  	tgid = fl->tgid;
>>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>>  	args[0].length = sizeof(tgid);
>>  	args[0].fd = -1;
>> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>>  
>> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				       sc, &args[0]);
>> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
>> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>> +	ioctl.inv.args = (u64)args;
>> +	return fastrpc_internal_invoke(fl, true, &ioctl);
>>  }
>>  
>>  static int fastrpc_device_release(struct inode *inode, struct file *file)
>> @@ -1647,45 +1661,77 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>  {
>>  	struct fastrpc_invoke_args args[1];
>> +	struct fastrpc_invoke_v2 ioctl = {0};
>>  	int tgid = fl->tgid;
>> -	u32 sc;
>>  
>>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>>  	args[0].length = sizeof(tgid);
>>  	args[0].fd = -1;
>> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>>  	fl->pd = pd;
>>  
>> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>> -				       sc, &args[0]);
>> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
>> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>> +	ioctl.inv.args = (u64)args;
>> +	return fastrpc_internal_invoke(fl, true, &ioctl);
>>  }
>>  
>> -static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>> +static int fastrpc_copy_args(struct fastrpc_invoke *inv)
>>  {
>>  	struct fastrpc_invoke_args *args = NULL;
>> -	struct fastrpc_invoke inv;
>>  	u32 nscalars;
>> -	int err;
>> -
>> -	if (copy_from_user(&inv, argp, sizeof(inv)))
>> -		return -EFAULT;
>>  
>>  	/* nscalars is truncated here to max supported value */
>> -	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
>> +	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
>>  	if (nscalars) {
>>  		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
>>  		if (!args)
>>  			return -ENOMEM;
>>  
>> -		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
>> +		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
> Wait... So inv->args is a user pointer? Then how can you assign a
> kernel-based pointer to the same field? I think you need to sanitize
> your structures. One is userspace-facing. It should be using userspace
> data pointers, etc. Another one is a kernel representation of the ioctl
> args. It might have a different structure, it shouldn't contain __user
> data, etc.
I'm planning to have a new structure to carry ctx specific data which will be saved in
fastrpc_invoke_ctx structure during fastrpc_context_alloc.

Something like this:
struct fastrpc_ctx_args {
    struct fastrpc_invoke_args *args;  /* Carries args that is copied from ioctl structure */
    void __user *crc; /* Carries CRC user pointer where the crcdata from DSP will be copied for user to read */
    u64 poll_timeout; /* Carried context specific poll_timeout information */
};

Do you see any problem with this?
>
>>  				   nscalars * sizeof(*args))) {
>>  			kfree(args);
>>  			return -EFAULT;
>>  		}
>>  	}
>> +	inv->args = args;
>>  
>> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
>> -	kfree(args);
>> +	return 0;
>> +}
> Looking at the rest of the code, I think the patch needs to be split.
> CRC is the minor issue at this point, please focus on getting existing
> data being handled correctly while refactoring the code to use new
> structure. I'd suggest seeing two struct definitions: one for the
> userspace and another one for the kernel space.
I've made changes for refactoring where instead of using userspace structure, I'm
planning to use fastrpc_ctx_args structure mentioned above.
>
>> +
>> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_invoke_v2 ioctl = {0};
>> +	struct fastrpc_invoke inv;
>> +	int err;
>> +
>> +	if (copy_from_user(&inv, argp, sizeof(inv)))
>> +		return -EFAULT;
>> +
>> +	err = fastrpc_copy_args(&inv);
>> +	if (err)
>>
>> -- 
>> 2.34.1
>>


