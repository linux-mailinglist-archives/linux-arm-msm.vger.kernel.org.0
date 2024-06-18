Return-Path: <linux-arm-msm+bounces-23145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7290DF5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64D521F214BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA221741EE;
	Tue, 18 Jun 2024 22:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y+JI30XZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA628DD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751000; cv=none; b=bQyR/56FT8CwOI+TJqPo1BlWIvrPvtuQoKRHuVMFK5LgKTpTYz7DE/0at7TottShMDtgFpMcyrNx46yyecAO/YoQ36WzDeWzImPPZtp13KR7ceqkGDWQTkeJX6a1GC38bC5kokYtkFMxpjnny/yxHY4tpRrzFOboM+neSCh5wt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751000; c=relaxed/simple;
	bh=6ixO99rJ/FXtuyc39OzcyXLQx3vJ52GxhyPzn1QejaY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=B9aHwvQ2R1VCZTqib91HmaXnirBe+nDTRXgvhtjMAzlLPisADBdCLpz/rmLqiGy2rlZkIQsE75uYW01G3R3GvEkOioyz1mArjMiF3ErUHqwP2owf9e+KQE2/8S8WcmZvYu82MxhO18/jiZgql1wqC9wDxvfkPwbyVZic8fPbFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y+JI30XZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILatL2005243;
	Tue, 18 Jun 2024 22:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnRI3hKsl+KafR+OMRjSAsb8yNpYYBGYRJOJhA3Nqmo=; b=Y+JI30XZAY4DbX0u
	g5LaR6/BdB67qa0a7OApfZnmqmn7MRSBm5sGTm2Ae9AlT5UB3PBkG9LQ+0t6q8Jy
	j2II/EdSyU8D5wU1hmNztI7l2CyMR02b+ZabREepfcHSwbZJQseoxm3FS703m/aL
	5lf+WHgzeqcjqeD1amNPBJD6YRY8HOEl4XqLI+A2Y2hTCQIgMQDdhF2WgaSA0qMM
	tRWLYZr3XmUFEk+kOvpqnHpnmv0F4pX1JCXFIfGv1O60mVuV+uU0LkuytAoX6BL9
	r/lUeor48Xi6BPoaLv2pFUHBqmlu5wpp//q271ZsH3oQngx7w9IbJvESabJAA/wZ
	ASX4sA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja783rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:49:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMnlpu008324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:49:47 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:49:46 -0700
Message-ID: <1e4307fa-a0a0-5c98-cf7d-a50c95206559@quicinc.com>
Date: Tue, 18 Jun 2024 15:49:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
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
 <20240614-dpu-mode-config-width-v3-1-29ec4069c99b@linaro.org>
 <52fef0ed-d9c6-682c-2d30-18cdd78f7a40@quicinc.com>
In-Reply-To: <52fef0ed-d9c6-682c-2d30-18cdd78f7a40@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UwJ2leUTwHkQNk4vDR2mwQ5wt9COrVRD
X-Proofpoint-GUID: UwJ2leUTwHkQNk4vDR2mwQ5wt9COrVRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=972 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 4:13 PM, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>> Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
>> overflowing LM requirements. Rename the function accordingly.
>>
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

As promised,


Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

