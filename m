Return-Path: <linux-arm-msm+bounces-47225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F0A2D361
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 04:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED26168778
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56FB148304;
	Sat,  8 Feb 2025 03:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p8PUv/19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09630155322;
	Sat,  8 Feb 2025 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738983938; cv=none; b=LWr+kFN4tg1xV1aJssSGHc7jLH6aF+dIqn3dFGe74ciWWwcg2jJ3tr44spsZQyun9j9upralT+0/NB5timCwhhDGZM/+0G3j0YSoCG9OGi/4DrsZsSwvkrsypIDt2Obpi1vGPa5WHkWDbVrCkn/MqNRobACJzhE55eirR8PJ3OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738983938; c=relaxed/simple;
	bh=nuEFzd6zO5H1NiHmg5BPa9IGCI9k+i4++cuNm5Seyqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=czzfNlgxRBQcMFM3avqxI2x0DMThf4yfRYGBP6IikwW96WaEyvm1yfTuMsswndwtYApWgnY6eLbBb3LftYNjLD//wdIAPZpzRqnXUsTjEUnkmVG6/E95xBbGgZTNy0OxHo/cTfgyPBsoic/WwGu3PEDkxyONFv3DNHII+A1yXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p8PUv/19; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518122FF016825;
	Sat, 8 Feb 2025 03:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csc4PlfoeaSMmWNY0yBRMUuWFB0UUDP2Tp94t3NXnBk=; b=p8PUv/19HBbB+/MJ
	4MOn7jrl1mlCNKEKnpXHQJ8ZD1BK0kpwC0tWqg4g53bvWmTZlOALLbjed0ITm4+r
	gF/X0D0SP3fTDUVpc4I2K4RPp29zIqka68yBerNdgQ4b+GjZVGDHUSs53rJA0WGY
	4qr8gTrLk1GdWQzQxLTc+lMWqlfQf2pYpDTCOfUyjBAYYmHZxaZNFBII1xp+10mO
	g8+IjPLHTuDYFwvr5v94gxRqSDVnej3hSmaTZK3PryqSDSY5JEnDQEX0/7BBYWyy
	VFXS8dHV98CIoKNaBgpU8dEmKr7SmhY0cjI8oLLLeF9tpy7yx1hhWiS7ZQ0SEVCY
	xXYxbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nw8cg5ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 03:05:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51835Gsh029396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 03:05:16 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 19:05:15 -0800
Message-ID: <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
Date: Fri, 7 Feb 2025 19:05:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>,
        Simona
 Vetter <simona.vetter@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
 <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2M2pxcy9ShUMNTfPHKkfN3vFpS9D_iqa
X-Proofpoint-ORIG-GUID: 2M2pxcy9ShUMNTfPHKkfN3vFpS9D_iqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=687 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080021



On 2/7/2025 6:04 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
>>> Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
>>>
>>> While the HDMI block has special block to send HVS InfoFrame, use
>>> GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
>>> that requires manual repacking in the driver, while GENERIC0 doesn't
>>> have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
>>> HDR InfoFrame which we do not at this point anyway.
>>>
>>
>> True that GENERIC_0/1 packets can be used for any infoframe. But because we
>> have so many of them, thats why when there are dedicated registers for some
>> of them, we use them to save the GENERIC0 ones for others.
> 
> True
> 
>> Lets take a case where we want to send HVSIF, SPD and HDR together for the
>> same frame, then we run out as there are no HDR specific infoframe registers
>> we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
>> HVSIF when we add HDR support?
> 
> Most likely, yes. That would be a part of the HDR support. At the same
> time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
> HDMI 2.x (once Linux gets support for that). At the same time we can not
> use VENSPEC_INFO to send those.
> 
> I can imagine that the driver will have to switch GENERIC1 between HDR
> (if required) and SPD (in all other cases).
> 

We dont have to use GENERIC0 for HFVS infoframes. We have dedicated 
HFVS_INFO registers for those.

>>
>> Also from a validation standpoint, I guess to really validate this change
>> you need an analyzer which decodes the HVSIF. So was this mostly sanity
>> tested at this pointed to make sure that the sink just comes up?
> 
> Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
> been validated (validated SPD, AUD, HVS and AVI frames).
> 

Yup, vertex2 validation is perfect for this!

Overall, I am fine with this,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


