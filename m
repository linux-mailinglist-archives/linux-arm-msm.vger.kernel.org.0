Return-Path: <linux-arm-msm+bounces-49856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57BEA49AE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E124F17473E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 13:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A942926E142;
	Fri, 28 Feb 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXkX3BIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472D482EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750358; cv=none; b=rB6zVcrQYmtZO4mVdpPR/vAOP2NmBDMgGm/yJzQq2KVZ7MCqCrDtXKNGhkCxdJETv17dvY6i3K5PVCxZNP9xlAZvfd9U6YMqRIosiQscoounEdMHwE0A3UOLU1ViRKxM+OTx/nWupQSZ0JzwaSUMVIdZp8Px2FfHZBwTGfWezb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750358; c=relaxed/simple;
	bh=dTbZgFe87nLGvj2GUp/LJFrA/XIiOhzoKmnS6B8fmNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Il5yZ0xsufmWo8WVpFUUWlG3Rxfemx+idw4wetZBjYsCoJ5htk6oBpHGIVF5ET5SrrboNHVmmPltA7flnHn7KH27k94Dp18IqJZJR8oL+XHBmqOjtJT35pH45Hy+FUOwriI8KrGgy6NFou+rCZlSuGxIBA6WBgrqu4HVZHql5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXkX3BIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAX5Rx019986
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=; b=UXkX3BIfY/8M396a
	UjCat4hwQmhGG02/WSx8S+HWbe4kRMf4khRfSnMsd4Fq5yu7g32oYs60fGFhDZNW
	DDx0fix8cntcU7/vxKYpaliQblncMDiwdZjs03hXXdYwQ60t4BAv5UdCbvm9tU7f
	IqjHLJd2Y1XziwX9z1Zo1Gk3THuxtoBVUT9APaTEpBx7bop6IXvFrxzVtmHbbcT2
	fWbq8WSVUAyfRPSS5Km+KC3onj9zrfMBH+encQAd1pRLSELGiGcVu0YPYNgDuo6F
	gqrQYwsK1ziqnjVhDR0FqVbeF51BfdMTkyhWCIkxegLrbNUzp/O+o3ZKXs4IysLc
	0zy03A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4539upgwkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:45:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e249d117b7so2500266d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740750352; x=1741355152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=;
        b=h61EBMjRD1vsprDykvK6jdqrLyq3Qv56cgi/XOqw79iOXCMPNjZqermPDn4s/S+Sv6
         RtxU0okAk6sFgJA8ZORg1wdgup1ivvez3LgBy4DS67DrZ2xPbqu/fgYTGsT0h2hnKoqn
         uKE+CkLh/GZBiiYeMPBmgqb/h/9dpdNvqZqeN2E1GmOnPfCEPzk/42jl+1/g0PCLl7aM
         H9RQ7muLeINYxnBtBphXAMtjGByJJBkO0efjMaoAIbKpKrpMdnjd6vo1AvGSFso7ju4s
         lwaP/RPQ4Zd1LTu4ykcFLAZISQByZm8RWB185VnEEtFjx00a9dWXdThakcymomDYmbBC
         C0lg==
X-Gm-Message-State: AOJu0YxpDRi2D4ySlYHfQecMiC/k3/7OW7JRLPl83yvcQOMe5ZqBK+HN
	DhEBaP3SWqafrbjpOGM/D4H8OYbUKq1ya09Sv3KaKpe6EdgaLb0VpA6/qVJVyPeh2XX7oFiwE0f
	PZa+q1R1EliT6N/p0R6T/RJST/KKE+dxH/m577x2vq2c08UPr4iRUu9T5ct0z6qrf
X-Gm-Gg: ASbGncsPF3mpLRihYBN5uaxcSWwVFuedHcEC6FkhguvvGzy7QUQ/U/DZcYj1ua7Z2IK
	aTd9rCTghKNnlnFSqr7oF1H7QXmJQiQKLIVwqAcC8kTQKEmUuuEpntx3v/qCU8Hkl0BHLJj2650
	t2DZZcFbiEpEQMiyBeJPWoJ0pSxGM0xCYnwVqPNLdDedyZUu0JRv6fJczUsMrGrZ5QlV18kQB51
	+Ua/3CdBgjRgm5JBnYT200LI05/qRSbBI9rGA76njfgEit/3jN8cooklNuVso9X38ItEiADJEXC
	xuLdMRf12AsHDWyxtXn11gXqRjx3RPL3SmRpIfm+343nFxUd+3FBeuA5WXz9GgabBjLfLw==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e8a0d390bdmr16624626d6.4.1740750352182;
        Fri, 28 Feb 2025 05:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/oCApv/Y5ObRZE/KFXdLu0bmSyua0FoUMda3K2Tbcj+Kjc3wCxjh+pxAlMy7QurbrRXWsqw==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e8a0d390bdmr16624436d6.4.1740750351841;
        Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d702sm2484342a12.17.2025.02.28.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Message-ID: <602c58bd-ae4b-4af9-acd1-ef4f1bde5f70@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:45:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: crQhBu695JYq2gL8Rvw2G6_MzJne3eHF
X-Proofpoint-GUID: crQhBu695JYq2gL8Rvw2G6_MzJne3eHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK and
> PINGPONG_SDM845_TE2_MASK with proper bitmasks.
> 
> Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index df01227fc36468f4945c03e767e1409ea4fc0896..4fdc9c19a74a0c52ae502b77fb8697a53bef0f97 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -115,14 +115,15 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
>  	{
>  		.name = "pingpong_0", .id = PINGPONG_0,
>  		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_TE2_MASK,
> +		.features = BIT(DPU_PINGPONG_DITHER) |
> +			    BIT(DPU_PINGPONG_TE2),

Neither are advertised downstream

Konrad

