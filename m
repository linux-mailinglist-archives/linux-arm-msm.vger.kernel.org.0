Return-Path: <linux-arm-msm+bounces-98031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOc3BmtuuGn5dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:56:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5372A071D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82A2630557F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DD435AC35;
	Mon, 16 Mar 2026 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqCS0vSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/1KgHuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52A2FFDE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694495; cv=none; b=jniTyJSA/TMR+0sX4UEv5Fy/SQ7y05dzPtwCJsPNcn5lFPh5Sf448cbmH+UFrdRxlvc6OlK+hIHgW7N3RZ6ioPx4pAkLcXitW5uU3lilAYK7lJFDExSjtpjF+B0OKkhSrz6P78dXcKMTCsAg1r7gJ6WRqMpKPYP+P8ToDgE5zV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694495; c=relaxed/simple;
	bh=4KRiweGLXxpGd1Bat+MwMPGxqS78TlSHqKE8E8sAtb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy0ProbqK9rQAD5LUQCbQc26BoZGK7YI1L5/IPia0B2ra/Do/h4abQsLCJOaopABAoZebYZuGGEl3uKUX22DzBweR6TeLoBImwSVpyODdSRCzRwtvxrG3L9wniVuV3mEc9dts+iEqqvtIvR7/PoXSlGVBnqJQDETdJ/FtyzjNLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqCS0vSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/1KgHuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6QPa4022256
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIPRW9ojG6PosnLQMZvCH1qVnkK0dNhAcHrugDb3mb4=; b=iqCS0vSFgvA95inI
	FDkdY8rpRTOm38K0Q/aNEVo+HRhDTGcu0lBX6P0GmFNN/Fc4pPRjuY5MgiWsacq6
	eEXzcu+ATLUp7LnrxwtT7yxq66Ew7SvFGjfQbZEi0qzbY9+NcKHx/NNWGFQJPj0B
	w6mVFRiGQlF5wswRcztc/U3dIw68FaBu7aIqHYfW20Vws3ld3as6+XUxp/8vVenW
	qIj9UG4fMUpR5cd+4T7qojAenMbQN9R9XC+7dpGdk6/dRoKI982H+kMci8W020ao
	hTdfZGkD/HmjpMK/tOJsCw+t7LpqwCcfcdU0PRZ6DPpyPmRBj9fM9tAcnkLSfIT+
	66JaKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fgwnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:54:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b060c14ccbso41319285ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773694492; x=1774299292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIPRW9ojG6PosnLQMZvCH1qVnkK0dNhAcHrugDb3mb4=;
        b=h/1KgHuws9L5kp3rcfR2IwsBDIpZGgqoVQMK2H0qlrEGBXWcvs6SQ5YSGiHtpJIpQ/
         iQAojKCh2PZ8HEVkj+28EI649IwBI+ZZdh53V7pGXPpJuWn3ar+pQDTfIbAGeRDNpBBC
         aH0rwR8rJ+OpXmF/TZ/SmDEJIvfPZuF5SfHoPYEHLX7vS8YmD8eC+1iHWrlB/y/rcqA+
         M7zF1CeG0qsFmrkr+Nl4xx9s2eLfLp4WxlMkO56oft/DrTtEjPN3O63wZcaXaUAUR20C
         3jd/lIsG59Mq6WpdzC6z3MVOm2k0FD+NUBL8wUZQJ6gnYRndYWaPedkkJl7xJN0qcv1k
         83SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694492; x=1774299292;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIPRW9ojG6PosnLQMZvCH1qVnkK0dNhAcHrugDb3mb4=;
        b=izfPJkeyaRwn+icl5+Ta/o8llaMB5r5UAWLX+8nqOKSuqZhV2T7S/bsrm1sg/anVP0
         LIpKBXpOdrI+e67CqDKll8jYHDYk7/XEoQzFPqu8hApPgEcD7Wm1iOoZ6HaW14qov0Nc
         k/7PmPblq889+3Pl9biWC1DOGPJhXElEIX+D7OwuLsbb1qaezRlf2eJeJR2gYIy77CcO
         LNoK1xL3guZSDXFIbUawS5wZrLS6VRFIu6lU5gcyZpfWBRzYHV5fyIQ179D3P9/rtgKe
         pwyMGEP3lKO1HQwM9nUft96S8BtRK3Vs5E9xV3l25dC9m744JCHs+kCLnZfyRtpKZWg1
         xRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWgJUO6bzgW3wP4D73EoU4uSN/XYoCaxC1H1/9xgQsWpWulYiO/dZNbHFEWcS6RtMvBt0lFneRvTB9dj/Bv@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJ4oSt/22ebPiAQgG9eegVqRk20qGqljiGOcpXENwTBVCpLWD
	V5GNbIvbxyVC7P5a90OoSBWIhTBN75Z/ZHi3jnllxxG5EJktco6o4DRAxCXlJSxkWreT6jfJHs/
	xMpCfzBI6ychwIGYr/vaoUo9T+XhvwoNGfZ00pL8xUC/w9WbnW1e7eUKZd7gApDfSFWCR
