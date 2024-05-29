Return-Path: <linux-arm-msm+bounces-21021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 039648D41BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2424D1C214F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C466117BB17;
	Wed, 29 May 2024 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mFWxfb22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5199015D5A0;
	Wed, 29 May 2024 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024291; cv=none; b=HnMAdAnrBM1WX8GT5nbmQEqJEczfIXh6rr+WPS+rrZnwBqZda5sgqbMi7N1iZms635S0WWdtHAflPe1zj4vBJhpx2l2w2TyKX1fXWVisEBu9IJ3880mmZX5zPO9zMTfIAhqT0v5NB/5fTYjZdTzUDZWOLdFryYui4Gu5JzH0+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024291; c=relaxed/simple;
	bh=Sa4tep4udZHR2VoYTX1M3cH5iuFnoFwhypYFnpK4hhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ayCO3wXOnCutFf+WYCpyIL7T07y2rwHRM7IzxypcXc0MhlkvFn6ibLY3RUfKwBRZx9W1Jy1rpVAvgApQoELMsonCusVURFoxiyI9ZsA0uE3aOK/Fazt+gylBQefMF7U8yNYsrDH9fw8jWG+J0/eWXh7n9ALs4JwQaOveT8wKh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mFWxfb22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TIQPCt000950;
	Wed, 29 May 2024 23:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZiLhE5otYIYHjTTbaI+mSK/3VS5gCBB71OrNrUp4HJg=; b=mFWxfb22vahoytaa
	osDQUQ9wnDv1FCZP1sa6gpKHFcKIpSiX0ga4hIeN+vmozXVqbEwotXDlgxlrBhJY
	FaEiB3q5EyBmQsnYoGzip4vZZfDdfrHMXwXI6GDI8E+srYolBF94HpU5GEzYFcDu
	wiXrfmHlLzC8qnbDeH2oUERJalTR9mFFvV4Q8nBrFm9gfKWZuhUDVZSGWx0CbjUZ
	QQGMKGaMie/l/t3IqwwXpe1jDq8TuRPbZUa3WbRpY9qxHvE/JTE34e2Xdj4x3ngi
	i1471I8teXfxAlnFAtQS1Z9a7+UkZ2+ODhF+LpMuU7l0LUXbZEzvNQUowj2IckLr
	H2u9ww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2ptkx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:11:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TNBEqi004689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:11:14 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 16:11:08 -0700
Message-ID: <1ac17233-61ee-6eff-1e28-bd2d74bbc5cc@quicinc.com>
Date: Wed, 29 May 2024 16:11:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com>
 <CAA8EJpoWUEGX8fq5qxXUebA-E25ONycm4NXscFhXAhFwcJGf0w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoWUEGX8fq5qxXUebA-E25ONycm4NXscFhXAhFwcJGf0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IYhx-57DSdUUVwgrjt2A23p1p9xnQ-CA
X-Proofpoint-ORIG-GUID: IYhx-57DSdUUVwgrjt2A23p1p9xnQ-CA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290166



On 5/22/2024 12:59 PM, Dmitry Baryshkov wrote:
> On Wed, 22 May 2024 at 21:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
>>> Command-mode DSI panels need to signal the display controlller when
>>> vsync happens, so that the device can start sending the next frame. Some
>>> devices (Google Pixel 3) use a non-default pin, so additional
>>> configuration is required. Add a way to specify this information in DT
>>> and handle it in the DSI and DPU drivers.
>>>
>>
>> Which pin is the pixel 3 using? Just wanted to know .. is it gpio0 or gpio1?
> 
> gpio2. If it was gpio0 then there were no issues at all.
> 

Got it. Instead of asking gpio1 or gpio2, I mistyped and asked gpio0 or 
gpio1.

While reviewing the code , I think the function 
dpu_hw_setup_vsync_source is poorly named . It really doesnt configured 
vsync_source. It actually configured watchdog timer.

Can you pls include one more patch in this series to rename 
dpu_hw_setup_vsync_source ---> dpu_hw_setup_wd_timer()

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Dmitry Baryshkov (7):
>>>         dt-bindings: display/msm/dsi: allow specifying TE source
>>>         drm/msm/dpu: convert vsync source defines to the enum
>>>         drm/msm/dsi: drop unused GPIOs handling
>>>         drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
>>>         drm/msm/dpu: rework vsync_source handling
>>>         drm/msm/dsi: parse vsync source from device tree
>>>         drm/msm/dpu: support setting the TE source
>>>
>>>    .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
>>>    drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>>>    drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
>>>    drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
>>>    12 files changed, 106 insertions(+), 62 deletions(-)
>>> ---
>>> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
>>> change-id: 20240514-dpu-handle-te-signal-82663c0211bd
>>>
>>> Best regards,
> 
> 
> 

