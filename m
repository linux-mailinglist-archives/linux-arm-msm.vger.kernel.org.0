Return-Path: <linux-arm-msm+bounces-108648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cZwtO7Z3DWqGxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4E58A45B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D41302BA7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000A83BF660;
	Wed, 20 May 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIN4JNsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrQRNi35"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607E23B95F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266406; cv=none; b=qOJp4KKBi3qbpO+qsy8SckEQRd9BoE1B2fQLuFoRtyoT4oyPKrUIJ/iaBzkqD+aC0ydDW0BIZsnfEZISq6VxPulhhbMDj0AAlQEiHD73b+ANIqBtCkWwr7HYgw/+MyH2uV8IXIUP1gkPhU1hchzhYLv6/NTewxLH54aIXIIYYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266406; c=relaxed/simple;
	bh=VeLTQww7qdVrRChuGiBDMBJv7WutPErP2jVZjGTom9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHHfx9/tzZO04K9YIndRUPpfP6VTZRki7+2s+eRtRY3DOixIUaQBseVGpIdjkNgqNXF+B7QIli9rnm/3DJFN4Es6X/iiImpmEgU3zMz24S0mgpcM6BJsY8MQcn+Qb6npsc0ISd/1nq93MdXPxEU28zIp9rpFDVbupT3PMyekK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIN4JNsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrQRNi35; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7KPFI1725603
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ksCuFyVopMwzaF+rhBhElIqrMrlV9U+fKPObu3sILeE=; b=BIN4JNsXc1As4p6H
	rgX40M9M/32FPCPa/TDm3Os5VKpmtghVak3XGCmv8w4HqFCFuuNmRocoMWz5/LVL
	+aAoR5AdZGKYzBP0W+lRcXKvTJpfLFt98jwDdhbj8EOf8g+e3/s6Zmw3dGVLgcLv
	kRjl737aQ77f6rpZMclPj+bMTeFD6dbIJqkdDL5QCOLk9D4TfAwHPgrUN9toGiex
	pE7TwHaRC80XfsQim2c4lnmCvulKcYL9xqFd0U8IZMS8siTBKvxDSFJhSnHiX0lY
	ezftB2e3ioOc+oHA97mpTxXEcPmgWsFq1ahpAXXmFaHXmafuE8nwGhzHYOByxfJe
	FPeLQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qkuqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:40:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so2107810a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266403; x=1779871203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksCuFyVopMwzaF+rhBhElIqrMrlV9U+fKPObu3sILeE=;
        b=GrQRNi35L1yIUK7KdaU5t55Eh9Gz97hbrawBvTPpczP7wYuockVyDvI2o8z2h6UDpv
         ROn5j6+7Ck70cLUJZrMRzPL7QQ94JtD1O+GZ/eG+5tMo9Tk9b6ebYsks6O2wPxzQBd5u
         jGJnra2syLPjv09oe30/VG8RrUZTye2eqG9LUolyn6a1UmcZzju2ZFQkkgc1engTE6vX
         TO0akhZ04s5E3OZNB9gSHJtstsJ1Fp+m8gzW2Y4O/VoG0KCo4LiGIA7PhTYls0JWXAWs
         rWWrO5dP1dAgFMtGOWJzxCIFvZHH0LX3sT9FvbLyRJx5YFKhjPBzutkbxU7Qx2J4Yxqv
         1JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266403; x=1779871203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksCuFyVopMwzaF+rhBhElIqrMrlV9U+fKPObu3sILeE=;
        b=Un1I/1lrDM9u95ktLGdA53+36K6NghvXfQ3pKc2RGvOum3hO8gFClVEl3EgGmASmS+
         KnBagc3NT+2U03UJ6lx2Oo9oi2ktXOiniUX2adtIzx43w7TBZf3Or3m7+8L1JjKXoQmm
         Ytr20pZvUnJvoJxtPW2JnIidS3J9N2qPSD39LJL1UOdfG6sNpXWiZf4hTe5XZ56XH6LZ
         g9ysYnueLI3QnnymOY32GotClc2wFtduqQ6Is0FON6SVu0M/V/wYa3MEqtDpxNLGX2AE
         +cJZD0Iltnhkt1llfeXXF1weNeQH0FwCmf4LTKNyVD7zCJN2DMwNX2G2dNvOqHWOTq/o
         FcLg==
