Return-Path: <linux-arm-msm+bounces-6987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436082A4B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 00:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389AA1F23C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 23:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B934CDE1;
	Wed, 10 Jan 2024 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZWdmu3sQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9572C4EB4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 23:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AN02vF020978;
	Wed, 10 Jan 2024 23:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/YS2Oai9YBw3NO3mRKDTfqOrq1eQDMGBPpUCNxqEUG8=; b=ZW
	dmu3sQtSz1z7nxAiN8VIe4Fu+lbVLTjbbl+OGfkG6CH3vBKepBOoxOwYsyRbi6DT
	eXqSRrkTaBQ2o2CARYJAreAvxKtjzjrPVLU5rubsBXAOQC4KWAYyaBwbCkbuKVBb
	DwgIpI40BckPgo11752GWqOZeqsbCMngbkBJl2qU59vQkgx9tiAD0khnH+F2LZzn
	R5q79t08rgpSdWNEKMcJrb5CowHVfRM8Kf8HiB1t92WQo0CRjiL+7ANyH+azBA+k
	TYoznTCLUJZ7q6g7AA1aRR1f+Fi2tpqLVuBiUIfZwkE+TeP1mxo4Vu7JFGVMZwFO
	AvYsXxvhbthB44NP8srA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvwx14ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 23:01:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AN1Dvi018002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 23:01:13 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 15:01:12 -0800
Message-ID: <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
Date: Wed, 10 Jan 2024 15:01:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] drm/msm/mdp5: drop split display support
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
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
 <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2EfGgkWn1EmqH-xmUYUYD4SgTfvXArSu
X-Proofpoint-ORIG-GUID: 2EfGgkWn1EmqH-xmUYUYD4SgTfvXArSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401100183



On 10/9/2023 1:57 PM, Dmitry Baryshkov wrote:
> The MSM DSI driver has dropped support for calling
> mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
> from the mdp5 driver together with the rest of the infrastructure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
>   drivers/gpu/drm/msm/msm_kms.h                 |  4 --
>   5 files changed, 111 deletions(-)
>

The programming inside the set_split_display() looks right from what i 
see, so whenever (if at all) bonded_dsi is implemented for mdp5, this 
will remain intact. Its just that there are no consumers left for 
set_split_display anymore so its dead code. If someone wants to add that 
support, I guess they have to start by reverting this commit first. If 
thats the plan and agreement,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

