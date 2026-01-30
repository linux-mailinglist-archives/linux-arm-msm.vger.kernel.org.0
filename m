Return-Path: <linux-arm-msm+bounces-91291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA5WCnmbfGn2NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:52:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A62BA2CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88F8A3019BB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444CE36D503;
	Fri, 30 Jan 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIQZxfxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVIDUhAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1634F46C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769773935; cv=none; b=XWKAZ/kJgLFvobWkqBBw+k+CNGMKl8bN5g2MQwKUSnAmQSe6rx9esdnIaNEPNrIZVVBdRixYVt27/i624dhPTHQqXDc+vaIC08ICn//cGs6EOH7dMqaCm/mfQO6giDQS9olqeLsnRjWoW1CyLQdHt42RHBNT4WaIJAPwJ22RD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769773935; c=relaxed/simple;
	bh=dLKlbBdNdZT0825AM0f0kn6sHa7tW2Pakir9yuwrrvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mW+klF10qaXh6q0OiH3vNTCpQcAPxbUOgmzBoA2iBlyd2ovnWBUUkynaXZzUF7o7/eUq6HIF0gwJ5lhYl2TGevuDrdpnq5B+JNW2VqjdtvDO7ctY2E2imGOF51By4NDNEUOO3w9E1YJ5BsooxWg1flaD4FRw8qACAFquG9Po5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIQZxfxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVIDUhAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAbJQM891567
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=; b=XIQZxfxT6C/JJcZW
	34qNv+mGZ4x+e2AgkQamMa3zP1LAyrOVCG3S0V1pLLellukjLRdnO3ymsjfNDIxW
	Bx2pw/xL1nJkPGNU0cbSn2uXnuy35FuuUPxfNUVVuVQ5Oi2WQXFeCzmB0GahHvey
	pkUSzx2G8MFScesjH18Ek5QKL9SL5MFGuXJFOcq5ly+TW+0uDzJIBW7Ab0dDq4Do
	mxyDpvrThFNHRP/8bZTmcAz1C+CQh2QKYibqEAPYATQ4DWCiODvBOMDRXR3aQxSg
	SERUaXT/RE6au6bozzanLx/KpRjVEpBURc1pmiv0jXYWFQTfaP7RI3AxkgBT/MF8
	Jxc0hQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7t14j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:52:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ac814f308so3155708a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769773931; x=1770378731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=;
        b=AVIDUhAVjBwROKFjNTL1yWxEqptCVMl4psC55gDCTRjIgEByttIUSF1djpyggi2hjL
         wjpHcN7Re4FW3eSTVvTHprUZqkrI9kPKfOfo9FbY3c1+iQgsGfAKVVuO//dBJ1E3fT6E
         zglQZyFNhxdm65kt6pqMvlhNeEMyIvkl2uxHle/uoX3I6ekXTigKRCTNzon5KnVWlF2E
         YkMvqXC3ASQYyyvtzEdiozOYQqXqdvJrH+r1UR00znyL0IoKJ754My2/UeLEirI26z7F
         mW41e20JXituHSYGmHNvfmYmPcFebhyH3NNWB2Qm3qfATfpwXfRljqDoUz7PZ8stIDZe
         3eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769773931; x=1770378731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=;
        b=ZjpMbnk5w0gYhbs1ZYvDm2lcT0j25Kp08EYKGtLb8b73CfSt6Vkf6/7e6IVHeBPs45
         hXo2x4PAR6plHnzbqUlv0YbEy02CZE91MEesK796NmBxps+wvwWgmw3+v0ZW9mm6PeA5
         NLcPGl+McsbHXTDfA8bTSzac0dG05mds3aoBGWB28fa87lGTwG9JvBhglh3OLlbeV+r6
         5dsVleLY09RkfFrLEZSAXCYzC1oEg9ddgtEtepgdFrmV+qd/tRqU5BJgpOQjq/qs0aLR
         k/Mg2KCg3A99jmBLubQWpnDnW31lpcazoDlm20jsXFBLQOCRRpaV7sQr6VqQIBzFWeiG
         xwLg==
