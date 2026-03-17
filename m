Return-Path: <linux-arm-msm+bounces-98147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GONBDmcvuWkYuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:39:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C912A8156
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E38A30022E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69433A63F8;
	Tue, 17 Mar 2026 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGtllZZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQhxLw6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D393A640A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743800; cv=none; b=Wr1FfwjZl1pui5EgmL/W1SS7ETQRImxVrV/Qx7YN7sf6n/a+c6OA0iry9na+r2MGM9c3A17vVkG0F2u70YTJmMVHVOTdEBtgMhyVQa4CXsaCOk9QnXGLXKZECEgPMqeBpnmlsFBLQWMZsYTRZRmrgvaoVqFufSyC4SW31nDPZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743800; c=relaxed/simple;
	bh=PYCPEMORv+mScCe3+qX4GcZq2DtQeefaihUU0y1mvhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKwnlxddgi3BE1qgxWtWn7o0Ay/z6w7EuiIO6BASE0N4b9EhwEB0yrXFGhhIGMT/aYo1BgKwOV1T+Ycf/WGqWz1jWFb2OFu9rvVg0gSB/SYL6Dv9eDotGriGeefqubS0XXElrbpOJwmXQNin9idh5Ov8PXaI/0/ewCyyVip5g3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGtllZZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQhxLw6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H97KpV3102507
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q80od46YfGjJbx+buL1XTCWGGPAhw78PvjTfETNu0/w=; b=SGtllZZhdUjTSRdg
	vUvB3C3qPLqtS0gCc9ND3pdqZKLbAZxN+B25Q/6Ar2tE595EW5i2RPVB9NUtxyP0
	qoWtxM1BNGxopbOHQfRO+80Eo3ATOotrKsM/ZAqBXAhqtrivAO1lEVWIXON1kmXs
	pXQdaH+BUixPZVfM3R6jd/YKFz1R0gKVPwNimtPQzLSPEHF5nW1lz/Cx1qBZf0ak
	L9Og6XPLmjkVJSY12DII93XKGwaeKESWpOfU3B9CA6BiRyGtKkz3cCmTIBZcYSd0
	3urkHEfsnLMD6EuUU8Qc0nYzDD44p+koEayc8OXXh3jMYtmTG+H8wWiWLpK8gG8l
	/psARQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7bcpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:36:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06b68783dso1221265ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773743798; x=1774348598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q80od46YfGjJbx+buL1XTCWGGPAhw78PvjTfETNu0/w=;
        b=cQhxLw6h0iALxibIOtFQotORRbJIfdyXJVY0fcX2R8lCr1KVAEX/uf31Wtd44M97Jm
         TrXzByylmNFW+VIedpqbD4N65N4kjCxqtbAMx2DQGwZ8UItE6BjA146ZkofAji4mysFg
         pHMRGmkCUIfbC3Rn7PTt/FdP5fZF3ZRj8y/BbQVzf4epqS2RWXLzUiKt1X7hFWHGgy3a
         UMjjKPWWe3MR+KIoJdfbZWWMZTeRMUK7cjQLrYJJDvFQJA73pSVx5Kn+5JfehPlnDnuL
         5vTmyuknFRzq34vxBwcqgDBY+FT+KfRVIKuqNInFzpnzdD7Gs3m2aHR1Z+1PMSKOYo5t
         FcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743798; x=1774348598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q80od46YfGjJbx+buL1XTCWGGPAhw78PvjTfETNu0/w=;
        b=fubS9Ynk3RE1CCgox+iAHZCvfA+oHHRiSMl5PcZEuiS3hjHLgePzYFtsoVqnDiSB6d
         rYUjtC1+Sg35nJpN2a6EzdAZPbBBP1M6XySH7NFOirIZ3BuB/WiOP4uO4pT1PKVS2iBl
         lzQqUsKdbyxQMsNkrovNw+lZXYotZ6IQD3dKkZc9aOyYJQe7/optN+UKWUMuYHJ8gWQJ
         u2yOTOUYP/mKmTLZm9gfxm0pOeVFb4p5UN2+uwyTVealPIjCEPcEwe3qBCoBifQCEMyB
         Q5Z/lcdjPUmTiNmUYLFL9nh2pICVCxEsgMeBuwD3inx7TPJmsF1v+cB2orEczX41BPva
         8EZw==
X-Gm-Message-State: AOJu0Yw9vafzXtl9+S+9IggZwfBrE/H2+z7tSifM0LLvGL8WEFCziFwY
	4maM39Y1xwx8iHKv9OwAoDSpxpXDbhJpxBBFpsA0SzZydoEcpY1cs6Rk9YWpBAErVEL9Y3NuIdr
	7hdAz/XzAoS+P1hPxJ4jlTjGXZXGGfbGbqaO7eg6Lb5TACPPsj16FQbJwhLqa5qt3OwIn
