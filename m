Return-Path: <linux-arm-msm+bounces-99597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fc7BKBfwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:55:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F644305FDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D4F310AD26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9C63DE458;
	Tue, 24 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEvWCCKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gka8S0a9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0123DDDCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345708; cv=none; b=SmRjc7E2uSvlyRrxm2RDwy6qI8Z6QQF+aD9g6JSIDRX74/yn3QzLa1msmiLjjrKXoTghh7NOw0B4CrNFs3RPL6e4AOGReCNepOcJenLvXngDedG9OsUg6sJlfENOBo/KpDZ4LF80k73w/kVNWsSLQ4uzdj+oJ5TZZYVs9akR5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345708; c=relaxed/simple;
	bh=iI/S+AUROO2ET41n/oQ7AYFci8kQ/u6iCfmO81T+k3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD/HKjht10sn8BjVka3Expy90zQb4u9mOfW27ArRbAYnk3KOKW/dm6aj66OexK26kExohiMiihhzGuXYQS1BGSA02vSOPUznGgpSHSDM9wUShieozZamrP9b0pWRDBt1aJeja8g6JVAGcepLVBxIX0C0eScwlmP2Pmq6H+nVp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEvWCCKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gka8S0a9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4IIdp1909349
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoKEgoUvUUln+NtcEflV6fUXI9ZyYyiSqPOsjxxTzBs=; b=IEvWCCKY9vy/yuDb
	04ReAzzSAoeErOTGrwCRQpWfp/vUOIUPaz5yuM3yRRUY9j/yGVVCXuc8nZOFQJ26
	T3yyuLo8/QhXeLMpJG+voaM7V0pRsq+7Cg9Hx9G1zJ+gqwxEwEIBXLiIQ3v9hPHH
	U4Iwq0GElfsS9GcQpSgBXTDbg34c0RAuWymODNWqtVVI1F0l8Bo8Wbxue9tFcgBb
	OrO+S7G8mWkXVEZDoP49XlSns707Pp0/E7JoXd1dYO/kSgtTqG+O1sx5nGsu49S4
	Yz9+fPVxVfxUcFDyBOzx/w6zzpxbD8j125hhOYyZE2iCxEmTjfU5FI03/fBxZ95B
	eLyGXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyttt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:48:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c4041so33710601cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345703; x=1774950503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoKEgoUvUUln+NtcEflV6fUXI9ZyYyiSqPOsjxxTzBs=;
        b=Gka8S0a9Kne7ce2MgRccJByyvvT5qq/HB+AMj8ONJuQRa5fdixWTw5FCgVj3dBsqkY
         xdKdO1O83h2Kr3X3KIjowe2ioPEs+3PZd3wqCh2pxgdOFikytDuXHEiGj5fePUWsDCmf
         vBmRj2S/VFX7IRudw1eW2Vp0wPZeglUROzOBbqE51c8lcm0Scqipr88DHCm2z0+VZRhk
         RAWyyIoYXZFiRT/NGN+Jbjd19N5+nKRQwQ/ZE7n0LuxiDHVGRNXS/ZuqNH4LS6Ba0AwF
         V0igyNU4wj4BoxkpmPXTq/eG1fSPf0iOxyxbeGA5m2hKOlRiVhfatKp9NhWMGjko6FDz
         PoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345703; x=1774950503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoKEgoUvUUln+NtcEflV6fUXI9ZyYyiSqPOsjxxTzBs=;
        b=Zkl3alJjVMo4L5LEb1aUBion/zqz9t/mVk+wLJzE59hRgxl2YIjx5wXJAtsAaHVRgs
         P8YA7wjaoBtGU+LqYTGKGrwabriCskF3kqjLOfwuYaIcjhm08aao3gvtcptnDpw3kJEh
         JZNmJnpp0Q2OirH3l4BVmMpItS9xhGt7d0xFPFo4k3WhEqtIPSz6Gcl8XnR1IX+Q00fh
         aaA0VzAzg2BrtCeUdUTX4zc9mgNb/VIfZwP789VWQSVYCym7qi/MAyGFmgHMUnZ9qSQx
         2xbsylcygW1S+H4uwDzpRjrUOh3vBQ4hjDzBpLL9QVFspUwJ6cRFhB//XZpkdkm3wrME
         mLew==
