Return-Path: <linux-arm-msm+bounces-101116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DoYBXwOzGmHNwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522436FC81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A613A30D02C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5C144CF34;
	Tue, 31 Mar 2026 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOdAcj/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaR5eutK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430464418DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980346; cv=none; b=gSIqITRYj7Fot3qXfxSK3aLavbiv0f79Z4vQTy8z0E18vgBSjbSEY3IBLP+AJD9usLOUuiQ6D3mEnaCj00nEHwt/2r4f4rCVL1ILMapdbsRMVShACgV2QdhYiFx2dR8NXwgJpnvvZEfw2QS5+Q39fXOGxkBQj0dQMuANf8PuWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980346; c=relaxed/simple;
	bh=975Qahn3t9M4ae4+XCsicE/xGI/wuAE+TXTHkp5X9dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEhYZsGc3+Oxz6XjPBazgxtPR9pGNYdj5sTzvTShxk1RX7e51CyVTEFuRVEauanKs5iJvHgwClvIO8743WG98WgD5TcAEAuGrYhUjRIZq40pWnR91skreFDBk082EM/h3yLMfjgJ+AN4JeFqn3eGGRD0yiKQmEojWWxo7ATokO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOdAcj/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaR5eutK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdjre1056471
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USrClDURSIOj2yOjY9ZTvHl5/K/quYC1V/gXkY+Qda4=; b=iOdAcj/DtzTfqhEF
	SQJo8FB8jMRwjj3uCccpI9H6tb4YGhvQ2UHThzh8awmPgkpV5duIsPYauhKzipXX
	iGUlOLp2biOFsfcvQsMXjn53poeRixNAX76ZJ7aMYgwHc3Od/8mjAblhx4Iqj/jo
	YtnmGN5y9dvjOKzbwbMKg+oPB+IjgXPTH2C7ouJx2vbaQnR+R9woTF5GLxiHx6EM
	4zq5Pj4gk8VbW/bqTLzvUk3B+b4l0YUctIRw50CEYkOB+x3DL5EHDQNj7jW/ffPk
	2pBPH61NDuOTiBNggouHZNBp3DzN9J01zGGBnY3bxA4sJTh0Xd+dsxfOgY6DAyuD
	Gx4oYg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hevpdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:05:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so447389a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980337; x=1775585137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USrClDURSIOj2yOjY9ZTvHl5/K/quYC1V/gXkY+Qda4=;
        b=RaR5eutKZPvKGVjVKFAndwthAbAy6V2TNPxcc0wUh4aHBDg3Ia9wre8yYGWDLJcvdH
         lxZQVA2ybhwCvOEDd5GDO4L37h+NX2/dyz515oJqdGVRSEX0AxAyhKq+7vkDf0riTDeF
         IgVDUUC8cspa6p9ftKEyUPIgQUK3q1qRnpJAzcNwBrgVB+G9pbnbrQkDWX5P+/jfB94B
         X62eptVs40pBRgdecjxDF6QFAB6G8duPJsZGuuz9xt5u4gIUWhnMxby/CdW3fQoOcBNI
         GgA20N9VAU9Ah43+FQseZRoCtsQxqX+VZFgjPsdG0c00tEeg709YQyEBtcjAymGY4WJ1
         OSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980337; x=1775585137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USrClDURSIOj2yOjY9ZTvHl5/K/quYC1V/gXkY+Qda4=;
        b=D3p9HUlq8hOXYOYR5s3TmJ3NLMFeT2M4o3PCEkNrBQVER9luW80eeYiGyfh7RBjVLF
         X78dxalds3lTaVCZuttddgns+iUgmkxC/Q1qtBfR85fv4G//8mFtsPgsowOmrErHY37/
         ndNwX4Udnp+OEGHv+n6lDFVj+nRxkKgQMZzTJ9pe0GJF3hEMDHy+09Xrkb8vpkl7+HKg
         xvfBGWfmh9TC4o/hsMGw5slLYN0kQirBv24SfJNmky67gLEzLL5nZ+QkTSeLcAn8tmhk
         gDMDx1Tu2dWfgZzFPPyM5jf+rGu89bFT3SaAIGhSQkNTxl6bFFZMSyJQvEO+XfZznXyO
         JGWg==
X-Forwarded-Encrypted: i=1; AJvYcCUlxbgO5G57L4qLzGtKc5SHc9j4HR6//Obcls+BKtEDyarka4dwkSQKwc5sXtqmN+6dF7zYgU+tFYQajyWx@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbsAbqenvJbjevhD4UZ5Zk7dV2ZZVZnzbcnmY+waPyvgdjZ4d
	j+v1ssk5iGte4KHUCT9Rd/hTEPoqbFKwXfUqZ2alGGUkqtLsY0GkIF+dtHUZwMxjQnsA3ER0B+L
	WPlLX8NkTMSgBQd5b4gUbB8KxF8n32q+MYlq0G00kFoK4dkANK2zDtllYKRYYsi+UaCpf
X-Gm-Gg: ATEYQzys+N2d4WlDX4YsteSKkX7bvpBL/TOOhmfwvsD6RfHVuwIpa4pY4p9qW3hXzx/
	lGa+oO6XNgKWZDBsUh2y4zh4nghTExJc7n3rcRunV9UINGb91LLu6+obmFB4Smm3MuAn9F2cn0P
	KdKvwUCrKDJkAg1ZGbvvj8OOTC434e4MtmQ0y1bi+MvBdyEssIOQeQr71Ybt0vVxgyADNOOXTSo
	zxfGy/S23JdK+NxyYefQr3eCHBWdOqTL5wscv9TntivpCYygFGca8x9spomJ6Ln5llhaMAU6kxB
	Cu5H1DhZc/xQdne6NtrThGrm7OqdU7koejNN55+FjBi/XsVMBPftozB4ID+GG/x90jOf9vCcMAT
	TfhaJpw4vMdI4nasllLp8+IiKsHZtQiUxj3O2CQQqKqk/