X-Gm-Gg: ATEYQzwbkLKTAz3m6WKV03qoYqQrNvv5wb2/UlSgz3/znOqWD0nab3xgZg+4yRlisYg
	RA1JDpPhTQ8xRqy45KmCKvEt4Ok2/nrJ/fmwlILLu0bnGidBZ8bFtlLvX/OWa2zdl18MQgk4A+R
	EZq2L2idr0OSphxdc4FisH5archTs1CReczFX7gfTIrOiBPe6wgiGD0Db+bKgNOPIizPFi2fZdM
	uMTrE4bMbY++wze59C73IRolsCgcovHQMkKlUYihPxrZcMjFeed8mdW68hiGNenF3h1xb7dA7vm
	ybLUGLetttJ48crQm0fmtdc8OdQNzZa7hKItIp3cU77IAsF0AfweT13MnDUZj+MXls4qNhFVpSY
	Q8JvRLXQwrCNVn8sZSCEYRqqV9RL/SCwxhlwom8ZDNCzfeZIh
X-Received: by 2002:a17:902:e5ca:b0:2b0:4f82:74d0 with SMTP id d9443c01a7336-2b04f827743mr78199185ad.46.1773743797576;
        Tue, 17 Mar 2026 03:36:37 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2b0:4f82:74d0 with SMTP id d9443c01a7336-2b04f827743mr78198715ad.46.1773743796964;
        Tue, 17 Mar 2026 03:36:36 -0700 (PDT)
Received: from [10.204.79.61] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06b74c672sm5745445ad.66.2026.03.17.03.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 03:36:36 -0700 (PDT)
Message-ID: <8b58adfb-ed3f-4c2a-ac4a-da5ef1bd8dba@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 16:06:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: default separate_gpu_kms to auto selection
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5MyBTYWx0ZWRfX5X63Enko/Hq9
 yJ0MgF6N6O7PLlmaJJIc4+5emdGxEbe4Z4RUhAeYEqWvcuWMYXsA6qXJx45QfQ4WJsCa90D25GN
 OQdp2rDW5M8DF4riSjrKdqQTjkvLi9KJJ+EyCieJwcpRzk9rr52ycz9zszSpmQgNGFB+p/RRnSa
 R3fepxOj6/VXa0TUd4zPzu06tGkql8vwVwm6qgv2rl1vqNiEujWxc7AUDML9lU4Qz5lMc6pmqpV
 pyCtTgAExeoed+ArhRk0LPRVQ7X646D1JjKLDtnfB9OsEbzDdnWNSVYWcPzJkP8NG71Udc4Xaas
 rQPW4pGXGx57WFT2sE6y7nLw+nbKuS/rKm+RxHdeY5/YHcpB17Ng/yRvBiy4E1VAh+tWuqtv5mx
 s08HkECW27HKJwymLa7duIwiU9Koyix6XoMxCt5AsSmmgDeeaDK0Kit4NkAhdm9020kKWU21hDF
 t0koWMO+OwCVANDH7Xg==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b92eb6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dfr3oJRqEVbvJVnc6jwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oOdrAdiyCK2o3NKUsL6sKUULKUSqkRxs
X-Proofpoint-GUID: oOdrAdiyCK2o3NKUsL6sKUULKUSqkRxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98147-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0C912A8156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 3:57 PM, Mahadevan P wrote:
> On platforms with multiple display subsystems, such as SA8775P, the GPU
> binds to the first display subsystem that probes. This implicit binding
> prevents subsequent display subsystems from probing successfully,
> breaking multi-display support.
> 
> Use the tristate separate_gpu_kms module parameter with the default
> value set to auto (-1). In auto mode, the driver selects the binding
> behavior based on the number of GPUs and display subsystems. This allows
> display subsystems to probe independently when required, while
> preserving the existing single-card behavior on simpler systems.
> 
> The separate_gpu_kms module parameter has the following semantics:
> 
>    -1 (auto, default):
>       Select the binding mode based on hardware topology. If exactly one
>       GPU and one display subsystem are present, bind them together to
>       form a single DRM device. Otherwise, expose the GPU and display
>       subsystems as separate DRM devices.
> 
>     0:
>       Always bind the GPU and display together to form a single DRM
>       device.
> 
>     1:
>       Always expose the GPU and display subsystems as separate DRM
>       devices.
> 
> This ensures correct probing on multi-display platforms without
> affecting single-display, single-GPU systems.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com

 From coverletter this got added from b4 will make sure will be posted 
properly with subsequent patches.

