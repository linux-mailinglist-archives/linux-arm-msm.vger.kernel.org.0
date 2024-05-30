Return-Path: <linux-arm-msm+bounces-21167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 261348D55CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF381B2051E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E7717545;
	Thu, 30 May 2024 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LABTvMMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75215B0E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109489; cv=none; b=r7DtqL0m6vhfD8xRXO3T4Xe+hf3hvhyxr4iA2dOEPz8JjvAIgTXZWcKkOnGMAZo5q6/UxyCWJI5PVR1CXvSDv72JsC1a9VLNVeCwZxp6hEbZytD8cakYT8rvAD3AaAQxDkcBfjuGtrJZ4XWgSnX9IOz007ppPNKBU7aQ1XTgTsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109489; c=relaxed/simple;
	bh=7IMseS0lXrNuPQqFFzKGSzijRJgH5RzxKI0Gm/WXBXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k9whX2i3FTyYLT4X0mbVA7YbzSGbpeg3p1V5NPJz1zjHJlhvrXCvSdYOZRbDeTvMHB9qtDvXJEZQuy5eRofz05Z/Hjq0cJSY8bPavk7WccoTRXF1u6D+k/xrCFb1w81cZZ3q1QsjqjcVmNgc6oj3/ujNg3iszYaYEvIwLgoRRxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LABTvMMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMGSm8015967;
	Thu, 30 May 2024 22:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZrhJ+sMGCGsSXipGknhXmqSpHpFL272b3upKmN0bnY=; b=LABTvMMTa+OCXbwD
	CagS4Kp4XLwSafSpcCLwaSTrn0n6xbHcNq5I6JHP0x3Bx3v7yT8ZpkJEQy+kWF0d
	SxQjSmA7fCTQebQCpl4LnPEoXyYKPypcTVFa6zlzOvhGsRdpFs+ypHgfmyjf95EO
	8uZkQjpzXpxxZA70sIXVQ2D2t1UrricTAd0Y3b13Q05P8hLzX6kM1CLXpPA7BhNr
	LrBVOE3h+eMSoqk4aU6AUtkxGuMnMXSGiXGYHjx3ynvkdVOE811o8YGYUoG4TvUB
	pRF49AWqt6O3jfR96DuCFtSm2/bQlVLLQC+q0XeX4CMqzP5lfNjiMrmxLMuFMetq
	YMNhbg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23sr1ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 22:51:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UMpBsb001829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 22:51:11 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 15:51:07 -0700
Message-ID: <fd520806-e362-f79a-26e6-a924acc4f067@quicinc.com>
Date: Thu, 30 May 2024 15:51:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] drm/msm/dpu: take plane rotation into account
 for wide planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W37KfcNBnqvdsPve45JrDrMfKvKCY8Dm
X-Proofpoint-GUID: W37KfcNBnqvdsPve45JrDrMfKvKCY8Dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300173



On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> Take into account the plane rotation and flipping when calculating src
> positions for the wide plane parts.
> 
> This is not an issue yet, because rotation is only supported for the
> UBWC planes and wide UBWC planes are rejected anyway because in parallel
> multirect case only the half of the usual width is supported for tiled
> formats. However it's better to fix this now rather than stumbling upon
> it later.
> 
> Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

