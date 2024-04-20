Return-Path: <linux-arm-msm+bounces-18002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B068C8AB80E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32D8CB21733
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 00:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0033A17C;
	Sat, 20 Apr 2024 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N8ir3761"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFD2C9E
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 00:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713571784; cv=none; b=NXQAtGJhKe3ldOgQC6Ve34ZUbzgwaELqhUBpL2IHfvl4dPVLA+pBkLIC37wYuIxDqrrrmitpeHHt6iYEeXx2H2/qIfG85S69p2yhFQh8lT/uYS3f/VTlH5eg1hpXqRr9lL4/jkUE6FywbM3Y7UpQ1CeH9EJokn1iAene5Xo1Ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713571784; c=relaxed/simple;
	bh=2E9FmtoJbNX9ICC3m5TnYcp2hlp6pJKzGJ7tmeKw/2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lWrgqxblqUOOQCv1sHWU9ABvSDyUKq2k4TC64BQyy6cSaLm8TNMZdoV+NuLSY6FObLvYzgC9dpC9mQlHfVOmEYoMWhXvMm6W2WHXAzoQ+CGxErzaL00A5yShyr4jan2uxjbyN0RapLwQn7rIv1AkLxuRoWfuGkRudDM+n4oqlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N8ir3761; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JNmlbe007421;
	Sat, 20 Apr 2024 00:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KpWHZLFOhbBRITvXy3o30m8+8Igu7d7gXRm5Qus5ajA=; b=N8
	ir37618WoSGQ9oGHNFbUSUXc0G9wAgNoZXvXTkc0IdwxnBgyWFK1SKEeazzHT9KM
	J/doGdfVr75F+lo49btv2wr9K3AO7KFILDrk/LmFVbEFlXlv9mdEt1MJH6w6n8Qm
	Zym7jcGX72Q3G1Q4wZfCzisC9mwROrBwsCTrze3Dtdz9TbtTsNLkQPTD3vAUgD/b
	zqz988Vk9Y2QQEmtLF0hzqYA7j1QT1hZY3GBAnrsUieUBRtXexycMaTYeKNS6b4P
	hKS5itM61pC63mRIn23NjSV261s+3sdFUJ78fROxZ2zBEB/1266lMC6MpBvbHQEx
	AYOQtvMAyqzw2gozue3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkgd729q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:09:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K08qSj030749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:08:52 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 17:08:51 -0700
Message-ID: <2689f418-f097-fbb5-b1bd-7fe6334da5a2@quicinc.com>
Date: Fri, 19 Apr 2024 17:08:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/9] drm/msm/dpu: split dpu_format_populate_layout
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
 <20240319-dpu-mode-config-width-v1-3-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-3-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tZPS9fIVvcOfGASPOz6kLAuPcKxczmL1
X-Proofpoint-ORIG-GUID: tZPS9fIVvcOfGASPOz6kLAuPcKxczmL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_16,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190188



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> Split dpu_format_populate_layout() into addess-related and
> pitch/format-related parts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 44 +++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 12 ++++--
>   4 files changed, 45 insertions(+), 27 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

