Return-Path: <linux-arm-msm+bounces-39609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C59DE943
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2F20B22823
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BD41422C7;
	Fri, 29 Nov 2024 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHTC/nPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD85A4D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732893709; cv=none; b=emPeGNT678PrbtCY0UQcit35+tCg9S2FoWGCYS0FAHBXIM/fF/ddhdCTAztR+3fmEA/VK5unc0iLX4Lp1K+CpUPkhijCFEJYjoXeZYJIxSpbV7KfEPDmhc778pRonoyjp6RdYinexO/WBRU8O98aoN+7hG8TdIncgNus5MLgT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732893709; c=relaxed/simple;
	bh=iMdEUPork4q238ileCpoenp6O4BbjBJRGZm+6y+TZVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1jFHFRE6iMSMs8M+MIJXBA1PML6eStA8wlKnCKx1CsNbEm42yf/y/hqsZEY8Q7sBF3YzhivJup6VlZ9FJUYt3+fK7ZfamtjQVcIj5GhO8FZvEz1SAd+C2QgFHGb9Mh6vlhfn+XAOvxfgiF5/bkh0Gw5RCACZjsShj+oJkgYSF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHTC/nPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATDMoql011245
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ5mIRsH3o55KXnabuNYt4mdIaB82lRdAStGmMYH8Ps=; b=mHTC/nPpbmztynUd
	6C3NhK5OlOdVnYswxs2VRl+6zV6i5RC9FMf78gOBnBVPnJQX8Jm2wDMzdSKp6t5b
	Ddt7aRW3cBQJanMh2ss+Y/P155/CEtobtYKNNO18uXSvMFoJuRhj26fDgNCrUqih
	D0MwQUlDU2db3EzGj56Aozvw35MYWG0pbQDfjXHOsHs1NZeFzK9+eQn+VO6+O3Ly
	Nnj20iGK4I3oy5lHh10wvFt0DpnARFf3n3WFvDGGH8E8yk+6R8FpF0QkKsmaTZJh
	OcTZ7cyL+4ggGu/RM8UcYT1F9excORDRVYc6Q2LiiVqdo+8WucmevfRHnq7ufuQh
	I4Gd0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y05tv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:21:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4667cab5e1bso2997701cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 07:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732893705; x=1733498505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ5mIRsH3o55KXnabuNYt4mdIaB82lRdAStGmMYH8Ps=;
        b=wlXtvbtI+dmdUe0cBsJ4YGXtRZiWf4E8UghQCJjRctgyER13yMHNVYXGoED9MOGI58
         1YLWO9Mtojik8p6h4/adld/3/u7zTifdVnLIhXwWlrZydh++QFuMC/jhgWx1b0x9xDvi
         Z9Z866ToyA685Zt/xE48noo0wcBgmjEeCzsU3Wyco5FzdMS8MbYAQetnEBdcRaGLMSF6
         Q5hPnrlxX90zXXVhKOPg7Tnx4SLbT8oE8xZv4H6gfK3ABMf9SaGmfe0oshO9ZZxJyd9i
         luuoD7oHlxkqZquVGmrCpq2X2/cw00r2FVCXb2X5Jzy7uhAYObaH7lZuiqlphW52k+P1
         ENng==
X-Gm-Message-State: AOJu0YzorZrbzm431W4Y26FU6Cijop6xn/knKGfShTuCtCVES+jdO7VI
	uR6Dztw204HVwMumcBSnQWe47jvOv3reJchTWkjEkZoQEDm514jTxKzhWmFc99TalPoXSpLCMfQ
	b2AzgUMdfqP6a6v6wn7Lxp0Vo0BN/dUbE07rKINfoaoIIUCdV4uAvuaaF1xazV8de
X-Gm-Gg: ASbGncvr6MK3oV3mQzR6K0BAcwIp+KQioTyWz2gVI8VSyhNM9IVjd/D2FPkNz+S0aVC
	ZDJl33JWangjb37qOD3+3r/w5F5z02aChDjlyxjBxBpW2YlBPL/wBd1Dh9sETsbZn8kFDx6UHKx
	tukorEAKfrIWd8IiLTI99Kcegs3ba+gAQWxeMHZMLdI8Yd77g5U4zlqEire6DF32texfifi+azD
	6+P5Ru0gU+Pzbi4HqifXf7B6IElJgR5rs1eKDgUrFKtDtpdYY0YYwQFdLOBnVQH36Cukl10aGNF
	l0FkygY9BRm/xkn4W+EZOUIbEP4O/oM=
X-Received: by 2002:a05:622a:19a2:b0:460:9acd:68be with SMTP id d75a77b69052e-466b34ed7b1mr72740051cf.5.1732893705113;
        Fri, 29 Nov 2024 07:21:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqnFCjvQhGdMrBi/YsC5bYvvrCBQFiBOX8WXQuxWzWQXGXy14AWNHZB3lTPTK/1au+rgfZ1g==
X-Received: by 2002:a05:622a:19a2:b0:460:9acd:68be with SMTP id d75a77b69052e-466b34ed7b1mr72739851cf.5.1732893704650;
        Fri, 29 Nov 2024 07:21:44 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f6c1sm1913718a12.11.2024.11.29.07.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 07:21:43 -0800 (PST)
Message-ID: <0dabac7a-bc7e-4075-86ed-3d4c25908ffb@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 16:21:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fVPJ6AHoN-EMa-xMwHGKa5FtBXd8Ztrs
X-Proofpoint-GUID: fVPJ6AHoN-EMa-xMwHGKa5FtBXd8Ztrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290125

On 28.11.2024 11:25 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the othe side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the bandwidth against the maximum supported bandwidth.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
>  4 files changed, 194 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  #include <drm/drm_gem.h>
>  
>  #include "a6xx_gpu.h"
> @@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/**
> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
> + * @vcd: virtual clock domain that this bcm belongs to
> + * @reserved: reserved field
> + */
> +struct bcm_db {
> +	__le32 unit;
> +	__le16 width;
> +	u8 vcd;
> +	u8 reserved;
> +};
> +
> +static u64 bcm_div(u64 num, u32 base)
> +{
> +	/* Ensure that small votes aren't lost. */
> +	if (num && num < base)
> +		return 1;
> +
> +	do_div(num, base);
> +
> +	return num;
> +}

This should live in include/soc/qcom/bcm.h, similarly to tcs.h in
that directory

> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
> +				       struct a6xx_gmu *gmu)
> +{
> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
> +	unsigned int bcm_index, bw_index, bcm_count = 0;
> +
> +	if (!info->bcms)
> +		return 0;
> +
> +	/* Retrieve BCM data from cmd-db */
> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
> +		size_t count;
> +
> +		/* Stop at first unconfigured bcm */
> +		if (!info->bcms[bcm_index].name)
> +			break;
> +
> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
> +						info->bcms[bcm_index].name,
> +						&count);
> +		if (IS_ERR(bcm_data[bcm_index]))
> +			return PTR_ERR(bcm_data[bcm_index]);
> +
> +		if (!count)
> +			return -EINVAL;
> +
> +		++bcm_count;
> +	}
> +
> +	/* Generate BCM votes values for each bandwidth & BCM */
> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
> +		u32 *data = gmu->gpu_ib_votes[bw_index];
> +		u32 bw = gmu->gpu_bw_table[bw_index];
> +
> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */

Ditto, perhaps this should be exported from icc

[...]

Konrad