X-Forwarded-Encrypted: i=1; AJvYcCWIXTLmTxiD1AldNoUAHqfAanXZkzDM3ncbQLmUVdcreN5PiZQ9QYVB6Kwju4ezbgKiaafGKhgXnOp9cWtJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJn6Z7AoFGQbilh36KC3nrW6hOeU1Ux4OEQf5JqbpMdJd49m2T
	p2KwdNUL+CQimFJEIol/Y7K0AVgLAuQCe31/JVFzSVeNgDmwyS8GxA9/VaczAQUxW35PDmG9XRF
	+0f9IoWUobcLzhAyorju8HPdhfPu5c3OcjTDkj8C6z6S6Ek7cItzentm3tOE3s1B7GSNw
X-Gm-Gg: AZuq6aL7wGs6/r9hedrk5WstKi8ZrGo4kyemf3qlCdgio50mTDecKLyESBO9hNjlVes
	inBca1irhoibdxReu78fGuD++t6CZdXFh+j/Lqo8EgBAxcKzUrHFf4pijd0NGz8BYu4xJR/Zl33
	26JyYdNwcZISQf0MCb19rrVQpj3foYdgTxiDt83ZEFNjfTaiMxvun90TvxuNdEhxq+KcZ3AX+/v
	mXpnyL3GO4ci+yrSQLyqrSv7ZLs2zZaKMcX5FLM0pga9yDn5NhUOx1sh0bGgLYxAvIU0gnwZcg/
	7vQ7dIx9jmNuigKIO0r5vply4A1l3QwGPqC1Hm2ZP0vy9K1NXpWATR3MFnOM40l1PFwsqh+iXu9
	WnnsEDg1uB5TYW0zf+ypCcjV36kKH4y6l//LLww==
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-3543b3b54b3mr2883672a91.29.1769773931072;
        Fri, 30 Jan 2026 03:52:11 -0800 (PST)
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-3543b3b54b3mr2883650a91.29.1769773930565;
        Fri, 30 Jan 2026 03:52:10 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb5adsm8083054a91.3.2026.01.30.03.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:52:10 -0800 (PST)
Message-ID: <7e52f1d4-c05c-45ea-878c-cea2e6354c3f@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:22:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NiBTYWx0ZWRfX2blCXYnRY27h
 mffgEqmXXlJFcF0FtH0LkMeD8HTy1pJM8nBDpnPeKePPu5uO3yxfRgzF3vMfUpRbU8R/wEmLmb3
 l+D/+FMxstU/8Jq5yHLd00iBXtqA/o6KF6iFnJ5Sh+ogVIS0fcSpJE8TGAhNEvd8FfKx7AtyZcn
 h5lOiji1CGPJUP9gKcPQWthZZSEkWJypVlVdkYinCFsFHG+7m1dJ2//nrBuC0NeB9CachGsqIjg
 +Pg1ssGQKrb3MstwIHBaxf5U4FKo57NsO36Ykh8AupPQFjYSw2R2hrF3U6yTEeaZ+plWsO0jcg5
 77zF2kVaWqmc/XNiyqB+2Oqj5gnI4Jyyz2w3YLZfRXiu7HjA+V/vG2R5575QpqdEsZr0ewo3ugC
 DNYyy36H5PTIKLEtwXH0sK7DpoQHEEgpP2+IXXeEk4Zsr6Vm5REsfUHQtly5KoBOAm5nGyP+yZO
 LF1o0FlwAz9XkYHvfzw==
X-Proofpoint-ORIG-GUID: Qhrfy5IlYJB9dfg5MnBdhtwQYR2p9zIt
X-Proofpoint-GUID: Qhrfy5IlYJB9dfg5MnBdhtwQYR2p9zIt
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c9b6b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hcJ8E8GYhuT13GVzWLAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91291-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78A62BA2CE
X-Rspamd-Action: no action



