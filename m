Return-Path: <linux-arm-msm+bounces-56183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A42AA3FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E4A188238F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C83A13C9A3;
	Wed, 30 Apr 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dawybj5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84563137C37;
	Wed, 30 Apr 2025 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973074; cv=none; b=kiyAHe+8vjCb8U56N87o04wglP60oLhVN0ZV7vtDXl3Y06ywhIFZkYQd0/5n8mFWcq4JrT2QC7IHh7LiHaB6LghaPvPiRkW+F7Wa71K/yM0w1IYsGjQxEGxzRUHpnKCirHKwp6l9kNKVWDMb9uDW/p5O1hNTXFjwSn3zDMofr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973074; c=relaxed/simple;
	bh=8K6c+oIOORHRuzQzb8B2SyQPetjV08qZOEHEF7LVcNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HHsYpl1lR1kP6IUvcSaOAi7k/G7DLMKhm7lA5Q0z34NBDzQGkobDCMClvS58IUPOdJnH6qgefjfBMxfYGiA2pnm4iR707oPEfreO2EvVybdcF0sthaq0BWxAqvxPkosgtCuoBG3sG9Ltqg6Jny8LqkhHec/wZnMnDdxGiUYgVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dawybj5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLadN5002524;
	Wed, 30 Apr 2025 00:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SH/hrE0EhbsEBMChKmI5FF04Vp+oBu+tOb0ZSc9FU4c=; b=dawybj5WLIu15I27
	WJwdwcwsrPpJzXzalo5JZW+mjX5exH+OVhWjTWvOAf09uBP93WsR2010MzAxQP28
	4WEGKAD+wo3wQLd9d9scy0/S2wribJeiE9oWCX0ZRCkbI3GefZscYtt1FJ324Wxt
	fLtwAinpInurIURPaC1Oml2tZxFVz2WKjx7iqd13Z6tt7Je70ScHRZJGSDvcnFZa
	2j9qqpkTiibS1uYJEgCb6OjgjFA5IRVx1e8ytI3mh+h5jLWY6nU8mxmhDPh3EJ8W
	tS8/7l67ZckBnWj7KabnopCeA8m8Y6WCZsmMbp2CtFVin7/DVBm+2vHmpUW4yI4h
	Khj5TA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u889y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:30:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U0UKMl010616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:30:20 GMT
Received: from [10.110.114.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:30:15 -0700
Message-ID: <5ee6f036-104b-4c53-87ce-8cec07c0b035@quicinc.com>
Date: Tue, 29 Apr 2025 17:30:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of
 msm_hdmi_set_timings()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman
	<jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "Dmitry
 Baryshkov" <lumag@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
 <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68116f2f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=q8S6-B7p12HAI_vjdQ4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z8hNlKXExkpvo2EQM06B9NDPU8M4VSd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMiBTYWx0ZWRfX6gcbSXtdEmCH gIzMjnpPXfiQxaK6AQtzbJv8czUVxF7+DWBBF9zqypu7lTy8iSLb6f4MH0dU5U2vTXIDNavzUb7 5/fzy4D7oGn0YUiFKHyakh3UhN7qyiUl7MPBsvZbxvMNjNvks+G78oq9LFQcEqYRqe59eYmJcMa
 s2/Q9KPr2lGThq0QnZiWpIvcjmtXirtQFgTP+GocpmKf+/5sEUVxI3ZLZd2qAS00JCji1t0vsRf OlR1smpnidtk46DhSHbcaqk+japseDbvwcNyHxtx+cLZmRH9Ujw7Bgy+h1TQ1moD5n3E4UWGD2h gxrbFUcYYYjwlITsjtYi08McuJEKGsOcAvQ2pUY/k643o7qp/vlh243NCPd59z7osv1fqv6xQjn
 xMQggKXUe2KodSmk9WOaqZZ+coWBXu/kgBWnVdn7CNZArNxNzKlRGPR4icB2TUt3LIPQ7QOI
X-Proofpoint-ORIG-GUID: z8hNlKXExkpvo2EQM06B9NDPU8M4VSd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 mlxlogscore=664 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300002



On 4/8/2025 6:54 AM, Dmitry Baryshkov wrote:
> There is a duplication between msm_hdmi_audio_update() calls in
> msm_hdmi_set_timings() and msm_hdmi_bridge_atomic_pre_enable(). Merge
> those two calls to be performed unconditionally at
> msm_hdmi_bridge_atomic_pre_enable().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

