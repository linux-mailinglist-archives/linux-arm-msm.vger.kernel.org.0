Return-Path: <linux-arm-msm+bounces-87842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A9CFD2A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 020AF30006FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E446D324B1E;
	Wed,  7 Jan 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5aVfneY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlrC4TgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E13246FE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781682; cv=none; b=Nc2a7qB+YTOfc+zZ/eiUWoubm7pAD1K1W1hLmbD2L2dwkObOiMDUUo1sCK2LAEOVYx/MEGmr9/z3ro974Unny0HYuXqc2EiPeDxAjxP7tvXfIqBL+Aq66L4yf+eQQOZIeRbSrLIEh9J3SRfsnS3CcuLPooJEet0tfocJFClWA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781682; c=relaxed/simple;
	bh=uCcibc5OS98EhbVSSuYJO2d7US27/DsclJdlxC+Fipo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcODyZOqPK6J6wOdWw0jgSCvZxwLYZVAK4obbC19tnU40fKm7cXF68npFfiNlyYf6NPYn7sfS4NcwQfSN6vc2El6mMiN739pXY42d6LwDZ4+PtulgkuMzx+FyjB+6NYVqip+MQtJR5HMhKHYkKIRxNpZ3/nthm0bxMe55cfTLF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5aVfneY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlrC4TgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6077ZmGq849477
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=; b=c5aVfneYNmh9jld0
	njlhGPu+rWl0UYGpRuHn8lznfimM1uhtA+u7+XxK5T9J2Y/OD/814shd3ksoJTUd
	lCyZlddqjm0EoJ/K630oenoolzgtusKSL04VS27/ba4qXRlvqSGpjbs5IBEK+Zat
	yJyYjpxysOhPwHMwuMGvsX1+QVBA67eNN4PgKz2pIZ8zc8aBlunfa8O4c26Ykyje
	it6Sc2qb+2tWMGMhHsQHYETPapTCqT/4jLNOhBKjGWP3tY6g5f+ZeiEVsNDOj+uq
	+eMu/DOI0zr5p/b7ceZGP1Qh6sLDhWFoPC5Yynhf/sZWJjv0Y1ttxQDF089Tx5+t
	aDxpOQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2x40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:28:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso3045768a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781680; x=1768386480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=;
        b=BlrC4TgJS4Xg76NW14AdQ2jbDWYMC0/ZASYPuQpBQcTUZFx1KdDt5thnrie4mHgWsy
         3i+lPUMIfJvKd1TKTXq+WNLIX/Glnjhb92VCYH2GrlmMFYuZh7XtVHSGhs/lHG4akK9h
         DPiIoGUn6EH2WvICuhovcMu6fnjlEAmlsleEjsBg3R1o1KYxIKzzvt76oRElvSMoLOZ6
         eOIzQaapAJd/AaCBpIdNgOYksgo/n4nZaePf16Iwb0FnbpPgye9J7aeCUbCOc5dtx05r
         gHKsHQTMx7MP6ySqnO6zR8N8fiKa2b9umPnqGMBvCXKunCGs7EIsZILNhSKpBYQemmd+
         RIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781680; x=1768386480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=;
        b=Fz2kEC0na6dljnicfaMKshnhtA9QemvcKbo7hsW1fZqaC8Y7tQPXVHD3deLDPe1dn8
         jnY63lN45tBledp+75ZOf9WnuxSSDbBx069Me9LdbV1kUTHGBFrXBAJKZSJsx0kY1wF+
         QtE/kqJ/BC2fbqSSyfU2QerV6R/LsbeHreSBK1i5qHWiXNJ2kXm36XhiLC+XJvw90BUu
         kQtSdG52+5q7JKU64mmELV6Sd17xYE79QbjUxA28AsadUDwnbSvrj3Nnkt4bsWATplNI
         xbYOsatfyE0kZkKlNn2yKISHsOQv48lnv+Mobt0YbrRjlkd2eWDtd/q1Fivs1knhKNb3
         su7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+M5mib2preOGkE0BwCUBkMVYbwU4t6AmC3R9s+9tansNsmmIgdG3Jkf7/Pu31cuVNBp93TO6uOKmG6Hrw@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVBtMvbdM5rg6p6UDv59nELIrctfAA7fflJeARLfLf6CsFleZ
	EtCQME11gOHhj3KPMlKQeCXl5ldyFzG+522EtG+gURtJALf6b3Rgd89t9z3iJwM4Z7NEMQEWg4L
	q4hJzM6M7lN/cNGZZ/ji7oxUVoXbwSfohBM4k+DIxcPtFQwTd8eD7hxojiNdYUegoWJJn
