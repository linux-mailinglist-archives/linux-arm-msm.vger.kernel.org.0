Return-Path: <linux-arm-msm+bounces-2976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2C801622
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555941F210C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D32619CD;
	Fri,  1 Dec 2023 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D5VHs/g2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD0CD63
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 14:13:02 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1GoscQ002120;
	Fri, 1 Dec 2023 22:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5f6rBTZ5MExdcZPTEmVCpE0jRYbqBWe1mXUEQV1gBzA=;
 b=D5VHs/g2YG5+YF00nMxfnJO2rUlK9al2x9cRMPQX66KRKq9MOZiy5w6tmIrCY5D4/0GP
 KBkmN13d7MHvEuTKS8O5+IGuXZxzu9j6gkWnzQMBe7mFjCfmWU4X8DpDzxaERgQtTBDH
 F/y0tppSTZCLxJa8Py1UHP50PdxEyDS1Kro1z65qBCZD9FlqERVaRWT6D+xyD5hbNEYl
 5IpOW52vaPijdLo8ymeBvDP+gl5yZyz0+eFrlZA/JcK7C9XSgc6i/UaS3nc+wAtusjsM
 ldJJpKZNnP+Bi0p2Wp4DAOcYUREc6STizk8yG+ScB65TZ8TRXs6opq7LytF8pcVR09Gt jw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq6dktnay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 22:12:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1MCo94020068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 22:12:50 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 14:12:50 -0800
Message-ID: <3307640a-8e28-0035-f51c-e56624475faa@quicinc.com>
Date: Fri, 1 Dec 2023 14:12:49 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 02/17] drm/msm/mdp5: use devres-managed
 allocation for configuration data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>, Stephen
 Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>, David Airlie
	<airlied@gmail.com>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230708010407.3871346-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gwzwomCSQaqFD44GhIBsJQXLyOV8mLHK
X-Proofpoint-GUID: gwzwomCSQaqFD44GhIBsJQXLyOV8mLHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_21,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=864 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010135



On 7/7/2023 6:03 PM, Dmitry Baryshkov wrote:
> Use devm_kzalloc to create configuration data structure. This allows us
> to remove corresponding kfree and drop mdp5_cfg_destroy() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 24 +++++-------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  1 -
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
>   3 files changed, 5 insertions(+), 22 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

