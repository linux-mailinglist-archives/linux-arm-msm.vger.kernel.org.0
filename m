Return-Path: <linux-arm-msm+bounces-17291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1F8A2094
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F91D2876B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFE0182B3;
	Thu, 11 Apr 2024 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkay/JR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FB15E8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712869351; cv=none; b=SsEbZMasygq54wxrPduNIHZ80VDk6vMJxTFG9bWdMxPP/cYMpEaqkFORmgbU+SaIhU/Q/D+EYDuaaMjj1ysLlKhGN3BvGqLns+GJl9s4+bu/TWSgljKvKNFwT1jLJ0dBD7KN2yUB7ekEk9iWX4Y6xjSll/mf75m9mbo1BhZ1eus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712869351; c=relaxed/simple;
	bh=Igo/fmgRVnUm0331hGALa3U/UYgr8erQOX0uZAASYOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PZWEeXGU7WnBe0t5AveT/Vm6ar9yKw7N6Y68zrvVjZtHTuWAMx8wL61zduZzyWOQpkb2ElHV6HJhUFroqVQLQo/U3swKBJSVdGnj6iwNhhPnxtbZTQY7oaV5PJMIXLfyv4XKXfgR5arp0oz4punaeIDjzm+Uw7WBkXQrCzVqYEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkay/JR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BKENSf023045;
	Thu, 11 Apr 2024 21:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gyF26bz2ntr6P14HAZa2oooqdS4ojk3WFGC29s8K5GA=; b=fk
	ay/JR2PoQNOHkzdzYQk6bBSeo9v5kRbKiaRVlLDLncfNoI6Icr2we4uHu6pBd9Tk
	FJKOSje4Sf1nvk82J5wd1wk4Gp+AVg+4S80f4denU3I1I+RuXUFmg4DDnjEGwOjg
	kfqiS9ukrSowkNZDtKscmELfl1fRzjghXMbRO43Q1TrZ8D4QcFyG4P4KFj4bt6Xc
	CcMyqU4qqWUxZeY/6Mb3g6HBg75syCChWOQvwYddJKkEh567L+53+XZRDXgVtV9/
	l+/mZvpZoG0a20DA4Yl5EA5lzZPuQY7MyRXXgb/ZZbtkej4SGuYYqmydHtZOz2GU
	ddjI3qYBVY7o0mHexS+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xep6fg4ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:02:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BL2Hn1017061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:02:17 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:02:17 -0700
Message-ID: <338bbd6b-d9fc-1fa8-0c8d-ed4f03a13061@quicinc.com>
Date: Thu, 11 Apr 2024 14:02:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/12] drm/msm: convert msm_format::unpack_tight to the
 flag
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
 <20231202214016.1257621-9-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z045ceKATNTa2CWhmi2QvC0XHaJvrEMy
X-Proofpoint-ORIG-GUID: Z045ceKATNTa2CWhmi2QvC0XHaJvrEMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=828 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110153



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Instead of having a u8 or bool field unpack_tight, convert it to the
> flag, this save space in the tables and allows us to handle all booleans
> in the same way.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 22 +++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 +-
>   drivers/gpu/drm/msm/disp/mdp_format.c       | 52 ++++++++++-----------
>   drivers/gpu/drm/msm/msm_drv.h               |  4 +-
>   7 files changed, 41 insertions(+), 47 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

