Return-Path: <linux-arm-msm+bounces-103075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPU7DOj83WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:38:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085A3F76ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 705BD3007BA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072D63B6C01;
	Tue, 14 Apr 2026 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwLUaFqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPYe8Kxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F063B47C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155877; cv=none; b=CIlA3/9O0Lf1RzPnREv4Gd99LHx4AXZS0tOc2UsoqBoisE5/pqIZEuzO8HYJOxnbjuxJ/0u31thv7Db1jhqTrgKJmYVcpv19wCYO1IE1Lhtm7Lg6MhZhHUm6o1QMgGenYc24Rqcw/YYl3RmUAA+/0lXl3+13YUBV0naHxvnmP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155877; c=relaxed/simple;
	bh=zj1QYxFhf4Oi40i3DmHESB0ZSXDClU16AlMr6gJ+t+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjaQtZkhws8xmVX5z7hZW9/L4q2gSnJVB0qz88w1xjb/8/3GhYVFrjM9VGl2nEsLXD0u69ZhiGP2Wxx71d7ijRPCWhyXYkEgWPczOa+h81EZt4yODnWRRiSvRPrYgP47bD4NgPUpBiJsBLS4R+DZMEBvHa1mxNI0ceconlG4VHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwLUaFqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPYe8Kxs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6FXTC3426105
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4RCYYRDRdY5PM4k7osDGGtFZVRpfQ8OgMr9WbE+nXQ=; b=cwLUaFqWuKYwLs9S
	KMThiPB5M95mbO/nrpnHUcvVJPF+SVx4q2HlEa3ougNILvaZlyCIUrYYVVRPkTjR
	VvyoUd3XhSB5KMI7eavM8Ieb9o4LtPUWyhxEYNmqZPm6WKOlb1bxjzcrYsdo6jT4
	/bHbFpcP0YnSPTdUR4wQ8R/EdyXLwYGE/mUVQDcgkEIVZYrgSMyhxgA+gnmnZLoT
	f7KRm4aiA7gJjHxcNjdw4Ei52wzcIG5M0plrSymsJlWaEc1v7kDJpmE9XKYKXZoU
	iodt1uLIYjYhdk0aauep+fRv+KqJ1Y2iQVK7dLfcCeueQ8zmyecCLahQUjJzr4LK
	Zs9C4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9u2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:37:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ec948174so24763185ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155874; x=1776760674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4RCYYRDRdY5PM4k7osDGGtFZVRpfQ8OgMr9WbE+nXQ=;
        b=aPYe8KxscGvzb8DPrawNh6MUsbk8GgZEwIlfOMccbkzqc/Zp/CdeGWs8R0izCvB71Q
         24mrS4sKdQgXtqiNx6SjypKVgxxetgr4ETQUusIERu9Yo4LKUsVmZkOHK2ENq74YqUh6
         mN7YZNJT2bJF0J5VGRSJKfd5XZWi6VOHFieNQw1EeoBKNDNx6zNGk8kQmGBsXe6XpOJ+
         Z1KWccAhzJR/AB4vZ2xdTy7C68/vxBDz42agu0MAO3rBg9yGgW90j16Pl7Ihkf3UI6kx
         Qqz5TLeSzGR0J6mLNVcCMMlpBR+ca/kSirikbShSFPmv6Lg9pvKik9HlK6+CTHfF5F+R
         ySYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155874; x=1776760674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4RCYYRDRdY5PM4k7osDGGtFZVRpfQ8OgMr9WbE+nXQ=;
        b=WgHaL9YW4H67c8unlUQ9ykadTHUwACdaTTpuNac1djYms1yoROhXDffgQ+FJZ+7PXr
         fgHdpIB4WgoykDYN245u3PwbMy346g+LNj09U6DGO3Wbe1Q+p/S1LX8ADUW+za2nA/36
         NIYCithi0VTm6Dcv4XMZ+pWh4g5E2uwTtQC46mNC+Cd7qv2xkBllHSR7/eqLRiPhVPGq
         To9tF17sH1Y7PrhSMA3DDAyYD2iQ3CEvX/ipqzKVkRsWWNYBafstKQSGU622iUtBMQ+4
         A7ifhKv+BX+fLYF4jNl5rmLJHTD5gURJsIZ+NCXzSLS+YIubL7wpkegsYMth804OMMf/
         zBLg==
X-Forwarded-Encrypted: i=1; AFNElJ9rJmgmX5lugSGYgwQrYpHktRaiKHeIZhw7FbN/hGYJ/xsl4nX5RcaSZE7sB1O/5eS3gAoo2ck4eSK3idp7@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqUcKUEpbKTGM/5VFnuFOdN547M+MY8XDTmqXRejGoC8Uau9i
	2aQLXN9+O2oT+hEFcVO+Z8kAN4hUhO9yrRfRmzHnGcJ8tVyjn5vDWijCj6m0mBnhh31evM1ohGS
	4I02C9rZIM6G4eGVcsahbQKKFs4yBiu+C8r9c7T7npzTpNFQn3ni+pT0kFLQ7nKPZTUXG
