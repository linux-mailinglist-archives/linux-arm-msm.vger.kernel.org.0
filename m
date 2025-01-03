Return-Path: <linux-arm-msm+bounces-43906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3AA00D53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F9283A367F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163331E9B01;
	Fri,  3 Jan 2025 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AUV485Ec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B682BE4F;
	Fri,  3 Jan 2025 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927438; cv=none; b=ZbDH0UYmmJQQTq5vIJHMO0abDyrja+tVcorwR938NBZ1IpTIUrg1cCF4jEOQO3vskmn8+pHPIAYPr2xpwKXmqK1sA6SOy/0QX2SM1gAR+/9NgVldapbD13sk7Ujd3e14Ftm+PCR69evZ7nFOQVs+4NgSdnVa5wtN68W2Dt3JNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927438; c=relaxed/simple;
	bh=nPAefGGXwA8aZDLPJePrT8HJ2BEXFOtU01i8kOS4TqA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=XtoNIT2ZECvbKipm+1PHN2k8ZH7Xb6CUcyme7//2b0a10E/z1Lig+8uOtbH8/RsaY9ZTPXmsmYsFbbH1O4EwObfYICbVC3jp/BPysU+2O82yIkSV+9MdXLsNInc6102r43e9LdNLT5cXbgKQQLKnin8jsCOJ714wA4G1KS4Dym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AUV485Ec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503EVgEd025998;
	Fri, 3 Jan 2025 18:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7/5D35/YiRUtzZJZNQoO3O+kQHt8BXBpGZN/GDS5RM=; b=AUV485Ec23bB860H
	0pJw0mqqJT6LvY3fZn8JQ+Q0kobNs0lWyqjITZPecoKe78fwpMesAxb45/xJ26Po
	m2aFDpBY9QM+5Po5XaEjVgrhiyveJFh9I10R9exhOSYKfWaefDx0IsYTrQmBtsjP
	M6uny9U2efStUWyHQtAkmhqqy2vBGeUYgx5P85w9+lx/9naq5s6xTkKG9MtbkRIz
	d9E+eFMU4mDeZr3y2qWrD0mXyUTXxl5MWOu9YnMmP/V52O39gsF/jGtTPF9sB2Qx
	z+FaSMJBVPioWfz9+tynDJY42X5hhbG18/tB2rojOrFFVmEElo5qxriFe0UbxQTb
	V+CtEw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xhqy0d0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:03:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503I3ct6021165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 18:03:38 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 10:03:36 -0800
Message-ID: <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
Date: Fri, 3 Jan 2025 10:03:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
Content-Language: en-US
In-Reply-To: <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c2jBojO7fRrDkuPuG05TgCZTSfUldBrI
X-Proofpoint-ORIG-GUID: c2jBojO7fRrDkuPuG05TgCZTSfUldBrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030159



On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
>> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
>> to account for concurrent writeback
> 
> Why?

Hi Dmitry,

This flag is necessary to specify that CWB mux(es) need to be assigned 
for the given reqeusted topology.

> 
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
>>   3 files changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>>   					    &crtc_state->adjusted_mode);
>>   
>> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>> +
>>   	/*
>>   	 * Datapath topology selection
>>   	 *
>> @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>>   	 *
>>   	 * Add dspps to the reservation requirements if ctm is requested
>> +	 *
>> +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
>> +	 * enabled. This is because in cases where CWB is enabled, num_intf will
>> +	 * count both the WB and real-time phys encoders.
>> +	 *
>> +	 * For non-DSC CWB usecases, have the num_lm be decided by the
>> +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>>   	 */
>>   
>> -	if (topology.num_intf == 2)
>> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>>   		topology.num_lm = 2;
>>   	else if (topology.num_dsc == 2)
>>   		topology.num_lm = 2;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
>>   	int i = 0, j, num_ctls;
>>   	bool needs_split_display;
>>   
>> -	/* each hw_intf needs its own hw_ctrl to program its control path */
>> -	num_ctls = top->num_intf;
>> +	/*
>> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
>> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
>> +	 */
> 
> Why?

This is because num_intf is based on the number of phys_encs. Since in 
the CWB case, the WB and real-time encoders will be driven by the same 
CTL. I can add this to the comment doc.

Thanks,

Jessica Zhang

> 
>> +	if (top->cwb_enabled)
>> +		num_ctls = 1;
>> +	else
>> +		num_ctls = top->num_intf;
>>   
>>   	needs_split_display = _dpu_rm_needs_split_display(top);
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -46,6 +46,7 @@ struct dpu_rm {
>>    * @num_dspp:     number of dspp blocks used
>>    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>>    * @needs_cdm:    indicates whether cdm block is needed for this display topology
>> + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>>    */
>>   struct msm_display_topology {
>>   	u32 num_lm;
>> @@ -53,6 +54,7 @@ struct msm_display_topology {
>>   	u32 num_dspp;
>>   	u32 num_dsc;
>>   	bool needs_cdm;
>> +	bool cwb_enabled;
>>   };
>>   
>>   int dpu_rm_init(struct drm_device *dev,
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry


