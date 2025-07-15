Return-Path: <linux-arm-msm+bounces-65108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253DB069F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 01:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691E54A0FC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 23:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A6E78F54;
	Tue, 15 Jul 2025 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaYCSLOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101912D6401
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622801; cv=none; b=ESuFkboReYx+HeN5r21ktzHAc41Wu4DjQONmad6wJfj0IinBqahzoJRxB+XRwuQScRghfOxkit9OapubQ6bhPaA/YypO1I5kg9Cs2kB7AyGCDIJMHRl6eKKxvS89HXHJT7GpJgY5/BzmNQVZ+/cuGS29KMHawHWGN9JiOmktiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622801; c=relaxed/simple;
	bh=svz0OAuyUwTJj9o6zAsDikYQeCg6mNOHNGiQpMViUMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWY1RGW8pGrh/Er2wgL7cN6/BHun1s1xtc4dtOPgZU6uKh8wfMa5AQnyiEa1SbmKMpbWZzAnmvj0H3+YxaxE8wJJ0JnbwE4qlxxIfl8aAplEgvdq0qoNs/knGoFW/6hnpLA3/osbPfi6eRKtupO4L+50kKMLo0SmYalb0TMYj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaYCSLOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDDUD025752
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=; b=IaYCSLOOLEaD7LrN
	c+4qWtRQIwr9PbsPWTZao3TgCymOOJOmZECQEhAnPDrIM6rlecqc/gzA17hAKjgG
	VnhgYvgvLRa2DAyMv+gUj9QQYFILDfXiW0q473s1UBcR5ZBMr21PyVcIC2rIwF2I
	KxhYX+8Rwkw+YSCi65/ugOgmCrDQgtCjd2k7eYoGmr95nqmJy1CocCi99FtNEwcN
	tCEaPdzpnNh/A4frAfIW7sxs3lu/eXagbkYSXErqXrjFbUHH2N/1fZKxpjpPMeMA
	A/2Gduk5qR2x0fRKHt4IMfd83iPC1GzodJsnGj1EF+85DhqkHvzacrNWyUGxfZNz
	Y/Ug2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy1ntx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 23:39:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so3369950a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 16:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752622798; x=1753227598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=;
        b=DY6RaJmb8//KqRClAbRN39HQodiYDfiZWcJhPyX6dNywy0IrbYuFwtkXiSWq2y5nh9
         bUGJAZ7iu6CHc5i7BoZMmCOCjxhagALl9ZJ+cwt53+0AolhJKv5MGzVrYvj+fhNVnkxu
         IjvBzoPklxzIauQhUQzPP9vxIkv4IkLWJFARpWwvqfKinIt7gJ5m9TYfdV5sbsB3KNbs
         pZcVqV90BRHwzTGxLVRUzUDO+8BSXGx+FbAnNUaVzhH03ERP4pobswRpNLwqomf2wLz4
         HyCIPmtVmiJu/QjDtzL9xLoBwidw5OK6t4oLRxSfYKD/RvuqUAzVPCW71oaWpvi5QCap
         8QLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9mdZtKubW29sz7/om8uwtC9f5GZomVsirDWuwAi8KPJ6JOe0xowFnGTpUzQgD7TW+rLbH6KjpkxeUqiR@vger.kernel.org
X-Gm-Message-State: AOJu0YzATbpg99909TMpRUvWwwpM+oje0LCyDMS7tgxK6Z3jq4lpuJsp
	f3Xh42IDAcARhV9JEIESO9OZsGsnDudHQO1GAQvtkR8DktsXHdbr+w0uhMVFsme5SHZbWK0AeJV
	h8UhrNT8gSv4q4jlDfGGZLTmEaftCs69NGvJOztbz3mg88BrWHqpnbk7WBE5dhDGeUysB
