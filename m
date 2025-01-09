Return-Path: <linux-arm-msm+bounces-44489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F38A06A43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 02:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A6518898BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 01:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE631AAC9;
	Thu,  9 Jan 2025 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fQ/8qyTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D417C61;
	Thu,  9 Jan 2025 01:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386112; cv=none; b=OLPXSp0u/yp6oZyB8U858b5SyQye0D+aJB1EU6EYdcf/Fqt+RVplxVUcf5PTTaw4bZJ98Iul3GL8XQQ4WgMuS1dGTeHsRQ7EVhzZWP4UNVlgl1btNco2VmK7fAULAcmkH8VXW7TpRgkmt4fy07zOtqSA6nydYrNHd/F7LlnxbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386112; c=relaxed/simple;
	bh=IRzjYXIiDE5bRIi18r5svFFJ8DPFiDvd2Ji861G4gOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tr1IqaInl/ltig35ml2HozP3rGmIdNvbvieFnx/QfhvN6uH2je4wewOojap6DM7mmc0M3+q56KgZYxmf2EOj+axDG9D/YTit8z8lFzs601nc6i7LUmug9vUHMTyldF2tHu14G6fg2OvtXowhp43myr41RCobXaNHHc7T4bE7mNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fQ/8qyTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GrqjC021280;
	Thu, 9 Jan 2025 01:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFlXTm7kHgZkTUyIpF8VoykTgwzjL1Xjg3GnWr7mbR8=; b=fQ/8qyTw0FnC3iuw
	6f0rMK/20lyMScbcs/5TYPjX8u68QLw/uLJ8nNFJR5ur2b6+B7GCoVo63fRdE56R
	L/FAu6mkjum8WdfBWOXdbTU2+EdjcmSbRSJFO34gLgatF3Nw58ROBNDn3UESOfV/
	Wsrybs1hsns4bHRoEjoCmOofxgAygzd3PgFBxuzHFDwCnLK1xyhiTvJs8EjLioKr
	9mbkFCAG5gKRjQJQzQppAC50D2xdFJlWtrHGmgiD+TR4KQoncoRun38wSdfXO1j0
	Vn2mm7d3f7reONypkYNGjLTLx8FTMnxW2bcP+tTDPqe2nzP3y1BEKKQCpDRXMr7x
	KlUdcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w9m12bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 01:27:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5091R06I011603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 01:27:00 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 17:27:00 -0800
Message-ID: <bd046827-8323-4518-bb5d-d0e943428ee7@quicinc.com>
Date: Wed, 8 Jan 2025 17:26:59 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Chandan
 Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran
	<jsanka@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sravanthi
 Kollukuduru <skolluku@codeaurora.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Archit
 Taneja <architt@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        Simona
 Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8GTLgLUzVWHhX6TGYmw_oWYQPqFlHBKS
X-Proofpoint-ORIG-GUID: 8GTLgLUzVWHhX6TGYmw_oWYQPqFlHBKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090009



On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> As a preparation for calling dpu_encoder_get_topology() from different
> places, move the code setting topology->needs_cdm to that function
> (instead of patching topology separately).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

