Return-Path: <linux-arm-msm+bounces-99606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAIAMKxmwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:25:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C9306688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7352631289C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0198035A939;
	Tue, 24 Mar 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0sF4b5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OovwyEhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7C3B3887
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347517; cv=none; b=oEo3SRmgM9KTTgIpiiv1i4O6DQbCxmBRHd/qnWSKp1UGcEDOJ2W8XbHDWZEqmekRgb+6yGvM7lIniPs/eR0iJ8Vqkqa/0FeWpn+tNFaGSUsXeyyYHcHqVs4lMOJyQhAMZF+vWVeoeEJZYQJJhb5WM9g97AHG2ZaqXt9y1jIrKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347517; c=relaxed/simple;
	bh=ziscFTAsuTFLHWmROa237NqXWQXtQahkZxOmtY9KmrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpuwL9AOTPgM6WJSdHUQWatFYc8JAUNI0sL7KWu+EIO3U5OS76sEwtxhm3GeS3WmHUPuxi5+Heohv/XpVwkpHYVnrB2DA+jYd+urAtlxqNdw8d8K+vwZ/cB4jBs64hcL8Cz28etp1f0aqmWlRmAn4BAaOpAO7sHKWhUKGlRNPYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0sF4b5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OovwyEhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA3eJZ890729
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPnI1qz4JmkBX498CrBWzlzsexCfiYIj7F62cjd2QS8=; b=i0sF4b5Bd5Q2u2/G
	6Nf+7F3BWhGAx9S+XYEqluz3vVGkL4ea84c/VHzWf4onrQVwORSie8sMayeQg8Ei
	ZrC8mExhbrkEbUANs/WdsM8+o5TT7S/6IJtPe+DGhcF5RRigabZDHGlZ8mf+x/1s
	xArN5Y9dHaybq7vdmHnaswQWDQbdTfKGSjm9K3tbDi3bXtS+2XUqp+R+nPh3L6VJ
	kbTKT0rawrDoCVLR6/2ILuheEY4o2ttOYhC5QwFTNi9fDP0u/zfl8vE2SVW3Dzup
	54kFdM7kLVcm4ABFaQWO4L5gkLhR/99IrZmLI3kDOVld13kdx8AoJwr/9enhsinS
	zHdWjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x9bkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:18:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so41520831cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774347515; x=1774952315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MPnI1qz4JmkBX498CrBWzlzsexCfiYIj7F62cjd2QS8=;
        b=OovwyEhUMlBBc8XKZYLFoDNPCcJ6AOHB5sOYQDjdlHxdTI11nSNT3B8m4raHarMF7B
         hN0cEqFaVSI2KlsjVWVNVqs8vTGVCPKg3HDkBcSB9R0mT0eKwnJ8kibf/RPf+U/YLSul
         w7LF3wYfumabEvHgTq2Y2NzMf4wT1tCpTGKfc3Brg79TSIP6c2n5PcDOQhRKb7AoZzrP
         onF26t2WYpjMDvCWEZc0/1A/wRA6WF9Ee/FpLlmk8f1k2e6QFRLNPx4NLho/y8Pk+lSg
         VmyrDP8mLA/zNtnZkD1pqqF0sv5UjfVD0jvhYqWsv9vRlTXhoqc5IMXiXhk9oeKhYmmu
         BSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347515; x=1774952315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPnI1qz4JmkBX498CrBWzlzsexCfiYIj7F62cjd2QS8=;
        b=iv4WKr8znZkZ3aPYPIY3tMTavYyLdA6XsPPMet6BWsmmz6HTJnJ0aAaVJog+84T30U
         t7S1A2LS3TYvC7bWfs/MsnOTKp7dFqamVh+k2xmWUCgrvs9r5cVsgAn2AfY4twG97wbW
         YXRhcwkr0FsflOyTYMLc4ymCwnFNOLizO6fl+bhV8pENUfBoN06Ylzfd/Ngq8Df8QSCZ
         J+Pewu0tWq6xLmkr0sG4/Vr7iYHNmzEvkDElqSL9foS5FAQ5adwOszhHSPT7PPX2zKad
         9THoTnYEBJwS50gki7h4ht9cP8iGq73xDMM1GE89iVq8XZ4nXFj+H6rsapSRDcTpwAA3
         4Ngg==
