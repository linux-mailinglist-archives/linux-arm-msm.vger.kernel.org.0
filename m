Return-Path: <linux-arm-msm+bounces-3343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C981803C72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F098B20CFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CE72EAF3;
	Mon,  4 Dec 2023 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OCca4v89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BCD1A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 10:07:34 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4HLXAI007781;
	Mon, 4 Dec 2023 18:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8p3Zd+6if6OsnnOQdgWBtD9Rur2zxR8vFBbfoZYNvR8=;
 b=OCca4v899WO1nEouYgSOyM8IJ1YYzAn8Z2RS1oZoo0336jHOGslD7ruTHztZDqdqDY6L
 cTixIlq0R0VUsd75wDWm5KlvukqpEgSlVhJMFYqzehA91VBOtfDtCr8LR+DUMCQdR1bN
 HOEw9dSzDK+yl4vSrwVQxC9J+3ux0KlFiISx5XNF497CGipFYfU3Ohjbr5dqkmbQauSH
 C9IEMwSRb3KKkO6VXjrLRD64l5B4xV/z8gN7jU3i0oCM/ZHpO7S5JNfwEnSunNIXHM7B
 GFvF0E5CRjoRR1fLKc0plt1oguUBnDFsMmheQoqRjqr7vYtC+JuTyAyHMQuFHaFr0xY8 wg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usdf7h5jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 18:07:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4I7LJO014616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 18:07:21 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 10:07:21 -0800
Message-ID: <5ae4729d-3a06-ef77-be9f-d93e91caa06c@quicinc.com>
Date: Mon, 4 Dec 2023 10:07:20 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
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
References: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ReXVwtYxsZnITWbvTb4F_k7ZCnRp1S-D
X-Proofpoint-GUID: ReXVwtYxsZnITWbvTb4F_k7ZCnRp1S-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_17,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040139



On 10/3/2023 8:19 PM, Dmitry Baryshkov wrote:
> There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
> together with the corresponding wait_for_vblank callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 --
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  1 -
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 -------------------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 +++---
>   drivers/gpu/drm/msm/msm_drv.h                 |  2 --
>   5 files changed, 4 insertions(+), 39 deletions(-)
> 

No users today but will need to be added back when features such as 
autorefresh get added. But, as usual, we go by what in the driver today 
so I am aware that this will be a lost argument.

Hence,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

