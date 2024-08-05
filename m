Return-Path: <linux-arm-msm+bounces-27960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE5E948246
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 21:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D616A283432
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 19:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B534615FA76;
	Mon,  5 Aug 2024 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cq1BQfoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B054364AB;
	Mon,  5 Aug 2024 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722885961; cv=none; b=d7+RK72GGSpRvi81VyNicCGv+LOxvo5ql8sGDr9arttAjimzO674QWqz48txywuW5zqHYNixCpn+1N51YSypUw/nqh/zyTMwKDqKUeMybmjAiJIkWc5piRKfBLeZb0hfspgz9GO0RMN70TyNq9vKvHNf6ur9ZKa9UYdApkXSf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722885961; c=relaxed/simple;
	bh=/HWSY8O7UkcxsXWoYzC2sSwQp9YK0mgh95Vv6HMt6sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CG+4xwESEJxhom9F3R142bO+AYuTV/yDcLQjcbDE8JOTLYBh7bMSAsyqPXb+nN2ZciVu4hGxwu7Pwbx855ScLAy1FL3WATmJQ82oCaRxG9F9Y2KcO18GmQWAZmJVTPdLXmymRpNaQ3sb2zL4Ahh9C0M0ZQv0ClUFLfuW+8wNkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cq1BQfoh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475BUvKZ021368;
	Mon, 5 Aug 2024 19:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05pYew0QZsnoHD2ifGyMy+1KXhPPBHZKe3O6r2x8sQI=; b=cq1BQfohNIBhAIxs
	Xci6Wlwk8v6ggm0uufQgSxCij98ckOyPRoWD4Mk2Dw7m3R1lF0yN5GgEq4t1Cnv6
	FFytrxr1lupa5IR/VZ7eQ86BtrOy+e2T0Ae+37/acy8lU0umQlQvRpxSMhWhI+cx
	L52WRforCrJTP8gq+ovg6gyj0KMKkPK0pIA1N8CYsmD+M38uVHJry4i0Cw4fwzye
	ZIXuDQn6Nrofnz1gNm6hvAH4ah938zlFqDs5rpRi4WxLsQn9zXuIz24rmj0zdErO
	7timoqBXZ33wpD/n1N57qUZtpsMWPP/FKj7r3fGVNbihF7gDm0On/xcC0QnNanxd
	u8lVPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scmtw3hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 19:25:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 475JPRJ9012819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 19:25:27 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 12:25:23 -0700
Message-ID: <531b68a0-e2e5-4f39-a586-5aaf73bb376c@quicinc.com>
Date: Mon, 5 Aug 2024 12:25:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Whn8VW-plGTcVijgWVdvo-KfbWe-Exz
X-Proofpoint-GUID: 7Whn8VW-plGTcVijgWVdvo-KfbWe-Exz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050137



On 8/2/2024 12:47 PM, Dmitry Baryshkov wrote:
> DPU debugging macros need to be converted to a proper drm_debug_*
> macros, however this is a going an intrusive patch, not suitable for a
> fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> to make sure that DPU debugging messages always end up in the drm debug
> messages and are controlled via the usual drm.debug mask.
> 
> I don't think that it is a good idea for a generic DPU_DEBUG macro to be
> tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
> default it should go to the DRM_UT_DRIVER channel. While refactoring
> debug macros later on we might end up with particular messages going to
> ATOMIC or KMS, but DRIVER should be the default.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