> ---
> Depends on:
>    https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> 
>    When separate_gpu_kms is enabled, the GPU and display drivers are
>    probed independently. In this configuration, the Adreno GPU driver
>    may no longer be loaded implicitly via the display subsystem.
> 
>    The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
>    Adreno GPU device, ensuring proper module autoloading based on
>    device tree matching. This is required to guarantee that the GPU
>    driver is loaded correctly when GPU and display probing are
>    decoupled.
> 
> Changes in v2:
> 
>      - Drop dependency on Lemans dual-DPU device tree changes as this patch
>        works independently (Dmitry)
>      - Switch separate_gpu_kms to tristate and default to auto mode (Rob)
>      - Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
>      - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c              | 52 ++++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/msm_drv.h              |  4 ++-
>   drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++++
>   4 files changed, 64 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 4edfe80c5be7..e40648c05797 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
>   static int adreno_probe(struct platform_device *pdev)
>   {
>   	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
> -	    msm_gpu_no_components())
> +	    msm_separate_gpu_kms_components())
>   		return msm_gpu_probe(pdev, &a3xx_ops);
>   
>   	return component_add(&pdev->dev, &a3xx_ops);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e5ab1e28851d..575d1aea7927 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -54,16 +54,54 @@ static bool modeset = true;
>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>   module_param(modeset, bool, 0600);
>   
> -static bool separate_gpu_kms;
> -MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> -module_param(separate_gpu_kms, bool, 0400);
> +/*
> + * separate_gpu_kms (tristate):
> + *   -1 (default): decide automatically based on hardware topology. Split devices
> + *                 if there is more than one GPU or more than one display master.
> + *    0: force single DRM device (bind display + GPU)
> + *    1: force separate DRM devices
> + */
> +static int separate_gpu_kms = -1;
> +MODULE_PARM_DESC(separate_gpu_kms,
> +		 "Use separate DRM device for the GPU (-1=auto (default), 0=single DRM device, 1=separate DRM devices)");
> +module_param(separate_gpu_kms, int, 0400);
>   
>   DECLARE_FAULT_ATTR(fail_gem_alloc);
>   DECLARE_FAULT_ATTR(fail_gem_iova);
>   
> -bool msm_gpu_no_components(void)
> +static const struct of_device_id msm_gpu_match[];
> +static int msm_count_gpus(void)
> +{
> +	struct device_node *np;
> +	int count = 0;
> +
> +	for_each_matching_node(np, msm_gpu_match) {
> +		if (of_device_is_available(np) && adreno_has_gpu(np))
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
> +static bool msm_separate_gpu_kms_auto(void)
> +{
> +	int gpus = msm_count_gpus();
> +	int mdss = msm_mdss_count_masters();
> +
> +	if (gpus <= 0 || mdss <= 0)
> +		return false;
> +
> +	/* If exactly one GPU and one display subsystem single card */
> +	return (gpus > 1) || (mdss > 1);
> +}
> +
> +bool msm_separate_gpu_kms_components(void)
>   {
> -	return separate_gpu_kms;
> +	if (separate_gpu_kms == 1)
> +		return true;
> +	if (separate_gpu_kms == 0)
> +		return false;
> +	return msm_separate_gpu_kms_auto();
>   }
>   
>   static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
> @@ -1030,7 +1068,7 @@ static int add_gpu_components(struct device *dev,
>   static int msm_drm_bind(struct device *dev)
>   {
>   	return msm_drm_init(dev,
> -			    msm_gpu_no_components() ?
> +			    msm_separate_gpu_kms_components() ?
>   				    &msm_kms_driver :
>   				    &msm_driver,
>   			    NULL);
> @@ -1069,7 +1107,7 @@ int msm_drv_probe(struct device *master_dev,
>   			return ret;
>   	}
>   
> -	if (!msm_gpu_no_components()) {
> +	if (!msm_separate_gpu_kms_components()) {
>   		ret = add_gpu_components(master_dev, &match);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6d847d593f1a..64a5ad35f7a2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -555,6 +555,8 @@ void msm_kms_shutdown(struct platform_device *pdev);
>   
>   bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>   
> -bool msm_gpu_no_components(void);
> +bool msm_separate_gpu_kms_components(void);
> +
> +int msm_mdss_count_masters(void);
>   
>   #endif /* __MSM_DRV_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9047e8d9ee89..00e3ac7dab3a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>   	return 0;
>   }
>   
> +static const struct of_device_id mdss_dt_match[];
> +
> +int msm_mdss_count_masters(void)
> +{
> +	struct device_node *np;
> +	int count = 0;
> +
> +	for_each_matching_node(np, mdss_dt_match) {
> +		if (of_device_is_available(np))
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
>   static void msm_mdss_irq(struct irq_desc *desc)
>   {
>   	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-separate_gpu_kms-04d2cf4d91e2
> 
> Best regards,

