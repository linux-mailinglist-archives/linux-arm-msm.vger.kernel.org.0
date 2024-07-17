Return-Path: <linux-arm-msm+bounces-26509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A336A9344D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 00:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F55284D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 22:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64AE4AEE6;
	Wed, 17 Jul 2024 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pzHl2PoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B6249F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721255177; cv=none; b=HWS/qcNDsboFv6IFEs9KuI+fQ4D1Tjcf7DbSTCfaUvmm5QX1KvQTugba2q5X1mIdtefNlxRYMA+2q+CWoPDc/qW84W9WNICBIEVgqMUCHPbjAiCqJTM68Ob1mKeIZAauc9MDF5ubU+NTtt+g86A09I//AdkG/o4pCOBf3Gongic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721255177; c=relaxed/simple;
	bh=5VkA3c5OyeVFkiEblegV9PCApVJvmIVcmUcwpFY6FKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ixvRpdz4s4UAU+f3UcxvuATqCH19UM6ErhOWg8BtypPF4mMcvZzuss2BuhLRLtkJCY5rMbYd03eyWVac++g/4pLJLyQwLmdFpdkEE/dkBNpcy0BVUGuPTlC/AuKKWocDaWkplkAltlWQ5lQuEnbLJIMFv+x2epGXmfk61HbFGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pzHl2PoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFDFNx004324;
	Wed, 17 Jul 2024 22:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/D8TuRlIv3+MI+d+h9FY80y8oeyXvIotba8jxGmeDM=; b=pzHl2PoH3/tqTIN6
	WnGaX1N3elxyEmpN6q72eZvjahVZ1Re2woGR9EYdWp3weVUU597BYMiGNwymYCBs
	r6n+i+d9D8O/Wz0Gd//4Oupj4fzys6gyd0BA8cAbs6o/0QiAzz+xO+RQsMAaYmGm
	Uf9qB12+QOqM90+iJeeW1jBTeQJ4t0w4nu2XcnrZhCJUJuj8Ig2sTa3XF/5viEnf
	f5DyM6Ug8qyfQ2zeKzoVKQ1MsfKdvL8tIV9uHyOaYbDzFRSlapGL9K7J3BVRfBhN
	aAcIVdBqdHuCZ2dGI2U48n9F2/nHg6+3yV18rrnZQrhhexDJSTSjHWp5cdazMHU8
	mYBrNA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpbug2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 22:26:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HMQ32r006473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 22:26:03 GMT
Received: from [10.110.63.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 15:26:02 -0700
Message-ID: <2563d9a7-89c9-4aee-a30e-68b4da9df9eb@quicinc.com>
Date: Wed, 17 Jul 2024 15:26:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
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
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9i-h16e4lFQ_Y5wwUWK9O-jX24n20dhO
X-Proofpoint-GUID: 9i-h16e4lFQ_Y5wwUWK9O-jX24n20dhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_17,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170170



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> The _dpu_format_get_plane_sizes_linear() already compares pitches of
> the framebuffer with the calculated pitches. Move the check to the same
> place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
> kernel log.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 

Not fully convinced about demoting DPU_ERROR to DPU_DEBUG but I think we 
have had a similar discussion earlier while logging atomic_check 
failures in the CDM series, so keeping that in mind,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

