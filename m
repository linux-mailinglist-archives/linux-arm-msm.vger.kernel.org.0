Return-Path: <linux-arm-msm+bounces-17292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB838A20B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFA2283ECB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C31A3308A;
	Thu, 11 Apr 2024 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RLgQQ8gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6D33062
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870006; cv=none; b=Tsap5ZWsHEir6xvdI5YayZfeUtKhKIjlgKcvbueP4Px0MMMpU/wxbS1AQGnG780TU6xA4FyahSKq3bt+1O8nblI9/35NbdJCOtiefngqh/42L2UzlVi3XVVyDyQmCzAPomRzGfK7ZHKOk58lX2KE4V3wGukmupclrmdUN7PfBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870006; c=relaxed/simple;
	bh=3qKVzdHgEabAlXTqNMw9sjN9fxFfsD/RE4pileP3AIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hht3tL5fdoIG0yVEpQcr3vQgbKSr1KJWuEwARz/pxvl8+MarDQK2PMl73M7vq9tiUe4bnxNT4+DdzO5nF7TX1H9fzBWybhD61ltdiKvUrn5fh6b1zazqwaRuh55Et+ns4DIjVvdSwq4XjbyzlxucxVRHkCQh8bnnNUH+fc3n9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RLgQQ8gh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BJk0gu025770;
	Thu, 11 Apr 2024 21:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0JS3oQjuUoxwPF7E7rLZsM/abZH9XISwyxqd2URzlWc=; b=RL
	gQQ8ght9i0pgK+zZM2egC0M1RgL1/sDB6NsSY19Nxb2dYyN1jAEGmDWapXVGRe0o
	m9GxWCn9BCWz9UBfYOQqrn2Be9wm/0h1qC5xj2W/L4kUgNHSd4Xa/YlO62Q97Ghu
	JiLkM7Wj3gEPuA5LAsXvVHs7DrUcH1h/2dLmvIYEW3u0AbLMoD2Z8nkaUPOzbJA5
	dsSsgOEDYy8No1DDT0z1WKQ6ngdbQbWtqmuW0x9+pdwkMfTIzRlbvHRbDZxO+2SI
	tzWnhwxq5mGlugPsVBR1kGtoACxnCE5u+8/QuRBUqomcA4/Z4lf3f6K9c5N1tdWb
	iT3n2E1K91xC7FgXZ3Vg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6vt726-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:13:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BLDEk7020498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:13:14 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:13:13 -0700
Message-ID: <2a5ef67c-85da-09cc-0114-717b937e6e47@quicinc.com>
Date: Thu, 11 Apr 2024 14:13:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/12] drm/msm: convert msm_format::unpack_align_msb to
 the flag
Content-Language: en-US
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
 <20231202214016.1257621-10-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kDsBIQpwYCmcTXCpJXGps6BGhlMxcTsc
X-Proofpoint-GUID: kDsBIQpwYCmcTXCpJXGps6BGhlMxcTsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=971 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110153



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Instead of having a u8 or bool field unpack_align_msb, convert it to the
> flag, this save space in the tables and allows us to handle all booleans
> in the same way.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 ++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
>   4 files changed, 6 insertions(+), 14 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

