Return-Path: <linux-arm-msm+bounces-107482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKETAproBGqnQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:09:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EA53ADC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDA2330078BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C57221D596;
	Wed, 13 May 2026 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9sJPLiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+2QfDE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862D2D94A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706584; cv=none; b=T0elfUYJkAKpbnrpPaLcYN/UbXWze508vbGH3EZJ+IF+ks98UKETYvvp43unwrn7mAKpg5jxzeIBWabDi4YDVMEzEAEq/lw3ExdJAAirgmL/SiMbHIfSiRo4mirZDnRbCj7fSBxm21B+dq9ZfNFJD+7FElDAqiKjT5Tl5DFTCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706584; c=relaxed/simple;
	bh=oGGQcoevba4bC/U1LFeILquNG1skms0DgQ1S/v7YPh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7PyqQIbcQx2zEuHNPMKe0Qdn3eS6rQZzYu+mjnQj08cusSxGMGmjS5C7lcW0IOvYxv8kCETpnCEKNxfmGXg6/b+gRS3Wny0XhjagodBHE5cW0U7HW0GSmDcKMHN2cXiIOYBypsRSmrWPdfHoxdi2l3cAluPGrhjG2WTmLCpmRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9sJPLiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+2QfDE1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAvaC2524359
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkhJMB3p3x9g/m7z4wc6rLzCh+cUSNcjou/V/e/uRck=; b=B9sJPLiOytiZis+i
	OD6Ce6a43XJnEe+NBuX6cguSEihH9ZeJNQ7Wd6kQwSIkbpAnC8FkJSqp7Qxuwr0A
	BY74u6GiTGdx2wJJ2Uestj+AIaF8uv0yTVWNmxbDs8V9kcZXR0Oc8Aj12bxndB8N
	aACvfqhYwkxxUap/+OnPoo3VxsSofvwQocrkmKnVHqwIw5gtBtudt3b2HZjG1NU7
	yjZxHIzJ2ci/wTYhJSOwdr5caWDefzjQn5VYjGxZao+68XGM7G49KZ11/qoiU676
	cBrlVFRagE+DHblBk3uY3fdVPdd1avgB1m/qyA23VFm1uFxDcsebZo0I1IYNSGds
	hUplFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjh6ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:09:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso8953942a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778706580; x=1779311380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkhJMB3p3x9g/m7z4wc6rLzCh+cUSNcjou/V/e/uRck=;
        b=h+2QfDE1hy94tiUcafgrBLqsxOmRDc4HWM8CELzECRbD9qYLdqnenT0QGObVaFAdVk
         qjX380Br7mGoRLZgjIH92GOpEKnk9WxL/886oFWHulT6duewqKhLJXvn28VpRxmVvEMm
         BiJO/GxoC7PlsYbB2EWLg1iqMjLsf/ftPtpvJtxBRxDYvw01E+sgUCQRoSIyuNfxuuTw
         i9kiTIx7iMrW/q587BtqdGJ2Xeikq5gc8V2q+qirmQr53LGo2FAD+L9vYrcBT4/BaFsp
         RgCfsjcihCpPAQxHw3lrCTNt0KEFDmGcDjrAdW5Y4KJQ4txeLPsuQe80tFOzT9tHvgl/
         pmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778706580; x=1779311380;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkhJMB3p3x9g/m7z4wc6rLzCh+cUSNcjou/V/e/uRck=;
        b=b1thn7wH/MxdAnS7RIbApralfCTJazPGEZROvYqdjCJQiUX+4PYP8SjPHPtOnBJPyq
         PU3s42kfgoRqKkYUD8ZIH2oIQ/Vp9PGyS66xRWmj40lgKMWcuFqUNVvAjQetizS3Bj1p
         oSTipl82g1f9rFOHaYz3NJozIHlPZ7qLMq0jl6uGqxqFh7InughpOEWio8agu2dEx4CP
         T6GW0uDfSXbXgltCe5MDTiy3rilUj5HFK4Y35N+1EYM5vVVdiFyoY9ESNa10wURZEFKd
         E0TVuqXe8w4vMNAlwL42gW6L9laCwwEp4jO3lWoTaCtAIvoRuBQAWQ0G7QyQQ1igOWOA
         tDhQ==
X-Forwarded-Encrypted: i=1; AFNElJ87lOkDQQi9VfD+qOJo1d+yGNpTsoi5uaGMlX9An3pSah17u4pq8PVfImICluszF4zs3JJXCYyvPp1B8b7X@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgi2UrzCS3PAGQ+yJ5RAePwlqrWl1o7j8DPbMjOeobCAJkTvl
	jcUT3Z0JZd0EAyJCMB2YqP4hm79m2UF1Z/fscqxJiNq0HEFyrY8URCsXEK7LIp9xVsuiOB+gaw5
	ir0audfWgFsFsUNI6so6Sri3+/xXsycKhb4AxHKIMjKiSW82W26FoBP4uBDV620+B2TfZ