X-Gm-Gg: AeBDiesvemXEfUEC/HHXajRRWfD977tUTTcyR2LhQ48mjN4cmPcuYGvJw678mXD3fAJ
	qDFYQTiZndn45w4UzDnDvog2oocYmLmKI4oFEvFP1Itq/BpdTfC/dA5tKdfLVgfyJ5KNh/m8rMf
	yR3JpQ097S1Rmfc24cPXx0Q79z8tvAoazhJ4qScU+xycz/aF8E1rpZOBSARmcYmtMFRWZ8Af2+M
	B/6ReOEgCoX+cW2a4l2jNaoDLI4wrQZlxBPHD/Pu76ia1MgkLR+8s4OYwtQEypR4nbegZ5YE4YI
	tqHbSJUXknNTcqXQTQjXEy26z1cz6OWemF4Niki5+PSleQzPWxCL5+f3NIgZWkMRDKuCzhSEL4k
	+SByN4lSensZyWVLUtdePgR53AeMsvwpXTr6xBgJB6gP+jNgrUQ==
X-Received: by 2002:a17:903:2f08:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2b2d5a6de57mr179074395ad.34.1776155874015;
        Tue, 14 Apr 2026 01:37:54 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2b2d5a6de57mr179074035ad.34.1776155873514;
        Tue, 14 Apr 2026 01:37:53 -0700 (PDT)
Received: from [10.204.79.79] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4daede9sm181511365ad.14.2026.04.14.01.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:37:52 -0700 (PDT)
Message-ID: <651ec8a6-60e4-4b5a-bdfb-c23c69afb34f@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 14:07:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
To: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
 <20260402054923.3061925-2-ekansh.gupta@oss.qualcomm.com>
 <44d79f33-26ea-4a57-b292-74ef474fe0a9@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <44d79f33-26ea-4a57-b292-74ef474fe0a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfXxaQKAiXiufja
 YAJ+pBUJqLSHlKy7b+U6f+qPSGBLCM/4BKzCxia2n5pXyvpJrLj1B+xsoRaC4RWnDrJJ1vvlFLu
 8FbqJUwx+HMDZ8ZVtPZTTp4RG5WNfxYTbLD1aBHSwqfrKmKWiY34Ug35A6xn0SViiiJXD9N+3rb
 WKdhCj4ajwzWTIZR/MRRm4gd47/hClk4Nghp9SOjjYkpfM82Me6xb8XMiZ4Y6aN7Yu9AXFW5qZx
 06EAQaBMGO9MABnXvN++/nQ6iUG4p53ac3hJ25cGMtR/TqjODTj/e33+TnWNzs+Oxk0yj33NvmQ
 8wFjV5RVmcSJBXQPgLOaCCn4ltoLksk73xyjF7lWIBgbw5GSPt8lfPc3Fx2zbJz9h7o3WoB23xi
 NG0NHyoQILbruK0D7CEQdu1JgnrD8JW5Zd1Qg5+cUwFpTq1eRi5T526lD8n6x+kp0Au54soLikH
 rL/5R8lrbgh7FsbrDRQ==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddfce2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E3m_rBUOw5yWVkgBiJUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: glvUhUrYEDCBV1gBYsVM96ZduUXYXuAg
X-Proofpoint-ORIG-GUID: glvUhUrYEDCBV1gBYsVM96ZduUXYXuAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103075-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1085A3F76ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13-04-2026 19:38, Srinivas Kandagatla wrote:
> 
> 
> On 4/2/26 5:49 AM, Ekansh Gupta wrote:
>> The fdlist is currently part of the meta buffer which is set during
>> fastrpc_get_args(), this fdlist is getting recalculated during
>> fastrpc_put_args().
>>
>> Move fdlist to the invoke context structure to improve maintainability
>> and reduce redundancy. This centralizes its handling and simplifies
>> meta buffer preparation and reading logic.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 47356a5d5804..11f4ae749e51 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>>  	int pid;
>>  	int client_id;
>>  	u32 sc;
>> +	u64 *fdlist;
>>  	u32 *crc;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> @@ -1016,6 +1017,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	rpra = ctx->buf->virt;
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1118,18 +1120,11 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>>  	struct fastrpc_user *fl = ctx->fl;
>>  	struct fastrpc_map *mmap = NULL;
>> -	struct fastrpc_invoke_buf *list;
>> -	struct fastrpc_phy_page *pages;
>> -	u64 *fdlist;
>> -	int i, inbufs, outbufs, handles;
>> +	u64 *fdlist = ctx->fdlist;
> 
> fdlist is available after input , output buffers and handles.
> 
> why this is now changed to nscalars?
We can replace it as,

nscalars = inbufs + outbufs + handles


> 
> --srini
>> +	int i, inbufs;
>>  	int ret = 0;
>>  
>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
>> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
>> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>>  
>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>>  		if (!ctx->maps[i]) {
> 


