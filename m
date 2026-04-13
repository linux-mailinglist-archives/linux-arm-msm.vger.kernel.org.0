Return-Path: <linux-arm-msm+bounces-102900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIi0Nrut3GnfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:47:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C93E9509
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CBB8301990D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC02C3AC0C4;
	Mon, 13 Apr 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOpUKElQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4daU7Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC73AC0CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069856; cv=none; b=QyrmX061q+M6/VKEZNBp1Vfx5bVz4zYV43MLeN6/CvKNM9I1GBBQzNJcitS4UJrZHmKWQgrPUn423dlSbC+VXm2HYTbk0SfpOR6QORwSTlrUPQux/2vRPE30qVyuOlNGnPkhgvO32jbs4Ft2sbJkUSph648nlcfjKM8+YGP7wxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069856; c=relaxed/simple;
	bh=on53NUjfhuKH5ZalBEWfuK0BGylr+gTSLLb2hUJ9fXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hs7pQOweJaGBPjCW2rFFBqAYwro4nBoxeR0cBG42RPgE24jkuiCPAlgXAmSrWfuhmbGtx08dLKPb6B4siMSAq//ip+5QBLg1oJl1JydYz7p174eQCiQbx0q9CRZDPwZfj3epJ+7C0TvRkn29z78ICUdIfE8aEaqYA/1Sr79pU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOpUKElQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4daU7Qi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4jPiu543708
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoK7egPfz3mwKJuQ43LZbL7M2c1YHPxwem4ZHrcdnzU=; b=VOpUKElQWFxOgY9z
	2Vbioz6hG1flpPKTsL9pY8wcSHguUSnbidWCTPplaPkUuGb6s41DIlsaJBnjm2LB
	mXDwdt1aVrdms2PgmlBxkgQdXHi7vxnzP7XEyIzStaRnwdvQMMMedXqugUo56F+Y
	+YIxTNkWHBe9MuRzApCmQ98rjQhYQ4Xh0nYMOchVCbr4/vBZdy+GCeV0jiHtolrX
	fz0e/cSXAXbJEy4KfTthQPVnejBeQyun17iSm3E0mePNYU5Iz/HgY/I4ky52HkWH
	2/HJLeCyVmSlR8e9LwgBOHmvLshWFxAWbHpxZ5P8TC495EL4h6Na62TFjle7IgX0
	xx1MOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvgb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:44:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e06219cbso19093985ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069853; x=1776674653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoK7egPfz3mwKJuQ43LZbL7M2c1YHPxwem4ZHrcdnzU=;
        b=W4daU7QiApnDnWnM66LBphfM6XOflZrdTMWYBYNNv2VRuvy0zaFwnICYH8ATY1greD
         REk1XzulsRE+OwLfhiwrmzxX65QIMcrKeUKEIoZsvpyuPgxJN4bHSlBo3APZx+P1/SeC
         L4oIZ9GEqFvg3K53jlyqQxT+OSiujJDz9zVbA99I3azTr6sVCrzIsI6/3mq7R3boiNtR
         MIWUSb5avmGzetTNu2moAim0fNJ6BbzrEs+vocrDZhYkUR/CUXL3CB3qHNlMEruKQykM
         Nnp+frPac98N+9pQcZqpeUeNVpGJ8L68faKFuFGLC+iGXMmBb5PhrW8LCpK2su/yOmRq
         raQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069853; x=1776674653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoK7egPfz3mwKJuQ43LZbL7M2c1YHPxwem4ZHrcdnzU=;
        b=s+0xifIwnHWEPfgolNBzyaFE2dpURU95AtEzdQByxXxK8+HU2FQuI5H/pzq6GhnyPj
         /CIu/SI8xof01FC4lTXJrScUSjV/NL+egw/G1DRlCfjOavg2bdKbXuL8dl11Gt4Fbt1j
         p8Zxbgsu5Fp3CFzVQ1ZuOY5sh2pN9ZK/cUVFZhku5A1NK4zBbLnLQZy2KIN5Q8517Q9U
         n5VgwP1a14f2TYb2H3SkYAnKBir7c11airRKdiO/IQ/rwbUS9g4IcKBUyK3DA2Uw3Ygj
         Pu4L4+mmX4R2jgqP1Bl2Fk3AwoV9OAyKD/TdlKkf7Sklfd0iKGaHuL3xWq5qiOObmAmB
         q/KQ==
