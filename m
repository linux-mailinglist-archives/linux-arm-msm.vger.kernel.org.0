Return-Path: <linux-arm-msm+bounces-99604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UELcE3FlwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:20:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F23065F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E9B330C9C4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0125239A7FB;
	Tue, 24 Mar 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYq+kP27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWo2Cw/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2FB3DCD90
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346981; cv=none; b=pABjXKfIcGpVWjZfH+e7IkkxlbWewhCNb0Phz6imsauN0tyKpFVsMtqKeqcIqoudxiP43rQ/scg0ftpF4yHDyKWeT4dtlwqaFIBJWh0H197RcirnY1j7c49/JYbA9GQz1iXcwCwXbYF3O1KcMdqGfWEPzdhpDRDnNT+C+DPFihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346981; c=relaxed/simple;
	bh=oJ9WWxBJ2slu4/6GOF4JM9/obtafmTxG9f8xuAa4k44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0JQciZG+x3+tDwyi5t793R+WgVPt9Ay3UUMU93W+ArWQbfSUufoOE/KvNRvGOLhMd06ozBWOC5guRJawaU4AcwGABglWAhVY3weKebZXnUdmozUSCmuV5dJ0oVMylMHdp5anXxUbDuUOQRNasQzvEJJo7ISrSnB1470IiiRoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYq+kP27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWo2Cw/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9qvwP1908753
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3X+z9f71+Se6G8QKmI4SJspHkjGgd4hGFUe4Lri+hy0=; b=mYq+kP278rWz5bKi
	W/6tWIdUw3BBPckBujL+YXfE4rbLvZ5+krUfgxN8ubk1qh4sj8Q0wF9h47HfHxer
	x2zmaTXHDe3HbH29vvDi608sKeYPN2EVp34FPUMOocD/fYB3m28Llrb0rA6g8RkC
	z/h6UP036fWtowbVru1+hxxMx3oqFmdlUJdgLcYX7mhCYe69o9VWJvkyBQallooU
	YMQzYBdzv9TZvFUJesnNWjuV+zhOPE4gHtFh1p9PhoAP/OShYnUIKcxBhkcJQMso
	0Mf+6ZLS6WRoCj5SprVv3O6RKuDVCRMBJsKoYwJYMmQ/TaWxtOljqd/zH5ZhSv2Z
	zyTTNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytwy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:09:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84cfae34so297969285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346977; x=1774951777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3X+z9f71+Se6G8QKmI4SJspHkjGgd4hGFUe4Lri+hy0=;
        b=UWo2Cw/uDPC1gFPZCnl9epc4kFk9iRFkzUYnbcLsS0LOQ4FkzxrEFcwD/9AGLUMRTk
         0eWeF9TCoxSjNZbd1CMsGtF+WRjAHmWQP8B3t1aDy5WEeWeLrqYwSsKju24s8b6whg5x
         +NoQhWD0U0ZmOpAAq3pAE3QbTKYGEdeTz+OhMI511tATSkvW2rQo+cXVJFEASHHgrU2W
         bLjr02VNUc17yM5IuzqomjcilUd8M2OffsO5wqEAL0NQE74UKRZDh766S8bXUBPHhhpu
         wXOwLI6MZ7F7k7P+OSbnQudZjtQ7Ee5gLUxtra7OopaQWuZDSgdzXLvoPaMbpt2udXEp
         aRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346977; x=1774951777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X+z9f71+Se6G8QKmI4SJspHkjGgd4hGFUe4Lri+hy0=;
        b=hN8waBA7DD7z9Z41pfii7oRkLeFdbsRLQ+7csGS3HByXQU2bQyUHoOqGadRHv+fwGb
         3EzXTFt/aChsTOaaBXTpzB2DvnYFK9H2AY6shl+nCmFEx0y3ScDzE9LMMZdYEPIQqnHP
         Wl+STnnEibmMENachM6p2L8B72UZIGzM0BsPFD1BeLu+JIa8pVTQFL+MXO35VKd3JBRE
         YCkLigxNKS+DwpeSFiNyhNOD5bzDduy5g8x3m3uByicdca3JhDibRYhmiXGE1Kn3vuR7
         639Lt6pjuReyWVdM3n24JLbJLwJ8iDWYJ2bmHTpTGBpPpX4ca92+GTbGrlg6t+CRnMCn
         rGKQ==
