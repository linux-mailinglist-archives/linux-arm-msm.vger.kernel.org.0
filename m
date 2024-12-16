Return-Path: <linux-arm-msm+bounces-42378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DE9F39FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2A016C8A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089CC207656;
	Mon, 16 Dec 2024 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kKgySrun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666ED206263;
	Mon, 16 Dec 2024 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377867; cv=none; b=usaqxsByMHk0XMcm1jtFS/uCE5SYcgei7eDh99C5LFWAUINxC9QcLSlyv7eaYoRdBj3yeJufgMAcs4b6f7VNH+rG37oTvN2eF5RuTOIb+TjaPYL8E7dJ0kQHxFZQ2x1+bo0cX877PXfbpgYcoga2gisw9qQLWn20eMV5ADxBgPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377867; c=relaxed/simple;
	bh=wkngRMiuFU5dS8KBJsgloNT6EOD7A4lL9iheQEXIBIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GC5auGX1kJ5aaIcaGuG+hmVmFuWQuvkPM46jXkRO9B9rM2MZ7J+iFDpjCSvYvqycwIw87Mvnkw6InjhhBj9FvqiXrBSiHRm3cdvyzGBIaYjmoYLvICNDoYPNaelXSQWkcge121j7WtGVBueiMAzZzzvVu/OWyxoaOq46UbBGuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kKgySrun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIbpWA010181;
	Mon, 16 Dec 2024 19:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ9iUpkHc3Sc4uWLqVwn2KjJnao0NtZDFWgqXUkgadc=; b=kKgySrunL2FC7yw4
	mQHwM5wGRXMytMmqgKUJx5/kUTcoyLPgdyGu5DkdlIDAnmNYRErQUeXmFaOpwsUU
	VoBHwCWClm2Bx4AqKZ2fpMtV/ki96IzB4lrWOxBIKYG4JA9w2Xpfkk6tHnmu49jQ
	XiCiv1Tsy+gsA/ShDsAn6Tv0EbgEx2L9hDDk+4T/iReP3Y6twKd88mTDqPul1NmQ
	qMbAyVJbQuNAqcgMw7dPXoZmIuLHtmiFYCeG1Xns0YGUzf6OPv/4YzbPu45k/XiC
	c17x5CKWbfDkuzKnlhQxdHlTn9OGvfLsWaOIHuhp6106pcsxzW7XQzrSOh7NCGGe
	Il18bQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9g47x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:37:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJbcx7024436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:37:38 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:37:34 -0800
Message-ID: <644fb6bd-f39b-4b84-b3d9-004217eb41a8@quicinc.com>
Date: Mon, 16 Dec 2024 11:37:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] drm/msm/dp: drop obsolete audio headers access
 through catalog
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
        <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-3-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-3-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yXy1dm7pHCjbA4_hP7BhEaVbsNDw6cL2
X-Proofpoint-ORIG-GUID: yXy1dm7pHCjbA4_hP7BhEaVbsNDw6cL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=836 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160162



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> Drop obsolete functions to access audio packet headers. The dp_audio.c
> now writes them using msm_dp_write_link() directly.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   |  2 -
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 76 -------------------------------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h | 24 ------------
>   3 files changed, 102 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

