Return-Path: <linux-arm-msm+bounces-4492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106581071C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F711C20DCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C74A50;
	Wed, 13 Dec 2023 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j4D4zg5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019FEA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:59:35 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD0vdio013112;
	Wed, 13 Dec 2023 00:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8OFjpdfhf3eEEMLN8TrKItjwICOInserMgH7XBuxaUk=; b=j4
	D4zg5Mrc4sag/SOg8ALgJ+0ZRzdAFHJLz1A89PG15YYjXr3IwZcB0ilti+kwnblr
	ttSH/CUThuRuwogvVNZPUDbLpu3T8OTLoCPeLHQqvLrBtHEodg4oKHzwjGQBWmGy
	RKkKTbhyCDG8LKGkCDQ6xmImYQqkM6svvLPHH3Yxjlv+oyovyJanDAQHYS+XPLXf
	43Ct/SI11HuQB2tRJtxJKI3Xfp855Uy+hxVwaWS1MvSJ7etcxOYAOKdC9X5zoPpA
	IPh8QoM5ynzOJrgWzHO8yDCaQ9VSSkeJEfI5CSZ74sJvBd9miAF1lzGmDyk+hFhV
	wT/cJoOS/NakDG3rBMAQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkx5a60e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 00:59:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD0xPPr003187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 00:59:25 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 16:59:24 -0800
Message-ID: <d485c123-4dbf-ef59-4566-bff84cae516a@quicinc.com>
Date: Tue, 12 Dec 2023 16:59:23 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: move CSC tables to dpu_hw_util.c
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
 Boyd <swboyd@chromium.org>
References: <20231213005728.53060-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231213005728.53060-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z3vmeUkc68RnnIrTR2B63449XfD9oXEW
X-Proofpoint-ORIG-GUID: Z3vmeUkc68RnnIrTR2B63449XfD9oXEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=827
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130005



On 12/12/2023 4:57 PM, Dmitry Baryshkov wrote:
> Move CSC tables out of the header file to fix following kind of warnings:
> 
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
>                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:5:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: ‘dpu_csc10_rgb2yuv_601l’ defined but not used [-Wunused-const-variable=]
>     54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: ‘dpu_csc10_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
>     39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: ‘dpu_csc_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
>     24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>        |                                 ^~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 44 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 44 ++-------------------
>   2 files changed, 47 insertions(+), 41 deletions(-)
> 

Strange, I didnt hit this but change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

