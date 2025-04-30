Return-Path: <linux-arm-msm+bounces-56184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65519AA3F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917CA16D6BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38514685;
	Wed, 30 Apr 2025 00:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQoEv9v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13825A41;
	Wed, 30 Apr 2025 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973352; cv=none; b=FcDukc+Aqz6YdMcoLyZhncAh+N2Siq0dHnqu0Fq53ITTMdEPO99f9AIG7eAGrV4v4YZm0wYpW6ed1EZXk5up4pdFs/vt+nlhjOXvKWMfC/4B2LqtiStmBR5SeLqpjg6reavUNrXPZHArC7K3qDLZ2EdGuXdJAdbq+jt0TV293lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973352; c=relaxed/simple;
	bh=lzxRzec6UYKTlnp+xedofFxMIiRdydhdPIX/NrX+u6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jKARv0Rt4476T2fcGazlLFs0esuu91DyN/iIXNBvo7zd0gIMfqBnrNZNYRp7f07LKIiLMUsYg6PZEsZ9NYaJCIJ7Xh7gvbD5foxj3bgu4EWVB6u6QdauV70qjxpFbeK4F5g7JyMdgF2g4eoQtKGRxQGCcSt5KLnTYGsU6M25/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQoEv9v/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaOsN012223;
	Wed, 30 Apr 2025 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1GdN2PIV6w0+kX/2ENmj4LjCy54IKx3CxCONNwRHUo=; b=TQoEv9v/8JpaA1uw
	qab73Z5y8tza4bQZr+hTp3eSae1n7+kjgx22prHIRzlgHuyfsA/vvX19pEfp0ozF
	b5QJ7IvaXd2hq7WrEfIMMB0eL8QBZhKH1HSYvisdfb9Q1I37asxTrx6fzWRqKNLr
	lIv6oa2Kosz0GFCHtmi0UHrs9rs94H8FBCkau9voiVzTXoQG0JThkMEWGBQTQW52
	IhsqevlseDdGqWNsfDNowd3W8SKtLN7ZPjsqJswQMSczoTh2WoUfcNmnWq5Mnlq4
	5JzYsLCA1Q1IG1q/frW8dVb3C5eooX46lx8U0racghozA6iIi19xxSTuxhJSGUnJ
	IquJhw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3raf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:35:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U0ZYZC029636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:35:34 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:35:33 -0700
Message-ID: <4b146012-d9e8-446b-ba71-700eae70ae60@quicinc.com>
Date: Tue, 29 Apr 2025 17:35:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-6-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-6-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6811705d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=9AL9IdXUWAWazHr2eOMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9XXKxcSfO2wOTydxxq_OhKLR2IknG_Yd
X-Proofpoint-ORIG-GUID: 9XXKxcSfO2wOTydxxq_OhKLR2IknG_Yd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMiBTYWx0ZWRfX7XqW5JTzAWtF IthBLajPqKdBuPnG+CZe9bGGus+gXsNUZqi+SYyATj/iiXfpsLjFOvZBmm+jPQMzgQsJ0fMLm9j qIU5lWOBEPbSNC6Mt6fWP4wEl1Wncj9F2mf+lf+OYua9kHv2P738lSpMJsKwG2zL1HAGNIMwY+n
 bPF2d7HNibCapSgQM3GNmV6uHhMIzjx2PmAcrbUkAG3nLeaKRXd0ora1p6/D9CXXR+tLVtNRj2J SHTsEGgHe5hm9hkfIsZ/2cGApTv8tu4A6FYNR5+fs1tfwyMAoMq96D3xyYbqKjVK2L3Asl0B2wV pzP3FIrr9tc3rgP396Mai8EXvJYXAh1oWxJR+iDylt7/NWPGfoEev3PeGIQ+BVmiCWchPs7b9gq
 ZsTDHPi0XsVOnC+OApMLH+AKWe4XkLco9Z+DAQONFijcsArhvJLTrAgquQDeUwlpCnXRG5MH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300002



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Unlike previous generation, since DPU 5.0 it is possible to use just one
> CTL to handle all INTF and WB blocks for a single output. And one has to
> use single CTL to support bonded DSI config. Allocate single CTL for
> these DPU versions.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 28 +++++++++++++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>   2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 3efbba425ca6e037cb9646981ebb0f0354ffea8e..c72b968d58a65960605456e752278def2a21df7b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
>   	/* Clear, setup lists */
>   	memset(rm, 0, sizeof(*rm));
>   
> +	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
> +
>   	/* Interrogate HW catalog and create tracking items for hw blocks */
>   	for (i = 0; i < cat->mixer_count; i++) {
>   		struct dpu_hw_mixer *hw;
> @@ -434,20 +436,19 @@ static int _dpu_rm_reserve_ctls(
>   	int i = 0, j, num_ctls;
>   	bool needs_split_display;
>   
> -	/*
> -	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> -	 * control path.
> -	 *
> -	 * Hardcode num_ctls to 1 if CWB is enabled because in CWB, both the
> -	 * writeback and real-time encoders must be driven by the same control
> -	 * path
> -	 */
> -	if (top->cwb_enabled)
> -		num_ctls = 1;
> -	else
> +	if (rm->has_legacy_ctls) {
> +		/*
> +		 * TODO: check if there is a need for special handling if
> +		 * DPU < 5.0 get CWB support.
> +		 */

Regarding this note: there will need to be special handling for CWB for 
DPU < 5.0 since one CTL will be driving both the WB and real-time encoders.

That being said, the current driver only supports CWB for DPU 10.x+, so 
I'm also OK if the special handling is added whenever CWB for DPU < 5.0 
is added.

Thanks,

Jessica Zhang

>   		num_ctls = top->num_intf;
>   
> -	needs_split_display = _dpu_rm_needs_split_display(top);
> +		needs_split_display = _dpu_rm_needs_split_display(top);
> +	} else {
> +		/* use single CTL */
> +		num_ctls = 1;
> +		needs_split_display = false;
> +	}
>   
>   	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
>   		const struct dpu_hw_ctl *ctl;
> @@ -465,7 +466,8 @@ static int _dpu_rm_reserve_ctls(
>   
>   		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
>   
> -		if (needs_split_display != has_split_display)
> +		if (rm->has_legacy_ctls &&
> +		    needs_split_display != has_split_display)
>   			continue;
>   
>   		ctl_idx[i] = j;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index a19dbdb1b6f48ad708f0d512c2460d092856f52f..aa62966056d489d9c94c61f24051a2f3e7b7ed89 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -24,6 +24,7 @@ struct dpu_global_state;
>    * @dspp_blks: array of dspp hardware resources
>    * @hw_sspp: array of sspp hardware resources
>    * @cdm_blk: cdm hardware resource
> + * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
>    */
>   struct dpu_rm {
>   	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> @@ -37,6 +38,7 @@ struct dpu_rm {
>   	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>   	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
>   	struct dpu_hw_blk *cdm_blk;
> +	bool has_legacy_ctls;
>   };
>   
>   struct dpu_rm_sspp_requirements {
> 


