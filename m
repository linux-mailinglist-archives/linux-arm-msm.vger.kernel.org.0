Return-Path: <linux-arm-msm+bounces-33727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF99975C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014421C232BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 19:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCB11A265B;
	Wed,  9 Oct 2024 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PLDK3vW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68140849;
	Wed,  9 Oct 2024 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728502868; cv=none; b=UlZo2cYjZW3QtkeqefOHXISq5gHHHWLtlGkWcFsitV6I63aHQW+5Ue/Q7ROGZ9MAiL4Bgl0gris0J6oz5aNOHTmd43kkRf9PG/tSDQ5Ion1nnvRL6DbJ9Y7Lp8YHBabvZYvR3eW067FrCOcHPL8DJ0OUjyDBctNbh3yA4JCZqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728502868; c=relaxed/simple;
	bh=BKDd+217cn1LMfbyrUUyCzZ1xRCnzswlgzHtfnP9jGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Iai8mHf6QLNPqhQbcD3ryrVQ7wd5pNTe6xsNqbZf/CpI7vu790eLfH5UMbnLdWI2KNZTCbFpzmu619jFdmx2oSy47MXZf8MvCVzpKn7u02bTjJdNrX7Y4eSVmL+pKkeCuSDCRg0EAe4DRJ5v0Lj3ee26aexyR4ur9JNPKwrVk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PLDK3vW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499I6ENY025610;
	Wed, 9 Oct 2024 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpiziDVRQrqq+xMtPzzwcKxJ2d4K9hj1JPy9sBR3yTo=; b=PLDK3vW1JUGm3XFW
	fphoq7n8Rbn5UFzGdKzYsSMx10wzDxVUrUcpOuwmjCz9QtbXRfcD9fT88v4uvIjI
	1sleele330mat5gbMp8XIWLHJ4PmkRMsfzMsSudq6fw3DuIEz3n77bqT9+3tHfOH
	m8vSGd1n2fRk3pi8NF0UlyLUAgB/SgTvC2MO6Qw+YmwEwcBE35veGXbzUX3ajUL1
	2ROSSe6DLvKTRfWmD5won0xUhtkZMSN+uslP2JPUlJB39P2FqcsKxJtSl8jyQ8UZ
	d1NgWL4tjpQKOBnjOYvX7raggT9g1i4RKvOfcAjpHVEJAd0c68TzcXbG9Zj4KmGp
	kpeU5g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthr7tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 19:41:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499Jexs1018867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 19:40:59 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 12:40:58 -0700
Message-ID: <6a7ebf4b-9126-4c72-87cb-a881495f5c95@quicinc.com>
Date: Wed, 9 Oct 2024 12:40:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: add sm8350-hdk
To: Vignesh Raman <vignesh.raman@collabora.com>,
        <dri-devel@lists.freedesktop.org>
CC: <daniels@collabora.com>, <helen.koike@collabora.com>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <robdclark@gmail.com>,
        <guilherme.gallo@collabora.com>, <sergi.blanch.torne@collabora.com>,
        <deborah.brouwer@collabora.com>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
 <20241004133126.2436930-4-vignesh.raman@collabora.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241004133126.2436930-4-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X7KYQapGwg778aSFyokjXVdfiJKpb7XH
X-Proofpoint-GUID: X7KYQapGwg778aSFyokjXVdfiJKpb7XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 mlxlogscore=925 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410090122



On 10/4/2024 6:31 AM, Vignesh Raman wrote:
> Add job that executes the IGT test suite for sm8350-hdk.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   drivers/gpu/drm/ci/arm64.config               |   7 +-
>   drivers/gpu/drm/ci/build.sh                   |   1 +
>   drivers/gpu/drm/ci/test.yml                   |  16 ++
>   .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
>   .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
>   .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
>   6 files changed, 255 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> 

Very happy to see this added

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

