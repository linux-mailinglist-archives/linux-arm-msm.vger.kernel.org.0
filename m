Return-Path: <linux-arm-msm+bounces-23153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8590DF83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE64E283AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA87C1741EE;
	Tue, 18 Jun 2024 22:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B7HXmB9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA116D9A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751487; cv=none; b=IN0gpbMW0/HgQf84aCSwsr6OCo4y+5FvReb/fcVrQbytmi8vLrzjsjG/M6Cz2ow6j7Xh9DufqBJp99T/ckhx2TERB99j2lXc3VidiorCjB2LvFWlF7B5PDz2ZD59+IijtrPu99in7gHBipeUlz5KyagJgRItVRIjskG7HjgfX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751487; c=relaxed/simple;
	bh=gx5S3ZblNvO94bejHPOBVMBYWj6RHufFW8CHGLk/DSo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=JAvg1gxFZrDRu8zn+5YsLS7hHTnf7OT9jNDIZXT12kONknLoa9MEy353EjZQre/fMF3BJjfiMIDswrYOPQteOFHMHQ1Dh0ieGh5OSY3LrYgdPPl02d9rf/uOYQwbw7MMfHFIsCnnp5VdrO2MfiJgDySGvArP8ALAXDYw1aD4la8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B7HXmB9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILafQg005103;
	Tue, 18 Jun 2024 22:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSNGU80bRBOgO9Q8lbRL86L4izi5paRJz5NaoZH530g=; b=B7HXmB9HFWK1PNH/
	fg7tm2tHY//ymJP+SDaK5oW36Ax5IltpcNfM1cIypzzPmaQSnL8wwg9nu/Om1wO7
	C8ma7REtujKvHLvGc+m3EkcXu0Ln56fqEgycGOSO6TrONhK2vMPjhlWvT2b5oM00
	8cE/Bj07w+qm6oOP2lalrfHnBdXRTJLjnhGgCRuaLB1z0ImTrvtuXwsbPgfwVDt+
	u5ZOa7XZeN2NqUetfxjvINHciLB5fhOb2S13XG167KwuZYiHt5GlSOHkh8cI5Hjh
	PfxfChDQO8OdvnZ31mq1k/BnPd8qmuJeqhOq8RcjW5C99ufPTL3QK5aa6nQwNS8N
	vbNiew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja7845p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:57:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMvtbR002824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:57:55 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:57:54 -0700
Message-ID: <a565b3e3-ec4b-4381-957d-9789b38a9f62@quicinc.com>
Date: Tue, 18 Jun 2024 15:57:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-9-29ec4069c99b@linaro.org>
 <a4ab3435-c69b-e754-0d51-dc1cc54bfde7@quicinc.com>
In-Reply-To: <a4ab3435-c69b-e754-0d51-dc1cc54bfde7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tFG6qpMb5RWmZHXbYYW2uv8i1K-h1s7z
X-Proofpoint-GUID: tFG6qpMb5RWmZHXbYYW2uv8i1K-h1s7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=755 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 4:16 PM, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>> Lift mode_config limits set by the DPU driver to the actual FB limits as
>> handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
>> to the drm_crtc_helper_funcs::mode_valid() callback.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
>>   2 files changed, 17 insertions(+), 7 deletions(-)
>>
> 
> Did anything change in this patch from v2 that the R-b was dropped?
> 
> Here it is again,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

