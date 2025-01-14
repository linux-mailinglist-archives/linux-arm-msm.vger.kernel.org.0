Return-Path: <linux-arm-msm+bounces-45038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D5A11174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92DF7164FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417C120AF65;
	Tue, 14 Jan 2025 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYMIYJ/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DD209693;
	Tue, 14 Jan 2025 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884226; cv=none; b=tGvxR5kQiwfTXjCLsAXhCfd9oY1Otlt6xeaoIZUX4uuJQCsJiPmb9Vl0fmxeTooiLKJDaqJY1/zCkbDU4qjE7i7yJr0Uvak+8qu2iYlEm+nZE8KuBZgBPWRocT4P3o4dX9Nirmz1crjZQ/ynElszz18pupk+G6zhi2tt805OEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884226; c=relaxed/simple;
	bh=IlAfbUKYCHa9yn3o+kjCLNUvEAuse3DeNmu4ffolL5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RUrWRjARZmWsb2p9ndrqeLdJRvOtaJ3ibATWveGxkhXAzw3STdaqb7ERDxeX5L3E3NGCrYtxbpj6a76xdVWPVoSvfTCAIZTNlzOcpOQEzQxAWG1NIMCBsjB1VLJN/W3k+UWCwL5PAl0O/HlvHoE+xbX0MnOVdWVNUGfOc7FV8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYMIYJ/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjXuv027456;
	Tue, 14 Jan 2025 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pb4LNoz/zowG0JD5feGpfNwlz6Ake5kwbgwbPfLzgLw=; b=VYMIYJ/iP0CJ+cTf
	CFV+MVTsnReVjVpuFnZHysx/Puprvh4l9swLjohrySJ9DUUnOvj1szVkAeqMYhmd
	LL2xMe/dyWIR2nvzMOy0EKyM7ZeINZtoV9lpljCTDad7t1lyreczUVDfO2FDNoGP
	Fz+L/SwD2ikYSZdE2Zn0YnbXm7XFEJA26KU49meC7gmv74Xqhg+neoSm5Jigk229
	4jwqO3rfi6G/qK6UxmzjBTNOQ3Ej98j5xlWVYRho0wDcfHIVtwsNffE9Bg66ZUX0
	zJrbQ58cwJ790l2aghQuHQ3GrBI7vhztSMpYJjwNWkuUuTj53zhpGz1qfVcv9p2i
	JXi3xA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqsgeeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 19:50:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EJoGLs019229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 19:50:16 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 11:50:15 -0800
Message-ID: <1bdf9d1e-4949-4bb4-bc8c-f160b11208c8@quicinc.com>
Date: Tue, 14 Jan 2025 11:50:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Add writeback support for SM6150
To: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
References: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wsi7ybK5Ud2UX_GFukyMEusVQgrwvQWP
X-Proofpoint-ORIG-GUID: wsi7ybK5Ud2UX_GFukyMEusVQgrwvQWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140151



On 1/14/2025 12:55 AM, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> A followup patch to add writeback configuration for the SM6150 catalog
> 
> test passed using kms_writeback

Thanks !

> ---
> Changes in v2:
> - Change reg_off from 0x3b8 to 0x2bc for sm6150_mdp [Abhinav]
> - Change bit_off from 24 to 16 for sm6150_mdp [Abninav]
> - Change base from 0x66000 to 0x65000 for sm6150_wb [Abninav]
> - Link to v1: https://lore.kernel.org/r/20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

