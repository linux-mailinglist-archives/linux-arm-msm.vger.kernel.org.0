Return-Path: <linux-arm-msm+bounces-26662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883F937DFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jul 2024 01:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2CB01F21945
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 23:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A35580026;
	Fri, 19 Jul 2024 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DRlxlBg1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381F8F77
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721431222; cv=none; b=jwM4kV0egNDVDHR4UOx3Y+3Z4HumpkuxcLMDHToxtDnt+KFHMSzaewhJkDIc9JO0ZjiDdVrCVK25IOI6yYqeyjquGlMIHVmfpOH2KEP1HWYAfDGJHdSbFmCGlqzIFQfAaK7P/g9vpHb98FI4SPL2PHDpPYb23wK0xwZHkXCuTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721431222; c=relaxed/simple;
	bh=GHF6EEVbAnnRKJwX9iaeFWseZY6/nJ+5z+yv7ho8dwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MUTAlPaLctKi/5gXLgArZr1O4cxQJ+esyNxULpIChp4LK8z3DLANQKkKt4U1du8eJnleqV6LvMZIxNsKOfEa86Llt2729xJGXEhg2hGfp5gHmwACSwb89be9FH/wxyX5H8SmX++z7SaiCGJCHG5cxFk6xuiOtujFvffyWrvYk7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DRlxlBg1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCaK58018986;
	Fri, 19 Jul 2024 23:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajCd/fFzWDC/10poGqgu/TrgGPcUkVYIIG0EefyGMBw=; b=DRlxlBg13+tPmeQO
	CgFoa2XvJSNXNqK5ydVOquI/ZOyVE1ShPInhRRdGMHpkTcAcPfQrGtTHz8qczI2/
	a2rcG4PtHTE2z3IX9/EtSfsLF2IZd5pSVFG2czvQ9xSlI3LAIXBldl9tC2Zf5wYb
	ymIaahXfnoUa4Q/IjIkEM6iX8K/FkrJve2gYBGkAlg2PfE4+tCvaymwm28Gvj8gC
	HMUTKLBEfp7LWtbPfPUsITdjfmoRlhYpOkWs/Y2nYHeCLGcfI0p9++hP1VfePNA4
	r+rA9q2Zl9+MSftLOyyMRIaOal/HOcItDmsItOCMWXuiHRTKI78AcD+Umo50qEnC
	K+IsTA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe352kqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:20:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JNK5Tn012780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:20:05 GMT
Received: from [10.110.15.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 16:20:04 -0700
Message-ID: <734e1b86-f946-4a43-a6f9-304fa3a263ab@quicinc.com>
Date: Fri, 19 Jul 2024 16:20:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
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
 <20240625-dpu-mode-config-width-v5-13-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-13-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -Bj6WZMUPDbLUflBnODsOCPDfxIorQ3o
X-Proofpoint-ORIG-GUID: -Bj6WZMUPDbLUflBnODsOCPDfxIorQ3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=877 clxscore=1015
 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190172



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> Move the call to dpu_format_populate_plane_sizes() to the atomic_check
> step, so that any issues with the FB layout can be reported as early as
> possible.
> 
> At the same time move the call to dpu_format_populate_addrs() to
> dpu_plane_sspp_atomic_update(). This way the all layout management is
> performed only for the visible planes: the .prepare_fb callback is
> called for not visible planes too, so keeping dpu_format_populate_addrs
> in dpu_plane_prepare_fb() will require dpu_format_populate_plane_sizes()
> to be called for !visible planes too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
>   1 file changed, 11 insertions(+), 15 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