X-Gm-Gg: ATEYQzxIh6tlnuBHnU3DUpD7TNqP+HczaW/prIM4nrhAYjSaFtgP1Pyw4rAf/GzrC4d
	KLGeBnMm5omggLu+/0+5maM2Q2nF2F38fo0+hzijNNNnBlq6JY4kdfLg5sRIy04913c88kch5Nn
	GMulfFDssErMcuh9UqNFpQ/DhE+1ILi46RCEOrcCyIoR3hZpTYTuJibVIUomUBieKzX7nIL+bs8
	XIu5bO8TqpvTX8xU2h260/sjCdSayuu4Vvm0hbtuNVLPTDA+SFfh4hg9+YSItMWI7vTcKmcKEGx
	BDGzPE4PlUlWbxx8J46rE+bNkS8u+fJkDNUurq0aCpAhbCny79vMWFFRai9Nc1XHkNXcXC27Nua
	RYEgd7qG5iPMjSxXW6In0jzfD0R3wsyMIFn/uQm+AOSEbJhuO91+UcR/ae/SijRRzZKtrbMuMTZ
	XB9Je0
X-Received: by 2002:a17:902:e5d2:b0:2ae:7f24:4940 with SMTP id d9443c01a7336-2aecac97dbcmr161128835ad.50.1773694491597;
        Mon, 16 Mar 2026 13:54:51 -0700 (PDT)
X-Received: by 2002:a17:902:e5d2:b0:2ae:7f24:4940 with SMTP id d9443c01a7336-2aecac97dbcmr161128715ad.50.1773694491133;
        Mon, 16 Mar 2026 13:54:51 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c27:17c8:7897:b4f6:fc6e:b55? ([2401:4900:1c27:17c8:7897:b4f6:fc6e:b55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83b35fsm128243285ad.80.2026.03.16.13.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:54:50 -0700 (PDT)
Message-ID: <97b5fc67-9dc0-4d86-a98d-eabf7465ba40@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 02:24:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: rob.clark@oss.qualcomm.com
Cc: Alexander Koskovich <akoskovich@pm.me>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
 <CACSVV00HQY6OfWRSWDcv4KnpwhTO+aLpTXLoQuGutvTTmgJFnw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00HQY6OfWRSWDcv4KnpwhTO+aLpTXLoQuGutvTTmgJFnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b86e1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iNc0q687GlOE84pCJgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rvRXGLBwdFq1BP7wmcVoaP3aoPdrz3WM
X-Proofpoint-ORIG-GUID: rvRXGLBwdFq1BP7wmcVoaP3aoPdrz3WM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE2OSBTYWx0ZWRfX51iS64ZblNWy
 Zog5xbixPekYOTO7RDpyxtaEzQwpXJBS2wuNkn3cOn45HSNCf6EWMklb95bCCuPLLwY5JKx4ryI
 OBShXu4fcKAN6WWzOGOf5+WxkHkXkcjH0y8oBqvj9o0VWjgLHqhdPjuFyaO4c5nJ69nONgbL5E6
 axgPdmc0ICG42YjuLp5XYmH1199vzoBew9d/Iuw0vH/vj7VpaO4AwxjSttfD5gojXPdifYx9zjZ
 HxXuHr4RDdWA3+8cRGw5B1xF37Gjqwt0xtPRwwh1otLahn0KQ6NNA15GII+vsJdgJPRk1MoHEew
 CNqzjgcYMJCkZ8CtgTrm0wVmk8qllJ9TQ0j0dtMrpNgw2+zm2fF8q/HNo1n3xR1BVZnrpL9L9Mb
 kRWpJgil5Kblf3ohNKjg+ekjyAgOz9ddoObXtX9FlQiLDlZEbe1RbBn2b975krSGEo28jtUeoB7
 upQ7neVUR92cDs8Rt5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160169
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[pm.me,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
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
X-Rspamd-Queue-Id: 6F5372A071D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/2026 8:01 PM, Rob Clark wrote:
> On Mon, Mar 16, 2026 at 2:22 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/14/26 5:14 AM, Alexander Koskovich wrote:
>>> Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
>>> GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
>>> to family >= ADRENO_6XX_GEN4.
>>>
>>> This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
>>> an incorrect GMEM_BASE which results in severe rendering corruption.
>>>
>>> Update check to also include ADRENO_6XX_GEN3 to fix A650.
>>>
>>> Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
>>
>> Hm, that commit also changed the value for A730 - Akhil/Rob, should
>> that be changed back?
> 
> No, it was incorrect before my patch.  The only problem was the change
> happened in a6xx_gen3, not a6xx_gen4.  So this patch is correct.

<< a little unrelated to this patch >>

Rob, on A740 and A8x GPU, KMD is mapping GMEM at 16MB and 64MB offsets
respectively. So returning 0 here to userspace for those GPUs doesn't
seem right for those GPUs.

I believe userspace is interested in the aperture base address
configured in UCHE_GMEM_RANGE/UCHE_CCHE_GC_GMEM_RANGE registers so that
it can compute the IOVA to read GMEM via UCHE.

-Akhil.

> 
> BR,
> -R
> 
>> Konrad
>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index d5fe6f6f0dec..0ac3fba5c277 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>>>               *value = adreno_gpu->info->gmem;
>>>               return 0;
>>>       case MSM_PARAM_GMEM_BASE:
>>> -             if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
>>> +             if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
>>>                       *value = 0;
>>>               else
>>>                       *value = 0x100000;
>>>
>>> ---
>>> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
>>> change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425
>>>
>>> Best regards,


