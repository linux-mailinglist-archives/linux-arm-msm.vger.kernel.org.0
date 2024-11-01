Return-Path: <linux-arm-msm+bounces-36800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C289B9A53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 22:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F3A282AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 21:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3891E32B4;
	Fri,  1 Nov 2024 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kus+8N4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CA9487BE;
	Fri,  1 Nov 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730497307; cv=none; b=hegRVD2N08qTRDjZR7JaRdl193ODtzpNBjnbxKRyuJdrMd4OutLsFI5mnmGyOfIPYitQ9lnBbaLtoqpb8UEFb/f9VrHzupiEUyI9SZvhAkRig2SjsL9EdVjlUu/1bmtlUL4X4UJPj7OExSNUODQkgC0WtR+Ny5/RLjSkD7/qe4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730497307; c=relaxed/simple;
	bh=CiN2uxsNj+DFqml8ELV9oi4hDaOwwmq30dVz/w17Qp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qh6J9bKEkTx7Z/2i7ZXqlnSSYLQC64oAsVCpmsMDm3Vt3MT8HVKzoq9pDiLTHjbJPMQD/Woxw1E/vTzLfW85x78sGauDeBnGBSnW9nf6RVqHVA9+hhmIul7qbOsvwLz96+PDN6d1GMOc9R4YEGPBqRa6B2E/a0RG0QCQx7/zWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kus+8N4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1C4w92019835;
	Fri, 1 Nov 2024 21:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxyvEmleRomRRpxzwY/QMB3t1MlR8jcEBupWPgJsTo0=; b=Kus+8N4pVUbJI4AW
	hCJVVQaDExoYXKQS2dCi/c8BdGLsmg9fgm9nlNxFy0WlX5mkoNfFi9NOHLXZDXMy
	xooGn7IXsoYESSqaZCpiUw6G1aLBZzqVuTorB4IBspfu+Rd7AlyKbr1V4Uy0ygKR
	NFGzf0Nolmf1o2kteNQnFoaCr2ehHD8Vper0AMUYekADE1qvjdqV4TCcWUGnM2bs
	1SndpLjHIsFIQuPMzEytMS0L4kcgqfGWimr+5wD7BXpbplw4Jf76DNRp8j16cEzI
	MdQe43DXLCgFJUQpJTs7cQ79CqTgfjlyQ/64eGw7CTA5c6oQ9J8uMj5g/31SW7Mp
	VHK+0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0rnud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 21:41:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1LfTpK009637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 21:41:29 GMT
Received: from [10.110.96.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 14:41:28 -0700
Message-ID: <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
Date: Fri, 1 Nov 2024 14:41:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TjgjCD5ik6jnu8KxeyIsSuO1o5H0Q3TF
X-Proofpoint-ORIG-GUID: TjgjCD5ik6jnu8KxeyIsSuO1o5H0Q3TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010156



On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> The MSM HDMI driver supports interlaced modes. Set the corresponding
> flag to allow interlaced modes on the corresponding connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 4a5b5112227f..643c152e6380 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
>   	bridge->funcs = &msm_hdmi_bridge_funcs;
>   	bridge->ddc = hdmi->i2c;
>   	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> +	bridge->interlace_allowed = true;
>   	bridge->ops = DRM_BRIDGE_OP_HPD |
>   		DRM_BRIDGE_OP_DETECT |
>   		DRM_BRIDGE_OP_EDID;
> 

I had quite a bit of discussion on this internally because this spans 
quite a few generations of chipsets.

On very old hardware, even before msm8996, there was dedicated hardware 
de-interlacer. But even on msm8996 or other HDMI supported chipsets 
where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is 
present, these were because its carry forward of older interface code.

The way we handle interlaced formats today, is software needs to handle 
the part of dividing height / 2 and width * 2 and adjust the source crop 
if necessary. This part has moved to userspace for recent chips.

Othwerise, we will need to add this part in the dpu driver to adjust 
this. I am not seeing this part there yet. So may I know how you 
validated this change? Something similar to :

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340

If we add this part first to dpu code, then we can mark interlace_allowed.

> ---
> base-commit: c4f364c621d0d509190d673d80a9b23250607b4a
> change-id: 20241019-msm-hdmi-interlaced-1508c1dc9bb9
> 
> Best regards,

