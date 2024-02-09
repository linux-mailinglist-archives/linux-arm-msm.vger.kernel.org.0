Return-Path: <linux-arm-msm+bounces-10367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C084FD42
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 20:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64CC21C212C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5101272B5;
	Fri,  9 Feb 2024 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PzQ7/g2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816186ADC
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707508666; cv=none; b=u5CBEBWZ50PMT3LQJGrlQKsikIHob1YF6O8XDo6EGmWHjMO9P8k1MLczMx3Q53pqAle3+0xjyhxOLsPS3j6j96MgTkTI/jn/PHorMXOKyI+0+5pP7L2QFxvNi+SBnCNt2TA3o6G36pcEdiaFy16dDF+AsHFVTA+mWtthDOC0KcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707508666; c=relaxed/simple;
	bh=64HIXSOHrMn3ChnNGN2aDqJZpdaQRF9HxdiZOXbu9SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BAC2kUmYTAFOGWPpH69zulQJpx6DyIoPiEblLGhfiXoFmQnEx4bI00vchjQh5MaVSBanCrTFKnOJ8ahdz1wZFVKRzPjoRYgYNCZO/OxXCkGeLengRSoI2LBXYo7rPS5nXV/gRhKfLkk7WxJuWhRokz3ov+mreFvt2k3JJka53Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PzQ7/g2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419H05B8009391;
	Fri, 9 Feb 2024 19:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=c8i16nuHIZPlWQ6bvZHYHEgLKUVycdE8mE3j8c8XImw=; b=Pz
	Q7/g2rq3lr1ioEJDrvpTTuMXgysklnrDiqOPZ1TBSL4ZWlmnETVVhVRH0HkHLUHT
	DYsDD+3sP5teRkoDXdYv8nvctcPhTHMrCbjsq/UATnpNBoz7OfMsXZTOrFxXwhq8
	/YhfodDqqmv69Pq++0UQSO8GDAiUPdEvS0oE45x0LQ1DCNe8zecmhyLbe255QdfH
	Y5ioRfkKf1WL6Wxb/tWPjWxJeAPP14FwWvMK+XlerhvKxp6iif40QfBWeMy+EUjN
	fPzVBNaF82Jnnhq4aycOhsBwgvGk4fdB3XN8dnXVOhGDodkCT5wwfQr1H8tBVLOb
	ndW9nHnTzrm3jTl+9+iA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5m158x86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 19:57:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419JvSu1030946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 19:57:28 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 11:57:27 -0800
Message-ID: <28dae7b6-36a0-33b2-d726-af49aa38deba@quicinc.com>
Date: Fri, 9 Feb 2024 11:57:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 2/5] drm/msm/dpu: finalise global state object
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
 <20231203000532.1290480-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203000532.1290480-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p1Y-v36sI3kGU43aKL-8k51kfrMt3hIL
X-Proofpoint-ORIG-GUID: p1Y-v36sI3kGU43aKL-8k51kfrMt3hIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_17,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=884 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090146



On 12/2/2023 4:05 PM, Dmitry Baryshkov wrote:
> Add calls to finalise global state object and corresponding lock.
> 
> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

