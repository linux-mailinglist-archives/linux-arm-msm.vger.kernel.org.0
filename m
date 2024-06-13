Return-Path: <linux-arm-msm+bounces-22660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD1907F53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AB7285778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01E213DDAB;
	Thu, 13 Jun 2024 23:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NdYy3Ybe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99187811FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718320758; cv=none; b=HFIoxUoyK4wJsQa6dYDKTG/CQwecsgryFMBYPEKQvj8cJbQQgNwkem1GAE8zTetxHxL/UFZ5VJnVYzyCGQiYFiC6WeEiQ7jYHMN2dFIqlKs0RBYKq4TwLj01XcXilpArhfXpMUXYk0wFDwyRQXPWxjVAgOT1Okz5IHlweu6wA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718320758; c=relaxed/simple;
	bh=no1uCXu8YJhW5LPzl+aq/LL5ojWUgcpBqzOO82Xrv3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cKmAAmj/PeEhoi8b0fULy6s0Tz137Pek2gs1wOIROuhQGzDcAN57DGof3+I3qtZRjT9uzUdTYG7h6RtX+4Q7+OEY3PgKtkF0vNSibCspf5nTbyglO8mEkerqgan7b2D9q0ts2cud3Y8FMKJyWV+gbVwMn3W+jLylWOJ7I2KXudo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NdYy3Ybe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGN8A015179;
	Thu, 13 Jun 2024 23:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuQGoFP2M4erz35vC2/uqS5ltyJsiqbZ+ZzkroyJtoc=; b=NdYy3Ybem2acPWH2
	yIIbjPshYnenc9/leb+yKINdPkr4RAfC3XDf8dBkaWgMgSJpK9+6jTtzikKRKRwY
	KP8LMfgUp3SoZXqbiKoMh/lOwzTp3IAbp3D9CpHePZ1cRRbBtEqH3O3Umv7NNdVz
	OVbvdAaH6GIUwzhoARWec0Il93kbP2XwKHAj0RUNx6x4LhY3cTulEB/g4GaG3Aw3
	ziiEtUrz1VHFUuWNyN845SWHPXGoNsRDwmmvfMM+y+OEc6GDEzROhEzvP8r5Kj9L
	kAzh7W+F2yN9Eg7xpeo7xKsHCUo9HnYnYvitQi14Q9TeaPPn9781o6H1C+NveFsL
	mk2zXA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q30gm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:19:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DNJ7hP013239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:19:08 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 16:19:07 -0700
Message-ID: <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
Date: Thu, 13 Jun 2024 16:19:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Content-Language: en-US
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
 <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SZTAXdaHsmXAc4tZwgRgzg5ySsNkGGL9
X-Proofpoint-ORIG-GUID: SZTAXdaHsmXAc4tZwgRgzg5ySsNkGGL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=944 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130166



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> step, so that any issues with the FB layout can be reported as early as
> possible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Did anything change between v2 to v3 that R-b was dropped?

Here it is again,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

