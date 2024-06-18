Return-Path: <linux-arm-msm+bounces-23152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862290DF7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA50D28393C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953FB1741EE;
	Tue, 18 Jun 2024 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MfMTw/kT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253F16D9A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751443; cv=none; b=JjK5KBrMEO289GrHOwC3HvgFUtEQkX18a+DnoY7OquVm5r68H+eamzEQjHjifA8CQKG/YI8OHPLpLdiG0QO1doJOfLyb9U6Sdv/NbVkzEMka8uE6TNEaaWLBX5ILRt8kJHcz5dgp2A4v+jgG/JU6ln0ClP+KIngPspffDm7dVz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751443; c=relaxed/simple;
	bh=Cc3BMUes8RoZZnkJ1Tyz/syPJaQ/NF9t1f4IwZ8R5VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sb3gv1wy9QuYZc9aWrvDVg4sPhLZaTJByse+skZNRTGkEpH4i2d4mfTNLC5u5gAkRHRe/e9iWoeNfz1uNHQC+0gL5guTqAJl4DQNgr/bAXEb9tcqkFR4l0prU+qzrIwWDwsy0+EoRb/R5N/+tqyJGTCJhNdUThFzSbRq1EnEKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MfMTw/kT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILb8At029191;
	Tue, 18 Jun 2024 22:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSAuiAKaO5XRygUlqECnRl7IbxmjVVoLnW4WraG7UM4=; b=MfMTw/kTTCRTUI3k
	WAr5ghkqHRVSRh3i+J3DSx20iTFXGLbK5hrp0quDb1QGlAY5WkiKAFl6ijSMr1oj
	8nDoHTtueqTwBC2Ymm/fKlc/C1qJ/5WaizoJSHbmK2xBhzfSFhJaYBM+DC8IDviD
	Q39g7vCeWGpktfIrhEz+exMI77ZVCURJ2GSZfHSuOPJHn1eT39xQJvgECAYhVscF
	DOql6oK+NycB37ixoicpwXBnE71h4Pq5vfrTgsde7avcygWSReMvBr2tRvbfLKlJ
	gqWj2zT8teVQWZjJNym23KjHfMLIyTfuwvLB1YzatOpEXBx7X0KhrXES8tfilnZO
	lnei2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9yr3u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:57:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMvDT7001994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:57:13 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:57:13 -0700
Message-ID: <c042bcea-9f32-c258-dfd4-87f2934b6caf@quicinc.com>
Date: Tue, 18 Jun 2024 15:57:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
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
 <20240614-dpu-mode-config-width-v3-8-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-8-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RVM0I_5EW3OVJNT3U6-TFr10E3kKO3ha
X-Proofpoint-GUID: RVM0I_5EW3OVJNT3U6-TFr10E3kKO3ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=470 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
> dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
> constants to remove duplication.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

