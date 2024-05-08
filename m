Return-Path: <linux-arm-msm+bounces-19514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D98C023D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49211F21B02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8616E63E;
	Wed,  8 May 2024 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D3y5bDv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0391A2C2D;
	Wed,  8 May 2024 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186774; cv=none; b=CrSt0cmfXleaXLOqm1q9QfqXoiXrOq2kmsdrexqrRhLrLNCPjQV9Ku+ZX7SABZX91h9yKX2CSlvCtfFBSyrz6JaFfHEJu8hWlDottreCkd5Ze25JcgZ12Rar/qHmEEzkFFZmu3dKqv3MX+4QVGtxafDuvLKA34zAvX/NaJzrOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186774; c=relaxed/simple;
	bh=xHDbuERo1kV+X43uuYC8JW1TLQMNAeIkdXxhDeNrWts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tYx4tosQ97Fb/I95OT6qOaMDLplOuA4ar5DhgP3cSYtqjLfqocEXq+sgXVAXd38tOThypHAl3sT8NMSA0xo3PFC21Snu3lnkqyDqNoBPeNfrEIgYTxBoPljz+dCkN8y6vdLvlk5JFKBaj7vngMUqABL2KNvgyYEW/rVEH0UvYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D3y5bDv/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Cr692003477;
	Wed, 8 May 2024 16:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QQcRbdP1TrvOiwGcWZc8A7ebL2foBKGMw4vYbB1n7bk=; b=D3
	y5bDv/ww6Gsn4leQKJRvhzlrQuNVlWUB+efWhxZurCy2SNgVYm09D6+5gd8+FAjl
	leD3WGRZR8RtWk5SIZ+fQMink1+U4JJfnsMDy+WKmvah9fClpo2UTwV6Xg1h43zO
	b8O1jIXTCxsQyxmaO8E1QfFGzJkh1sxWQIcoaN0YHD9NerxBtVKqLNrUqMDnH1kQ
	ZU3lFrFgfQhGnnz0U1XhkEV3YxvoXRR/qIKw16CWJtJDlX9Z72ynmlkAOZPLnjTX
	Uh7Hg06Z/GMr1iOzhAVID8lwNGsMmbpNdkdJJ4NxTPNUym80PqozuSaQNvx+HV9I
	gCej8JgLlS547Xiv1nRg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930rpt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 16:46:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448Gk4MM008246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 16:46:04 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:46:04 -0700
Message-ID: <83b6e1aa-c8ec-0bd7-2c98-20705741b76a@quicinc.com>
Date: Wed, 8 May 2024 09:46:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for python earlier than v3.9
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>, Rob Clark <robdclark@gmail.com>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20240508091751.336654-1-jonathanh@nvidia.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240508091751.336654-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fr03b_TBEt47KehI53EoPrrGLuPf96TJ
X-Proofpoint-ORIG-GUID: fr03b_TBEt47KehI53EoPrrGLuPf96TJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080121



On 5/8/2024 2:17 AM, Jon Hunter wrote:
> Building the kernel with python3 versions earlier than v3.9 fails with ...
> 
>   Traceback (most recent call last):
>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
>       main()
>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
>       parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
>   AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> 
> The argparse attribute 'BooleanOptionalAction' is only supported for
> python v3.9 and later. Fix support for earlier python3 versions by
> explicitly defining '--validate' and '--no-validate' arguments.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks for your patch, I had sent something similar y'day.

If you are alright with https://patchwork.freedesktop.org/patch/593057/, 
we can use that one.

> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index fc3bfdc991d2..64f67d2e3f1c 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -948,7 +948,8 @@ def main():
>   	parser = argparse.ArgumentParser()
>   	parser.add_argument('--rnn', type=str, required=True)
>   	parser.add_argument('--xml', type=str, required=True)
> -	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> +	parser.add_argument('--validate', dest='validate', action='store_true')
> +	parser.add_argument('--no-validate', dest='validate', action='store_false')
>   
>   	subparsers = parser.add_subparsers()
>   	subparsers.required = True

