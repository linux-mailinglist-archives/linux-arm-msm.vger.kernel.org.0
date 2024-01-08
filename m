Return-Path: <linux-arm-msm+bounces-6686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11308827A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 22:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370D31C218D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 21:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7918D55E7C;
	Mon,  8 Jan 2024 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZVHkYm9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565B5644C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408LLDIC020598;
	Mon, 8 Jan 2024 21:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4bjcSFCKv/rbo779Ha8OaogJtYMZ6fKVq5T7EjGq/WM=; b=ZV
	HkYm9FzlWhAMId1ha9/cxYxUs7fnVJm2AhtLhf9PYWRORmHC7f4YE7LtBN+eN4sQ
	/m+4RLaXkGQ+I5krAalNJlKq0BpuKjgllZ+DyJ+Q57pS7oRyWXZ42cP4u6tOQka1
	AoJuMIZMMUX9hE6g8bMvxcDxOPWKB1VfRGxkq+vIkhDiFRyAX7GLjnaf5xa3J0Pl
	b9tuVx9IVkMRAJnoNydiAIb2/YZM6tuCM1Ghazc1uR01vGeDnVB072g4HquWuPQT
	6XhwwJT1HTmA2/krkT1OLD224M6jqlRU1aTpuTHyUb3WMuoezVUgQm+AmCYLaZlC
	yRP3eSbuS9blktGwQmAQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vghmbs4av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 21:39:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408LdFPm022271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 21:39:15 GMT
Received: from [10.110.115.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 13:39:14 -0800
Message-ID: <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
Date: Mon, 8 Jan 2024 13:39:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
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
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kiBOGBER1VbLV8eIAPPQ2DKOCE0eZ3ES
X-Proofpoint-GUID: kiBOGBER1VbLV8eIAPPQ2DKOCE0eZ3ES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080178



On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> Move corresponding checks to drm_writeback_connector's implementation
> and drop the dpu_encoder_phys_wb_atomic_check() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
>   4 files changed, 64 insertions(+), 59 deletions(-)
> 

I am fine with this change with respect to how the code is today.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

But if we start noticing a pattern like below in dpu_encoder.c's 
atomic_check,

if (INTF_WB)
.....
else if (INTF_DP || INTF_DSI)
.....

then, it will demand bringing back a phys specific callback.


