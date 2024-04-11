Return-Path: <linux-arm-msm+bounces-17278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC188A1ED4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8873A1F2B3A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 18:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C075205E35;
	Thu, 11 Apr 2024 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iQvl6GeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C9C205E32
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712860992; cv=none; b=Pfwl3az4eiDti47IcWyUkxrdYrKlj3EY4Ewb8AgjUMK4EHnVu2+t79j2nZKJp19XqleDhdSmeACtxnmuOutdujiXVUxTrxVEBS30NdTFWcThcddilvaOBpNE/tszYtIZWNGVLXBEvZpUcTQsn8v5WMW+214wvirpDFL1xO2xkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712860992; c=relaxed/simple;
	bh=VAvQSlB5kvd386jRIwEnDnlyJJVBa3k5LAfmdzuHAQ4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=vAIWC8POfQ9GAYWaJSSpPLAoVas6/i+8A1j6BSKmz2shMkvwV4xElJQp7tTY38omLubf7lbzgd2UdU4X306UQ+YzejwdBzP1zRZmFmk0Cjj4i2D5/gRWwmwkoCLxvNmZAVL/QrmGEu6Ee5qJoXp4WkpQ5O/OvGTMYXMJE2eOIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iQvl6GeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BCWWRS007844;
	Thu, 11 Apr 2024 18:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=l0mGIIANjDyxm+e8e+dV7rCE3SepN75fWHXkPif1qbM=; b=iQ
	vl6GeRr6dI19njlwwZLvLFNJQGeMNpqAg1IsQ+qj7N3N9obzHjIXSrTHUX/lYOB6
	BvdATp6hzvEwF3+jCaUK4Y42ytPOH5nFvlqfwyIRmsMGlt+Yq0N0/7l8RDrwJXcV
	6hxx3pibDLcPI181pIbuOgKmRAZSiP46Q+x3dXdg2ZgV6N8s7WtHJNSCulLVH2Cg
	pv4PGFuXyEohRiYPXlAYSvxOOOw5FJqRlMl3meS9oBe6wpkc4iG24o7wYJ1FVqet
	Y5GY99ymUPA+5hZVZ+ZorxPkENaynZqdrbsEEJj8VFfUo3nMzdn+w8uybnVEvaKU
	UiJ0NnaobHjOyNyrwkzA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe8yvjx52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:42:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BIgrdh006405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:42:53 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 11:42:52 -0700
Message-ID: <f06d1916-7721-7e04-de35-0326cec7ba6c@quicinc.com>
Date: Thu, 11 Apr 2024 11:42:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/12] drm/msm/dpu: pull format flag definitions to
 msm_drv.h
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-7-dmitry.baryshkov@linaro.org>
 <0ce28e37-0d92-2eaa-7d95-0b3829149a8f@quicinc.com>
In-Reply-To: <0ce28e37-0d92-2eaa-7d95-0b3829149a8f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WIeJh5EioWTwFWcJtaQWUu-gQ3wQdygl
X-Proofpoint-GUID: WIeJh5EioWTwFWcJtaQWUu-gQ3wQdygl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110136



On 4/11/2024 11:41 AM, Abhinav Kumar wrote:
> 
> 
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>> In preparation to merger of formats databases, pull format flag
>> definitions to msm_drv.h header, so that they are visibile to both dpu
>> and mdp drivers.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 28 ++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +-
>>   drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
>>   drivers/gpu/drm/msm/disp/mdp_kms.h          |  3 +-
>>   drivers/gpu/drm/msm/msm_drv.h               | 24 +++++
>>   8 files changed, 91 insertions(+), 84 deletions(-)
>>
> 
> <snip>
> 
>> +#define DPU_FORMAT_IS_YUV(X)        MSM_FORMAT_IS_YUV(&(X)->base)
>> +#define DPU_FORMAT_IS_DX(X)        MSM_FORMAT_IS_DX(&(X)->base)
>> +#define DPU_FORMAT_IS_LINEAR(X)        MSM_FORMAT_IS_LINEAR(&(X)->base)
>> +#define DPU_FORMAT_IS_TILE(X)        MSM_FORMAT_IS_TILE(&(X)->base)
>> +#define DPU_FORMAT_IS_UBWC(X)        MSM_FORMAT_IS_UBWC(&(X)->base)
> 
> Do we need another wrapper macro on top of MSM_FORMAT_*** macros? Why 
> cant we use them directly?
> 
> Same comment for MDP_FORMAT_IS_YUV macro as well.
> 
> Rest LGTM.

never mind, the next change does exactly this. Hence this one LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

