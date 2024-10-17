Return-Path: <linux-arm-msm+bounces-34804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A59A2BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4282861CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FD61E04AD;
	Thu, 17 Oct 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IOhVHhZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6138DDB;
	Thu, 17 Oct 2024 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188983; cv=none; b=YjJ5eBE4kt7qE7Gn9LbRLwKrLVHRHORDv6ZJDRLbeCHcB+dRVXc1fVL5hShRcndGY+m8/RJu3UJy8WaQ5AXp5B4paYx+MCpsRx42FkjGP1psO6RKkNw42dz9AqnmVwbgA/kF+gEH7tEhVXsJFynVNRVZgIESqRBKHMl1r5j9r5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188983; c=relaxed/simple;
	bh=FGOGeKbhvA8/HTyvQrhvcBGk4hF8UoeLGIR/+MPfqzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qXChIIA8BAbKDR8J2kOr6DO0Hr9wli2QJ5tLmC1h3dSt+wCJoyzZUX2Zmx2BP1IXnUGttxqpOFlaTXSM82YyiKQtiBj94eGW6ma//dO8Xm8Txh7MX5bNZWRrE988YtOq7J51cVTXFcAvw+0mEAnWbCe/HOeRPDdNoTZbrOO1P5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IOhVHhZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HHEWHP000489;
	Thu, 17 Oct 2024 18:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeJRH/YAIkVBraIlzYlHPzq4ydysGr0w+AAJtV0hV1A=; b=IOhVHhZ4/NF4IlIB
	63uqgnn46WPV2e++gO0jjl3mEohk20KBPIb64qLOyfR25DljsYVEzFtDOvdBnG65
	syzudRQf4fOycHAozU3mxCy+hI5I1JoWuufGPqfSWgUPPy9QkmpRVjvDqF39uyym
	kWVKcLzM0CyjBFoPIpEsIYWsoo8hdG8+6txk6vnHO29yaoZ/3e1CftaRFCYMkQUx
	3/DURPhDJjrcy8RRAxfTMW+M2jo0YHboAtDfalUsBTKIZvjAXtOFAXacIcNY7N55
	GjIy0h3dp3JixKHfVbA7Q/MNCVbLfCsb1LaMCqg4LJuPhNDGIW6SnmbTmqzSDHNm
	Clh/gg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq5n6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 18:16:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HIG0G9016271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 18:16:00 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 11:15:59 -0700
Message-ID: <5bdafadb-aeb6-432a-8269-a45dc3e1ec66@quicinc.com>
Date: Thu, 17 Oct 2024 11:15:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
To: Maxime Ripard <mripard@kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann
	<tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter
	<simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241017-didactic-hornet-of-glory-14fcce@houat>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241017-didactic-hornet-of-glory-14fcce@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jZeQjWMgWm9VhWRINs84pGPOUsVJbByY
X-Proofpoint-GUID: jZeQjWMgWm9VhWRINs84pGPOUsVJbByY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=962 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170124

Hi Maxime

On 10/17/2024 7:31 AM, Maxime Ripard wrote:
> On Wed, Oct 16, 2024 at 06:21:06PM GMT, Jessica Zhang wrote:
>> Changes in v3:
>> - Dropped support for CWB on DP connectors for now
>> - Dropped unnecessary PINGPONG array in *_setup_cwb()
>> - Add a check to make sure CWB and CDM aren't supported simultaneously
>>    (Dmitry)
>> - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
>> - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
>> - Dropped duplicate error message for reserving CWB resources (Dmitry)
>> - Added notes in framework changes about posting a separate series to
>>    add proper KUnit tests (Maxime)
> 
> I mean, I asked for kunit tests, not for a note that is going to be
> dropped when applying.
> 
> Maxime

The framework changes wont be applied without an ack from you or in 
other words till we add the KUnit tests :)

The series was re-pushed to get acks on all other MSM changes and keep 
this series ready for validation by other developers and interested 
parties. That way only KUnit will be the pending item.

Based on cycles, one of us will add the KUnit and we can either link it 
to this series or absorb it in this itself when its ready.

Thanks

Abhinav

