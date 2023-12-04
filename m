Return-Path: <linux-arm-msm+bounces-3371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC880427F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 00:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B181C20A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 23:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D158B2377C;
	Mon,  4 Dec 2023 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QacTz9nO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCF9C0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 15:19:47 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4MRjEC012015;
	Mon, 4 Dec 2023 23:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DC+2ehiG+QhLdNsiYr9idsrCJKNZnpUCf0UcTMrvdtw=;
 b=QacTz9nOUIgpCEoa+COdy+GeIliYq7I9/FsuE3HUFbqQqB8THVh5CSAbh3c7bhONBKvV
 51G+Xc2J1oTxwAQIwOKLxZnDH16kaZkelUhBpU7gE621hkgri4E7KDsRDlP1/guIINY/
 esO8iCn8fCTiQQ4aFuokoUQE1ns7Cv+vnD/aAHhaWxKExW+uxH7stj7MIvIpLtv054G5
 Mng25xCBdRhwvbWfTImaYwADaQjwtF4MBzdqODNrwW4O/KOBEEH24d7oweEvl5X/DirJ
 Lv8lEXHPva2M1/sp4lc9GeRVLQJN5hGv+cnBJPSdb5OHkTUxt8ihCHRnItKyzLNi5xt/ FQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usfu798wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 23:19:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4NJaUP029117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 23:19:36 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 15:19:35 -0800
Message-ID: <3997021e-81de-c776-0e9e-349735ed020b@quicinc.com>
Date: Mon, 4 Dec 2023 15:19:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/4] drm/msm/mdss: Handle the reg bus ICC path
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
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
 <20231202224247.1282567-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202224247.1282567-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bHhHEkcpwuv75KnEfn9A6oevsI-pRhrO
X-Proofpoint-ORIG-GUID: bHhHEkcpwuv75KnEfn9A6oevsI-pRhrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_21,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=798 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040183



On 12/2/2023 2:42 PM, Dmitry Baryshkov wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects, from none to otherwise
> inexplicable DSI timeouts.
> 
> Provide a way for MDSS driver to vote on this bus.
> 
> A note regarding vote values. Newer platforms have corresponding
> bandwidth values in the vendor DT files. For the older platforms there
> was a static vote in the mdss_mdp and rotator drivers. I choose to be
> conservative here and choose this value as a default.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 49 +++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/msm_mdss.h |  1 +
>   2 files changed, 46 insertions(+), 4 deletions(-)
> 

I checked the values with corresponding DT files and they match,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

