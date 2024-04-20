Return-Path: <linux-arm-msm+bounces-18003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2838AB811
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 493FEB210C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 00:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A23A38C;
	Sat, 20 Apr 2024 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ENajL2kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0720017C
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713572085; cv=none; b=cP9cEDEKPu2jEXcjnSAM+2epgjhnpEir8MB28j4XxD83VYJn4mmAZwCL1M0dLW0oQOzrcoVMQGEWk/yN0JiSoKYgbifZ5biGFfoeMswA/NFdCLH0m6B9+S1DRZjmJ7L//aJ+JzkDj6Pi4u7Hw5ioA6mFaG4OzM0FTkqiF4rhMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713572085; c=relaxed/simple;
	bh=2ysAuYC/7/5sgQGWLXGl3ClP9ZiiImms8TbBu/Zyaas=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s1pXFjmyR7DVpDIXiv+wriN0rbRZ7Ao6Kvdc2atkpvuynzaLn4CidaaE3vaGMJxOc/NbTsiTDAGiRb08+gGLc5v+dEgmqtWiOHEYns0tLC0XnjVBbv4RakCPJ3oRPbI03+aKIsJRm5wR/JiD0Ixq0mzR7Ei5ke+X9gY8wY4MB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ENajL2kq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JNpkYb011743;
	Sat, 20 Apr 2024 00:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GyUDVrFZwwln78QGXjMt684doRtuODlliPK2CTJb5S4=; b=EN
	ajL2kqvgb6FMx5HaUdiM2sXkA52t9VXM8neHuZMB0Z31V/sMEcEH41cnodu8+tHO
	Yqa6GkTFrdbQW+4YtAZdYBNeQWsqq4AE/wV5tvreVfu0ehVWXYUavka0gHzB/cd5
	RgmGmJHxAeA2r1mvoo5rd+UVdfFnv1tUgEWvdFsdvfpCV6dbrq6alWvOrArCj/4o
	lfNRqLx1ALMx3f98mYYwKxv4VQS9x0tlqYNAOdpNAauVlOIaLtXNYd2YxHDz5ivX
	vo8p0uGYXNTKfoij18dQZonnm+VISPB4mVBszzAjXLsDzT0TAEuQd4B/tjFFyuIG
	dsr7sLK3H17G5buplV7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkkss9w6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:14:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K0E2Iq017381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:14:02 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 17:14:02 -0700
Message-ID: <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
Date: Fri, 19 Apr 2024 17:14:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
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
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GeIsBMv4tRoXbN6l6zt_hCxtWqUyPLfV
X-Proofpoint-GUID: GeIsBMv4tRoXbN6l6zt_hCxtWqUyPLfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_16,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190188



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> step, so that any issues with the FB layout can be reported as early as
> possible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d9631fe90228..a9de1fbd0df3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>   		}
>   	}
>   
> -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
> -	if (ret) {
> -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> -		return ret;
> -	}
> -
>   	/* validate framebuffer layout before commit */
>   	ret = dpu_format_populate_addrs(pstate->aspace,
>   					new_state->fb,
> @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -E2BIG;
>   	}
>   
> +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
> +	if (ret) {
> +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> +		return ret;
> +	}
> +

I think we need another function to do the check. It seems incorrect to 
populate the layout to the plane state knowing it can potentially fail.

Can we move the validation part of dpu_format_populate_plane_sizes() out 
to another helper dpu_format_validate_plane_sizes() and use that?

And then make the remaining dpu_format_populate_plane_sizes() just a 
void API to fill the layout?

