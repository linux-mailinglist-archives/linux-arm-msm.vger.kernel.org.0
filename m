Return-Path: <linux-arm-msm+bounces-60655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D575AD2147
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3EB3AC460
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DF618C930;
	Mon,  9 Jun 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzHTThpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E222AEE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480475; cv=none; b=dkWU8a8SMMz9h1mBTPZ4exwO9dNiV/2rjCwaYL6zUWeiZuh9Tz6r+f1tvQSRTqqVJkPo73iTc6xGYbtTqCALI+yqpph2But20YU840KCd7SyEnxRwO4lDhWJzR84g0bgw84fOgDoxAPxtfCLi1n/jBX/xB7KHXMuBXygdybq0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480475; c=relaxed/simple;
	bh=t2H/PV27I+6OsQidRIxbGZeAfK77X/pAZrruQSHwRVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2EhtZBgOnI0wTg9UIbeMnLSgr6DgcP5EbF2TX8BG6sHObhssNEEOw0GWusDKAzws51rs7sh0ufaw21lnUB5B11WHHUhunvZjPVo1vNWRb/lRqKLO+6AR5zizWJ2CNYYPhJufyoDA8qosFEufX2pyk/K25QHRh+KgZwlj2wAk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzHTThpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Pofn001471
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tuaiCNKngsyuTcrXO4lY5lHn
	ox8s7k7WOsTYEjpg4UY=; b=UzHTThpBROAclNP4kYRtw2hgs+cIFI+Ns8+D06xI
	2QX19W3nKhoQWqy+lhNiHpBbDVoMipsjLpj7usoMWLcn/0bAqXMpFwe9eY5TBaQU
	KSQd4Jk0NohfT5IJ96bEScFkG3ScRjuMv5WXw6swSMH1JGel7zcNYx/dx8pPnisD
	8Yw2EBWFUk8JptUvUjAYZfOd9v2DQig5RKZYtVsuKrXVMVh3/lM4Supzl3rmqVv4
	1pjbyp8o9HTOwPFt1rsrEGIAFoyCly13F+2ANap7BuQyle9gHh0RsiGJsuknGBaF
	zxyvCkn31MtVaCDx45FVe2yoVRYnFXpxXLexOQCmuG4M3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6694q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:47:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so753611885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480470; x=1750085270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuaiCNKngsyuTcrXO4lY5lHnox8s7k7WOsTYEjpg4UY=;
        b=Ss0X/6C08DOpdh0sJdVlDGsXY01AHgM5IDqpbHUQ0MBHO6AKcgrbSFXFbTboCEzlsf
         29La81e8zB9EhbJDlt9i8vs3gm2avHGKwpD2jV+J7aWNPRll7f8AwF8ToNbsRma9Z5Lg
         oiJgLTKnr0tObueMBeZrqVlUBor+/z5PSU8dMIpdjp0Jfk0m6k8s34OBlts4+0Chusae
         jafj0iENRaj8PENBswRXSsyr/xuj1lPKsurkA1TDUiCPA/DqfvZJ+30tafnRo8YUr/f/
         hhvnSwr6hjdP9Z3zuy9PfQCXrkMNWAzzqdkIH2V2dSruW5zJL+pAPn87y9OvVLEPG0og
         5UdA==
X-Forwarded-Encrypted: i=1; AJvYcCVO7CO+znLcsb60adXzAqmGMkJt9mqqQkAX3ZEb9ZFe47EYS7CBKIn4Z4AUZ+5yTGR+CDodwjRNIcRWRX/k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Vcsc/wQb2JbmTaJeefL3qqjbHk/Jcd2A2HRhzyNEF/VwDEqz
	ND2IgMjOf0xipFki+37tqEPpnRUsuAVBEeTk91hVh0Va1wyPBenS7kSKiLjeFuOfF/H604xoNi5
	qEblBPae2fPXOtlETR8a/18aT/RiCjRcO5VObaIlif1PoUrgMjFhByEi5Rjd2Z/+T+xHm
X-Gm-Gg: ASbGncsSCYoEX53j3pke1ZvfEiBB46i1Msqdt8Yu+aMs5AymfHvVkpUQSXD1jziK97t
	zCwQGAUyX98diK6uHDzzkrVub2AfSMSjOXY+Ork+Rfo2lwSCH1U3nhKuGwgy9Kb4fIi7ArNXaVy
	GP1xbtCuL27aHOCnn0o3CSXQBP185dSQJW02xjkk7wlPBVSQ/xloG3MID8OYNAcxTiAtQhncQ5V
	1Uzj1xbkXkjdKSRebtLstKjvEwcdqHFdPrA/HkrhJmpcOALuEHJ2dPTjIcobwbBimjmUCIryBNI
	Uegacuwl2+EBnQYG+RNTJU6as0QpXaMdimj4GNnUFmIjhZSzWGoT/TUU3SqK4qBS9psjG1ptcAk
	=
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id af79cd13be357-7d39d155b1amr16768585a.19.1749480470632;
        Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1IE11ont/nfDyhFTaWdajrMX3DfUNne8k9aK+3myxAzvAYnGnjtSxABOB2Bn0WlsuVIf9WQ==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id af79cd13be357-7d39d155b1amr16765785a.19.1749480470260;
        Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cab5c1sm11928561fa.54.2025.06.09.07.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:47:49 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:47:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <xx6v4lfd5cv24ce2kqtt7kverk36snydypeaq7h2hgjti5iadq@japcugke524t>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX03ep4XuoI52T
 sjBBQE+rtI9AKpGQmThQG5lmt/Lu3O/cHZiwEQzmRZQAQC9J1vPEkogOmstb5NLQkCGCmXRPOkv
 15cpU6iIhqL5CUvR87GNXepNwe1c/yPBMPgP4yCuPecHUR0zD69iX4fNxRwGJXfLnWhT74Zfjfb
 XGFlEiJvR12rZd4Uq+HlTpizzg6PEjewxIgtKxhmXh6IH8KrPpChDwCz++qfbV+Br6W+MLmiF1y
 UsB649wNucq0LKKbubID3GtvCeN2Oq3w9HlSjyFVWBR2zXHy5NCj+HfecTI1jKZhzVpuqxaSMSs
 4zJ/ZE/H+usZlN1KjebUycP8LqVYtM+zbSWgIHym45Z0yr5KdO1AXlfGaghiFnrWceOcDFe9wmc
 9FD/UgLy3A6JUmyEB+/wARqxPms/M02r606MztXRDLR62MfaXCurihyArxQzAjPsW6ZcWKKO
X-Proofpoint-GUID: dW2eJBVsHYsfDGpPGeXCbXPk_uUK90mX
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846f418 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xwcYTDe4h3asnKb2uucA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dW2eJBVsHYsfDGpPGeXCbXPk_uUK90mX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:57PM +0800, Yongxing Mou wrote:
> This change enables support for Multi-Stream Transport (MST), allowing
> each controller to handle up to two DisplayPort streams. As all
> necessary code for MST support was already implemented in the previous
> series of patches.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e..16196dcc9ff4ac6a35b6bcd8d433b08f7d18fe5b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -127,8 +127,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},

I thought few patches ago you wrote that this controller should support
4 MST streams.

> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

