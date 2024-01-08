Return-Path: <linux-arm-msm+bounces-6684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDD827A30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 22:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C31F1F230C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 21:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C84956440;
	Mon,  8 Jan 2024 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o70z/K8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285556441
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408LRRbf020110;
	Mon, 8 Jan 2024 21:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fJ31jQS7Dt9jLXxkzNiy99zQohXILwV9j/M0lZKl4uA=; b=o7
	0z/K8RMAgiv3sYCNAAawpF8l2/X7F1A9e9ztyld6coXcsSH0hTKh0jZEIMzSMr3S
	p9/1BuA+tNYJTNWI+cd6tn5vNkyBue1CmLKETVPvrud5LYGeyh1jdQ1o2TeMv5Vi
	N7eW87MagjvwhWV14oR2Zju77gFZuwDgkPEbw+tnWir7h3bvSS/F8g7h2P/6PW5W
	1eC/aKVjYg+LBoJ5E47bucUKnazk9neTmm943dN4LWaL8lh2s4jSxE4W0cphDqJX
	G760gPS30bO5PE+J1CZOaIufNh4wK5M6xaSv6h5xK0z8mJYVRD+489vPG3lfehiJ
	ekP4VGK41wKRI770cVKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgch51ss0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 21:27:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408LRQN6008164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 21:27:26 GMT
Received: from [10.110.115.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 13:27:25 -0800
Message-ID: <086eb162-441f-01db-807e-8d57de0c9547@quicinc.com>
Date: Mon, 8 Jan 2024 13:26:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/5] drm/msm/dpu: split irq_control into irq_enable and
 _disable
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
 <20231225130853.3659424-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231225130853.3659424-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CTGUJjEZVLWdig5AY9t4vSii1JMlr_H9
X-Proofpoint-GUID: CTGUJjEZVLWdig5AY9t4vSii1JMlr_H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=769 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401080177



On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> The single helper for both enable and disable cases is too complicated,
> especially if we start adding more code to these helpers. Split it into
> irq_enable and irq_disable cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +++++++---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 65 ++++++++++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 46 +++++++------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 29 ++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 62 ++++++++++++++----
>   6 files changed, 158 insertions(+), 86 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

