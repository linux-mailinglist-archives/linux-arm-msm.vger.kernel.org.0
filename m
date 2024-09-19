Return-Path: <linux-arm-msm+bounces-31990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2497C451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 08:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A18E9B2183C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3351E17C20F;
	Thu, 19 Sep 2024 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JB0n8yFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC2A2D611;
	Thu, 19 Sep 2024 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726727454; cv=none; b=agQBobTPce1AC7tBvp204t4+5TV1HV4JTzIfM0lFoIw+7//bL+Ub9+yafzzEK25I7vxKB7xNyCvHUP3Jha452D18gpZ/8uotR1GOses/T0yxTjTFry9w/F+piz1uKy9YP2r6GFrzPZH1zkOCyr2nz/fM4yUNHrBiWSyLHbQNqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726727454; c=relaxed/simple;
	bh=9E1Dj8+Rtvk4CsMbA5zBO+6mpKq1iMvge6SlBi4g6Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XQNa1RNCAJvPwN4MHP12PkJWtT3WoIYtT6OYCOI0/U9oVaWDfDVnvnRVSF1s6/5Hsxerj/qIPu8RLrMXUw/gwAW8j7/Gx94dP3G2Z06Qz2UTuiDKIh/v6TfAetykHp9xn1DMSSYTAA3Vi14k4gVSGhj6GoAgtOeJh5XdNMqhe00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JB0n8yFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IJI7tY012612;
	Thu, 19 Sep 2024 06:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CMh2NDjOinI+rhXcFElY+FQUwnwc3oYqXqP3e8yjhE=; b=JB0n8yFkCU6TMunz
	A/7o6G2jKTvQXt9zCVmhb1Szuhk2sA9kDLGqwg7O7+f/n9YBuqyWYojZXA1WHFEu
	w2DebHoSeyX94WZRAYHjBwjPi6d61NgwP3AFCSI+u/Mv5+KjWPjEc+DEwZnzDmhg
	MZ5R5ISm/2nFhvwu3BElmTEnlp7L8DOJ9JjjVCX9Gf+mNhENgi52sRPG7vxQQCl6
	GtgQv3aL2Ctgmj8cMe2uanvUC2swOJMe+0fqWhm5oKirFsGx9OuZu65xceF41UMY
	OKyDw5N9fXx3HppudXT9ka+b8zB7QM1qVKqGtubirZdAOyxzeyVa/YoaLXMwWu+e
	7ukJQA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd4ade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 06:30:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J6UdlK027082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 06:30:39 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 23:30:35 -0700
Message-ID: <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>
Date: Thu, 19 Sep 2024 12:00:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
 <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sFzpdocpkrE2omDSeZ2UUeT0-RqyU-dm
X-Proofpoint-GUID: sFzpdocpkrE2omDSeZ2UUeT0-RqyU-dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190040



On 8/30/2024 3:03 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
>> If multiple dma handles are passed with same fd over a remote call
>> the kernel driver takes a reference and expects that put for the
>> map will be called as many times to free the map.
>> But DSP only
>> updates the fd one time in the fd list when the DSP refcount
>> goes to zero
> I'm sorry, I couldn't understand this phrase. Could you plese clarify
> what do you mean here?
DMA handle are buffers passed to DSP which are only unmapped when DSP updated
the buffer fd in fdlist.
fdlist implementation: misc: fastrpc: Add fdlist implementation - kernel/git/next/linux-next.git - The linux-next integration testing tree <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=8f6c1d8c4f0cc316b0456788fff8373554d1d99d>

A remote call payload carries both input/output buffers and dma handles. The lifetime
of input/output buffer is a remote call which means that any buffer allocated or mapped
for a remote call will be freed or unmapped when the remote call is completing. Whereas,
dma handles can get freed over some other remote call whenever the DSP will update
fdlist. So if a remote call passed multiple dma handles with same fd to DSP, on driver, ref
count will be incremented, but DSP can update fdlist only 1 time for the same fd as DSP also
has a ref counting happening for the dma handle and fdlist is updated when the DSP ref
count goes to 0. In this case, the map will not get freed even though it is no longer in use.
>
>> and hence kernel make put call only once for the
>> fd. This can cause SMMU fault issue as the same fd can be used
>> in future for some other call.
>>
>> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ebe828770a8d..ad56e918e1f8 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>>  
>>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  				u64 va, u64 len, u32 attr,
>> -				struct fastrpc_map **ppmap)
>> +				struct fastrpc_map **ppmap, bool take_ref)
>>  {
>>  	struct fastrpc_session_ctx *sess = fl->sctx;
>>  	struct fastrpc_map *map = NULL;
>> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  	struct scatterlist *sgl = NULL;
>>  	int err = 0, sgl_index = 0;
>>  
>> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
>> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
>>  		return 0;
>>  
>>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
>> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>>  	int i, err;
>>  
>>  	for (i = 0; i < ctx->nscalars; ++i) {
>> +		bool take_ref = true;
>>  
>>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>>  		    ctx->args[i].length == 0)
>>  			continue;
>>  
>> +		if (i >= ctx->nbufs)
>> +			take_ref = false;
> Please clarify too.
nbufs -> total input/output buffers
nscalars -> nbufs + dma handles
So here, avoiding ref increment for dma handles.
>
>>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
>> -				ctx->args[i].attr, &ctx->maps[i]);
>> +				ctx->args[i].attr, &ctx->maps[i], take_ref);
>>  		if (err) {
>>  			dev_err(dev, "Error Creating map %d\n", err);
>>  			return -EINVAL;
>> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  
>>  	if (init.filelen && init.filefd) {
>>  		err = fastrpc_map_create(fl, init.filefd, init.file,
>> -				init.filelen, 0, &map);
>> +				init.filelen, 0, &map, true);
>>  		if (err)
>>  			goto err;
>>  	}
>> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  
>>  	/* create SMMU mapping */
>>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
>> -			0, &map);
>> +			0, &map, true);
>>  	if (err) {
>>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>  		return err;
>> -- 
>> 2.34.1
>>