X-Received: by 2002:a05:6a21:6da2:b0:39b:da83:91a3 with SMTP id adf61e73a8af0-39ef774a085mr250667637.50.1774980337160;
        Tue, 31 Mar 2026 11:05:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da2:b0:39b:da83:91a3 with SMTP id adf61e73a8af0-39ef774a085mr250607637.50.1774980336469;
        Tue, 31 Mar 2026 11:05:36 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.233.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm10964512b3a.50.2026.03.31.11.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:05:36 -0700 (PDT)
Message-ID: <720bf565-342c-45b1-b797-3e27a7e9bb56@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init
 failures
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
 <CACSVV01RxTce4qEkt=vPb8AmPSuTLVTh5DR5gCAP2n3U3vkDqw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01RxTce4qEkt=vPb8AmPSuTLVTh5DR5gCAP2n3U3vkDqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cc0cf2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=LIJ1G+IszuYCLGPi0MaIKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mYQd18i7ClW-Y3202ycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UOoFxgwLGOb04S5ege1TpBc23-ieochy
X-Proofpoint-ORIG-GUID: UOoFxgwLGOb04S5ege1TpBc23-ieochy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3NCBTYWx0ZWRfX/T1+iJlCB5Tn
 GLr2ekju5+6kktMVGl4OQ0y4Pb2IZZ8gxciuEOIKgBsLH92hmo6/Ghur5C1Bn++E4+JoDoXA6fv
 DFAMYzhfBkZljVKN2er58WgiuyzMOugkDfmUhCfldlGyfyPLU3S5HwoU56j2jl+TEwXqV3XC3q4
 1FJPrkn3SIOxeSVO3JSR1pSzTkk+xW4v+61Qm9V6MQmrCUbARwp3tbHr35x25px4cJ7lDntKodM
 PQZdxZiLFPUiKlcciK3BENL07dFaWsiClLEQgmz1qlIaUvKFQZsggPJmn8LnZp0EXotx4Ot7fUE
 3IP+i7FQ2gI3MXci+XMAIlNa5pf3Ev7i27lvgxXFishWiJnE1mxhPS/uw/uBfRdHrPk7LdFD+V1
 ZyYCUsPuwYGjVnw58YLWwCeR5VMovYu9S6twVBzPkRWGL7s306lZguUgCM6PAzZ7tVlGe5iruyj
 5i62QIxKJLRwm7CWqFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8522436FC81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/2026 1:21 AM, Rob Clark wrote:
> On Thu, Mar 26, 2026 at 5:15 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> Capture coredump on GPU or GMU errors during initialization to help in
>> debugging the issues. To be consistent with the locks while calling
>> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
>> msm_gpu->lock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 5 ++++-
>>  drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
>>  drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
>>  5 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 1b44b9e21ad8..916c5d99c4d1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1335,6 +1335,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>
>>  disable_irq:
>>         disable_irq(gmu->gmu_irq);
>> +       msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>>         a6xx_rpmh_stop(gmu);
>>  disable_clk:
>>         clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 4edfe80c5be7..ca5f96e16870 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -105,6 +105,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>>          */
>>         pm_runtime_enable(&pdev->dev);
>>
>> +       guard(mutex)(&gpu->lock);
> 
> so, I am a fan of guard(), but I realized this means we are holding
> gpu->lock across the debugfs_init() (only a5xx).. which I suspect will
> anger lockdep, although I don't have a good way to test that atm.

Shall we drop this patch for now? I will send a respin later.

-Akhil.

> 
> BR,
> -R
> 
>> +
>>         ret = pm_runtime_get_sync(&pdev->dev);
>>         if (ret < 0) {
>>                 pm_runtime_put_noidle(&pdev->dev);
>> @@ -112,10 +114,9 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>>                 goto err_disable_rpm;
>>         }
>>
>> -       mutex_lock(&gpu->lock);
>>         ret = msm_gpu_hw_init(gpu);
>> -       mutex_unlock(&gpu->lock);
>>         if (ret) {
>> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>>                 DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", ret);
>>                 goto err_put_rpm;
>>         }
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 785e99fb5bd5..8475802fdde2 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>>                 return 0;
>>         case MSM_PARAM_TIMESTAMP:
>>                 if (adreno_gpu->funcs->get_timestamp) {
>> +                       mutex_lock(&gpu->lock);
>>                         pm_runtime_get_sync(&gpu->pdev->dev);
>> +
>>                         *value = adreno_gpu->funcs->get_timestamp(gpu);
>> -                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
>>
>> +                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
>> +                       mutex_unlock(&gpu->lock);
>>                         return 0;
>>                 }
>>                 return -EINVAL;
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 995549d0bbbc..472db2c916f9 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -361,7 +361,7 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
>>         mutex_unlock(&vm->mmu_lock);
>>  }
>>
>> -static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>>                 struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
>>                 char *comm, char *cmd)
>>  {
>> @@ -886,7 +886,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>
>>         pm_runtime_get_sync(&gpu->pdev->dev);
>>
>> -       msm_gpu_hw_init(gpu);
>> +       if (msm_gpu_hw_init(gpu))
>> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>>
>>         submit->seqno = submit->hw_fence->seqno;
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>> index 666cf499b7ec..eb5b3a7b81f9 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -747,6 +747,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
>>  }
>>
>>  void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
>> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>> +               struct msm_gpu_fault_info *fault_info, char *comm, char *cmd);
>>
>>  /*
>>   * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
>>
>> --
>> 2.51.0
>>


