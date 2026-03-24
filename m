Return-Path: <linux-arm-msm+bounces-99598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPXgMwphwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:01:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 363A630619E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0EF63245AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52103DEAF1;
	Tue, 24 Mar 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzCHoPH2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMW/L91i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FE3DE449
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345884; cv=none; b=tmvA7cvuZoCyAyPhRaHA65mCdSOxfg/Qkf4nZw/Np7RNiC41112plgHyjdF6jXMJ+Lje4qgXcTCuQDmKRhU2sfDLuAstkLteZWBKrK3NqG1BsUxGTYbqjM3zyqfdvHf8M/uL5mUO3w0HpoC5FstG+SGBCq6j8/ioL3x6w6NPCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345884; c=relaxed/simple;
	bh=PJdd//Wc6EbL+GSyX3BxvuXT8zmtsHUoR2IXE0iBvbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iagY8NidN9bL3j80WRtYRM9KEyHuuwj8j4T+LgL85FhG18mlarREi0GFupFq8SmoqUWXJBhejUfCJAlZ6uU+y3vsPP0JvMqECC5a6GHYUclFdr3pNx2W1LueMlHs7wa6IjWC344xXtjmo6Hzhohl8rakFys9YbHjYI/dHajHOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzCHoPH2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMW/L91i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9dpUs1762212
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuEm4InrR8PTYNcIHNHYlCNu11l1X/KZ8SAxL2hLrew=; b=HzCHoPH29VN2ts+u
	k8WjvaZLRS2ZtlkgtUapLSP2BXj7Dr/6hSsv8B5rY3PilRil0oj6FVaO9bAPoZMO
	sKSsytQGH35bbwnZrZ4o7qPQMcu3w9PVnemyQuBSIoP+Cm/mmjSQ0CoucFTUjbMI
	Tp6R6TDH/uF1ykEqoUQ/STfgWhiNki0xvsY42pIFH2Go3BNRLft2tKeQVnz3PuOC
	xI0tSpZiNwsN9qppMGEHO3ppiEb0VHBFFI71EY4h4Aev82nDGnKcYWJiCrFHTkB/
	sHnOyfAcS8EBzMYqekhwPpx6+dUvxTpstlRz8VgCmWsEEE7AAWzVEv6FjQZ4I/WF
	MyB8aQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0bw7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:51:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4f6c45a7so32814046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345882; x=1774950682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuEm4InrR8PTYNcIHNHYlCNu11l1X/KZ8SAxL2hLrew=;
        b=AMW/L91innh6b9o+187azJ1n7gTmLZpS7ZxLFvvPLANAGfjmg39lG28Fp1RGUgBs7F
         OyfTBZMk2RyTDtgm8Bq+u/QKZDQkIXcVmRLqA2nuCaK97K7xMcKNdM7gB6mwF5x6i6w/
         MuhT3hJQ9Mkm5k15KGAScd1xpa80Z/eMVNlgs42ovnqJrctZtZGUWia+GxshJZKzTOv1
         MmjMsGte5QxZvh7K97h6L5k0xZJ5jjqNwntZvTWx8zeJGE5Mo+AF2kWpwdngaqDI5eao
         CLqcCQ5o1PJzoac6fCsOVyp/lJbQsGfYe1OXZal8MHOUVQVmlS1q3s3hc7oi/Y2RN0P+
         nsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345882; x=1774950682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuEm4InrR8PTYNcIHNHYlCNu11l1X/KZ8SAxL2hLrew=;
        b=pCUQmnz6dl/8EfGGfzSyGGwEhOzgzwAMCtgv7YCNIcTZe8XxQ83NxyZ8WE+0KNmCmL
         23UFR7xjpoecM38dbLyq5NexcRpNJvmsg+rLym3hpkLxOMAu309ENBZzFaSDMiOTxAMK
         pyUIeCNxbwkoeZPx+LdxuTNSWJ8/QNSoLxJuVUuGN7jU7gvkfeXuJcDInhKy6bWnnu04
         MUMm+YuhV7gYt1uClekaKdxdISqhggJOmVDRp33Ssk7mkE6rqkn3HDeLsqi+saA5Wa1q
         H6kjZvO05ahCpnMlCPbnyFrkWboHoDOiI7f+5fBG9RTNzFaChpqU4PhlBJcW1lY6wgwA
         RmHw==