X-Gm-Gg: ASbGncvBsBF6kNMUlMR0NWpuUaNkAW/ZWyH5QqH8ZbVI887OpxqZyLWy7CHWy7LaSh7
	ZEGD+eHKZfVqgNvMY46jTuK81KdFllaNKbLEV9VqgddJP9FCnIS+1mJamDpQ6X7zYv2/5BPmLoR
	4y8/109MwZNjIvK0j6KEoaZL5hb4AS3FmJx8kUM/i73O3xRz+WhpgpJyIEgxdjg0zxEtfMFuK9o
	jXO4fdptiXzuR9M5P1nYICpmG2OdVo5n0MgcKSANqNR5DaWOO/pTrRAH4X/6WTSw9rzz7+3BhxF
	XYUnukAEEnEwDEplVIYuOlDH+OD90w8D77vz7ru0rzpOYSO57HkjZ17tq4albJOWZh7raR7D0wc
	cB2YRznDlHTQp57LqF1chTQ==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id d9443c01a7336-23e25789d06mr7514995ad.51.1752622798189;
        Tue, 15 Jul 2025 16:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf12jj/HXthN2xljhqv21Hmol41Hu+5CcS5uDGOfODnO8leUZVdIm61q3dSm6XrZYdYl3Kww==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id d9443c01a7336-23e25789d06mr7514655ad.51.1752622797749;
        Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4333e6csm118928995ad.162.2025.07.15.16.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Message-ID: <03f4b74e-9231-43f7-aac1-b2ec1b6cf8ed@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:39:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Initialize crtc_state to NULL in
 dpu_plane_virtual_atomic_check()
To: Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, stable@vger.kernel.org
References: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfX0GxKm2/3IUFf
 rpN3+VpyJuA2IvkMImER5jgvTFkClXhhm7U/IH+XpeVqXAJkZANyPBMnFhDF6g8L4moVdTZRrEG
 KvQn/r24baP3/JmJ7D5gWohW109RDIF9oztjvzaCzULi8n+fjRylJ6wvmGGE4/QVt4FsXuTDw8v
 z29bK9LMHtAZ6zKRh4qHHp8BDHtRvUCgk/MPjvvFs1w30FutSNscRs5Atan+WYIi07omMqQZ/+1
 fi3jBW0rLchnqifaLUGrQ3cHAKh/OoVlfzacmuUlFhISQv3B9hOvX0nYggOFHeTmWbLhuyzHrq4
 7E/ksgfJhfSLZTxsGqvRO4k2wJxnbCa4lDYyw1ZaVpTfv3KRSB6+V0/SxqD/tzKUyH9QOF/Q2yQ
 ZfbW0NrnTCWCdyO90Zbh76l55qwccyM5HnVvYNpglbP6cbdGKFhBjRAiCYpWBKldocf/YMGs
X-Proofpoint-GUID: IdhINB2wmMcrb4FZlQLgP6oqhvUuh29V
X-Proofpoint-ORIG-GUID: IdhINB2wmMcrb4FZlQLgP6oqhvUuh29V
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6876e6cf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5QVS9psdCSE4z-izM1AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150219



On 7/15/2025 4:27 PM, Nathan Chancellor wrote:
> After a recent change in clang to expose uninitialized warnings from
> const variables and pointers [1], there is a warning around crtc_state
> in dpu_plane_virtual_atomic_check():
> 
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     1145 |         if (plane_state->crtc)
>          |             ^~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1149:58: note: uninitialized use occurs here
>     1149 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>          |                                                                 ^~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:2: note: remove the 'if' if its condition is always true
>     1145 |         if (plane_state->crtc)
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>     1146 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1139:35: note: initialize the variable 'crtc_state' to silence this warning
>     1139 |         struct drm_crtc_state *crtc_state;
>          |                                          ^
>          |                                           = NULL
> 
> Initialize crtc_state to NULL like other places in the driver do, so
> that it is consistently initialized.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2106
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Link: https://github.com/llvm/llvm-project/commit/2464313eef01c5b1edf0eccf57a32cdee01472c7 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 421138bc3cb7..30ff21c01a36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1136,7 +1136,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	struct drm_plane_state *old_plane_state =
>   		drm_atomic_get_old_plane_state(state, plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state = NULL;
>   	int ret;
>   
>   	if (IS_ERR(plane_state))
> 
> ---
> base-commit: d3deabe4c619875714b9a844b1a3d9752dbae1dd
> change-id: 20250715-drm-msm-fix-const-uninit-warning-2b93cef9f1c6
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 


