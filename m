Return-Path: <linux-arm-msm+bounces-100159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gESqIj+UxWmq/gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 21:17:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CD33B546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 21:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D43C6305DA6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3032C399352;
	Thu, 26 Mar 2026 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E47JHlGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGfNcK+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E518F39A7FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555965; cv=none; b=HvF6DUAs0pw7satYmqmfKddn9bKZ+Fto7odIT1nOCM01BD+pRYHdE0vH7q1YyPpepdRK94ckdiyoboy858AYneHe0Nbkv/2wIobH9YJ8V1YlhqaAEcvCocvq/loQRIXEC2DEKAog5nJmuxpbZUuYn2h1ewBNFiOwegUH9VbcIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555965; c=relaxed/simple;
	bh=7lj/ANPVX16smGGnIA1Tr+YVtvsuhO0D0GA9kL+w8d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOaUeTZwcbngzy6PeDW5PdkF3TQfn/IbpldemWrUckCZ9Spy/6PVkZdyFb2ZHw6ESQ+3x6g9EI9hplLefXPxvDg3LJgWSawNZwR9M6gtuSTZ0wAAsCAL54pw+mOe0L2f4yNGzOrWmJV0VLPzPwdKa2CPgEtAOk1ZCgmVhdWfnSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E47JHlGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGfNcK+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9hl3789806
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXRlhBV1u+N2Q2EAkpUy5Y7mrQx6fLfQQhyX/geIzcU=; b=E47JHlGlcwGJgZmZ
	ewOwhKuCXPRAM5U/J6TTPPSiUXhRSt0+WV1Ql7gsLcpOsUNYN42WdbaHlisoXqQZ
	qnX1dUsvdVRp1P2RJGBq8hqdgqVWmD2y6gFid8NlgFirTOvvVX2xFWhwqWN2akMf
	yjEtcYGG1qo8AxhOPjdBh/B34veXLpMTxc3eCGtYtRHCWgrQUvrFh/oQb9ZTvFdX
	MtabLkGZ193Jyy1GsxVVXQfrLeP41NyYiJg1W42DSMVKVBmN92pKau+6PHVJtKqZ
	w85p4JfswQGiUOw6WEQKLoPFbfAX8sFqDL6UZPqsykzhPsTWkKfXmoMlN/8R7ku9
	1R6kSA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqhx9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so1619052a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774555963; x=1775160763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXRlhBV1u+N2Q2EAkpUy5Y7mrQx6fLfQQhyX/geIzcU=;
        b=XGfNcK+EBw216sBuOKy6yecKXfFORRl8CGOCsxOThubl6mG2QpLvdKEWbMbxJ2hm1V
         iUoD7UHduD/ZWTxfB115j1gQDEhJoFUIE81eNCRq7DJsdjCh7KgZ+dAerjMn6TKlwP9a
         PiIRd0CqnCNuhPjNe4haqq0SNq0o2qCuRMmMyxVWv2Q5T1z/WLFzDm8PlRnSJ70UlBqJ
         PbwymPAy8acD3JXJh8kGtM0lwYyiPMEACnikxVUPShC+DT9+trhfRWS3pTiu9MWOEQFC
         /7qtj/m2WmiGU2x7Sr7tUyw2J6EsS8JajglFAzWw968vnDAk/Co/oRoZTkRbUMT0BACN
         aUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555963; x=1775160763;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXRlhBV1u+N2Q2EAkpUy5Y7mrQx6fLfQQhyX/geIzcU=;
        b=cLSs3wo01J5QFuZdUa04uA8BzuU12Tc20+vGCtXzRFTbV4GfidV+AMhVB/dUjF+LCE
         x1q+8KgIqWQuxY16gEdZoYsghezIYU7C+RcoXS7ADJJWv4QOqHz60b8KyxtIhEG9A5Cm
         avdjGe2hEWzL7IxjRhEtAmpPRyVuwQkJOoQI7kqLpfPSTNFFHeXK2kwz6ioZ37bgYCVM
         1h3tH9aUCeBqcg3/1eKt8sHGKNFhdUVyqx1DZpI+iYJdQ7sx19mtNt8kpADvD1m15pgI
         rT20YkAraYSmGZxC9WhwD/Ea4X4e3PvTgOvKFav8aPORDJa9TNcyDnj6y8PyvtbmSC7i
         Lrlg==
X-Gm-Message-State: AOJu0YySIWkhwr0WR7uqZ8V6/Bd/YY6NBzvVzHjJsgbx8+dz2aIFek/J
	U35JJjYexfY/e/CaqpDr+z/EbF7EOWlmyjvyrzPJPu+Fe5XhzMxKgRWBjze13XeTFKesf2f4Xlm
	p2PUMLVXsX+CpyjfNYBmVDhOyPeVogmYP243K/+cC5g2Hm2VLTBzuf/LVKVAlWeqYGea9
