Return-Path: <linux-arm-msm+bounces-41630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9F9EDCFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F0282831FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E064F218;
	Thu, 12 Dec 2024 01:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Te5yZNJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99D22611;
	Thu, 12 Dec 2024 01:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733966074; cv=none; b=uZ9VQvuvvyfWmmL59CDv42aGKDqYEYvTsjDi6UCxJBTQL7FNZvi3Z+TlSi1n+J+A4f/Nz+EJxbErNjh6SBFArv8JyX/skcYe5AUhroyL7DnENpiXIkxkCXhFKn7yDry8PLvaexWuNrkYB247EQlTqpdxMcDmsuoRlHs3/gTRCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733966074; c=relaxed/simple;
	bh=FiNuu/nR/FU7UPx+3TTSxCuhQObqCgFrpQEzW7nWIrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u9Fz0KSnN5iYh0/MxWccAiSx/D7AG08DJjSaS/cgEh5/apOQAa0fCW0jopd4wprrokEnZGwmAhmhWHEeScBPOutzJRXORPVoDAmeiqH9Rd7mFu+vnFZc9l4nTxXZr1ysHpCDVtonLJmzEYxP7DZ08VxFMKSUjP1YGLJ/ah305nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Te5yZNJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD3II029041;
	Thu, 12 Dec 2024 01:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B38WI0vfY0zD3FJhLNd3QacpcrSPNoEjI/skK01muIA=; b=Te5yZNJbiKhMm6hn
	DrUQme/+ACDhWiLKKSB6zWTZkqLGgVUmuDNz89ldc9ObMYnEghBjRVpbHEyFTQU5
	VEEzhBKpOHgxGt3XW5aoWXbM7/CVVzbQiRdhsBBNdgaO/Jm5XzQlU2lNcSMwRBz7
	/5cWetE88jZsMRDXTEIFbBTxk7xB5Y238+RZoc9/oVFi6D3zYW/DhzHYcKSRm/EH
	GQxZR9xqPCvEN09dASN9RluvrAW0MIO0tG6dMYKfvITgT7vyDHo7ToBBrh/if+O4
	ZJ+hHz4PjGGnQb7/No4ErY6T6k2Q/jK36zFNfAqoJjhVXVu5v/R5UouyOhLHpDzp
	yO0L7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xsb57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 01:14:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC1ENr2007646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 01:14:23 GMT
Received: from [10.110.5.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 17:14:19 -0800
Message-ID: <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
Date: Wed, 11 Dec 2024 17:14:18 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jqHhR6o3tTfRBFY69Ad0z80eE7fIQs-3
X-Proofpoint-GUID: jqHhR6o3tTfRBFY69Ad0z80eE7fIQs-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120006



On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> Rather than printing random garbage from stack and pretending that it is
> the default safe_to_exit_level, set the variable beforehand.
> 
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -329,10 +329,10 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
>   		safe_to_exit_level = 5;
>   		break;
>   	default:
> +		safe_to_exit_level = 14;
>   		drm_dbg_dp(audio->drm_dev,
>   				"setting the default safe_to_exit_level = %u\n",
>   				safe_to_exit_level);
> -		safe_to_exit_level = 14;
>   		break;
>   	}
>   
> 

This was already picked up in -fixes, so no need to include

