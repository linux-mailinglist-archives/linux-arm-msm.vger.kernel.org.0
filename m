Return-Path: <linux-arm-msm+bounces-29675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A72339618AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C92D1F247B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4B5156C52;
	Tue, 27 Aug 2024 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PS+cWT51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC979945;
	Tue, 27 Aug 2024 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724791547; cv=none; b=S5c8PzBSCa+3SzAh09RuEOQJoqDv8FCmlx9kW4E6Gg0bdrqfzufsDnI71TUYFXQ/J7Ha8DitR3wAqCm0CSErcXJ8LbaPyis1Re9x8ODEyYP7woB4RO/6Zpd3OuZrwGeuHajxQBT0DULccca4sC52TYbEztfqRu4uzmWpFrxJxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724791547; c=relaxed/simple;
	bh=/zdcqAYuS9HMoBKKIr/sj1TOL1GvjFcLhm+ZP3wpGfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G8e9Ly8obLJwZOuFRni7qVdxCjpjCPCn8EMTY5pbF5Ko5LRHQ16EPEFd7HxX4Kg+kj3/xOdDIv3kH3d+XSb6OeAEBT+lwtt7+ZNcZoOg5HoDyn7iqqbFDfez7Qus9ki0sV26yEcUi047TREPdgL72hybIHkdxA0xQ2pYgEIRNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PS+cWT51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RJl3mK004588;
	Tue, 27 Aug 2024 20:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQaoOhm2fyYx+icjXg5dOFhbPQs+X5Q7zfJoFBqlsQI=; b=PS+cWT51F0Eak4Md
	mPl2ueeSSbnogPX/fnFx15fyYjkE8c1MVbfmeGKK3sLWR2AVF/Oz1r/NuosAokPI
	ufZzZ9pf/UtMHSmbWwpXUDQ9xK4sSlOXPXOr6y6hXgbfABzUVs0qEGN5MnNeYG9q
	98N3nnVVSkLlNSvxcRq7AGA76dXRyrxYh18E4cQ+loWGCqK4D3rP0+ITqLEiIX8q
	BIcUU/TbeSOaJrksz/bRF6P2PngfuBJac2IVh0V5EoV3o+OjEgZQjaUJKRObmOIb
	NqOa8yrfOUcLFN+XYLChs1t62VDYLVc119wcTAWzYFNGoZ/4IRkcGReWITrAPyha
	OhSi1w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4199yt25wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 20:45:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RKjb4w022552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 20:45:37 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 13:45:37 -0700
Message-ID: <b2607783-8453-49e5-b26f-0a918fde2478@quicinc.com>
Date: Tue, 27 Aug 2024 13:45:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-5-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-5-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gBI1Tm8qXzJuksKPGQnG9ULZDZyPeEUO
X-Proofpoint-ORIG-GUID: gBI1Tm8qXzJuksKPGQnG9ULZDZyPeEUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270153



On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> In preparation for virtualized planes support, move pstate->pipe
> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> case of virtual planes the plane's pipe will not be known up to the
> point of atomic_check() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