On 1/30/2026 3:41 AM, Rob Clark wrote:
> On Thu, Jan 29, 2026 at 2:39 AM Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
>>>> Currently, FastRPC only supports mapping buffers allocated by the
>>>> kernel. This limits flexibility for applications that allocate memory
>>>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
>>> Hmm, for DMABUF we need _import_ support rather than support for mapping
>>> of userspace-allocated buffers.
>>>
>>>> Add support for mapping and unmapping userspace-allocated buffers to
>>>> the DSP through SMMU. This includes handling map requests for rpcmem
>>>> and DMABUF-backed memory and providing corresponding unmap
>>>> functionality.
>>> For me this definitely looks like a step back. For drm/accel we are
>>> going to have GEM-managed buffers only. Why do we need to handle
>>> userspace-allocated buffers here?
>> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
>> change is to enable routing of DSP logs to HLOS which is done by using a shared
>> buffer between userspace process and DSP PD. The buffer can be allocated from
>> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
>>
>> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
>> with this change.
> So, a mmap'd dma-buf is not necessarily pinned.  Or even backed with
> pages.  So you wouldn't want to try to map a userspace vaddr from a
> dma-buf to the device.
>
> But looking at the patch, this looks more like mapping an imported
> dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
> the existing fastrpc code?
yes, when the fd is passed to this call, first fastrpc_map_create is called which is
calling dma_buf_map_attachment[1]. After this the buffer is mapped onto DSP.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n781

>
> BR,
> -R
>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>>>
>>>> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>>>>      return err;
>>>>  }
>>>>
>>>> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
>>>> +                              struct fastrpc_req_mmap req,
>>>> +                              char __user *argp)
>>>>  {
>>>> -    struct fastrpc_req_mmap req;
>>>> +    struct fastrpc_map *map = NULL;
>>>> +    struct device *dev = fl->sctx->dev;
>>>> +    u64 raddr = 0;
>>>>      int err;
>>>>
>>>> -    if (copy_from_user(&req, argp, sizeof(req)))
>>>> -            return -EFAULT;
>>>> +    err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
>>>> +    if (err) {
>>>> +            dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>>> +            return err;
>>>> +    }
>>>> +
>>>> +    err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>>>> +                              req.vaddrin, &raddr);
>>>> +    if (err)
>>>> +            goto err_invoke;
>>>>
>>>> -    if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>>>> -            dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>>>> +    /* update the buffer to be able to deallocate the memory on the DSP */
>>>> +    map->raddr = (u64)raddr;
>>> Which type are you converting? And why?
>> I'll drop this.
>>>> -            return -EINVAL;
>>>> +    /* let the client know the address to use */
>>>> +    req.vaddrout = raddr;
>>>> +    dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
>>>> +            (void *)(unsigned long)map->raddr, map->size);
>>>> +
>>>> +    if (copy_to_user(argp, &req, sizeof(req))) {
>>>> +            err = -EFAULT;
>>>> +            goto err_copy;
>>>>      }
>>>>
>>>> -    err = fastrpc_req_buf_alloc(fl, req, argp);
>>>> +    return 0;
>>>> +err_copy:
>>>> +    fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>>>> +err_invoke:
>>>> +    fastrpc_map_put(map);
>>>>
>>>>      return err;
>>>>  }
>>>>
>>>> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> +{
>>>> +    struct fastrpc_req_mmap req;
>>>> +    int err;
>>>> +
>>>> +    if (copy_from_user(&req, argp, sizeof(req)))
>>>> +            return -EFAULT;
>>>> +
>>>> +    if ((req.flags == ADSP_MMAP_ADD_PAGES ||
>>>> +         req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
>>> Side note: why are these flags not defined in the uABI header?
>> Ack. These should be part of uABI. I'll create a separate patch for this.
>>>> +            err = fastrpc_req_buf_alloc(fl, req, argp);
>>>> +            if (err)
>>>> +                    return err;


