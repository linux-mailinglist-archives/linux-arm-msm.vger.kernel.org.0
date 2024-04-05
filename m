Return-Path: <linux-arm-msm+bounces-16575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4789A36E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 19:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E482882E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED17A171665;
	Fri,  5 Apr 2024 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N2CL5Le0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C29F171645
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712337659; cv=none; b=OXbsm3/InAfHRqtXIY9PCHrHGM7fBySwDwVxEk9wBk+k8rZKmtMWcxK2fKw+u8MZ91iJP2J6vbGhdSqcbllMiGAaHaLGM21qd88HwuYhUu/0eerDkjD7vos6j0kY36r3f3riz9h54OpfcL7xECihpMhZJnt8FD87QsJx6I6dKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712337659; c=relaxed/simple;
	bh=M6tF6vN6Mx5nZLt4lk6hNJFWPEkSX3B2+n0etI5nUB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MGCHz4hJ775346ZLvXp4FCij6QICVKhXhrWDP8EZU+WyvhG3EYVAGY9IBNI23KXcxBnFY2QYYdg11KkOo0/ruNvds4gSTxSJiNAK7Vv6dPcesRF4RYKuklRw9Y+AJ6Dd74sPqNZmn5VkRPQJTuPz0CcWdxQ74tNDHOuF4CPNGhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N2CL5Le0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435FdWnt012303;
	Fri, 5 Apr 2024 17:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rdVicK8oXjnYCKal2tdDCizk7pj1BqtMn3gXYbKIiA8=; b=N2
	CL5Le0UeezYYHDwjWoQCrz6Eyy2oWPS5TujJDwOUTW7MorAGjioiQoIGbX/NrG5x
	Rt3QETq0Cu1ZhCKF5DRZMGWtnIUdKowczfiir5WQWV7JQ21P+vInbCIkfatMrGiF
	keMLfSNhoFLSk9Y6ODcxYdL4jJIHWO7LV6ZLJw07bPENjvq4HotDClSmCpahw1OJ
	Y/O1lg5CUomg7iNPxZVx1t83CYvLLTsS/OwspgUhWUrkPlU+c+8AwtOrfge0Ti1F
	ltD7CnbXEKa525vV0CGZbtuKLT8triUOjnX8pHvbVGA61TdpFhCrGWYSSey/A8fh
	eRutfxXvSj9UrCFcOiJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xahb10r26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 17:20:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435HKnmq030512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 17:20:49 GMT
Received: from [10.110.24.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 10:20:49 -0700
Message-ID: <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
Date: Fri, 5 Apr 2024 10:20:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VoBlKFIlVu6ohSOr3x-lBfnJjDdpgq1Q
X-Proofpoint-GUID: VoBlKFIlVu6ohSOr3x-lBfnJjDdpgq1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_19,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=720
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050121



On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> All the bridges that are being used with the MSM DSI hosts have been
> converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
> code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
> downstream bridges.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
>   1 file changed, 11 insertions(+), 25 deletions(-)
> 

There are the bridges I checked by looking at the dts:

1) lontium,lt9611
2) lontium,lt9611uxc
3) adi,adv7533
4) ti,sn65dsi86

Are there any more?

If not, this LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