X-Gm-Message-State: AOJu0YzQ0aMUJcuuUpBbwN9WnybECuDjl+7AfsnwGRnCDPTWvvrR+riu
	HmcxYqKxdc98uUWfFOWXH2oGIj69VKftDrq789SwwAGk9GouwIsRUQFGAf43niUSKoGefYUPojM
	NialY2kPfhfti+uuP1BFb4ookWnrhqCftvIXMzuV4klcUaqY9F9IX/8G2zlpgHXPk2K7y
X-Gm-Gg: Acq92OHmSd/oqCvAUnBUhfNo54XInrbSbTnElEmoMhe/ywMru2zcrALWW3fnuGyj2BZ
	rnlcaRXj20K/69R9mEzNU4VlaIBwaaSYDPYzY78BwBIDSKLzGUlDv6mfKAByf9sMYg/Jdy2mGQ1
	UZfyO2eBDuS0mD2rQXIzwTAT0gnu0uYQ2JYpaNWWEp9i1eObrpkuCNEkyJuuAor1dbU8+4ErJCv
	2iHBXJTTgGgUmc9z1pSjbi/BsA/WlzTWT/gIhDmycWoT5wx7ZU4HfEhD9bHqtE3CeWXlrfvz+zR
	AXiWsiu7WweBOttmf35Epch3EPbPncAXTaCRiH8Iiz+8tS6J9+jqIs9Q5Co6XqIwO8c2d35ECmK
	I3biEwDAk5VyCeYVCmJdjVCWmSMmQu0CMT/AagCM9yw==
X-Received: by 2002:a05:6a21:6d9e:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3b22e70d3a6mr25668443637.13.1779266402734;
        Wed, 20 May 2026 01:40:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9e:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3b22e70d3a6mr25668409637.13.1779266402224;
        Wed, 20 May 2026 01:40:02 -0700 (PDT)