X-Gm-Gg: ATEYQzz0XhH9PVviZOOtD7uKnmq1RHTf9IO+TF6zzb1kKcYW0k4UZTAEt/d8S/5q5j0
	7lW3M8v8oeUKVO+rVIEofArYivXjdp85aGvcnRWphSNt53k+bOfUff9hx76RhMVEWAnkTOqhJZ1
	14whMM3LKQXgWsAvhCcZ14dL9a2KHwhuus2VQ/+9IHe9ziif1IZs1DCAa1gFqwBLG+KS1hMvb1i
	JZjPlMyeNFVif8Btq/GT1vLtd88nmV9X18hinftsL3Nx6pDbULhAkuBVKXi5Pn+b65FriPnrgOn
	cX5qrPrYp880UEIYmGK0jk/IhN6C6pqKq28hGnNxwcw8hVOdHpGAAghQlzpwWx/3/6iDFwqrisJ
	q7AgKXR2p8834z0kskYJ318wTMY5Pfw8z4DbgAcPPFCwt
X-Received: by 2002:a17:90b:3906:b0:35b:e4d7:53f0 with SMTP id 98e67ed59e1d1-35c0ddc19e1mr7943948a91.32.1774555962543;
        Thu, 26 Mar 2026 13:12:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:35b:e4d7:53f0 with SMTP id 98e67ed59e1d1-35c0ddc19e1mr7943935a91.32.1774555962069;
        Thu, 26 Mar 2026 13:12:42 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ebe2c98sm44495a91.6.2026.03.26.13.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 13:12:41 -0700 (PDT)
Message-ID: <92acb4e9-91ba-4a91-9007-17cfaa1c6097@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 01:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] drm/msm/a8xx: Preemption support for A840
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-14-fc95b8d9c017@oss.qualcomm.com>
 <3a71adbc-b06c-4c04-b539-abb56e4b1c6d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3a71adbc-b06c-4c04-b539-abb56e4b1c6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE0NSBTYWx0ZWRfX5yJVHGKPTn48
 zm7blXer09/f3he6/M2UVV5lSejq+YgLSncytnDe7IJnp6NsTo1pnz2YLqFD81u2gjlkgEe/3JI
 eygLQGOclNWaWxboTKOW8dwtRpOAwLk/AwAYPhcapYcuDMcmw08ee3bgzUz5JlRwgIpJiiLSQzi
 5h74yLORjW8ScHxpFfjBHJo3TAsOidK0RwnUs3Q+x6+HBRoPQfA1OPKokejwUaBHmZCDZwxhMqJ
 2U45BaCf7HNaDNh9Ij9pD5tXVejiWwe4lbRKPaUJjQh7Y83xwyCXMdpdHGL4Pko3c/346A+CCTC
 PVK0m7fhYpYREPNwgD+ji8VT5HPUS7ADr9iKZEhK1tL/E2G92pC8ecQYM40+brg1jAMgMXMu7dE
 RWbVp9xL4mdu1h1ruBUBqbHN+XxuzqiHkjaCcoiVgDrAsuHQbmQsd60NU/Rogb+rqrDjZPdocYe
 ktAEJem/Hxj1B8n/kDw==
X-Proofpoint-GUID: SmQ3sjFemv6mO3ujH2FMqKsqm_vDL2Lu
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5933b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vQjnIgnGPh3RF3IfkbUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: SmQ3sjFemv6mO3ujH2FMqKsqm_vDL2Lu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE1CD33B546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:48 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> The programing sequence related to preemption is unchanged from A7x. But
>> there is some code churn due to register shuffling in A8x. So, split out
>> the common code into a header file for code sharing and add/update
>> additional changes required to support preemption feature on A8x GPUs.
>>
>> Finally, enable the preemption quirk in A840's catalog to enable this
>> feature.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/* ... and after*/
> 
> ultra nit: space before comment end marker, please
> 
> [...]
> 
>> +static int a8xx_preempt_start(struct msm_gpu *gpu)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct msm_ringbuffer *ring = gpu->rb[0];
>> +
>> +	if (gpu->nr_rings <= 1)
> 
> Can this ever be < 1?

This is just copy-paste from a7xx_preempt_start().

> 
> 
>> +static void a8xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
> 
> Are we going to have any a8xx+gmuwrapper?

We can remove that check.

-Akhil.
> 
> Konrad