X-Gm-Message-State: AOJu0YzLyr/+oanPaw5WfmZAH3esU3tFD92LJ5g3PhsSWZqD58/e/wlw
	e3KfMvf4abFzFahxvVsxfGkWEBRoa8Ew21/xoeDRPNSBrDSlF15CGCXPahqV6fthFCiSXPV15Mm
	Rog8xloOCP2AHrQXE+joVQai4qkC9iv1MpyWE4cWXBrUDk1flCoLbPMXWnIcbi8jhn4eh
X-Gm-Gg: ATEYQzwx9x/DW/rqSosm9mhpxG3rpu9GoDZTL2h+CAO/VEF7aiUenELvY2JkrDfyb70
	n//5+/ZvvSHL7/MMukuvnclXj4RkwjPAchQGeWGr1+/Vm9fug9gfo6Cw32QsyDu3ktmPbAV4p90
	HhqvjJQIaq8Rkv8ggI0fL8jdkmUndFTk8sRiC7QM2HLgsJfWlEVYIJlRhT0l8iefTf9z0evJnup
	OP/lvgiIb9qAarLb7YSdGj+1bE+NpAV2M7MHZ8bT+jrwfibCWAmuC0IuuKojheUQUxI3wFo6Bzz
	hoUL0CC6YxTlEKyT0nwNLqwNpl50RaZpF84j4fEVh/8v/fcTrHTpI+QQL0zJcjvTvTsqMZeKmLz
	vP1sWkZUOoMNgDWmk7ZVpy2v8jktYbUJbdAfUPeFPEtXQik5PDqE8xyVjcdTUQ5/ZCt8blcz/UU
	EStBE=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr181292351cf.3.1774345703541;
        Tue, 24 Mar 2026 02:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr181292131cf.3.1774345703079;
        Tue, 24 Mar 2026 02:48:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e88sm3096534e87.12.2026.03.24.02.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:48:18 -0700 (PDT)
Message-ID: <b0ce15a6-b2b4-4059-93fd-9b4b0b4360c8@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:48:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] drm/msm/a8xx: Fix the ticks used in submit traces
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
 <20260324-a8xx-gpu-batch2-v1-1-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-1-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OCBTYWx0ZWRfX3T1VkbtQWRzM
 tDbaEhAZ5+kcS4NoPc6I2uIp4yMHec5Zb6vHv7kkMBDSafkwuPa/NxwFI9cT0QKH+c+NLCyx5SF
 JuJ+utVBgE4vZXLAE024xNuQ/4zOtVOHmpLZv6oULOMMMySF+d39GjleUtF46Zu3i7LQv3keOsn
 9Tt9NdPk3Z3/jYB0Tbiy48SxWuIrzI1rNH698GEUV3rIA70t8U3gBVawJHGamIltzXoox0kuoWz
 pxrlvcmpgAXVwH0YfCmkBRmSDQnzQL/GE9M0pWTKu9KgGQ8OoXnDzrzdN3T6tbNcQLDgRVKboHS
 J7nLVl4cMN8oeD2u/IneTJBsoG+KvzJC6Hr12timnzXWgYoYb1w8wO489Ku88JyXjGR6qbxoi42
 ui6nlkG5dV75zfRpZUstSO5U69xbIwTODRe5M1mYrWXW0Lebef69LV9zC+UcUXmT70zKjRas7vf
 VYO5fn4tdbGlGcFUVKQ==
X-Proofpoint-ORIG-GUID: R4oio3hbPwO_jwRyvRnPvYIbldtsrZ0g
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25de8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SuZvJZu2A8V8SJCN6oQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: R4oio3hbPwO_jwRyvRnPvYIbldtsrZ0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99597-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5F644305FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
> register offsets are used in the submit traces instead of A8x offsets.
> To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
> everywhere.
> 
> While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
> counter.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> +static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
> -	*value = read_gmu_ao_counter(a6xx_gpu);
> -
> -	return 0;
> +	return read_gmu_ao_counter(a6xx_gpu);

Can we instead make read_gmu_ao_counter() take a struct msm_gpu * and drop
this wrapper? Other callers also already have a ptr of that type

[...]

> -int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)

Similarly here (also I know this is a static symbol, but keeping an
a8xx_ prefix would be nice

[...]

>  	case MSM_PARAM_TIMESTAMP:
>  		if (adreno_gpu->funcs->get_timestamp) {
> -			int ret;
> -
>  			pm_runtime_get_sync(&gpu->pdev->dev);
> -			ret = adreno_gpu->funcs->get_timestamp(gpu, value);
> +			*value = (uint64_t) adreno_gpu->funcs->get_timestamp(gpu);

"u64", I think checkpathch will also warn about whitespace after a typecast

Konrad