Received: from [172.20.10.3] ([27.60.134.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb08cde6sm18588546a12.13.2026.05.20.01.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:40:01 -0700 (PDT)
Message-ID: <83ff0d14-1cad-4ca5-a512-05773c36cd8d@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:09:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup
 reglist
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
 <20260518190735.16236-16-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518190735.16236-16-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MiBTYWx0ZWRfX/e+rVq++mffJ
 B4EFGv9/vxr3tV4+Lc23gXU7rGHQyL6SfBHVHdmgrSJgd2L+1AQ7ZCwDTQYJtHMOObhTyKioHq5
 2sSdLSEKC6OlY/vCtJUkyF9FpsEuUK1aScyjJ08zaqwEln5Y8+SWaU+VCSGMWyTt5xo/6H/0c9g
 IECALS3AEhDQ/64VDkdpfeU/3CYtxSLCSCW0VIbad1n9YwM42YPpwlaX69Cm5a2niqxDKxp6Ed2
 O7HB+RdTNY0LE2xaP6flexK4bP6FlZFFYMCQ+s3+I20hgWMF06DT1jVz3MQNuKdKeksPyP1yeYz
 /JorpRx8/Xg/Zfg7MO618SbM5iD1/lV6kMf8x8WXQlgHzTpva8yVgeTHN0NFl2A5U/mOI/frDFX
 Rnijh8Y5Swxu79bAex5yCJTWSnLGYOC1Jj9S0x/5Mmkk64Z/8pMhSn7vrGXdG5P4XLwloXOA0kb
 /V6aQtrQQrgLa0R0+IQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d7363 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Q/5yxSSCruZ1lXPW2Frkag==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=r2EW3oPWh8cgNxWArIsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: s8XU4dWoGz74QFL79oNLxxpUeLyGysiS
X-Proofpoint-ORIG-GUID: s8XU4dWoGz74QFL79oNLxxpUeLyGysiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-108648-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CC4E58A45B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/2026 12:36 AM, Rob Clark wrote:
> This is needed so that SEL reg values are restored on exit from IFPC.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 +++-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
>  3 files changed, 87 insertions(+), 7 deletions(-)
> 

<< snip >>

>  static void
>  a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  			const struct msm_perfcntr_stream *stream)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	enum adreno_pipe pipe = PIPE_NONE;
> +	uint32_t *reglist = NULL;
> +	uint32_t *reglist_sel_start;
> +
> +	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
> +		WARN_ON(!a6xx_gpu->pwrup_reglist_emitted);
> +
> +		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
> +		int off = (2 * lock->ifpc_list_len) +
> +			  (2 * lock->preemption_list_len) +
> +			  (3 * a6xx_gpu->dynamic_sel_reglist_offset);
> +
> +		reglist = (uint32_t *)&lock->regs[0];
> +		reglist += off;
> +		reglist_sel_start = reglist;
> +
> +		/* Clear any previously configured SEL reg entries: */
> +		lock->dynamic_list_len = a6xx_gpu->dynamic_sel_reglist_offset;
> +
> +		/*
> +		 * Ensure CP sees the dynamic_list_len update before we
> +		 * start modifying the SEL entries:
> +		 */
> +		wmb();

dma_wmb() is a lighter barrier and provides the same ordering for memory
writes visible to devices.

> +	}
>  
>  	for (unsigned i = 0; i < stream->nr_groups; i++) {
>  		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
> @@ -2567,17 +2617,15 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  		const struct msm_perfcntr_counter *counter = &group->counters[base];
>  		unsigned nr = group_state->allocated_counters;
> -		OUT_PKT4(ring, counter->select_reg, nr);
> -		for (unsigned c = 0; c < nr; c++)
> -			OUT_RING(ring, group_state->countables[c]);
> +		perfcntr_select(ring, pipe, counter->select_reg,
> +				group_state->countables, nr, &reglist);
>  
>  		for (unsigned s = 0; s < ARRAY_SIZE(counter->slice_select_regs); s++) {
>  			if (!counter->slice_select_regs[s])
>  				break;
>  
> -			OUT_PKT4(ring, counter->slice_select_regs[s], nr);
> -			for (unsigned c = 0; c < nr; c++)
> -				OUT_RING(ring, group_state->countables[c]);
> +			perfcntr_select(ring, pipe, counter->slice_select_regs[s],
> +					group_state->countables, nr, &reglist);
>  		}
>  	}
>  
> @@ -2591,6 +2639,28 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  	OUT_RING(ring, upper_32_bits(rbmemptr(ring, perfcntr_fence)));
>  	OUT_RING(ring, stream->sel_fence);
>  
> +	/*
> +	 * Update the pwrup reglist size before flushing.  Kgsl does a shared-
> +	 * memory spinlock dance with SQE to avoid racing with IFPC exit.  But
> +	 * we can skip that since the ringbuffer programming will be executed
> +	 * by SQE after dynamic reglist size is updated.  So even if we lose
> +	 * the race, the register programming in the rb will overwrite/correct
> +	 * the SEL regs restored by SQE on IFPC exit, before sampling begins.
> +	 */
> +	if (reglist) {
> +		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
> +		unsigned nr_regs = (reglist - reglist_sel_start) / 3;
> +
> +		/*
> +		 * Ensure CP sees updates to the pwrup_reglist before it
> +		 * sees the new (increased) length:
> +		 */
> +		wmb();

Same as above.

-Akhil



