Return-Path: <linux-arm-msm+bounces-36632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD99B85F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 23:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6822B2131E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211D1CCB30;
	Thu, 31 Oct 2024 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l3/ydvMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF01BDA85;
	Thu, 31 Oct 2024 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730412914; cv=none; b=U43g34QUWw62oPYvQD65Iom0PaeAX2wpzIzHSFhKrceQhIbLBCfCM8zmWAyGZgnL+zVOT/eoBDl4JNCqrEPVg8nRvDEmc7h/IZPSmlUG5vIWXFmRmMvgnaOABa9q//PIYD50Qdx5rVx42nKxyDkPtNqaN0xAL2y1rriYIsLkNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730412914; c=relaxed/simple;
	bh=M1k9zeKf2yb171jTgRXekf/spGF95/MvsJLDbDr0sH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TlvLO7NgqcUiIQcgh4JmfP5Df86PyYM8Mm0luA20rE9zdgX3+lUQ6colkRqUmilVJiVrKk35xAWuBcYu/ckwIPZ0sWtovzQiaqq6NEJyI6GZbGtWccGjeAjuB5TRrUJ9XQpIsnZTtUrYBIHA2vNWp5RsJI0XeoA9xxQlTwG80p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l3/ydvMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VLqJ4P004918;
	Thu, 31 Oct 2024 22:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYJT0itPQ9aPV29XqWXKT+4QQlBV6CXsq/NJ1R9dvb4=; b=l3/ydvMRYxYKWshj
	vEr920fRS57Kt9jutEvQcmI9PsSDAbP9ze3drPQcfvf81/EKqyND9ruaQbrgWPmH
	PrzC+arYplTPONmFlZKRPFv/rL/R3Oh+WR2C2nIfzJZd4zaHqYOwEu0EZHGj7aVn
	dPqrzbnVWcNDf97O1CYlGVZQTqwjnQrHo6tVMnMfFlsWyr2U5l6DiPstqNf8k9Fm
	PUuHeKWQ4hLrnziH8UKcw0udjygpm+oHfVe+KvssIz06X1TqybqzkCouC3Di/mZT
	S3F4Ww8fYQkN4+OTVJZB1LdflSVo0g11B6NSPguvZEFNaJMZNTg19MKpWV3BoXS0
	Hel4+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ku65bwp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:15:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VMF0WO030182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:15:00 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 15:14:58 -0700
Message-ID: <bb234fcb-8b1f-417c-8b37-e14aa34ef5fe@quicinc.com>
Date: Thu, 31 Oct 2024 15:14:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
 <20241031-dpu-move-topology-v1-2-8ffa8122d3b6@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241031-dpu-move-topology-v1-2-8ffa8122d3b6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wpjMwMcsDjIzKT5abVacNVorfA7mKi9s
X-Proofpoint-ORIG-GUID: wpjMwMcsDjIzKT5abVacNVorfA7mKi9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=899
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310168



On 10/31/2024 2:44 PM, Dmitry Baryshkov wrote:
> The MAX_H_TILES_PER_DISPLAY const is only used by the DPU driver, move
> it to the corresponding header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
>   drivers/gpu/drm/msm/msm_drv.h               | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