X-Gm-Message-State: AOJu0YxfljOrhwUibED193Y++o2ju2/J+EdK3Ylk9N9kQAdC6HndgYUX
	UmKpm8AscWZe18jOuOWitV0gJLrNEVCpYPKSWVSKl7juyEEK+ivGtXcsLlYJBbiKTpX4oxHMOdL
	IuYZKuFoICYULspkRY28U/9Ab0JpHiiXnRCXU6dVkkhuIsrEyx03M/gFX51J/LTyltIDH
X-Gm-Gg: AeBDietYRrkuECWtlzJi0a8N8OXW2jLIetVZqQMYaENpSwEHt2VCZj7OUW2/9m5a/Kz
	zUMqJSj2edAX2lq9N28piBe8WQdvIGMbheDAh440v1HEar8rA07+01QRuTPeMG/TaJHw0y37mlM
	RBr/PaRKRWw8/Gr9kTYAwj7Y6s7mK2m3J+USgW5pOS51+iY9YdWCUDfcvHxZgujQXyWuLy0DSM0
	7eu3zS4axPtueP3paSHle70JLvLwim9nAQtSbtdzytlozjHUoxSrI3ikHrRuR+5NDNPaltieRAo
	YY3GkTAYf8jf/kN3NV03u2h4GLcOYRVw1jtSo0rVcmB2kWetcs6ehqoiApZL/PGPZQwWCWrQbzZ
	x7rYHr5WnS2p1qYLkgFVRe5sMK1x4+WEb2ncyHTX6gmB9WGYj
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr126982925ad.41.1776069852871;
        Mon, 13 Apr 2026 01:44:12 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr126982605ad.41.1776069852288;
        Mon, 13 Apr 2026 01:44:12 -0700 (PDT)
Received: from [10.204.79.61] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d066afesm30849245ad.8.2026.04.13.01.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:44:11 -0700 (PDT)
Message-ID: <7cb406ca-e631-4cd4-9782-d3efe30844e4@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:14:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm: default separate_gpu_kms to auto selection
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
References: <20260330-separate_gpu_kms-v3-1-a3e54b9c9417@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <20260330-separate_gpu_kms-v3-1-a3e54b9c9417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2IPLwf5phUWZD9_maR0WruTZNq13lEZ-
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcacde cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J7XNo4u_9JsdxoHv6woA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2IPLwf5phUWZD9_maR0WruTZNq13lEZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NCBTYWx0ZWRfXwcmhMB+lSbkd
 aWp1MLwsuy00C/f+R18WrDr/KeJ9R2y6La+bSgcHrDJtMmZxYIPpHbB+E166/V/5w1WTOt6c07w
 8XAEdxSrOZRgSxJMxUeLb3RpvhvyABKCBTF0Mf30K3Y+U/1+ta4hw6YQbN66ptSAVm7y6UNI1se
 rfaM0cTobMbFw/ru9IVF3hHINKmvE1wCZ8FH9Ld/ah2HcLyMfb4J5IHwgWxzdmvO/k9QrSirZ/H
 CQRJonOcFfRFjtAGDJtBnbryqunDWuf2K3VA77/ShlwZ6/7NPo0oxoDaQ3owI41E8k3oG0XOYdu
 bNWJObbluNw360Zcmf7LwAh8XsvQYzaB9bkiy48z5D4lQWF3JNCo5+kBFI5PuaO3dCb0k5F2UAA
 dvEj3MvaIwx3YyRxTlHgOLbFGbaAdGjMG0qhKzxO30Keaz6UfbQxl/L0CqvOrpRO3Ok042ewo8H
 NB8u20yX+4KhTDEMErg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 422C93E9509
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Just a gentle ping on this patch below.
Any feedback would be very helpful.

