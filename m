Return-Path: <linux-arm-msm+bounces-55714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E3A9D085
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6AB1BA526D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B01FCD1F;
	Fri, 25 Apr 2025 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jArYCwMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C0202C31;
	Fri, 25 Apr 2025 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606072; cv=none; b=u9ew/HB+m7/Z7Vo0QOBdfcknSIXdRx3NOu5N5seWLyif9Cuwt8T08j8D0BHpI5lvMVl4oqtGJsqRDpPerQka/QYmlYNY0qqFLPv6h7vMmS40hRKd0Vo7NsEPV8/v9E6WGEgrwYN/88mxD3r7a1gCl3ZnKVcjgxIDoP7qgZP5n8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606072; c=relaxed/simple;
	bh=jz2fj/+mdnovzopxTKQ3wInTsn4dK3PBfkhBVWfsQpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X/1ewOa2Pn1yNjd3CHW2yJ2Og7nplFA3rUs1D5MKAOZVeKIoo687+EUDTM8/C6rkqs/0xEYDX/8mrtvBMP/yaQHbQyhmLMrFvykFStELZXpo4Tr70osfDBrwdMf/TTJwlNl1xs5Of0ncpYOFRB7RPsodrNO/TbvtGurCnh+lx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jArYCwMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqT9004641;
	Fri, 25 Apr 2025 18:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpf3DT5UzR74dZGzrTOa5DHwm1uSbc0G7zvmerjwaXo=; b=jArYCwMm4Xw9sSSt
	L78ye8lyYR5tzLbFMskxmTTzf08pgl1fx7XQ/6pl+eHGt1dI6UE9vuyznzZzqxG4
	9RMZ+TTLrNpVA3oRjHNmm/QZ9Rkkx37tKtLbcy4HaS93NhNGad8ugWnOE8FLKM90
	NhwBt7mbbqvf1GDHpxM9cRAYsikMWtyvFnJQn/4XFlrT2s/Amc0rllZC7U+zJ0D6
	9KCWE3DXI7a1ucJTaD9p0PiHyjiGF/RG3lg/J4Pq7Jh36JBcT4WjwhaP9nVZ0178
	ofPe4nn5ZF8D3dOf2ILM5wu8beGSgYO9djsYwPF0f5ErHPzrtSjyAMjbdjR1xnVZ
	QqzbEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a0w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 18:34:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PIYJu7012358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 18:34:19 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 11:34:19 -0700
Message-ID: <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
Date: Fri, 25 Apr 2025 11:34:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMSBTYWx0ZWRfX9pHbDgD+TDcu CADlErJgBq4+9cSSx7/zm4TZa2uYVI42iROlXc251IcDAK/KHxj36hW73Lj4KQmJ2S13spQuzLL BUtreaFMvzVYdSv34DxrkudrVl8CODTrbQ9H6RJDR3MA0thobvRsFgw+0BQHz+9JD4BlsiYQijR
 v0289tA8/CEqtfnWn15Dtf2nqEZ7JFfUDOvI0jlwsv1Lzl3i37korIPJICb2KPS49svZTuHaHTi FywKo6Fx2oArq9/bSay7mCE0TTLhSERqHyn04aJo8DpFeEnWE3kntBN2AqbF0Vyn7mJQR5/8vdS rhYeq+pUNB8G98YcuJoyUir0HEWXxdw9oUMuXnRPnO4J853ot4tfVYGaKzqd7aBAQA7CXobRa4y
 J8Q7UUDYU11vnqFX0ptt/jpXDH9ykvf3C6E9aQs5dI+k52dH4BeCVdGFeLYWeVEu59uhAOTe
X-Proofpoint-GUID: D6W7qwmaDHYb_wjT_fXSDZgD1_lhhgnr
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bd5ac cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=HeSMwb9fToagm6IspYYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D6W7qwmaDHYb_wjT_fXSDZgD1_lhhgnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250131



On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In order to support more versatile configuration of the display pipes on
> SC8280XP, enable SmartDMA for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Seems like Abhinav's signed-off-by is missing for the patches that list 
him as author.

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	{
>   		.name = "sspp_0", .id = SSPP_VIG0,
>   		.base = 0x4000, .len = 0x2ac,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_0,
>   		.xin_id = 0,
>   		.type = SSPP_TYPE_VIG,
> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_1", .id = SSPP_VIG1,
>   		.base = 0x6000, .len = 0x2ac,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_0,
>   		.xin_id = 4,
>   		.type = SSPP_TYPE_VIG,
> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_2", .id = SSPP_VIG2,
>   		.base = 0x8000, .len = 0x2ac,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_0,
>   		.xin_id = 8,
>   		.type = SSPP_TYPE_VIG,
> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_3", .id = SSPP_VIG3,
>   		.base = 0xa000, .len = 0x2ac,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_0,
>   		.xin_id = 12,
>   		.type = SSPP_TYPE_VIG,
> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_8", .id = SSPP_DMA0,
>   		.base = 0x24000, .len = 0x2ac,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 1,
>   		.type = SSPP_TYPE_DMA,
> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_9", .id = SSPP_DMA1,
>   		.base = 0x26000, .len = 0x2ac,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 5,
>   		.type = SSPP_TYPE_DMA,
> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_10", .id = SSPP_DMA2,
>   		.base = 0x28000, .len = 0x2ac,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 9,
>   		.type = SSPP_TYPE_DMA,
> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	}, {
>   		.name = "sspp_11", .id = SSPP_DMA3,
>   		.base = 0x2a000, .len = 0x2ac,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 13,
>   		.type = SSPP_TYPE_DMA,
> 