X-Gm-Message-State: AOJu0Yy1XHaIPBLMrZkHe2Hm5V2X5cCL77v8VNiVmnzHPrd3y6SLcvk1
	dmcGANpOdFDThAxDbdHKWEWPN8jPCXoxaI1HNcfb3cB1WREvfqnI6ci9FsjO1x/OQjr8L7oEvg2
	Rslt5xE2RrewIFuXQTJ5y5E1yp6u6nhohQo9pe7/qOCypMpM/U034q0w/7yxw+5Gb60RB
X-Gm-Gg: ATEYQzyK9PCb5xRMUvqBtazpiL+iml16bF/T6f5cH/Z9ej1rrKT9qjEffCZGEmj+QHY
	ExLa3780++qUfK68tFWeKWMS1AhfDRPdzlFj2Xbr5YCbsq6GEIgXz69x54T47d5AGu0oLfe2LoU
	6gIKCUk36MQs7aIDz32QV5V/xFxYWDTkpkbX3CCmgvrFl9KoowqX+Xn92pRgbOsGNdEld1fCiZD
	GzMvU4JpCI41WobHmxX02BRAJrjSc3EMZs1baPBIl8k0ciQmp5VKnuYJzIXP+lp3MWZkbE2zCB/
	/+Quc5yg9DbWpx0WPhvMFxq6otkJV7XEnn3aPStIm4BMrlw3kCQkUTaoAmU7+4yLNmIH7+I5836
	j+LHOHUEzW/kY3gDmOPe87hZNdMGFdoKfBAcLQEN/n2mWhnYDcGvYSMiuVLZ0nOZ8B46dOir6Xq
	h6zko=
X-Received: by 2002:a05:620a:4450:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cfc7f1fcadmr1635371485a.4.1774346977227;
        Tue, 24 Mar 2026 03:09:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cfc7f1fcadmr1635368685a.4.1774346976716;
        Tue, 24 Mar 2026 03:09:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2a4b390sm4513271a12.28.2026.03.24.03.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:09:34 -0700 (PDT)
Message-ID: <2ef8138a-56a3-4851-a98b-597475ea8eb3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:09:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
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
 <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MSBTYWx0ZWRfX2v3lAmYGjvnR
 IAillaoyq3IgR9Xthbm+nbCTW/eMRa0tQPK2ZT7uipZAqov3/pqCTeQC4bo/Fewz3lkrqYoS6Bm
 NqimkRPnhqG107yoMe4d9ImSaEuC0HISGWY0pe+A3YpNUv45tENirPqGeoOvRFozJxuQmhV0X4G
 mYGlE+uFYctvfezw7K94wZN4Kwe1O5i4Otouyprzg3Ezmm/8EoruxLEUNFFR8n1umJlq+WkPz6g
 tZ+VqPuCQNyTm+CVcDWDZmKX2IR2S5l7Of87UM2qfOMA/e9F5+SMj8PFmzJwG+mpenOR2BO3wOq
 evZ5zgai8wNnojRsMTJMVCj1LCT36yQnIyVf57w9CErR59QGFDk9+JVH10VPwEBo6dbgEMRJDyR
 lOvRrybb+JerL4FTcx1zqGx0E1cE+WYLQIN0rqNAMqzk0TtfC/pnhsfnrR1TAUSMnfPNvvWFDQg
 xk+eWwl+2A41TNYSnAg==
X-Proofpoint-ORIG-GUID: rSKg0Kzg5FBBA1j7Ua8Pgswg0d7JOOYy
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c262e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u65CJqherDVI_0nTr6EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rSKg0Kzg5FBBA1j7Ua8Pgswg0d7JOOYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: A59F23065F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> Adreno X2-85 series present in Glymur chipset supports a new mechanism
> for SKU detection. A new CX_MISC register exposes the combined (or
> final) speedbin value from both HW fuse register and the Soft Fuse
> register.
> 
> Implement this new SKU detection along with a new quirk to identify the
> GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85
> and add its SKU table to the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/* Set the speedbin value that is passed to userspace */
> +	if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
> +		speedbin = 0xffff;
> +	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);

FWIW this is lower_16_bits()

[...]

> +	if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
> +		*speedbin = a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS);
> +		*speedbin = A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(*speedbin);

Do we need to act upon the other field here (SOFTSKUDISABLED)?

Konrad