X-Gm-Message-State: AOJu0YyvL+LJIn67K1w4f9D1sST53WjwpeuWcG5RERao0DA/CpFMDzhl
	VxdBQ+OciQUSni1jXBQD8iRQLJJApWva9HXBIq8bNpQoF77L9KSBqXE+OTUxmNLpwttZHs1jCsX
	70CwvZe+mVE3SAKs30dNkcYXYGo9lAbfzrFLmzTQe7KrJbBiC/9WoGgcWwucV3P+B+BAZ
X-Gm-Gg: ATEYQzwmvtEDrd25chIoumwsvDLNKQJ9Xi++eT+S69FVBNzWyCrqYZJEs402Eojj8qf
	AR6jYAc9PRXTaRz/nCQMmeEX6Qqx25dFNVCtAv+AguUt5pSodt9/wRaNEQQMdNgxzSPsY0qGsya
	cuzNRi7dpoHgu6P9pFkFXDSa7f4Muth6IY9Khv7lBWmKH/D0pz1R8BS2ZJTgsFHOlnoqg4an9e0
	4C17xJ9HuJB3xvFSH7VvpOcU8I5LmfCJAUJplbr1JRA+709i064g9ASPhPKMCxR7ul12NSFz4co
	1tZJtO+nG2AJ7phSXq611G2QatZmF0xEeo2cl2Jmt3FwYLrrjhMijINLKQJVU+AlrPuMGHsb1mv
	ndktijZdMfLWwe26gBoRKWfh1uYSs6YQL7wjKvOMyoBQzFjk0zPWKFDMatG82St/X3fA0eZ+s6+
	QHYvI=
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr177154261cf.0.1774347515007;
        Tue, 24 Mar 2026 03:18:35 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr177153911cf.0.1774347514588;
        Tue, 24 Mar 2026 03:18:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm615146366b.3.2026.03.24.03.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:18:33 -0700 (PDT)
Message-ID: <3a71adbc-b06c-4c04-b539-abb56e4b1c6d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:18:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] drm/msm/a8xx: Preemption support for A840
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-14-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-14-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MiBTYWx0ZWRfX+NuYVei/9zEU
 Rofy8tkhZpcbMpDYMGwXTuyOrdPB/J5DyFGS5FJkR/80EdT/bXN7Ht7QU63bXFMdK/vUwHMXGYj
 eUaFOmLZK4vn5jw8MPv8QfryzyVDaOoPz/7N6sgh7Ytk3DzN7mbmWUIxX9Yk61j+mspvZWy10Tt
 bVC0Us+KJ82S9i8YAL4xgug+0sNJ/qe1kKx7fPiT7ZFVdM8z7CRdCauZ9X5kJVjGXp1snZ3Cvyw
 NueKpxX2Z5YoCJgF9h4NPHNklzd5FWrNv/bRwDEMx3sOsM4aCUhE9TruWOCuGnomOHTkH5CmANO
 WRIlsxN0UzRfv8OA0jjDSI5SBgpE21TwMq/hVRsUW9y48fZH6OXn+JxqcZqHNdRvKS16hkmeBB3
 oKptAjSJGZHNZ6+B01cKPXmcft81aY5PA7QKeR5SDuNRVycVFOfRL4wY4cFv8jNmibjoH0+u06c
 J+oQzA1h8PLLj8X61TA==
X-Proofpoint-ORIG-GUID: tsDcTiXirS1Qrs1SSU2xH07zaV-ZnWUT
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c264fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=n4QsoBDMxz4R0sOL5fcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tsDcTiXirS1Qrs1SSU2xH07zaV-ZnWUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99606-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 215C9306688
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> The programing sequence related to preemption is unchanged from A7x. But
> there is some code churn due to register shuffling in A8x. So, split out
> the common code into a header file for code sharing and add/update
> additional changes required to support preemption feature on A8x GPUs.
> 
> Finally, enable the preemption quirk in A840's catalog to enable this
> feature.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/* ... and after*/

ultra nit: space before comment end marker, please

[...]

> +static int a8xx_preempt_start(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct msm_ringbuffer *ring = gpu->rb[0];
> +
> +	if (gpu->nr_rings <= 1)

Can this ever be < 1?


> +static void a8xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;

Are we going to have any a8xx+gmuwrapper?

Konrad