X-Gm-Gg: AY/fxX65KgeAiYG98b71W8UHhkMIvLg7vis3mBboqCEtyjYYILh2LxkX5yxXF76u1r/
	1KuwpJLanTD3wiyUO5izrRxddxq88q2MPnamBUoZh0or5k3+XpfXABMhfguu+IjBH0k4HAY8UQ1
	uiU1Pz1HxtJLq5kIFgxZEQlL0/UHcbe/c/j820McFfnxKJGWw6QFuY1XiBpaeMpwnNgW3P8za70
	en5YHtZqExzJJ5D5WSJumO0hhiKeUaJfFZXtmDNxMPibDoOCzFeQLGHx2R2wwyO5FiMr2QUHhtK
	6PyzSpkpCfzQmsiCfOxbGGa+blfO2Flu0oENCmNjW4YQiGAq0UGdWW1esBDT1o2XwNFjj4uqXnX
	SM3Tx+xrJdgBRq4pa8UfS4FahrJ90pnACWTTbul3cUg==
X-Received: by 2002:a05:6a21:6da1:b0:350:3436:68de with SMTP id adf61e73a8af0-3898f9ba491mr1752625637.53.1767781680012;
        Wed, 07 Jan 2026 02:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPuCY992g0490yz1nPwcMPiCXPxiqcodxyzXRdSDwuApzNgokfbaIZN8xgrL6S1i+C88XVTg==
X-Received: by 2002:a05:6a21:6da1:b0:350:3436:68de with SMTP id adf61e73a8af0-3898f9ba491mr1752606637.53.1767781679598;
        Wed, 07 Jan 2026 02:27:59 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm4734492a12.22.2026.01.07.02.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:27:59 -0800 (PST)
Message-ID: <2ba6c9b8-6040-42d6-83ae-59092ebefbf5@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:57:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: iris: gen1: Destroy internal buffers after
 FW releases
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfXyl/JlLnslDxM
 VW5bOlaScNkQ4XuJylGobJQSUGqn2pc+DRuSryFONncaQFryEcFOm+MhJuayA7+0wAaEhZzXA5Q
 /uwf038ywVWYDO9epKicrImNW0KLdYh8vMm265e6yWYIkTtDzb3evWjAiWlf5DVgnPOef/xdVXf
 ndxlSqn8w2BAr3nHYx2NYjyvxeyjTZv8YSOzIGKgxZIoqmYRrMGazHBEGau/OrvGoU5ByDFG/0i
 Fk5e79LTuPxRBBIxVomPHBgo6oyqK6fJzNPSv2GC8jXwTrCUQjORRIXgG6UtCrZu6Y4aqjvAjlX
 UO26+uoZp35a3NwozZ3uYwmZ70P496kjdWGsTiEewdWJ32VoHUDlD2tShUhIzF4v5K/U7dMh8lR
 d5Hv++iI0nMoMz+Jlw6aLxh0pH84dKwWJD+BcvYF3TDt5qQOlE4SxSvI+BvMeFV+WAwYhWaY5FA
 WWsJFQO5041EG9iFvYg==
X-Proofpoint-GUID: RrxoCL3Iz-lRV5zc8cwe4Sdm-eKKxhQC
X-Proofpoint-ORIG-GUID: RrxoCL3Iz-lRV5zc8cwe4Sdm-eKKxhQC
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e3530 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5SAIZNfH76eZnwG7RIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> After the firmware releases internal buffers, the driver was not
> destroying them. This left stale allocations that were no longer used,
> especially across resolution changes where new buffers are allocated per
> the updated requirements. As a result, memory was wasted until session
> close.
> 
> Destroy internal buffers once the release response is received from the
> firmware.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
>   		goto exit;
>   
>   	ret = iris_wait_for_session_response(inst, false);
> +	if (!ret)
> +		ret = iris_destroy_internal_buffer(inst, buf);
>   
>   exit:
>   	kfree(pkt);
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