On 3/30/2026 3:22 PM, Mahadevan P wrote:
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
> Additionally, ensure that display subsystems are always exposed as
> separate DRM devices when no recognized Adreno GPU is present,
> regardless of the separate_gpu_kms setting.
> 
> This ensures correct probing on multi-display platforms without
> affecting single-display, single-GPU systems.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
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
> Changes in v3:
> - Ensure display subsystems are always exposed as separate DRM devices when
>    no recognized Adreno GPU is present (!adreno_has_gpu()), regardless of
>    separate_gpu_kms setting. (Dmitry)
> - Extend auto-selection logic to account for legacy display controllers (MDP4 and MDP5). (Dmitry)
> - Rename msm_mdss_count_masters() to msm_mdss_count() to better reflect functionality. (Dmitry)
> - Common helper to determine presence of a valid Adreno GPU node, avoiding repeated
>    adreno_has_gpu() and availability checks.
> - Update commit message to reflect the above behavior.
> - Link to v2: https://lore.kernel.org/r/20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com
> 
> Changes in v2:
> - Drop dependency on Lemans dual-DPU device tree changes as this patch
>    works independently (Dmitry)
> - Switch separate_gpu_kms to tristate and default to auto mode (Rob)
> - Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
> - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 14 +++++++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 14 +++++++
>   drivers/gpu/drm/msm/msm_drv.c              | 64 ++++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/msm_drv.h              |  8 +++-
>   drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++
>   6 files changed, 107 insertions(+), 10 deletions(-)
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
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 809ca191e9de..409000b739b6 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -15,6 +15,20 @@
>   #include "msm_mmu.h"
>   #include "mdp4_kms.h"
>   
> +static const struct of_device_id mdp4_dt_match[];
> +int msm_count_mdp4(void)
> +{
> +	struct device_node *np;
> +	int count = 0;
> +
> +	for_each_matching_node(np, mdp4_dt_match) {
> +		if (of_device_is_available(np))
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
>   static int mdp4_hw_init(struct msm_kms *kms)
>   {
>   	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 1e3dc9bf9494..086895c9f103 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -19,6 +19,20 @@
>   #include "msm_mmu.h"
>   #include "mdp5_kms.h"
>   
> +static const struct of_device_id mdp5_dt_match[];
> +int msm_count_mdp5(void)
> +{
> +	struct device_node *np;
> +	int count = 0;
> +
> +	for_each_matching_node(np, mdp5_dt_match) {
> +		if (of_device_is_available(np))
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
>   static int mdp5_hw_init(struct msm_kms *kms)
>   {
>   	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e5ab1e28851d..e2101c6632ac 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -54,16 +54,64 @@ static bool modeset = true;
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
> +static inline bool msm_gpu_node_present(struct device_node *np)
> +{
> +	return np && of_device_is_available(np) && adreno_has_gpu(np);
> +}
> +
> +static int msm_count_gpus(void)
> +{
> +	struct device_node *np;
> +	int count = 0;
> +
> +	for_each_matching_node(np, msm_gpu_match) {
> +		if (msm_gpu_node_present(np))
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
> +static bool msm_separate_gpu_kms_auto(void)
> +{
> +	int gpus = msm_count_gpus();
> +	int display_subsystems = msm_count_mdss() + msm_count_mdp4() + msm_count_mdp5();
> +
> +	if (gpus <= 0 || display_subsystems <= 0)
> +		return false;
> +
> +	/* If exactly one GPU and one display subsystem single card */
> +	return (gpus > 1) || (display_subsystems > 1);
> +}
> +
> +bool msm_separate_gpu_kms_components(void)
>   {
> -	return separate_gpu_kms;
> +	struct device_node *np;
> +
> +	np = of_find_matching_node(NULL, msm_gpu_match);
> +	if (!msm_gpu_node_present(np))
> +		return true;
> +	if (separate_gpu_kms == 1)
> +		return true;
> +	if (separate_gpu_kms == 0)
> +		return false;
> +	return msm_separate_gpu_kms_auto();
>   }
>   
>   static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
> @@ -1019,7 +1067,7 @@ static int add_gpu_components(struct device *dev,
>   	if (!np)
>   		return 0;
>   
> -	if (of_device_is_available(np) && adreno_has_gpu(np))
> +	if (msm_gpu_node_present(np))
>   		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>   
>   	of_node_put(np);
> @@ -1030,7 +1078,7 @@ static int add_gpu_components(struct device *dev,
>   static int msm_drm_bind(struct device *dev)
>   {
>   	return msm_drm_init(dev,
> -			    msm_gpu_no_components() ?
> +			    msm_separate_gpu_kms_components() ?
>   				    &msm_kms_driver :
>   				    &msm_driver,
>   			    NULL);
> @@ -1069,7 +1117,7 @@ int msm_drv_probe(struct device *master_dev,
>   			return ret;
>   	}
>   
> -	if (!msm_gpu_no_components()) {
> +	if (!msm_separate_gpu_kms_components()) {
>   		ret = add_gpu_components(master_dev, &match);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6d847d593f1a..a977fe7b36b8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -555,6 +555,12 @@ void msm_kms_shutdown(struct platform_device *pdev);
>   
>   bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>   
> -bool msm_gpu_no_components(void);
> +bool msm_separate_gpu_kms_components(void);
> +
> +int msm_count_mdss(void);
> +
> +int msm_count_mdp4(void);
> +
> +int msm_count_mdp5(void);
>   
>   #endif /* __MSM_DRV_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9047e8d9ee89..4c788f2647b0 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>   	return 0;
>   }
>   
> +static const struct of_device_id mdss_dt_match[];
> +
> +int msm_count_mdss(void)
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
Thanks,
Mahadevan

