Return-Path: <linux-arm-msm+bounces-3375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF48042E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 00:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F5B3B2097E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 23:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BC839FC5;
	Mon,  4 Dec 2023 23:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lh8xwO4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A999F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 15:53:26 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4K1R5R021249;
	Mon, 4 Dec 2023 23:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+6mETUCV1uC6+/XeJCxyw9zBpFhVG+yuAAX/Hl443jQ=;
 b=Lh8xwO4R9G5+MoPUFC2Gdj7jizlckT8pjzFogg9Ha40BIcjenLIhuS3whUWTdg76flGi
 wPPN79tYePawd6QUfYzwzIHZFwXN0HEuqljqjzurwxEuo5gPuZre6TAHzscY5rMN0nJe
 iFnIBCe6Vw4iE4JcIa+I4tbl/amEXbRni5Of8S1GKyxmW4orko6JwIxsh1qeHieqWr/e
 MjgWLj4M8ZrV74tNxRu0mEaLpm2GXefW0UnpHbsuvY3CmRPg/sBzVGSwrPoFFcbZwAwU
 IequicAhENWzGyureiyWqjcS+psBTxWzq7tX2bHOSFN1e9ZnJ62K9ISmQO2QBQc6qKhr 9w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usghcs8jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 23:53:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4NrFgD001930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 23:53:15 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 15:53:15 -0800
Message-ID: <625a149d-88ec-16c8-aa21-2389b87d4db0@quicinc.com>
Date: Mon, 4 Dec 2023 15:53:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 10/10] drm/msm/gpu: drop duplicating VIG feature masks
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
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
 <20231201234234.2065610-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231201234234.2065610-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EUcA_D9hLFMY0UKdaW5eeg6g5NSH0DaT
X-Proofpoint-GUID: EUcA_D9hLFMY0UKdaW5eeg6g5NSH0DaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_22,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=761 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312040187



On 12/1/2023 3:40 PM, Dmitry Baryshkov wrote:
> After folding QSEED3LITE and QSEED4 feature bits into QSEED3_COMPATIBLE
> several VIG feature masks became equal. Drop these duplicates.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c        | 11 +----------
>   11 files changed, 26 insertions(+), 35 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