X-Gm-Gg: Acq92OF9gaQVOiQIFTzXL7NBXC/GRhNJB6bGiLjafBpn94XEAl178klLsQgi3AYLvaf
	E8PTKW+48nEB97g9DaXs6oNWH9A6dSOmxnUWHTzrW2eW+0+7OdWaWUP6JQ4DsII9f1sooxPq29U
	MfAQ0aCqzuCDrjTP3QleDy7f875vqzUBBSLTiexzqYWuH/c8r6DPfC/DWn70fAau742KOxCWJ8N
	1dw3ewOUPNQhWjcwLh4upFfOAHI2QDTbn8UjisOyW/Xg1uqw0k4AJEsM5AWY2YYeObxRR+OuzKA
	3Q55j3nwtDdBB4efO3Q9cuJy/Q3vCh/T8QBTVSYzBQv1wxTsCB8MldyHcLn8RZs/0oAe7dT8a9K
	GUG63D2mX4AEHejaUv6u0pZ/H/AaTnnm0as0vU01wtV028cwpYlMHy1Y=
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4800524a91.14.1778706580521;
        Wed, 13 May 2026 14:09:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4800494a91.14.1778706580063;
        Wed, 13 May 2026 14:09:40 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf6738bsm4863172a91.8.2026.05.13.14.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 14:09:39 -0700 (PDT)
Message-ID: <f94bebb3-8d33-446c-b9c4-b0c40850aea5@oss.qualcomm.com>
Date: Thu, 14 May 2026 02:39:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 4/5] drm/msm: Always use component model for
 standalone GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-4-6e33e6aa9b4f@oss.qualcomm.com>
 <pbvoyojew67yeo2cr4n7msem242ytlh2qqtrxli2q3tv7e3iao@myqtn5w57paz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <pbvoyojew67yeo2cr4n7msem242ytlh2qqtrxli2q3tv7e3iao@myqtn5w57paz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pFllAJlY9SFjf6X0dpyGKhXYOXHbRVDG
X-Proofpoint-ORIG-GUID: pFllAJlY9SFjf6X0dpyGKhXYOXHbRVDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwOSBTYWx0ZWRfX+BDyWmnHsW/p
 RbPkSZEvhdm8Nvm3jkuVtL27hRUSsrPPGTstZYCUR+Pn7hBeSdgT2fj8hkbf33fUirIv2LUIehx
 We/4SjBWX3ElcS9hxZJQ1fUrCPfXWLUQeGhecXJPgASk04L8oIdXF++R6hjZD5sxS9gSZG9mtjQ
 oZjmtH0yVe/z2OdMMlVgMWzJEZUqwvt5QeceDiihdmFJs7cVVSCs5fzPavO25yu1war5A0e3mt5
 sxDg12ZDqgWeXo3lOvwJswS99aB5Z9AfiZJ8DfoEeEEscG8C3hY+r/39rwGNKfK+ATey3ZJNHzU
 c/l6OcMYeXr6DIl+93bdXkNhTPOBHg23XxNUhR8s2fcygNCOB6g8L0iCCIm9FkvNZfgnUPqy6Dc
 cV0wzOosRljRUfStIVoXV9v0e7YDn7PUAlxLuRSk1d3d9nyhc6cuFPbgf3mhNAryWwqqsuneB+H
 Kir8bj+c2ooVjZsMP2w==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04e895 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nm1BsBjGsf7C+PoY3QnOXg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QCrFGBqe7VSYUZ7klbgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130209