X-Gm-Message-State: AOJu0YzTJpnACvuMIDcfboPNxo0M51VekXZ1CqhX9CUjpB1pIll9Nm+I
	WT/O8E6AhCh62ry5jbAEnRh3XX0CW2KR4mC3Mlb4iDHhIV+7V4nLWI31148gJsB3vu8HGtPMeLI
	wqIxx27BYhMBDAB8auyTjZhXKwV3zYmN9wRnxqSqJfzKWJUJc3/iLLHqhsf7whlFQf4mn
X-Gm-Gg: ATEYQzxz3jYpi+cLb2oDH76UlyIKkM/+ETIG83fP4mf7lpMAhD9MhSWaDfTnYf6KL52
	dvxhusSHh8CU+U2V9ESqO98NPDRjoIAWPTiWxdSkPosKlJfarFWDVdayJA5laB6LoAV2BKH4rbM
	xidvqqWjXyMZo3/o+c9mtxTDXlKEQWInx+IiFAz1hF+5kQm5lamp7SKkM36dctOiYL/N1DwzYXI
	ohUO6Ih/tn44uAAYiGxWhGDoznlro482wp/cPr67uHqVVONkYT9i22iZMgTPD64JZB/ksg0Ehbw
	hAMzHiKSigcfOpgsjgVp+yK7dH3YlBWOs6NC08eoaccG82Acj86JZnfSleEMDxjcFd4QkyrkR2P
	FLAmbUNl0KqenHQ7xsa2lMqFUwIiBkk1A3Ro39E5tzllH9QBeRInU+sVasf3GF4DqknQ4WNC0lO
	d3nmI=
X-Received: by 2002:a05:6214:5293:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89c85a61351mr217672486d6.5.1774345881890;
        Tue, 24 Mar 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a05:6214:5293:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89c85a61351mr217672196d6.5.1774345881426;
        Tue, 24 Mar 2026 02:51:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43bbbsm626014766b.8.2026.03.24.02.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:51:20 -0700 (PDT)
Message-ID: <deb68834-f384-46d8-81a3-9eff88deaef7@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:51:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] drm/msm/a6xx: Switch to preemption safe AO counter
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
 <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c25e9a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-1Y_YdnrJnI9lEGYafQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: e-QhAtKFPVqBcPN4FqHm0bMEsZ92GyLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfX2hCfyWhThzFU
 Dq+/Ybd6PPOfMw4wkfqXq4jx4rSjH23zeoLIsKYnZ4Fe9XgCEajG4i0Bw8OJdAwafWJybgan6kI
 TAAkrc8pvbG4+9Tsb6Y7QByuszICxh7fxojbRm8iCeyYC/isaZ4qJP331qGlimKl0cQMBTPAnn2
 ugoI2r6K1qnEYDTYTjZnOcRLZ/SyHrM4ObqXyynzUTh/W90JScqk87ocZ7qgpbyk8JLMfT2PlmZ
 nIzivXINu4kBdQPGGxxfqQ7NoN3aqWj5OU9I1isyb1UW7MHgg9JrjbtoAKqf1j+jPpCP5qIBzVJ
 Ea3iaQBbx945nIsrL4ZN5Q4T0otwpKY5Ht5sZRxwp3VhRGCAOg5Tf9I/5CiV/8eX5YiPKPGn/WC
 PBJApRSWdNff5ZY/CHPfOZ47mO9TMZaukZNGrz8fDHqmYJulAy/b7ySeQdJ2nwH/3FHEPPVch4i
 0k9yw0evvpkM3eyVdfA==
X-Proofpoint-GUID: e-QhAtKFPVqBcPN4FqHm0bMEsZ92GyLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99598-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 363A630619E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
> provide accurate data about the 'submit' when preemption is enabled.
> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
> 
> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 14d5b5e266f7..93bf2c40bfb9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -345,7 +345,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	 * GPU registers so we need to add 0x1a800 to the register value on A630
>  	 * to get the right value from PM4.
>  	 */
> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>  		rbmemptr_stats(ring, index, alwayson_start));
>  
>  	/* Invalidate CCU depth and color */
> @@ -386,7 +386,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>  		rbmemptr_stats(ring, index, cpcycles_end));
> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>  		rbmemptr_stats(ring, index, alwayson_end));
>  
>  	/* Write the fence to the scratch register */
> @@ -478,10 +478,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	if (adreno_is_a8xx(adreno_gpu)) {
>  		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
> -		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
> +		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT;

I'm a little worried about mixing the names here - KGSL uses both of
these registers (A6XX_KERNEL_PROFILE vs A6XX_KERNEL_PROFILE_CONTEXT)
to track different fields of the struct adreno_drawobj_profile_entry

Konrad

