Return-Path: <linux-arm-msm+bounces-18022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C08AB91B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 04:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB271C2096B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916D8205E27;
	Sat, 20 Apr 2024 02:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gCifA1EE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B246FB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713581700; cv=none; b=cU7RdgZVGfzIlQwRDbpkIVxpEcEqn9isqY7GufjU1jQfaJzEe+S1LXKKvtJN+4ignKgRMi6EX3ZE5mTd1sb5rQk1Gzrcb9gn2Dgy6tzE4mvImbJ1v9EHYIFjQ0y1I/CXm4pZBD0hqdacPoWibbq2DNZ6tdZa2xu1epNFJey9Pjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713581700; c=relaxed/simple;
	bh=iEQfT2yByjmwuN/NfLgfyRASAVeidDJI2X3NyBACEXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YaRXpmdgzp0p7bqV1se0VShO52gdZ0+vy7Eztbr/hXQUs99+VwTnxx2DBs8NaM3jfhXrDv/5are+n/fENWpemAowGCkT/cRxAA3IXaVugBRIwa0m1nfIiQJM6zgrAlCakZQ2LKJmwt4nxxb2k747LVEE0UbLOClAzkFOfT9IR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gCifA1EE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43K2Nh0w028861;
	Sat, 20 Apr 2024 02:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=z+Jzwf6S8XdIpA9oFssfS0P4qkUkjz73C2z/BbcQbvs=; b=gC
	ifA1EEbv0ACi+XhJZ+ZuTA+222sXwn1FCrGZtXEDNADegUVkGlOueviioOVdtCIP
	cw4Uc/2j3DVBUxHtjxPBt0CCZ+tYtfOiYXU1Z7F/w+ZmcfdOT3CiGoqC7ec40Hs+
	wJgWFedYacFBTqTuhcnXpDaZjTE0CDzvjmL5ze8290lkNxJ2gn97b/pE8zb6VP6i
	MJ/Sb64XtHVQZLzX2b9TDnDfaokahM+YNmDvXjcH/I39U5fZSDZJuwd98EUt21dG
	xi2ab/066XueYTdtX5c2536LzM8Tc8ki/btWW5vXis4svKqP2acVgsq1PJFieKCd
	cGxqnCvoAvBJHQdNM5Iw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm48382wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 02:54:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K2sW0c025542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 02:54:32 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 19:54:31 -0700
Message-ID: <51e3ecba-11d3-61c3-dcfe-2377578a77a9@quicinc.com>
Date: Fri, 19 Apr 2024 19:54:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
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
 <20240319-dpu-mode-config-width-v1-8-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-8-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mrzNINM0gdRNLlV4rERntH0CSw8ZqlA5
X-Proofpoint-GUID: mrzNINM0gdRNLlV4rERntH0CSw8ZqlA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-20_02,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxlogscore=470
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200020



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
> dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
> constants to remove duplication.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

