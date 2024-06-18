Return-Path: <linux-arm-msm+bounces-23150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E590DF75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC4281F20FE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B49216D9A0;
	Tue, 18 Jun 2024 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LaVJOlu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305161849C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751216; cv=none; b=odawE7KEdDa+zlOSSyxi2aeS8X3//wYw/TzRsnY6LszRMQ/c6fEyqFSla5LzHdkRksaLeVBXpgBvKLMjG8Dq9raGuT66E7DvnAZ7/z0iNlYpR5MIKYK1m0N8TrRHvZmJ60RySD5YGxoW7SKX6162AMC8SF8sh5qRv+7oKTihPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751216; c=relaxed/simple;
	bh=EmyZGVNFXXdO1AbbQpdrxnpWoxFaOfPQOaLDipxPm/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TUnjXBufl3PJANkiRWe6PY13LrJSgSb5sVua7v2MO35oq8uLjyc1NUM6XTnaNEnvJq6MOOvdSq3cFMoQMCFX93Y89zpLtdCNekqSPpDCi/dqM9NPGv0GJOvKeAWgV78I4LvHAPSyIbqq9xIdtgA8PHeAKP1jR8icx/GoYV6mXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LaVJOlu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILet2m026483;
	Tue, 18 Jun 2024 22:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1XZwBemGx4fiiu7h51Nvr+lAoFDMzcHjUJFXpi6XdU=; b=LaVJOlu81uKiBrtg
	qvCSo+jN4gfm4YB+DDO37EgNGI6r1DUmPBfujwSlAtgrDKS5tonZqgtDOdsgP60A
	uresOWR1E0flGjrQL8RaaFgrnEQNKb8kICUA68IybA5vtjHhb7fQabX05qqpHwfP
	9k09WICaLGJO5WeF4Rlaq3Q+DCkWvcfY8+hZWf6htAosEcpSKjd4XtC2r11t6QHl
	ARb9sI8ogVhcG0FrOIHDU+x5CPQTUJur9C/l9HWQXk+rkcSeNjwXc4feDpF+9uS9
	CvoNG2NV94WlP2vu2qkxLUjyAL8DZNk4nW/8om96pRfrC0cm73SIjlx3/yhonyCQ
	dzP56A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4g3ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:53:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMrQ3j010031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:53:26 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:53:25 -0700
Message-ID: <2c32d36a-2abe-d2fc-e1f1-57f2a280bb0f@quicinc.com>
Date: Tue, 18 Jun 2024 15:53:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 6/9] drm/msm/dpu: check for the plane pitch overflow
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
 <20240614-dpu-mode-config-width-v3-6-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-6-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YwltCfvqa8ZEgSGljYkeAaiIn9kXBwZH
X-Proofpoint-GUID: YwltCfvqa8ZEgSGljYkeAaiIn9kXBwZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=844 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> Check that the plane pitch doesn't overflow the maximum pitch size
> allowed by the hardware.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