X-Rspamd-Queue-Id: 9E9EA53ADC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107482-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/2026 5:13 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 02:22:59AM +0530, Akhil P Oommen wrote:
>> When separate_gpu_kms=1 (or the device is compatible with "amd,imageon"),
>> msm_gpu_no_components() evaluates true and adreno_probe() bypasses the
>> component framework by calling msm_gpu_probe() directly. In this case,
>> we skip creating components and directly bind the GPU.
>>
>> That shortcut makes it impossible to add a second sibling on the GPU
>> master without introducing ad-hoc plumbing. To prepare for adding the
>> GMU as a peer component on this master, turn the GPU pdev into both a
>> component master and the sole component of itself in this path. A follow
>> up patch will introduce GMU as a component device.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 20 ++++++++++++-----
>>  drivers/gpu/drm/msm/msm_drv.c              | 35 +++++++++++++++++++++++++-----
>>  drivers/gpu/drm/msm/msm_drv.h              |  6 ++---
>>  3 files changed, 45 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 66953e551d86..67686424f3a1 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -271,18 +271,26 @@ static const struct component_ops a3xx_ops = {
>>  
>>  static int adreno_probe(struct platform_device *pdev)
>>  {
>> -	if (msm_gpu_use_separate_drm_dev(pdev))
>> -		return msm_gpu_probe(pdev, &a3xx_ops);
>> +	int ret;
>>  
>> -	return component_add(&pdev->dev, &a3xx_ops);
>> +	if (msm_gpu_use_separate_drm_dev(pdev)) {
>> +		ret = msm_gpu_probe(pdev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = component_add(&pdev->dev, &a3xx_ops);
>> +	if (ret && msm_gpu_use_separate_drm_dev(pdev))
>> +		msm_gpu_remove(pdev);
> 
> What about making it more clear:
> 
> 	if (!msm_gpu_use_separate_drm_dev(pdev))
> 		return component_add(&pdev->dev, &a3xx_ops);
> 
> 	ret = msm_gpu_probe(pdev);
> 	if (ret)
> 		return ret;
> 
> 	ret = component_add(&pdev->dev, &a3xx_ops);
> 
> 	if (ret)
> 		msm_gpu_remove(pdev);
> 
> 	return ret;

Ack. this is more readable.

> 
> However with this patch in place, maybe it's easier to use the main
> msm_drv_probe()? It would need some fixes to handle !kms case as the
> GPU-only, but it looks very similar to your new functions.
>

Agree. Will do this in a separate patch in the next rev.

> 
>> +
>> +	return ret;
>>  }
>>  
>>  static void adreno_remove(struct platform_device *pdev)
>>  {
>> +	component_del(&pdev->dev, &a3xx_ops);
>>  	if (msm_gpu_use_separate_drm_dev(pdev))
>> -		msm_gpu_remove(pdev, &a3xx_ops);
>> -	else
>> -		component_del(&pdev->dev, &a3xx_ops);
>> +		msm_gpu_remove(pdev);
>>  }
>>  
>>  static void adreno_shutdown(struct platform_device *pdev)
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index b61deafd02c3..af5aa7ff6179 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1097,10 +1097,25 @@ int msm_drv_probe(struct device *master_dev,
>>  	return 0;
>>  }
>>  
>> -int msm_gpu_probe(struct platform_device *pdev,
>> -		  const struct component_ops *ops)
>> +static int msm_gpu_drm_bind(struct device *dev)
>> +{
>> +	return msm_drm_init(dev, &msm_gpu_driver, NULL);
> 
> With this patch in place, we can remove the ops argument from
> msm_drm_init() and msm_drm_uninit().

I didn't notice this. Will drop the unused arg. Thanks.

-Akhil.

> 
>> +}
>> +
>> +static void msm_gpu_drm_unbind(struct device *dev)
>> +{
>> +	msm_drm_uninit(dev, NULL);
>> +}
>> +
>> +static const struct component_master_ops msm_gpu_drm_ops = {
>> +	.bind = msm_gpu_drm_bind,
>> +	.unbind = msm_gpu_drm_unbind,
>> +};
>> +
>> +int msm_gpu_probe(struct platform_device *pdev)
>>  {
>>  	struct msm_drm_private *priv;
>> +	struct component_match *match = NULL;
>>  	int ret;
>>  
>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> @@ -1116,13 +1131,21 @@ int msm_gpu_probe(struct platform_device *pdev,
>>  	if (ret)
>>  		return ret;
>>  
>> -	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
>> +	/*
>> +	 * The GPU pdev acts as both the component master and the sole
>> +	 * component (added by adreno_probe()). Future patches add the
>> +	 * GMU node as a second component on this same master.
>> +	 */
>> +	drm_of_component_match_add(&pdev->dev, &match,
>> +				   component_compare_of, pdev->dev.of_node);
>> +
>> +	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
>> +					       match);
>>  }
>>  
>> -void msm_gpu_remove(struct platform_device *pdev,
>> -		    const struct component_ops *ops)
>> +void msm_gpu_remove(struct platform_device *pdev)
>>  {
>> -	msm_drm_uninit(&pdev->dev, ops);
>> +	component_master_del(&pdev->dev, &msm_gpu_drm_ops);
>>  }
>>  
>>  static int __init msm_drm_register(void)
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index 6fcb696ceb7c..6264ff27496f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -544,10 +544,8 @@ extern const struct component_master_ops msm_drm_ops;
>>  int msm_kms_pm_prepare(struct device *dev);
>>  void msm_kms_pm_complete(struct device *dev);
>>  
>> -int msm_gpu_probe(struct platform_device *pdev,
>> -		  const struct component_ops *ops);
>> -void msm_gpu_remove(struct platform_device *pdev,
>> -		    const struct component_ops *ops);
>> +int msm_gpu_probe(struct platform_device *pdev);
>> +void msm_gpu_remove(struct platform_device *pdev);
>>  int msm_drv_probe(struct device *dev,
>>  	int (*kms_init)(struct drm_device *dev),
>>  	struct msm_kms *kms);
>>
>> -- 
>> 2.51.0
>>
> 


