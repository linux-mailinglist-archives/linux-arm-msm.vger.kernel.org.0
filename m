Return-Path: <linux-arm-msm+bounces-21522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD78DB6C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43DDB1F23759
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A78013BC0C;
	Mon,  3 Jun 2024 21:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9JL9KwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBF713BAD9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 21:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450024; cv=none; b=TWlzHd1ew93L8wvTKKUpz5Gw/TL+Ueg3IPUkdyDpyJXueV0K8MkrK+GZSgP9VPa80/TsreSw28N8mx2UV0lmuQiwtgoiXbF6+u4mfUAc4FRcqk/f2MULMU8qUJfYsHY9t1lKvt9hkEtgcbXux7XbAqzIyBw11eNuacyrsDlupJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450024; c=relaxed/simple;
	bh=B6RTxNG3qSeWdnrss15uJxMkYMUg2WM2scr2cXyOxDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nI9B2Q29D6qvZc473OANE/khYUvrc753klVQAJzQtAMSz3TV27MvDIi10Eqm754i25Oc4SVLqDfWYEOwijUj1DhuygBv/205M0/X7bNOPRQtQdA93tvKUT0MWFPuI42hVHjfx4Yt1SboC5CPwzdktf8oPGEoX/y75nu6l8eIjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g9JL9KwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Bm0E1014353;
	Mon, 3 Jun 2024 21:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Vsg/7i4TrMa5VqqJmBGZbSvUazxMubExhCzCHIm2Sg=; b=g9JL9KwOTPVO07FD
	zPgxRjAPfdw9kcIrFp+ilmjnbSlrc0wUYsblmzaoz4GriZ0/IrXWXix1sKxaOkzx
	keTboGGHuBwbkkh0GTBb6pJvPrZpOiU/1SsVCpdTFSx84z1VEbRS+fhoo+35BJbp
	0BImZdyfU+0jOt/ZM3JG6gL6DjrnXKwPVL62Fmq+tyujFsukg9sOCV4UZkJ21EFm
	Ary+mdenkmqBuLD8kywagZwlyBfNTGPWvDjtsQJYu2GiXWIYf8ZQ37wvn8srJ9HX
	LCVxl8rh8/en9H3yRytAbdzz/3UfhYp6cNQPquG5f0l1KnVbByv71ur9MifXvGXA
	s4zLzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4an9hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 21:26:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453LQqoS029796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 21:26:52 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 14:26:49 -0700
Message-ID: <d1287bcb-5410-c44b-3ac1-62b404c1fbe7@quicinc.com>
Date: Mon, 3 Jun 2024 14:26:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-9-16af520575a6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240603-dpu-mode-config-width-v2-9-16af520575a6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6-uPctjtj6AywfqVv0SSeJKSRF8m7r74
X-Proofpoint-ORIG-GUID: 6-uPctjtj6AywfqVv0SSeJKSRF8m7r74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=982 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030173



On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> Lift mode_config limits set by the DPU driver to the actual FB limits as
> handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
> to the drm_crtc_helper_funcs::mode_valid() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
>   2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c5e874a3656a..8cf063e4c09d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1236,6 +1236,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	return 0;
>   }
>   

With the added checks in dpu_crtc_mode_valid(), I am fine with this as 
it will retain the previous limits in drm_mode_config.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

