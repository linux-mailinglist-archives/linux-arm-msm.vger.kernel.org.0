Return-Path: <linux-arm-msm+bounces-32032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61897CD8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 20:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED1101F23502
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 18:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875CA1EF1D;
	Thu, 19 Sep 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FWAylBn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C442C87C;
	Thu, 19 Sep 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726770501; cv=none; b=fVOcD8kHh0zD294gNEhzNuA1mbPYvLLcgF0ovnNQJ36KrnkJkizwfukVkQ+T6+BRkK33RennE8iQHFQXAZkb5tiCQDskuwXifcLdtTYqmYzajpDcmo/KMLeoBEOZVB1qevllXlNagWv2ghL/e8sZOx8ryabT4msj6STasBeuBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726770501; c=relaxed/simple;
	bh=UoNK/cjA2OlXExzMl1VlJI9PDhYRy/brc5cM/w2oeHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oNx/YZst+uiXfs266vW/ltJpYHi6hEdmnGxmn9qUzL/0HB2xL/Nqew3iWQ1GY3Fv3BBgcnsHYJ2JpYzVGGSJgCzDX0SODBiDuB7y+QLLOVhVoUA7Ri+gUmG8LuHavuLc4unBhXY4Bnx53EoFEigxPsdC+Fu+FPFCBAd7/X7jTu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FWAylBn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JBZKKZ030850;
	Thu, 19 Sep 2024 18:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6rWaz5VkVg0DzOHeXT5mJM7S9+sUuoW2B1W7R+FgA0=; b=FWAylBn4nN/66+BZ
	ilwpv6P821RiUAr9IvLqMvNdyxEKkjcZS4L1+Me5cgjTvg4H8f9gWNQqrJiY80vE
	4wx+XN4IISHWgztCaAFEgOXPUwGd2BSOUNFja3pzz77xhLMlyrMY4aIELL6Lu6Sy
	HhUo3L03c1NSw71cL04qiKvuyj1r7esUxAUqxWx4uMESR0x89Rq7mGVRkmEycrb3
	FbMWUQpESJkTLkvVTVY0PgVuNZV5/h4je0f6JWcFaeDC4Hc6Psl4jxWUKTLoYKwf
	koFXbHrLKIHu1xFXty6mN/VfGPCQvzL9Al4DivFB6EzOeCdxEuKnKCaM78PIHDRJ
	XvrrZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hheb02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:27:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JIRBdm023458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:27:11 GMT
Received: from [10.110.111.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 11:27:11 -0700
Message-ID: <e2656024-4ca0-4898-9a2d-7df54c40ac7d@quicinc.com>
Date: Thu, 19 Sep 2024 11:27:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dpu: drop LM_3 / LM_4 on SDM845
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sravanthi
 Kollukuduru <skolluku@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jami Kettunen
	<jami.kettunen@somainline.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
 <20240905-dpu-fix-sdm845-catalog-v1-2-3363d03998bd@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-2-3363d03998bd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IABmKMX9h5fOTHXixWpMIJJa0HkKTy1j
X-Proofpoint-ORIG-GUID: IABmKMX9h5fOTHXixWpMIJJa0HkKTy1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=762 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190123



On 9/4/2024 8:26 PM, Dmitry Baryshkov wrote:
> On the SDM845 platform ther are no LM_3 and LM_4 blocks. Drop them from
> the SDM845 catalog.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

