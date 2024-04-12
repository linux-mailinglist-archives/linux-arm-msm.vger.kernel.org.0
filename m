Return-Path: <linux-arm-msm+bounces-17364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818408A37FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 23:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04580B2301D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 21:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948AA152175;
	Fri, 12 Apr 2024 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kAgE980t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2539FD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712958054; cv=none; b=V//qWrAPvr4CHlr0aZTlOxOlhZ2OU4yrLrnK3TKlLFe6lAI1AgBoDdTkixIueyYzVBJbKA6yaaOKTefJPG+7OQwhW3e8a3OudmAGawsjUqs7y6QDUicBQi5Dzo/h1dIIQUJer95eItu6lozjIBLhnm5SCh/Zvqszikc8EkBhmRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712958054; c=relaxed/simple;
	bh=xdgZQokm7al9X0O4LOAnCCkXCudhVxiYcp6aEJxWQcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GCLtqtZWmUPAszg2g7VH5+5FPpowGyujYMBdGzCnBRw2vN7hp6US40CqVp0rm1QOksnURUFQ8NyxP9w9htGoKflsMEF/2zSXegL/xzZNwyS0B0iKJpKQdikCIq2DeJRoeFf5BUam/A9tEPI/Rzf6udb8axQERdQWnrxvWelrlJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kAgE980t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43CLOaDf013978;
	Fri, 12 Apr 2024 21:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AU89ERYqYieecOUfTjiT+cgxqORhpOtRmqut6kbZHvc=; b=kA
	gE980t4pCBmDDQjGKVAplmqHtufNDvRbwkIle8zIhbkCzmmT9kWAnBazu2UsQTrk
	BE+l4ra2j3qYSQ03JYSr8v2sIyzbuWY//e2vIv5tu2TOObnhGCCawo5cSet+rZS0
	6Gx6/M+1NyzJITpsDgo/VTwU1LJaPAGEWP7uEfMk3IJuUh4DephKq68oSVJ5tgdm
	HOWxq4vTcUjfF064rbU12IEXLF6ss38sGUVvt0F94afuI/NMadNtGBUe6XIWhdHc
	vJGzeB1eZ4SyqBgZkBc+ONuNxORJRfjXJgVWyW3cbxaG+52PQIVCvPz9qwJhcXp9
	LV0nAfj46hifC3Vmr+ag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xf9x6rmvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 21:40:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CLed97020301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 21:40:39 GMT
Received: from [10.110.81.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 14:40:38 -0700
Message-ID: <d8569c6c-592a-e88e-d3ef-c2c14b115d0b@quicinc.com>
Date: Fri, 12 Apr 2024 14:40:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 12/12] drm/msm: drop msm_kms_funcs::get_format() callback
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
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-13-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k1EtKLMqlbnG3DnhtMsMRbg9E_55mncv
X-Proofpoint-GUID: k1EtKLMqlbnG3DnhtMsMRbg9E_55mncv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_18,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=966 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404120156



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Now as all subdrivers were converted to use common database of formats,
> drop the get_format() callback and use mdp_get_format() directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c              | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c            | 2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c             | 1 -
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c             | 1 -
>   drivers/gpu/drm/msm/msm_fb.c                         | 2 +-
>   drivers/gpu/drm/msm/msm_kms.h                        | 4 ----
>   8 files changed, 4 insertions(+), 11 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

