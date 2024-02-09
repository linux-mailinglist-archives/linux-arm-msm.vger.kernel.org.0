Return-Path: <linux-arm-msm+bounces-10420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77984FFE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2061F22E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C55B24A18;
	Fri,  9 Feb 2024 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eKH0/cov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB021350
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517725; cv=none; b=mMRF+ymh0ZzhuHJfRhFE65+TkN389i0hD/nudZTezibWuvpLh5niDD8EWqqU67VDGszMT7mM2xkQE+P+t8CFoFF6JTnp7TxYBVCn+eRq1e6WNjDHzFma98HAeqX2JZobvsDE953p56gk8jt8YnrAcyHO5wu0TNxYTm+8RIxeQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517725; c=relaxed/simple;
	bh=fkx+g++TQWJkIvSzI352C5iy1NfUb8bmU7GPN9mw1wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MY6lTHOApgNdQ+KO11urqRVVXk6DlE0Cr+XQeBC6gJ0LWGHcM7N/jrIvQBTsCc+vr9jeGo8x0UASHkOWqOsfqO4uB3cAXVvSARyrvuMKTUrlFVmYEpX86UCukwz5u7bTEVfFfUYyuxsTkYGbdYLlXxKilu0VUG8B6RiDoyXOWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eKH0/cov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419MFCkY011697;
	Fri, 9 Feb 2024 22:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oo5ysK421OQklguivCEPzyBLkF66DUE9RWrmo4QV5gw=; b=eK
	H0/covPLWr45sN8RoRv9Wjyg2YNboYaoTFvN+EI/xagf4HlHuLqbSPLq1UW9F4at
	CaHrACeUPpwApppnRgoghoc6iiYNyKmRZ75sqDyzoE+hUO6OtINdijqEer4bQUFH
	4/70JCiIjefN9aU0b0XR3JUcxZ/K75CeXMR2N7Q82erm29l3nd5YY2dovqevDci9
	4THX5kPT4NeVhZV5i87i0RFyvZTQ/HG6IA2lM/APXe5ckszvwMH1L7jWu/sMeNWb
	EYWFNXcSJ+LxSJoGakKOAKZCUqeIhV14kssbRnOBCfRagL7ciVD0FGE4gblChoTA
	VjJ2wEixu6qw7HtlU6Xg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5gk2hnnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 22:28:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419MSUis027146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 22:28:30 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 14:28:29 -0800
Message-ID: <8f740281-f0e4-6a4f-10bb-66604618a2ea@quicinc.com>
Date: Fri, 9 Feb 2024 14:28:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 3/5] drm/msm/dpu: drop global_state_lock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
 <20231203000532.1290480-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203000532.1290480-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D9VPgtLCtW5mwu6JpHaJHVZlZXJ4Uk4I
X-Proofpoint-GUID: D9VPgtLCtW5mwu6JpHaJHVZlZXJ4Uk4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=618 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402090165



On 12/2/2023 4:05 PM, Dmitry Baryshkov wrote:
> Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") the DRM framework no longer requires the external
> lock for private objects. Drop the lock, letting the DRM to manage
> private object locking.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 --------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 1 -
>   2 files changed, 9 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

