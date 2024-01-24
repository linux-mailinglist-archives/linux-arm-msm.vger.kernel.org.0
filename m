Return-Path: <linux-arm-msm+bounces-8161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2883B432
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 22:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34C9285AEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 21:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20991350FB;
	Wed, 24 Jan 2024 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ta5qce0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855A131E26
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706132519; cv=none; b=fk2QL5QQ/3M55w2z2mjxCxExYrC3Mn3O3YQoeZjlJEASIFP/1I/9pjuV1FRDZ/RoNbZnNxyHgBGpT3bgbiPHR5SbRiC7JS5tkCK1AyOY00ycRgGjABi4THWT0IxjqS83prLha5e56tLy9Af5eFkTHJyqZE8kCnNe7AGkxJPzdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706132519; c=relaxed/simple;
	bh=vj/vQ77p2v63Xsymv00xbhHZmRf+CwRmN9/3Gub/Zns=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=ZmLOv1QQt1BZNjIEBUxQnmP7xME9PqTyIfEU3u/4qGQz3N+hCX9Qcc3spT6ERV3w8LrSpNKWB7zf7X4PbL+B28M7dOoZuJy1dWNv9AFYULHqdGpFkXnD+X9SscEQq/DpTK2E9I20AegdkIog9hIhIFVUv+Nm1fLc+b/EAUTltJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ta5qce0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40ODvcWA010402;
	Wed, 24 Jan 2024 21:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uQX9xuShpgOtVrWiP3OZBHiY1ykF6TDzrzZZ7r10cOM=; b=Ta
	5qce0HNX3SFBPsbw2pePbOVJusLvRjnvfXl189XHnSo/ZhOkxVM8YEJ+ELORhE4H
	InJRuD7kQH4gvy3zZ/deOsHya6lXzkXErWOhPyoeKa+7+26iQO3zwWspaPO8VPjF
	zTTaLv4S1kcz/PpnLW3IJQF3yDMm6iJAbxMlrgz2Y012WxETdUByIfvbq98v0XGr
	RcREem2fpTDO0QOBKwcew5aos8uEiC/lbCTmI1O1H/F3gk9S/OgVKxdcHXylPOWA
	dT97yaY4/boPUXUC7rcqvpFs6Bazg0dkRijHVZgwfwERTKC1Awi7OXJqtUWy3eDJ
	F3tWnHEbF6I2sMsYNYXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vu1cche7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 21:41:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40OLfdkH003049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 21:41:39 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 13:41:39 -0800
Message-ID: <5835e242-ea32-7d94-6247-6bfd236424cd@quicinc.com>
Date: Wed, 24 Jan 2024 13:41:38 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: drop obsolete documentation for
 dpu_encoder_virt
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
 <64967f7a-8c7d-ca63-c126-e187905d3470@quicinc.com>
In-Reply-To: <64967f7a-8c7d-ca63-c126-e187905d3470@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S41NaIM1uzw9Px3fsm1VpdamCOCwiPwz
X-Proofpoint-GUID: S41NaIM1uzw9Px3fsm1VpdamCOCwiPwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_10,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=504
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240157



On 12/18/2023 9:57 AM, Abhinav Kumar wrote:
> 
> 
> On 12/16/2023 4:01 PM, Dmitry Baryshkov wrote:
>> Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
>> Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard 
>> encoder debugfs dir")
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

Have picked up https://patchwork.freedesktop.org/patch/572962/ instead 
of this one as it also cleans up another doc error in addition to the 
ones here.

