Return-Path: <linux-arm-msm+bounces-3011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8A801966
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 02:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C691F210E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 01:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E671388;
	Sat,  2 Dec 2023 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ouGfCMSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2381B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 17:23:03 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B21Mqh5015433;
	Sat, 2 Dec 2023 01:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Zg8HfVorKZC+xg3ZixY/5QZdf38W/r1gwQz9oQthue0=;
 b=ouGfCMSLOsnmwY9BVoOfkih65IoAZXoaaqgTJflHjKsqg4CKrW43iSTjm50ZJownXYmV
 L/H3GxTbLB90weLE3QbOBvKs/io+wfCpL1DcXaJZ0ggU3ClJc7EGzMwk9iB7mFIeP8eS
 SJHphOqxd+zLsv4ltfUEnrCW9yKGbaN8PTXTTFMyz50TIq2bHhcEwkFOueVIf9yimWh/
 TgZNF3Ou5af7QkVoh7OJ9nyKW9I+0XREHo2XwWaZ5bOa6iWMCRpgMvyJCUTR8cR/mtGb
 qF63ZggIJhmW2RHi9pu/anF4h7StukzaNwDYOpN+I6CW3PQm0Q38c2O6U0R90NdGqnym Bw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2kapn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Dec 2023 01:22:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B21Mp9b026776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 2 Dec 2023 01:22:51 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 17:22:50 -0800
Message-ID: <e8c965c9-7663-e5ac-7a9c-c03d4d4bbebe@quicinc.com>
Date: Fri, 1 Dec 2023 17:22:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/17] drm/msm/mdp4: use drmm-managed allocation for
 mdp4_lcdc_encoder
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
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-16-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230708010407.3871346-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kjLp2jaFKcc7R7zpp8vm6BYvXtnb2cle
X-Proofpoint-ORIG-GUID: kjLp2jaFKcc7R7zpp8vm6BYvXtnb2cle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020007



On 7/7/2023 6:04 PM, Dmitry Baryshkov wrote:
> Change struct mdp4_lcdc_encoder allocation to use drmm_encoder_alloc().
> This removes the need to perform any actions on this encoder
> destruction.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 36 ++++---------------
>   1 file changed, 7 insertions(+), 29 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

